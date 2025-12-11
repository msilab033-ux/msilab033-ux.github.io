import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
// Note: avoid using dart:io for web requests; we use `package:http` for model listing
import 'package:http/http.dart' as http;
import 'dart:math';
// dart:io and dart:typed_data removed for web compatibility; we use http and text input only
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// removed unnecessary direct imports; `package:flutter/material.dart` exports required symbols
// file_picker removed; we now accept text input only for mindmap generation
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:graphview/GraphView.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart';

// Import your data files
import 'organicchemistry.dart' as organic;
import 'applied.dart' as applied;
import 'clinical_toxicology.dart' as toxicology;
import 'clinical_chemistry.dart' as chemistry;

Future<void> _launchTelegram() async {
  final uri = Uri.parse('https://t.me/PandaRxxx');
  try {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  } catch (e) {
    debugPrint('Could not launch $uri: $e');
  }
}

void main() {
  runApp(const FloatingCaseApp());
}

class FloatingCaseApp extends StatelessWidget {
  const FloatingCaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'امسيكيو على طاير - Updated',
      debugShowCheckedModeBanner: false,
      home: const SubjectSelectionScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: Colors.amber,
              secondary: Colors.amber,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SUBJECT SELECTION SCREEN
// -----------------------------------------------------------------------------
class SubjectSelectionScreen extends StatefulWidget {
  const SubjectSelectionScreen({super.key});

  @override
  State<SubjectSelectionScreen> createState() => _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState extends State<SubjectSelectionScreen> {
  bool _isFlashcardMode = false;

  Widget _buildSubjectCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.amber.withAlpha(100)),
      ),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.amber, size: 48),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withAlpha(242),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeSwitch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.amber.withAlpha(128)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isFlashcardMode = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_isFlashcardMode ? Colors.amber : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'MCQ Quiz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: !_isFlashcardMode ? Colors.black : Colors.white70,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isFlashcardMode = true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _isFlashcardMode ? Colors.amber : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Flashcards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isFlashcardMode ? Colors.black : Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('اختر المادة'),
        ),
        actions: [
          TextButton(
            onPressed: _launchTelegram,
            child: const Text(
              'PandaRx',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AiGeneratorScreen()),
          );
        },
        label: const Text('AI Generator'),
        icon: const Icon(Icons.auto_awesome),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          Column(
            children: [
              _buildModeSwitch(),
              Expanded(
                child: Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            _buildSubjectCard(
                              context,
                              'Applied Therapeutics',
                              Icons.medical_services,
                              () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => AppliedTherapeuticsCategoryScreen(
                                      caseList: applied.appliedTherapeuticsCaseList,
                                      isFlashcardMode: _isFlashcardMode,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildSubjectCard(
                              context,
                              'Organic Chemistry | الكيمياء العضوية',
                              Icons.science,
                              () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => OrganicChemistryCategoryScreen(
                                      caseList: organic.organicChemistryCaseList,
                                      isFlashcardMode: _isFlashcardMode,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildSubjectCard(
                              context,
                              'Clinical Toxicology | السموم السريرية',
                              Icons.warning,
                              () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ClinicalToxicologyCategoryScreen(
                                      caseList: toxicology.clinicalToxicologyCaseList,
                                      isFlashcardMode: _isFlashcardMode,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildSubjectCard(
                              context,
                              'Clinical Chemistry | الكيمياء السريرية',
                              Icons.biotech,
                              () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ClinicalChemistryCategoryScreen(
                                      caseList: chemistry.clinicalChemistryCaseList,
                                      isFlashcardMode: _isFlashcardMode,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// CATEGORY SCREENS
// -----------------------------------------------------------------------------

class OrganicChemistryCategoryScreen extends StatelessWidget {
  final List<organic.OrganicCaseItem> caseList;
  final bool isFlashcardMode;
  
  const OrganicChemistryCategoryScreen({super.key, required this.caseList, required this.isFlashcardMode});

  IconData _getIconForCategory(organic.OrganicChemistryCategory category) {
     switch (category) {
      case organic.OrganicChemistryCategory.lec1: return Icons.looks_one;
      case organic.OrganicChemistryCategory.lec2: return Icons.looks_two;
      case organic.OrganicChemistryCategory.lec3: return Icons.looks_3;
      case organic.OrganicChemistryCategory.lec4: return Icons.looks_4;
      case organic.OrganicChemistryCategory.lec5: return Icons.looks_5;
      case organic.OrganicChemistryCategory.lec6: return Icons.looks_6;
      case organic.OrganicChemistryCategory.lec7: return Icons.library_books;
    }
  }

  void _navigateToGame(BuildContext context, String title, List<dynamic> filteredList) {
    if (isFlashcardMode) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => FlashcardGameScreen(title: title, caseList: filteredList),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => FloatingCaseHome(title: title, caseList: filteredList),
      ));
    }
  }

  Widget _buildCategoryCard(BuildContext context, organic.OrganicChemistryCategory category) {
    final questionCount = caseList.where((c) => c.categories.contains(category)).length;
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () {
          final filteredCases = caseList.where((c) => c.categories.contains(category)).toList();
          _navigateToGame(context, category.displayName, filteredCases);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForCategory(category), color: Colors.amber),
              const SizedBox(height: 12),
              Text(category.displayName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withAlpha(242), fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text('$questionCount أسئلة', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesCard(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () => _navigateToGame(context, 'كل فصول الكيمياء العضوية', caseList),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.all_inclusive, color: Colors.amber, size: 32),
               SizedBox(width: 12),
               Text('كل الأسئلة', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Directionality(textDirection: TextDirection.rtl, child: Text('اختر الفصل (كيمياء عضوية)'))),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.9,
                children: [
                  for (final category in organic.OrganicChemistryCategory.values) _buildCategoryCard(context, category),
                  _buildAllCategoriesCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppliedTherapeuticsCategoryScreen extends StatelessWidget {
  final List<applied.AppliedCaseItem> caseList;
  final bool isFlashcardMode;
  
  const AppliedTherapeuticsCategoryScreen({super.key, required this.caseList, required this.isFlashcardMode});

  IconData _getIconForCategory(applied.AppliedTherapeuticsCategory category) {
     switch (category) {
      case applied.AppliedTherapeuticsCategory.lec1: return Icons.looks_one;
      case applied.AppliedTherapeuticsCategory.lec2: return Icons.looks_two;
      case applied.AppliedTherapeuticsCategory.lec3: return Icons.looks_3;
      case applied.AppliedTherapeuticsCategory.lec4: return Icons.looks_4;
      case applied.AppliedTherapeuticsCategory.lec5: return Icons.looks_5;
      case applied.AppliedTherapeuticsCategory.lec6: return Icons.looks_6;
      case applied.AppliedTherapeuticsCategory.lec7: return Icons.library_books;
      case applied.AppliedTherapeuticsCategory.lec8: return Icons.library_books;
      case applied.AppliedTherapeuticsCategory.lec9: return Icons.library_books;
    }
  }

  void _navigateToGame(BuildContext context, String title, List<dynamic> filteredList) {
    if (isFlashcardMode) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FlashcardGameScreen(title: title, caseList: filteredList)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FloatingCaseHome(title: title, caseList: filteredList)));
    }
  }

  Widget _buildCategoryCard(BuildContext context, applied.AppliedTherapeuticsCategory category) {
    final questionCount = caseList.where((c) => c.categories.contains(category)).length;
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () {
          final filteredCases = caseList.where((c) => c.categories.contains(category)).toList();
          _navigateToGame(context, category.displayName, filteredCases);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForCategory(category), color: Colors.amber),
              const SizedBox(height: 12),
              Text(category.displayName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withAlpha(242), fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text('$questionCount أسئلة', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesCard(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () => _navigateToGame(context, 'كل فصول المعالجة التطبيقية', caseList),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.all_inclusive, color: Colors.amber, size: 32),
               SizedBox(width: 12),
               Text('كل الأسئلة', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Directionality(textDirection: TextDirection.rtl, child: Text('اختر الفصل (معالجة تطبيقية)'))),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.9,
                children: [
                  for (final category in applied.AppliedTherapeuticsCategory.values) _buildCategoryCard(context, category),
                  _buildAllCategoriesCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClinicalToxicologyCategoryScreen extends StatelessWidget {
  final List<toxicology.ClinicalToxicologyCaseItem> caseList;
  final bool isFlashcardMode;
  
  const ClinicalToxicologyCategoryScreen({super.key, required this.caseList, required this.isFlashcardMode});

  IconData _getIconForCategory(toxicology.ClinicalToxicologyCategory category) {
     switch (category) {
      case toxicology.ClinicalToxicologyCategory.lec1: return Icons.looks_one;
      case toxicology.ClinicalToxicologyCategory.lec2: return Icons.looks_two;
      case toxicology.ClinicalToxicologyCategory.lec3: return Icons.looks_3;
      case toxicology.ClinicalToxicologyCategory.lec4: return Icons.looks_4;
      case toxicology.ClinicalToxicologyCategory.lec5: return Icons.looks_5;
      case toxicology.ClinicalToxicologyCategory.lec6: return Icons.looks_6;
      case toxicology.ClinicalToxicologyCategory.lec7: return Icons.library_books;
    }
  }

  void _navigateToGame(BuildContext context, String title, List<dynamic> filteredList) {
    if (isFlashcardMode) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FlashcardGameScreen(title: title, caseList: filteredList)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FloatingCaseHome(title: title, caseList: filteredList)));
    }
  }

  Widget _buildCategoryCard(BuildContext context, toxicology.ClinicalToxicologyCategory category) {
    final questionCount = caseList.where((c) => c.categories.contains(category)).length;
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () {
          final filteredCases = caseList.where((c) => c.categories.contains(category)).toList();
          _navigateToGame(context, category.displayName, filteredCases);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForCategory(category), color: Colors.amber),
              const SizedBox(height: 12),
              Text(category.displayName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withAlpha(242), fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text('$questionCount أسئلة', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesCard(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () => _navigateToGame(context, 'كل فصول السموم السريرية', caseList),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.all_inclusive, color: Colors.amber, size: 32),
               SizedBox(width: 12),
               Text('كل الأسئلة', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Directionality(textDirection: TextDirection.rtl, child: Text('اختر الفصل (سموم سريرية)'))),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.9,
                children: [
                  for (final category in toxicology.ClinicalToxicologyCategory.values) _buildCategoryCard(context, category),
                  _buildAllCategoriesCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClinicalChemistryCategoryScreen extends StatelessWidget {
  final List<chemistry.ClinicalChemistryCaseItem> caseList;
  final bool isFlashcardMode;
  
  const ClinicalChemistryCategoryScreen({super.key, required this.caseList, required this.isFlashcardMode});

  IconData _getIconForCategory(chemistry.ClinicalChemistryCategory category) {
     switch (category) {
      case chemistry.ClinicalChemistryCategory.lec1: return Icons.looks_one;
      case chemistry.ClinicalChemistryCategory.lec2: return Icons.looks_two;
      case chemistry.ClinicalChemistryCategory.lec3: return Icons.looks_3;
      case chemistry.ClinicalChemistryCategory.lec4: return Icons.looks_4;
      case chemistry.ClinicalChemistryCategory.lec5: return Icons.looks_5;
      case chemistry.ClinicalChemistryCategory.lec6: return Icons.looks_6;
      case chemistry.ClinicalChemistryCategory.lec7: return Icons.library_books;
    }
  }

  void _navigateToGame(BuildContext context, String title, List<dynamic> filteredList) {
    if (isFlashcardMode) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FlashcardGameScreen(title: title, caseList: filteredList)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => FloatingCaseHome(title: title, caseList: filteredList)));
    }
  }

  Widget _buildCategoryCard(BuildContext context, chemistry.ClinicalChemistryCategory category) {
    final questionCount = caseList.where((c) => c.categories.contains(category)).length;
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () {
          final filteredCases = caseList.where((c) => c.categories.contains(category)).toList();
          _navigateToGame(context, category.displayName, filteredCases);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForCategory(category), color: Colors.amber),
              const SizedBox(height: 12),
              Text(category.displayName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withAlpha(242), fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text('$questionCount أسئلة', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesCard(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.amber.withAlpha(100))),
      elevation: 4,
      child: InkWell(
        onTap: () => _navigateToGame(context, 'كل فصول الكيمياء السريرية', caseList),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.all_inclusive, color: Colors.amber, size: 32),
               SizedBox(width: 12),
               Text('كل الأسئلة', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Directionality(textDirection: TextDirection.rtl, child: Text('اختر الفصل (كيمياء سريرية)'))),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.9,
                children: [
                  for (final category in chemistry.ClinicalChemistryCategory.values) _buildCategoryCard(context, category),
                  _buildAllCategoriesCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SECURE AI GENERATOR SCREEN (FIXED: Direct File Bytes & Multiple Models)
// -----------------------------------------------------------------------------

class AiGeneratorScreen extends StatefulWidget {
  const AiGeneratorScreen({super.key});

  @override
  State<AiGeneratorScreen> createState() => _AiGeneratorScreenState();
}

class _AiGeneratorScreenState extends State<AiGeneratorScreen> {
  // Key state management
  final TextEditingController _keyController = TextEditingController();
  String? _userApiKey;
  bool _isCheckingKey = true; 

  // Generation state
  bool _isLoading = false;
  String _loadingMessage = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedKey();
  }

  Future<void> _loadSavedKey() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userApiKey = prefs.getString('gemini_api_key');
      _isCheckingKey = false;
    });
  }

  Future<void> _saveKey() async {
    final key = _keyController.text.trim();
    if (key.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('gemini_api_key', key);
      setState(() {
        _userApiKey = key;
      });
    }
  }

  Future<void> _clearKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('gemini_api_key');
    setState(() {
      _userApiKey = null;
      _keyController.clear();
      _textController.clear();
    });
  }

  Future<void> _openApiKeyUrl() async {
    final uri = Uri.parse('https://aistudio.google.com/app/apikey');
    if (!await launchUrl(uri)) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not launch URL")));
    }
  }

  @override
  void dispose() {
    _keyController.dispose();
    _textController.dispose();
    super.dispose();
  }

  // No file picker — mindmap generation uses text input only.

  // 2. Generate (UPDATED: Tries multiple models automatically)
  Future<void> _generateFlashcards() async {
    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter text to analyze')));
      return;
    }
    if (_userApiKey == null) return;

    setState(() {
      _isLoading = true;
      _loadingMessage = 'AI is analyzing content...';
    });

    // Auto-detect a model that supports generateContent and use it directly.
    final detected = await _findModelSupportingGenerateContent(_userApiKey!);
    List<String> modelsToTry;
    if (detected != null && detected.isNotEmpty) {
      modelsToTry = [detected];
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Auto-selected model: $detected')));
    } else {
      // No detected supported model; try known working models in order.
      modelsToTry = [
        'gemini-2.5-flash',
        'gemini-1.5-flash',
        'gemini-1.5-flash-latest',
        'gemini-1.5-pro',
      ];
    }

    String? successModel;
    String lastError = '';

    try {
      GenerateContentResponse? response;

      for (final modelName in modelsToTry) {
        try {
          debugPrint("Attempting with model: $modelName");
          final model = GenerativeModel(model: modelName, apiKey: _userApiKey!);
          
          final prompt = '''
          Analyze the following user text and produce a structured mind map in JSON only.

          Requirements:
          - Return ONLY valid JSON and nothing else.
          - JSON schema: {"nodes":[{"id":"n0","label":"Root" ,"notes":"optional"}], "edges":[{"from":"n0","to":"n1"}], "metadata":{"rootId":"n0"}}
          - Keep labels short (<= 60 chars). Group subtopics logically under parent nodes.
          - Use node ids like n0, n1, n2...

          Here is the user text:
          ${_textController.text}
          ''';

          List<Part> parts = [];
          parts.add(TextPart(prompt));

           parts.add(TextPart(_textController.text));

          response = await model.generateContent([Content.multi(parts)]);
          
          if (response.text != null && response.text!.isNotEmpty) {
            successModel = modelName;
            break; // Success!
          }
        } catch (e) {
          debugPrint("Model $modelName failed: $e");
          lastError = e.toString();
          // Loop continues to next model...
        }
      }

      // If we auto-selected a single model and it failed, try the fallback list once.
      if (successModel == null && detected != null && detected.isNotEmpty) {
        final fallback = [
          'gemini-2.5-flash',
          'gemini-1.5-flash',
          'gemini-1.5-flash-latest',
          'gemini-1.5-pro',
        ];
        for (final modelName in fallback) {
          try {
            debugPrint("Fallback attempt with model: $modelName");
            final model = GenerativeModel(model: modelName, apiKey: _userApiKey!);
            final prompt = '''
            Analyze the following user text and produce a structured mind map in JSON only.

            Requirements:
            - Return ONLY valid JSON and nothing else.
            - JSON schema: {"nodes":[{"id":"n0","label":"Root" ,"notes":"optional"}], "edges":[{"from":"n0","to":"n1"}], "metadata":{"rootId":"n0"}}
            - Keep labels short (<= 60 chars). Group subtopics logically under parent nodes.
            - Use node ids like n0, n1, n2...

            Here is the user text:
            ${_textController.text}
            ''';

            final List<Part> parts = [TextPart(prompt)];
            final response = await model.generateContent([Content.multi(parts)]);
            if (response.text != null && response.text!.isNotEmpty) {
              successModel = modelName;
              break;
            }
          } catch (e) {
            lastError = e.toString();
          }
        }
      }

      if (successModel != null && response?.text != null) {
        String clean = response!.text!.replaceAll('```json', '').replaceAll('```', '').trim();
        // Try parsing as JSON mindmap
        try {
          final Map<String, dynamic> parsed = jsonDecode(clean) as Map<String, dynamic>;
          final nodes = (parsed['nodes'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
          final edges = (parsed['edges'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

          if (mounted) {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MindMapScreen(nodes: nodes, edges: edges, title: 'Mind Map')));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Mind map generated using $successModel')));
          }
        } catch (e) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to parse mindmap JSON: $e')));
        }
      } else {
        // If all model attempts failed, try to fetch the list of available models
        // for this API key to help debugging and present it to the user.
        final modelsList = await _fetchAvailableModels(_userApiKey!);
        final details = modelsList.isNotEmpty ? modelsList.join('\n') : 'No models returned from the API.';

        if (mounted) {
          // Show a dialog with the list (or error) so the user can read it fully.
          showDialog<void>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('AI Models Report'),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(child: Text(details)),
              ),
              actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Close'))],
            ),
          );

          // Also show a concise snackbar with guidance.
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('AI Failed: $lastError. See model report.'),
            duration: const Duration(seconds: 6),
          ));
        }
        return; // stop further error propagation
      }

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('AI Failed: $e'), 
          duration: const Duration(seconds: 8),
        ));
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Helper: fetch list of available models from the Generative Language REST API
  Future<List<String>> _fetchAvailableModels(String apiKey) async {
    try {
      final uri = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey');
      // Use package:http which works on web and mobile.
      final resp = await http.get(uri);
      final body = resp.body;

      if (resp.statusCode == 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(body) as Map<String, dynamic>;
        final items = jsonBody['models'] as List<dynamic>?;
        if (items == null) return [];
        return items.map<String>((m) {
          final name = m['name'] ?? m['model'] ?? m['displayName'] ?? 'unknown';
          final methods = (m['supportedMethods'] as List<dynamic>?)?.join(', ') ?? '';
          return '$name ${methods.isNotEmpty ? '($methods)' : ''}';
        }).toList();
      } else {
        return ['Failed to fetch models (status ${resp.statusCode}): $body'];
      }
    } catch (e) {
      return ['Error fetching models: $e'];
    }
  }

  /// Query the models endpoint and return the first model name that
  /// advertises support for the `generateContent` method, or `null`.
  Future<String?> _findModelSupportingGenerateContent(String apiKey) async {
    try {
      final uri = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey');
      final resp = await http.get(uri);
      if (resp.statusCode != 200) return null;
      final Map<String, dynamic> jsonBody = jsonDecode(resp.body) as Map<String, dynamic>;
      final items = jsonBody['models'] as List<dynamic>?;
      if (items == null) return null;
      for (final m in items) {
        if (m is Map<String, dynamic>) {
          final methods = (m['supportedMethods'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
          if (methods.contains('generateContent')) {
            return (m['name'] ?? m['model'] ?? m['displayName'])?.toString();
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingKey) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // --- SETUP SCREEN (Dark, Golden Bubbles) ---
    if (_userApiKey == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Setup AI')),
        body: Stack(
          children: [
            const Positioned.fill(child: GoldenBubbles(count: 15)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.vpn_key, size: 64, color: Colors.amber),
                  const SizedBox(height: 24),
                  const Text("AI Setup Required", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 12),
                  const Text("Enter your free Google Gemini API Key to generate flashcards from PDFs.", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _openApiKeyUrl, 
                    icon: const Icon(Icons.open_in_new),
                    label: const Text("Get Free API Key"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _keyController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Paste API Key Here",
                      labelStyle: TextStyle(color: Colors.amber),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                      prefixIcon: Icon(Icons.key, color: Colors.white54),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _saveKey,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                      child: const Text("Save & Continue", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // --- GENERATOR SCREEN (Dark, Golden Bubbles) ---
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart AI Generator'),
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: _clearKey, tooltip: "Change API Key")],
      ),
      body: Stack(
        children: [
           const Positioned.fill(child: GoldenBubbles(count: 15)),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 // Text-only mindmap input
                 const SizedBox(height: 10),
                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white24)),
                     child: TextField(
                       controller: _textController,
                       maxLines: null,
                       readOnly: _isLoading,
                       style: const TextStyle(color: Colors.white),
                       decoration: const InputDecoration(
                         contentPadding: EdgeInsets.all(16),
                         hintText: 'Paste text here to generate a mind map (no files required)...',
                         hintStyle: TextStyle(color: Colors.white30),
                         border: InputBorder.none,
                       ),
                     ),
                   ),
                 ),

                 const SizedBox(height: 16),
                 SizedBox(
                   height: 55,
                   child: ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    onPressed: _isLoading ? null : _generateFlashcards,
                    icon: _isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
                        : const Icon(Icons.account_tree),
                    label: Text(
                      _isLoading ? _loadingMessage : 'Generate Mind Map',
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

// _AiCaseItem duplicate removed (kept in `ai_generator.dart`)

// -----------------------------------------------------------------------------
// FLASHCARD GAME SCREEN
// -----------------------------------------------------------------------------
class FlashcardGameScreen extends StatefulWidget {
  final String title;
  final List<dynamic> caseList;

  const FlashcardGameScreen({super.key, required this.title, required this.caseList});

  @override
  State<FlashcardGameScreen> createState() => _FlashcardGameScreenState();
}

class _FlashcardGameScreenState extends State<FlashcardGameScreen> {
  late List<dynamic> _deck;
  int _currentIndex = 0;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _deck = List.from(widget.caseList);
  }

  void _nextCard() {
    setState(() {
      if (_currentIndex < _deck.length - 1) {
        _currentIndex++;
        _isFlipped = false;
      }
    });
  }

  void _prevCard() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _isFlipped = false;
      }
    });
  }

  void _shuffleDeck() {
    setState(() {
      _deck.shuffle();
      _currentIndex = 0;
      _isFlipped = false;
    });
  }

  void _toggleFlip() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCase = _deck.isEmpty ? null : _deck[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle, color: Colors.amber),
            onPressed: _shuffleDeck,
            tooltip: 'خلط الأوراق',
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(child: GoldenBubbles(count: 22)),
          if (_deck.isEmpty)
             const Center(child: Text('لا توجد بطاقات', style: TextStyle(color: Colors.white)))
          else
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'بطاقة ${_currentIndex + 1} من ${_deck.length}',
                    style: const TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: _toggleFlip,
                        child: FlashcardWidget(
                          isFlipped: _isFlipped,
                          front: _buildFront(currentCase),
                          back: _buildBack(currentCase),
                        ),
                      ),
                    ),
                  ),
                ),
                // Controls
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _currentIndex > 0 ? _prevCard : null,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('السابق'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10,
                          foregroundColor: Colors.amber,
                        ),
                      ),
                      const Text(
                        'اضغط على البطاقة للقلب',
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                      ElevatedButton.icon(
                        onPressed: _currentIndex < _deck.length - 1 ? _nextCard : null,
                        // Swap icon/label for RTL feel or keep standard
                        icon: const Icon(Icons.arrow_forward), 
                        label: const Text('التالي'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10,
                          foregroundColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFront(dynamic item) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withAlpha(128), width: 2),
      ),
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.help_outline, size: 48, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              item.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack(dynamic item) {
    // Get correct answer text
    final correctAns = item.options[item.correctIndex];
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.greenAccent.withAlpha(128), width: 2),
      ),
      padding: const EdgeInsets.all(24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('الإجابة الصحيحة:', style: TextStyle(color: Colors.white54, fontSize: 14)),
              const SizedBox(height: 10),
              Text(
                correctAns,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white24),
              const SizedBox(height: 20),
              if (item.explanation != null && item.explanation.isNotEmpty)
                Text(
                  item.explanation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textDirection: TextDirection.rtl,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Flip Animation Widget to avoid external packages
class FlashcardWidget extends StatelessWidget {
  final bool isFlipped;
  final Widget front;
  final Widget back;

  const FlashcardWidget({
    super.key,
    required this.isFlipped,
    required this.front,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotateAnim,
          child: child,
          builder: (context, child) {
            final isUnder = (ValueKey(isFlipped) != child!.key);
            var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
            tilt *= isUnder ? -1.0 : 1.0;
            final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
            return Transform(
              transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      layoutBuilder: (widget, list) => Stack(children: [if (widget != null) widget, ...list]),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack.flipped,
      child: isFlipped
          ? SizedBox(key: const ValueKey(true), child: back)
          : SizedBox(key: const ValueKey(false), child: front),
    );
  }
}

// ---------------------- MCQ HOME SCREEN (EXISTING) ----------------------
// (Keep this section - it contains your original game logic)

class FloatingCaseHome extends StatefulWidget {
  final String title;
  final List<dynamic> caseList;

  const FloatingCaseHome({super.key, required this.title, required this.caseList});

  @override
  State<FloatingCaseHome> createState() => _FloatingCaseHomeState();
}

class _FloatingCaseHomeState extends State<FloatingCaseHome> with SingleTickerProviderStateMixin {
  final _rand = Random();
  dynamic _current;
  int? _selectedIndex;
  bool _answered = false;
  bool _isReview = false;
  late Set<int> _remainingIds;
  final List<SolvedCase> _history = [];
  bool _completedRun = false;

  @override
  void initState() {
    super.initState();
    _resetPool();
  }

  void _resetPool() {
    _remainingIds = widget.caseList.map<int>((c) => c.id).toSet();
    _history.clear();
    _completedRun = false;
    _current = null;
    _selectedIndex = null;
    _answered = false;
    _isReview = false;
    setState(() {});
  }

  dynamic _pickRandomFromRemaining() {
    if (_remainingIds.isEmpty) return null;
    final ids = _remainingIds.toList();
    final id = ids[_rand.nextInt(ids.length)];
    return widget.caseList.firstWhere((c) => c.id == id);
  }

  void _showRandomCase() {
    final next = _pickRandomFromRemaining();
    if (next == null) {
      setState(() {
        _completedRun = true;
        _current = null;
      });
      return;
    }
    setState(() {
      _current = next;
      _selectedIndex = null;
      _answered = false;
      _isReview = false;
    });
  }

  void _selectAnswer(int index) {
    if (_current == null || _answered || _isReview) return;
    final isCorrect = index == _current.correctIndex;

    setState(() {
      _selectedIndex = index;
      _answered = true;

      if (_remainingIds.contains(_current.id)) {
        _remainingIds.remove(_current.id);
      }
      final already = _history.any((h) => h.item.id == _current.id);
      if (!already) {
        _history.insert(
          0,
          SolvedCase(
            item: _current,
            selectedIndex: index,
            isCorrect: isCorrect,
            time: DateTime.now(),
          ),
        );
      }
    });
  }

  void _reviewFromHistory(SolvedCase entry) {
    setState(() {
      _current = entry.item;
      _selectedIndex = entry.selectedIndex;
      _answered = true;
      _isReview = true;
      _completedRun = false;
    });
  }

  void _showHistoryDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final isWide = constraints.maxWidth >= 980;

        return Scaffold(
          appBar: AppBar(
            title: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            actions: [
              if (!isWide)
                Builder(
                  builder: (inner) => IconButton(
                    tooltip: 'السجل',
                    onPressed: () => _showHistoryDrawer(inner),
                    icon: const Icon(Icons.history, color: Colors.amber),
                  ),
                ),
            ],
          ),
          endDrawer: isWide ? null : _HistoryDrawer(history: _history, onTap: _reviewFromHistory),
          body: Stack(
            children: [
              Positioned.fill(child: GoldenBubbles(count: 22)),
              SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _buildMainContent(isWide: isWide),
                      ),
                    ),
                    if (isWide)
                      SizedBox(
                        width: 340,
                        child: _HistoryPanel(
                          history: _history,
                          onTap: _reviewFromHistory,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainContent({required bool isWide}) {
    if (_completedRun) {
      return _buildCompletionCard();
    }
    if (_current == null) {
      return _buildStartCard();
    }
    return _buildCaseCard(_current);
  }

  Widget _buildStartCard() {
    return Center(
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Card(
              color: const Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.amber.withAlpha(100)),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.play_circle_fill, color: Colors.amber, size: 56),
                    const SizedBox(height: 12),
                    Text(
                      'يلة نبدي',
                      style: TextStyle(
                        color: Colors.white.withAlpha(242),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'دوس حتى تعرض سؤال عشوائي.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14.5),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber.withAlpha(38),
                        foregroundColor: Colors.amber,
                      ),
                      onPressed: _showRandomCase,
                      icon: const Icon(Icons.casino),
                      label: const Text('عرض حالة'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompletionCard() {
    return Center(
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Card(
              color: const Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.amber.withAlpha(100)),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.emoji_events, color: Colors.amber, size: 56),
                    const SizedBox(height: 12),
                    Text(
                      'عفية سجاج👏, خلصت كل الأسئلة',
                      style: TextStyle(
                        color: Colors.white.withAlpha(242),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'تريد تبدا من جديد؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14.5),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber.withAlpha(38),
                        foregroundColor: Colors.amber,
                      ),
                      onPressed: _resetPool,
                      icon: const Icon(Icons.refresh),
                      label: const Text(' أبدا من جديد'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaseCard(dynamic caseItem) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Card(
            color: const Color(0xFF1A1A1A),
            elevation: 4,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.amber.withAlpha(100)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.help_outline, color: Colors.amber),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          caseItem.question,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(caseItem.options.length, (i) {
                    final isCorrect = i == caseItem.correctIndex;
                    final isSelected = i == _selectedIndex;
                    final showState = _answered;
                    Color border;
                    Color fill;
                    IconData? icon;

                    if (showState && isCorrect) {
                      border = Colors.amber;
                      fill = Colors.amber.withAlpha(30);
                      icon = Icons.check_circle;
                    } else if (showState && isSelected && !isCorrect) {
                      border = Colors.orangeAccent;
                      fill = Colors.orangeAccent.withAlpha(30);
                      icon = Icons.cancel;
                    } else {
                      border = Colors.white10;
                      fill = Colors.white.withAlpha(8);
                      icon = null;
                    }

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: border, width: 1),
                        color: fill,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: _isReview ? null : () => _selectAnswer(i),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          child: Row(
                            children: [
                              if (icon != null)
                                Icon(icon, color: isCorrect ? Colors.amber : Colors.orangeAccent)
                              else
                                const Icon(Icons.radio_button_unchecked, color: Colors.white38),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  caseItem.options[i],
                                  style: const TextStyle(fontSize: 16.5, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: !_answered
                        ? const SizedBox.shrink()
                        : Row(
                            key: ValueKey(_answered),
                            children: [
                              Icon(
                                (_selectedIndex == caseItem.correctIndex)
                                    ? Icons.check_circle
                                    : Icons.error_outline,
                                color: (_selectedIndex == caseItem.correctIndex)
                                    ? Colors.amber
                                    : Colors.orangeAccent,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                (_selectedIndex == caseItem.correctIndex) ? 'إجابة صحيحة!' : 'إجابة غير صحيحة',
                                style: TextStyle(
                                  color: (_selectedIndex == caseItem.correctIndex) ? Colors.amber : Colors.orangeAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (_isReview)
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(' — عرض من السجل', style: TextStyle(color: Colors.white54)),
                                ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 250),
                    crossFadeState: _answered ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'الشرح: ${caseItem.explanation}',
                        style: TextStyle(
                          color: Colors.white.withAlpha(229),
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _showRandomCase,
                        icon: const Icon(Icons.autorenew, color: Colors.amber),
                        label: const Text('حالة أخرى', style: TextStyle(color: Colors.amber)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() { _current = null; });
                        },
                        icon: const Icon(Icons.visibility_off, color: Colors.white70),
                        label: const Text('إخفاء', style: TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SolvedCase {
  final dynamic item;
  final int selectedIndex;
  final bool isCorrect;
  final DateTime time;

  SolvedCase({
    required this.item,
    required this.selectedIndex,
    required this.isCorrect,
    required this.time,
  });
}

class _HistoryPanel extends StatelessWidget {
  final List<SolvedCase> history;
  final void Function(SolvedCase) onTap;

  const _HistoryPanel({required this.history, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: const Color(0xFF1A1A1A),
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: const [
              Icon(Icons.history, color: Colors.amber),
              SizedBox(width: 8),
              Text('السجل', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(height: 8),
            Expanded(
              child: history.isEmpty
                  ? const Center(
                      child: Text(
                        'لا يوجد عناصر بعد',
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  : ListView.separated(
                      itemCount: history.length,
                      separatorBuilder: (_, __) => Divider(color: Colors.white10),
                      itemBuilder: (context, i) {
                        final h = history[i];
                        return ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          leading: Icon(
                            h.isCorrect ? Icons.check_circle : Icons.cancel,
                            color: h.isCorrect ? Colors.amber : Colors.orangeAccent,
                          ),
                          title: Text(
                            h.item.question,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14.5),
                          ),
                          subtitle: Text(
                            'جوابك: ${h.item.options[h.selectedIndex]}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white60, fontSize: 12.5),
                          ),
                          trailing: const Icon(Icons.visibility, color: Colors.white54),
                          onTap: () => onTap(h),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryDrawer extends StatelessWidget {
  final List<SolvedCase> history;
  final void Function(SolvedCase) onTap;

  const _HistoryDrawer({required this.history, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1A1A1A),
      child: SafeArea(
        child: _HistoryPanel(history: history, onTap: (h) {
          Navigator.of(context).maybePop();
          onTap(h);
        }),
      ),
    );
  }
}

class GoldenBubbles extends StatefulWidget {
  const GoldenBubbles({super.key, this.count = 22});
  final int count;

  @override
  State<GoldenBubbles> createState() => _GoldenBubblesState();
}

class _GoldenBubblesState extends State<GoldenBubbles> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_BubbleSeed> _seeds;
  final _rand = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )
      ..addListener(() {
        setState(() {});
      })
      ..repeat();

    _seeds = List.generate(widget.count, (i) {
      final radius = _rand.nextDouble() * 18 + 8;
      final speed = _rand.nextDouble() * 1.2 + 0.4;
      final amp = _rand.nextDouble() * 40 + 20;
      final phase = _rand.nextDouble() * pi * 2;
      final color = Colors.amber.withAlpha(48 + _rand.nextInt(68));
      return _BubbleSeed(
        baseX: _rand.nextDouble(),
        baseY: _rand.nextDouble(),
        radius: radius,
        speed: speed,
        amplitude: amp,
        phase: phase,
        color: color,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = _controller.value * 18.0;
    return CustomPaint(
      painter: _BubblesPainter(
        time: time,
        seeds: _seeds,
      ),
    );
  }
}

// Mind map rendering screen
class MindMapScreen extends StatefulWidget {
  final List<Map<String, dynamic>> nodes;
  final List<Map<String, dynamic>> edges;
  final String title;

  const MindMapScreen({super.key, required this.nodes, required this.edges, this.title = 'Mind Map'});

  @override
  State<MindMapScreen> createState() => _MindMapScreenState();
}

class _MindMapScreenState extends State<MindMapScreen> {
  final GlobalKey _repaintKey = GlobalKey();
  bool _isSaving = false;
  final TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _saveMindMapAsPng() async {
    if (_isSaving) return;
    setState(() => _isSaving = true);

    try {
      // wait a short moment to ensure repaint has completed
      await Future.delayed(const Duration(milliseconds: 120));
      final RenderRepaintBoundary? boundary = _repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        throw Exception('Could not capture widget (boundary == null). Ensure the map is visible and try again.');
      }

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw Exception('Could not convert image to bytes');

      final List<int> pngBytes = byteData.buffer.asUint8List();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'mindmap_$timestamp.png';

      if (kIsWeb) {
        // Web download
        try {
          _downloadPngWeb(pngBytes, fileName);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mind map download started: $fileName')),
            );
          }
        } catch (we) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error downloading mind map: $we')),
            );
          }
        }
      } else {
        // Mobile: Save to documents
        final dir = await path_provider.getApplicationDocumentsDirectory();
        final filePath = '${dir.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(pngBytes);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Mind map saved to: $filePath'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e, st) {
      debugPrint('Save error: $e\n$st');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving mind map: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _downloadPngWeb(List<int> bytes, String fileName) {
    if (!kIsWeb) return;
    try {
      // Use data URI approach (base64) and attempt to open it.
      final base64Data = base64Encode(bytes);
      final dataUri = 'data:image/png;base64,$base64Data';
      // Attempt to open the data URI; browsers may download or open in new tab
      launchUrl(Uri.parse(dataUri));
    } catch (e) {
      debugPrint('Web download error: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.nodes.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(
          child: Text('No mind map data available', style: TextStyle(color: Colors.white70)),
        ),
      );
    }

    final graph = Graph();
    final Map<String, Node> nodeMap = {};
    final Map<Node, Widget> nodeWidgets = {};

    for (int idx = 0; idx < widget.nodes.length; idx++) {
      final n = widget.nodes[idx];
      final id = (n['id'] ?? 'n$idx').toString();
      final label = (n['label'] ?? 'Node $idx').toString();
      final isRoot = idx == 0;
      
      final nodeWidget = Container(
        constraints: const BoxConstraints(minWidth: 90, minHeight: 60),
        decoration: BoxDecoration(
          color: isRoot ? Colors.amber : const Color(0xFF444444),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isRoot ? Colors.amberAccent : Colors.amber.withAlpha(150),
            width: isRoot ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isRoot ? Colors.black : Colors.white,
                fontWeight: isRoot ? FontWeight.bold : FontWeight.w500,
                fontSize: isRoot ? 13 : 11,
              ),
            ),
          ),
        ),
      );
      
      final node = Node.Id(id);
      nodeMap[id] = node;
      nodeWidgets[node] = nodeWidget;
      graph.addNode(node);
    }

    for (final e in widget.edges) {
      final from = (e['from'] ?? '').toString();
      final to = (e['to'] ?? '').toString();
      final a = nodeMap[from];
      final b = nodeMap[to];
      if (a != null && b != null) {
        try {
          graph.addEdge(a, b);
        } catch (ex) {
          debugPrint('Error adding edge: $ex');
        }
      }
    }

    final builder = BuchheimWalkerConfiguration();
    builder.siblingSeparation = 60;
    builder.levelSeparation = 100;
    builder.subtreeSeparation = 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: _isSaving 
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.amber, strokeWidth: 2))
              : const Icon(Icons.download, color: Colors.amber),
            tooltip: 'Save as PNG',
            onPressed: _isSaving ? null : _saveMindMapAsPng,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: RepaintBoundary(
        key: _repaintKey,
        child: Container(
          color: Colors.black,
          child: InteractiveViewer(
            transformationController: _transformationController,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(2000),
            minScale: 0.02,
            maxScale: 5.0,
            panEnabled: true,
            scaleEnabled: true,
            child: SizedBox(
              width: 2000,
              height: 2000,
              child: GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                builder: (Node n) => nodeWidgets[n] ?? const SizedBox.shrink(),
                paint: Paint()
                  ..color = Colors.amber
                  ..strokeWidth = 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _BubbleSeed {
  final double baseX;
  final double baseY;
  final double radius;
  final double speed;
  final double amplitude;
  final double phase;
  final Color color;

  _BubbleSeed({
    required this.baseX,
    required this.baseY,
    required this.radius,
    required this.speed,
    required this.amplitude,
    required this.phase,
    required this.color,
  });
}

class _BubblesPainter extends CustomPainter {
  final double time;
  final List<_BubbleSeed> seeds;

  _BubblesPainter({required this.time, required this.seeds});

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.black;
    canvas.drawRect(Offset.zero & size, bg);

    for (final s in seeds) {
      final cx = s.baseX * size.width + sin((time * s.speed) + s.phase) * s.amplitude;
      final cy = s.baseY * size.height + cos((time * s.speed) + s.phase) * s.amplitude;
      final bubblePaint = Paint()..color = s.color;
      canvas.drawCircle(Offset(cx, cy), s.radius, bubblePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BubblesPainter oldDelegate) {
    return oldDelegate.time != time || oldDelegate.seeds != seeds;
  }
}
