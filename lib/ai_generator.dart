import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
// CHANGE THIS IMPORT to match your actual main file name if it's not main.dart
import 'main.dart'; 

class AiGeneratorScreen extends StatefulWidget {
  const AiGeneratorScreen({super.key});

  @override
  State<AiGeneratorScreen> createState() => _AiGeneratorScreenState();
}

class _AiGeneratorScreenState extends State<AiGeneratorScreen> {
  // Your API Key is inserted here
  final String _apiKey = 'AIzaSyAUrgj8ip4pxuKXLfnHULvNPz9rVReMv30'; 
  
  bool _isLoading = false;
  String? _fileName;
  final TextEditingController _textController = TextEditingController();

  // 1. Pick a text file from the device
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'json', 'md'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      try {
        String content = await file.readAsString();
        setState(() {
          _fileName = result.files.single.name;
          _textController.text = content; // Preview the text
        });
      } catch (e) {
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error reading file: $e')));
      }
    }
  }

  // 2. Send text to Gemini AI and parse the result
  Future<void> _generateFlashcards() async {
    if (_textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter text or upload a file first')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Initialize the Model
      final model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);

      // The Prompt: strict instructions for JSON format
      final prompt = '''
      You are a strict teacher. Analyze the following study notes and generate 10 multiple choice questions.
      
      CRITICAL: Return the response ONLY as valid JSON. Do not include markdown formatting, backticks, or the word "json".
      The structure must be exactly this list format:
      [
        {
          "id": 1,
          "question": "Question text?",
          "options": ["A", "B", "C", "D"],
          "correctIndex": 0,
          "explanation": "Explanation here"
        }
      ]

      Here is the content to analyze:
      ${_textController.text}
      ''';

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      if (response.text != null) {
        // Clean the response in case AI adds markdown
        String cleanJson = response.text!
            .replaceAll('```json', '')
            .replaceAll('```', '')
            .trim();
        
        List<dynamic> parsedList = jsonDecode(cleanJson);
        
        // Map the JSON to objects your game can read
        List<dynamic> generatedCases = parsedList.map((item) {
          return _AiCaseItem(
            id: DateTime.now().millisecondsSinceEpoch + (item['id'] as int? ?? 0),
            question: item['question'] ?? 'No Question',
            options: List<String>.from(item['options'] ?? ['Yes', 'No']),
            correctIndex: item['correctIndex'] ?? 0,
            explanation: item['explanation'] ?? 'No explanation',
          );
        }).toList();

        if (mounted) {
          // Navigate to the Game Screen with the new data
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FlashcardGameScreen(
                title: 'AI Quiz: ${_fileName ?? "Custom Notes"}',
                caseList: generatedCases,
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        // Show error details for debugging
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('AI Error: $e'), duration: const Duration(seconds: 5)),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Flashcard Generator')),
      body: Stack(
        children: [
           // Use the same bubble background for consistency
           const Positioned.fill(child: GoldenBubbles(count: 15)),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 // Instruction Card
                 Card(
                 color: const Color(0xFF1A1A1A),
                 shape: RoundedRectangleBorder(
                   side: BorderSide(color: Colors.amber.withAlpha(128)),
                   borderRadius: BorderRadius.circular(12)
                 ),
                   child: ListTile(
                     leading: const Icon(Icons.upload_file, color: Colors.amber),
                     title: Text(_fileName ?? 'Upload Lecture Notes (.txt)'),
                     subtitle: const Text('Or paste text below to generate cards', style: TextStyle(color: Colors.white54)),
                     onTap: _pickFile,
                     trailing: _fileName != null ? const Icon(Icons.check_circle, color: Colors.green) : const Icon(Icons.add, color: Colors.white),
                   ),
                 ),
                 const SizedBox(height: 16),
                 
                 // Text Input Area
                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.black54,
                       borderRadius: BorderRadius.circular(12),
                       border: Border.all(color: Colors.white24),
                     ),
                     child: TextField(
                       controller: _textController,
                       maxLines: null,
                       style: const TextStyle(color: Colors.white),
                       decoration: const InputDecoration(
                         contentPadding: EdgeInsets.all(16),
                         hintText: 'Paste your lecture text here, or type a topic (e.g., "Antibiotics Mechanism")...',
                         hintStyle: TextStyle(color: Colors.white30),
                         border: InputBorder.none,
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 16),
                 
                 // Generate Button
                 SizedBox(
                   height: 55,
                   child: ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.amber,
                       foregroundColor: Colors.black,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                     ),
                     onPressed: _isLoading ? null : _generateFlashcards,
                     icon: _isLoading 
                         ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2)) 
                         : const Icon(Icons.auto_awesome),
                     label: Text(
                       _isLoading ? 'Generating Questions...' : 'Generate Flashcards',
                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }
}

// Simple class to hold the AI data
class _AiCaseItem {
  final int id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  _AiCaseItem({
    required this.id, 
    required this.question, 
    required this.options, 
    required this.correctIndex, 
    required this.explanation
  });
}