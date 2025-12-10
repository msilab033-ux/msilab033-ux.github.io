// organicchemistry.dart
enum OrganicChemistryCategory {
  lec1('Coming Later '),
  lec2('Coming Later '),
  lec3('Coming Later '),
  lec4('Coming Later '),
  lec5('Coming Later '),
  lec6('Coming Later '),
  lec7('Coming Later ');

  const OrganicChemistryCategory(this.displayName);
  final String displayName;
}

class OrganicCaseItem {
  final int id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Set<OrganicChemistryCategory> categories;

  const OrganicCaseItem({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.categories,
  });
}

// Sample organic chemistry cases
final List<OrganicCaseItem> organicChemistryCaseList = [
  OrganicCaseItem(
    id: 1,
    question: ' Test ما هو المركب الذي يعتبر من الألكانات؟',
    options: [
      'CH₃CH₂OH',
      'CH₃COOH',
      'CH₃CH₂CH₃',
      'C₆H₆'
    ],
    correctIndex: 2,
    explanation: 'البروبان (CH₃CH₂CH₃) هو ألكان بينما المركبات الأخرى إما كحول أو حمض كربوكسيلي أو مركب عطري.',
    categories: {OrganicChemistryCategory.lec1},
  ),
  

];