// clinical_toxicology.dart
enum ClinicalToxicologyCategory {
  lec1('Coming Later '),
  lec2('Coming Later '),
  lec3('Coming Later '),
  lec4('Coming Later '),
  lec5('Coming Later '),
  lec6('Coming Later '),
  lec7('Coming Later ');

  const ClinicalToxicologyCategory(this.displayName);
  final String displayName;
}

class ClinicalToxicologyCaseItem {
  final int id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Set<ClinicalToxicologyCategory> categories;

  const ClinicalToxicologyCaseItem({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.categories,
  });
}

// Sample clinical toxicology cases
final List<ClinicalToxicologyCaseItem> clinicalToxicologyCaseList = [
  ClinicalToxicologyCaseItem(
    id: 1,
    question: ' Test ما هو الترياق المحدد للتسمم بالسيانيد؟',
    options: [
      'N-acetylcysteine',
      'Hydroxocobalamin',
      'Flumazenil',
      'Atropine'
    ],
    correctIndex: 1,
    explanation: 'الهيدروكسوكوبالامين هو الترياق المحدد للتسمم بالسيانيد حيث يرتبط مع السيانيد ليشكل سيانوكوبالامين غير السام.',
    categories: {ClinicalToxicologyCategory.lec1},
  ),
  
   
];