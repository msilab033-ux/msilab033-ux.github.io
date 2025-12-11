// clinical_chemistry.dart
enum ClinicalChemistryCategory {
  lec1('Lipid'),
  lec2('Liver '),
  lec3('Enzymology '),
  lec4('Carbohydrates '),
  lec5('Last Year\'s mid '),
  lec6('Coming Later '),
  lec7('Coming Later ');

  const ClinicalChemistryCategory(this.displayName);
  final String displayName;
}

class ClinicalChemistryCaseItem {
  final int id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Set<ClinicalChemistryCategory> categories;

  const ClinicalChemistryCaseItem({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.categories,
  });
}

// Sample clinical chemistry cases
final List<ClinicalChemistryCaseItem> clinicalChemistryCaseList = [
  // Regular MCQs (1-30)
ClinicalChemistryCaseItem(
    id: 1,
    question: 'Which of the following lipids is a straight-chain carbon compound that can be saturated or unsaturated?',
    options: [
      'Cholesterol',
      'Fatty Acids', 
      'Phospholipids',
      'Triglycerides'
    ],
    correctIndex: 1,
    explanation: 'Fatty acids are defined as straight-chain carbon compounds of varying lengths that may be saturated (no double bonds), monounsaturated (one double bond), or polyunsaturated (multiple double bonds).',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 2,
    question: 'Which lipoprotein is responsible for transporting exogenous lipids from the intestine to tissues?',
    options: [
      'VLDL',
      'LDL',
      'HDL',
      'Chylomicrons'
    ],
    correctIndex: 3,
    explanation: 'Chylomicrons are the largest and least dense lipoproteins that transport exogenous lipid from the intestine to all cells.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 3,
    question: 'What is the rate-limiting enzyme in cholesterol synthesis?',
    options: [
      'Lipoprotein lipase',
      'LCAT',
      'HMG-CoA reductase',
      'Cholesterol esterase'
    ],
    correctIndex: 2,
    explanation: 'HMG-CoA reductase is the rate-limiting enzyme in cholesterol synthesis and is controlled by negative feedback from intracellular cholesterol concentration.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 4,
    question: 'Which apolipoprotein activates lipoprotein lipase?',
    options: [
      'Apo A-I',
      'Apo B-48',
      'Apo C-II',
      'Apo E'
    ],
    correctIndex: 2,
    explanation: 'Apo C-II activates lipoprotein lipase in tissues, enabling the hydrolysis of triglycerides from chylomicrons and VLDL.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 5,
    question: 'Which lipoprotein is involved in reverse cholesterol transport?',
    options: [
      'Chylomicrons',
      'VLDL',
      'LDL',
      'HDL'
    ],
    correctIndex: 3,
    explanation: 'HDL (high-density lipoproteins) are involved in the transport of cholesterol from cells back to the liver, known as reverse cholesterol transport.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 6,
    question: 'What happens to chylomicrons after they lose approximately 90% of their triglyceride content?',
    options: [
      'They become HDL particles',
      'They are converted to VLDL',
      'They form chylomicron remnants',
      'They are excreted in urine'
    ],
    correctIndex: 2,
    explanation: 'As chylomicrons lose triacylglycerol, they become smaller and relatively enriched in cholesterol, forming chylomicron remnants that are taken up by the liver.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 7,
    question: 'Which lipoprotein is formed during the conversion of VLDL to LDL?',
    options: [
      'Chylomicrons',
      'IDL',
      'HDL',
      'Lipoprotein(a)'
    ],
    correctIndex: 1,
    explanation: 'Intermediate-density lipoproteins (IDLs) are transient particles formed during the conversion of VLDL to LDL and are not normally present in plasma.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 8,
    question: 'Which enzyme esterifies cholesterol within HDL particles?',
    options: [
      'HMG-CoA reductase',
      'Lipoprotein lipase',
      'LCAT',
      'Cholesterol oxidase'
    ],
    correctIndex: 2,
    explanation: 'Lecithin:cholesterol acyltransferase (LCAT) converts free cholesterol to cholesterol esters within HDL particles, with activation by apo A-I.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 9,
    question: 'In Fredrickson classification, which type is characterized by elevated chylomicrons and deficiency of lipoprotein lipase?',
    options: [
      'Type I',
      'Type IIa',
      'Type III',
      'Type IV'
    ],
    correctIndex: 0,
    explanation: 'Type I hyperlipoproteinemia is characterized by elevated chylomicrons and can be due to deficiency of lipoprotein lipase or apo C-II.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 10,
    question: 'Which condition is characterized by defective LDL receptors and autosomal dominant inheritance?',
    options: [
      'Familial hypertriglyceridemia',
      'Familial hypercholesterolemia',
      'Type III hyperlipoproteinemia',
      'Tangier disease'
    ],
    correctIndex: 1,
    explanation: 'Familial hypercholesterolemia is usually inherited as an autosomal dominant trait with defective LDL receptors, showing type IIa or IIb Fredrickson phenotype.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 11,
    question: 'Which drug class inhibits HMG-CoA reductase?',
    options: [
      'Fibrates',
      'Statins',
      'Bile acid sequestrants',
      'Ezetimibe'
    ],
    correctIndex: 1,
    explanation: 'Statins (HMG-CoA reductase inhibitors) such as lovastatin, simvastatin, and atorvastatin inhibit the rate-limiting enzyme of cholesterol synthesis.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 12,
    question: 'What is the main apolipoprotein in LDL?',
    options: [
      'Apo A-I',
      'Apo B-48',
      'Apo B-100',
      'Apo E'
    ],
    correctIndex: 2,
    explanation: 'LDL contains only apo B-100 as its apolipoprotein and is formed from VLDL metabolism.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 13,
    question: 'Which condition is associated with very low HDL levels and yellow tonsils?',
    options: [
      'Familial hypercholesterolemia',
      'Tangier disease',
      'LCAT deficiency',
      'Fish-eye disease'
    ],
    correctIndex: 1,
    explanation: 'Tangier disease is characterized by very low HDL levels, large yellow tonsils, hepatomegaly, and accumulation of cholesterol esters in the reticuloendothelial system.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 14,
    question: 'What is the primary function of lipoprotein lipase?',
    options: [
      'Synthesize cholesterol',
      'Esterify cholesterol',
      'Hydrolyze triglycerides',
      'Transport lipids'
    ],
    correctIndex: 2,
    explanation: 'Lipoprotein lipase hydrolyzes triacylglycerol to fatty acid and glycerol, enabling uptake by adipose cells and muscle cells.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 15,
    question: 'Which lipoprotein has the lowest density?',
    options: [
      'HDL',
      'LDL',
      'VLDL',
      'Chylomicrons'
    ],
    correctIndex: 3,
    explanation: 'Chylomicrons have the lowest density (<0.95 g/mL) and largest size (500 nm) among lipoproteins.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 16,
    question: 'In Type III hyperlipoproteinemia, what is the underlying biochemical defect?',
    options: [
      'LDL receptor deficiency',
      'Reduced clearance of remnant lipoproteins',
      'Lipoprotein lipase deficiency',
      'Apo A-I deficiency'
    ],
    correctIndex: 1,
    explanation: 'Type III hyperlipoproteinemia involves reduced clearance of chylomicron and VLDL remnants due to abnormal apoE that binds poorly to remnant receptors.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 17,
    question: 'Which drug class works by binding bile salts in the intestinal lumen?',
    options: [
      'Statins',
      'Fibrates',
      'Bile acid sequestrants',
      'Ezetimibe'
    ],
    correctIndex: 2,
    explanation: 'Bile salt sequestrants like colestipol and colestyramine bind bile salts in the intestinal lumen, interrupting their reabsorption and stimulating hepatic LDL receptor expression.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 18,
    question: 'What is the main apolipoprotein in nascent chylomicrons?',
    options: [
      'Apo B-100',
      'Apo B-48',
      'Apo A-I',
      'Apo E'
    ],
    correctIndex: 1,
    explanation: 'Nascent chylomicrons formed in intestinal mucosal cells contain apo B-48, along with dietary lipids and phospholipids.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 19,
    question: 'Which condition results from a mutation in the apoB gene affecting amino acid 3500?',
    options: [
      'Familial hypercholesterolemia',
      'Familial defective apoB3500',
      'Tangier disease',
      'LCAT deficiency'
    ],
    correctIndex: 1,
    explanation: 'Familial defective apoB3500 results from a mutation substituting arginine for glutamine at position 3500, impairing LDL receptor binding.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 20,
    question: 'What is the typical Fredrickson phenotype in polygenic hypercholesterolemia?',
    options: [
      'Type I or Type V',
      'Type IIa or Type IIb',
      'Type III only',
      'Type IV only'
    ],
    correctIndex: 1,
    explanation: 'Polygenic hypercholesterolemia typically shows either IIa or IIb Fredrickson phenotype and is one of the most common causes of raised plasma cholesterol.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 21,
    question: 'Which enzyme deficiency causes accumulation of free unesterified cholesterol in tissues?',
    options: [
      'Lipoprotein lipase',
      'HMG-CoA reductase',
      'LCAT',
      'Hepatic lipase'
    ],
    correctIndex: 2,
    explanation: 'LCAT deficiency results in accumulation of free unesterified cholesterol in tissues, causing corneal opacities, renal damage, and atherosclerosis.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 22,
    question: 'Which lipoprotein acquires apo C-II and apo E from circulating HDL after entering circulation?',
    options: [
      'LDL',
      'Nascent chylomicrons',
      'Mature HDL',
      'IDL'
    ],
    correctIndex: 1,
    explanation: 'Nascent chylomicrons acquire apo C-II and apo E from circulating HDL shortly after entering the circulation, enabling activation of lipoprotein lipase.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 23,
    question: 'What is the primary risk associated with hyperalpholipoproteinemia?',
    options: [
      'Increased cardiovascular disease',
      'Acute pancreatitis',
      'Premature atherosclerosis',
      'No increased cardiovascular risk'
    ],
    correctIndex: 3,
    explanation: 'Hyperalpholipoproteinemia (elevated HDL) shows no increased prevalence of cardiovascular disease despite elevated total cholesterol.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 24,
    question: 'Which of the following is a secondary cause of hypertriglyceridemia?',
    options: [
      'Hypothyroidism',
      'Nephrotic syndrome',
      'Alcohol excess',
      'Cholestasis'
    ],
    correctIndex: 2,
    explanation: 'Alcohol excess is a predominant cause of secondary hypertriglyceridemia, along with obesity, diabetes, and certain drugs.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 25,
    question: 'What is the main site of apolipoprotein synthesis?',
    options: [
      'Intestine',
      'Adipose tissue',
      'Liver',
      'Muscle'
    ],
    correctIndex: 2,
    explanation: 'All apolipoproteins are mainly synthesized in the liver, though small quantities are produced from almost all organs.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 26,
    question: 'Which condition is characterized by overproduction of VLDL triglyceride?',
    options: [
      'Familial hypercholesterolemia',
      'Familial combined hyperlipidemia',
      'Type I hyperlipoproteinemia',
      'Tangier disease'
    ],
    correctIndex: 1,
    explanation: 'Familial combined hyperlipidemia involves increased synthesis of VLDL triglyceride and may show IIa, IIb, or IV Fredrickson phenotypes.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 27,
    question: 'What happens to plasma triglyceride concentrations after a meal?',
    options: [
      'Decrease',
      'Remain unchanged',
      'Increase',
      'Become undetectable'
    ],
    correctIndex: 2,
    explanation: 'Plasma triglyceride concentrations rise after a meal due to dietary fat absorption, unlike plasma cholesterol which remains more stable.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 28,
    question: 'Which drug inhibits intestinal cholesterol uptake specifically?',
    options: [
      'Statins',
      'Fibrates',
      'Ezetimibe',
      'Colestyramine'
    ],
    correctIndex: 2,
    explanation: 'Ezetimibe inhibits intestinal cholesterol uptake specifically by blocking the NPC1L1 transporter.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 29,
    question: 'What is the characteristic feature of Type III hyperlipoproteinemia on electrophoresis?',
    options: [
      'Isolated LDL elevation',
      'Broad beta band',
      'Chylomicron layer',
      'Isolated HDL elevation'
    ],
    correctIndex: 1,
    explanation: 'Type III hyperlipoproteinemia is also called broad beta-hyperlipidemia due to its characteristic electrophoretic pattern.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 30,
    question: 'Which condition may present with eruptive xanthomata and lipaemia retinalis?',
    options: [
      'Familial hypercholesterolemia',
      'Chylomicron syndrome',
      'Hyperalpholipoproteinemia',
      'LCAT deficiency'
    ],
    correctIndex: 1,
    explanation: 'Chylomicron syndrome (Type I or V) may present with eruptive xanthomata, hepatosplenomegaly, and lipaemia retinalis due to extremely high triglycerides.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

// Clinical Case MCQs (31-40)
ClinicalChemistryCaseItem(
    id: 31,
    question: 'A 45-year-old male presents with severe abdominal pain and is diagnosed with acute pancreatitis. Laboratory analysis reveals markedly elevated plasma triglycerides and a creamy layer formed when plasma is left overnight at 4°C. Which lipoprotein is most likely responsible?',
    options: [
      'LDL',
      'HDL',
      'VLDL',
      'Chylomicrons'
    ],
    correctIndex: 3,
    explanation: 'The creamy layer formation overnight is characteristic of chylomicrons. Chylomicron syndrome (Type I or V) can present with abdominal pain and acute pancreatitis due to extremely high triglycerides.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 32,
    question: 'A 35-year-old woman presents with yellow-orange tonsils and very low HDL cholesterol levels. Genetic testing reveals a defect in the ABC1 gene. What is the most likely diagnosis?',
    options: [
      'Familial hypercholesterolemia',
      'Tangier disease',
      'LCAT deficiency',
      'Familial hypertriglyceridemia'
    ],
    correctIndex: 1,
    explanation: 'Tangier disease is characterized by very low HDL levels, large yellow tonsils, and a defect in the ABC1 gene involved in HDL transport.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 33,
    question: 'A 50-year-old male with tendon xanthomas and corneal arcus has total cholesterol of 350 mg/dL. His father died of myocardial infarction at age 45. Which genetic defect is most likely?',
    options: [
      'Lipoprotein lipase deficiency',
      'LDL receptor mutation',
      'Apo E abnormality',
      'LCAT deficiency'
    ],
    correctIndex: 1,
    explanation: 'The presentation is classic for familial hypercholesterolemia, which is usually due to LDL receptor mutations and shows autosomal dominant inheritance with premature coronary artery disease.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 34,
    question: 'A 60-year-old diabetic patient develops corneal opacities and renal impairment. Laboratory shows low HDL and accumulation of free cholesterol. Which enzyme deficiency is suspected?',
    options: [
      'HMG-CoA reductase',
      'Lipoprotein lipase',
      'LCAT',
      'Hepatic lipase'
    ],
    correctIndex: 2,
    explanation: 'LCAT deficiency causes accumulation of free unesterified cholesterol, leading to corneal opacities, renal damage, and low HDL levels.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 35,
    question: 'A 40-year-old obese male with metabolic syndrome has elevated triglycerides and low HDL. He shows phenotypes IIa, IIb, and IV at different times. What is the most likely diagnosis?',
    options: [
      'Familial hypercholesterolemia',
      'Familial combined hyperlipidemia',
      'Type I hyperlipoproteinemia',
      'Hyperalpholipoproteinemia'
    ],
    correctIndex: 1,
    explanation: 'Familial combined hyperlipidemia can show variable phenotypes (IIa, IIb, IV) and is associated with overproduction of VLDL triglyceride and insulin resistance.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 36,
    question: 'A patient with hypothyroidism develops hypercholesterolemia. Which pattern of lipid abnormality is most characteristic of this secondary cause?',
    options: [
      'Isolated hypertriglyceridemia',
      'Combined hyperlipidemia',
      'Isolated hypercholesterolemia',
      'Low HDL with high triglycerides'
    ],
    correctIndex: 2,
    explanation: 'Hypothyroidism typically causes predominant hypercholesterolemia due to reduced LDL receptor activity and decreased cholesterol clearance.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 37,
    question: 'A 55-year-old male with peripheral vascular disease has elevated cholesterol and triglycerides. Electrophoresis shows broad beta band. Which apolipoprotein abnormality is responsible?',
    options: [
      'Apo A-I deficiency',
      'Apo B-100 mutation',
      'Apo E2/E2 genotype',
      'Apo C-II deficiency'
    ],
    correctIndex: 2,
    explanation: 'Type III hyperlipoproteinemia (broad beta disease) is typically caused by apoE2/E2 genotype, leading to impaired remnant clearance and peripheral vascular disease.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 38,
    question: 'A patient taking cyclosporin after kidney transplantation develops hyperlipidemia. Which lipid pattern is most expected with this medication?',
    options: [
      'Isolated HDL elevation',
      'Predominant hypercholesterolemia',
      'Isolated hypertriglyceridemia',
      'Combined hyperlipidemia'
    ],
    correctIndex: 1,
    explanation: 'Cyclosporin is known to cause predominant hypercholesterolemia as a secondary effect, along with other drugs like chlorinated hydrocarbons.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 39,
    question: 'A 30-year-old athlete has elevated HDL cholesterol (90 mg/dL) but no family history of cardiovascular disease. What is the most appropriate management?',
    options: [
      'Start statin therapy',
      'No treatment needed',
      'Begin fibrate therapy',
      'Lipoprotein apheresis'
    ],
    correctIndex: 1,
    explanation: 'Hyperalpholipoproteinemia (elevated HDL) shows no increased cardiovascular risk and requires no treatment, especially in an athlete where exercise naturally raises HDL.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

ClinicalChemistryCaseItem(
    id: 40,
    question: 'A patient with familial hypercholesterolemia fails to achieve target LDL levels with high-dose statin therapy. Which additional drug works by inhibiting intestinal cholesterol absorption?',
    options: [
      'Gemfibrozil',
      'Colestyramine',
      'Ezetimibe',
      'Niacin'
    ],
    correctIndex: 2,
    explanation: 'Ezetimibe inhibits intestinal cholesterol uptake specifically and is often used in combination with statins for additional LDL lowering in familial hypercholesterolemia.',
    categories: {ClinicalChemistryCategory.lec1},
  ),

  // Regular MCQs (1-30)
ClinicalChemistryCaseItem(
    id: 1,
    question: 'What is the main blood supply to the liver?',
    options: [
      'Hepatic artery',
      'Portal vein',
      'Central hepatic vein',
      'Sinusoidal spaces'
    ],
    correctIndex: 1,
    explanation: 'The main blood supply to the liver is via the portal vein, which brings nutrient-rich blood from the gastrointestinal tract.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 2,
    question: 'Which cells in the liver have phagocytic and detoxifying functions?',
    options: [
      'Hepatocytes',
      'Kupffer cells',
      'Endothelial cells',
      'Biliary epithelial cells'
    ],
    correctIndex: 1,
    explanation: 'Kupffer cells are hepatic macrophages located along sinusoidal walls that are part of the reticuloendothelial system and have important detoxifying functions.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 3,
    question: 'Which of the following coagulation factors requires vitamin K for synthesis?',
    options: [
      'Factor V',
      'Factor VII',
      'Factor XI',
      'Factor XIII'
    ],
    correctIndex: 1,
    explanation: 'Prothrombin (II) and factors VII, IX, and X cannot be synthesized without vitamin K, while factors V, XI, XII, and XIII do not require vitamin K.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 4,
    question: 'What is the primary site for bilirubin conjugation?',
    options: [
      'Spleen',
      'Smooth endoplasmic reticulum',
      'Mitochondria',
      'Biliary canaliculi'
    ],
    correctIndex: 1,
    explanation: 'Bilirubin is conjugated with glucuronate in the smooth endoplasmic reticulum by UDP-glucuronosyltransferase.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 5,
    question: 'Which form of bilirubin is water-soluble and can be excreted in urine?',
    options: [
      'Unconjugated bilirubin',
      'Conjugated bilirubin',
      'Bilirubin-albumin complex',
      'Free bilirubin'
    ],
    correctIndex: 1,
    explanation: 'Conjugated bilirubin is water-soluble, less strongly protein-bound, and can be excreted in urine, while unconjugated bilirubin is lipid-soluble and cannot be excreted in urine.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 6,
    question: 'What is the rate-limiting step in bilirubin metabolism?',
    options: [
      'Hemoglobin breakdown',
      'Bilirubin conjugation',
      'Secretion into biliary canaliculi',
      'Urobilinogen formation'
    ],
    correctIndex: 2,
    explanation: 'The secretion of conjugated bilirubin into the biliary canaliculi is the rate-limiting step in bilirubin metabolism.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 7,
    question: 'At what plasma bilirubin concentration does jaundice typically become clinically apparent?',
    options: [
      '20 µmol/L',
      '50 µmol/L',
      '100 µmol/L',
      '200 µmol/L'
    ],
    correctIndex: 1,
    explanation: 'Jaundice usually becomes clinically apparent when the plasma bilirubin concentration reaches about 50 µmol/L.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 8,
    question: 'Which condition is characterized by unconjugated hyperbilirubinemia due to impaired conjugation?',
    options: [
      'Dubin-Johnson syndrome',
      'Gilbert\'s syndrome',
      'Primary biliary cirrhosis',
      'Cholestasis'
    ],
    correctIndex: 1,
    explanation: 'Gilbert\'s syndrome is characterized by mild unconjugated hyperbilirubinemia due to reduced UDP-glucuronosyltransferase activity.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 9,
    question: 'What is the most sensitive enzymatic indicator of hepatocellular damage?',
    options: [
      'Alkaline phosphatase',
      'Gamma-glutamyl transferase',
      'Alanine aminotransferase',
      'Lactate dehydrogenase'
    ],
    correctIndex: 2,
    explanation: 'Plasma aminotransferase activities, particularly ALT, are sensitive indicators of hepatocellular damage as they are released from damaged cytoplasmic membranes.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 10,
    question: 'Which enzyme ratio is suggestive of alcoholic liver disease?',
    options: [
      'AST:ALT ≥ 2',
      'ALT:AST ≥ 2',
      'ALP:GGT ≥ 2',
      'GGT:ALP ≥ 2'
    ],
    correctIndex: 0,
    explanation: 'A plasma AST:ALT ratio of ≥ 2 is suggestive but not diagnostic of alcoholic liver disease.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 11,
    question: 'Which test is the most specific indicator of impaired hepatic synthetic function?',
    options: [
      'Plasma albumin',
      'Prothrombin time',
      'Bilirubin',
      'ALT'
    ],
    correctIndex: 1,
    explanation: 'Prolonged prothrombin time is a more specific indicator of impaired synthetic capacity than hypoalbuminemia, as albumin is affected by many non-hepatic conditions.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 12,
    question: 'What finding suggests that elevated alkaline phosphatase is of hepatic origin?',
    options: [
      'Elevated ALT',
      'Elevated GGT',
      'Elevated bilirubin',
      'Prolonged prothrombin time'
    ],
    correctIndex: 1,
    explanation: 'A raised ALP concentration in the presence of a raised GGT concentration implies that the ALP is of hepatic origin.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 13,
    question: 'Which condition is characterized by deposition of bile salts in the skin causing pruritus?',
    options: [
      'Acute hepatitis',
      'Cholestasis',
      'Gilbert\'s syndrome',
      'Hemolytic anemia'
    ],
    correctIndex: 1,
    explanation: 'In prolonged cholestasis, retained bile salts deposited in the skin cause severe pruritus.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 14,
    question: 'What is the typical pattern of aminotransferase elevation in acute viral hepatitis?',
    options: [
      'AST > ALT',
      'ALT > AST',
      'AST = ALT',
      'Normal aminotransferases'
    ],
    correctIndex: 1,
    explanation: 'In viral hepatitis, there is relatively greater increase in plasma ALT than AST activities due to predominant cytoplasmic membrane damage.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 15,
    question: 'Which autoimmune disorder primarily affects middle-aged women and shows elevated IgM?',
    options: [
      'Autoimmune hepatitis',
      'Primary biliary cirrhosis',
      'Wilson\'s disease',
      'Hemochromatosis'
    ],
    correctIndex: 1,
    explanation: 'Primary biliary cirrhosis is a rare autoimmune disorder that occurs most commonly in middle-aged women and shows elevated plasma IgM concentration.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 16,
    question: 'What is the incubation period for Hepatitis A?',
    options: [
      '5-10 days',
      '15-45 days',
      '40-180 days',
      '15-50 days'
    ],
    correctIndex: 1,
    explanation: 'Hepatitis A has an incubation period of between 15 and 45 days and is transmitted by the fecal-oral route.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 17,
    question: 'Which hepatitis virus is most associated with progression to cirrhosis?',
    options: [
      'Hepatitis A',
      'Hepatitis B',
      'Hepatitis C',
      'Hepatitis E'
    ],
    correctIndex: 2,
    explanation: 'Hepatitis C may progress to cirrhosis and is transmitted through blood products and sexual contact.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 18,
    question: 'What biochemical finding is characteristic of alcoholic hepatitis?',
    options: [
      'Markedly elevated aminotransferases',
      'Very high bilirubin',
      'Elevated GGT with modest aminotransferase rise',
      'Normal liver enzymes'
    ],
    correctIndex: 2,
    explanation: 'In alcoholic hepatitis, plasma aminotransferase activities and bilirubin are not usually markedly elevated, but GGT may be elevated due to enzyme induction.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 19,
    question: 'Which condition results in kernicterus in newborns?',
    options: [
      'Conjugated hyperbilirubinemia',
      'High levels of protein-bound bilirubin',
      'Free unconjugated bilirubin crossing blood-brain barrier',
      'Elevated urobilinogen'
    ],
    correctIndex: 2,
    explanation: 'Free unconjugated bilirubin can cross the blood-brain barrier and deposit in brain tissue, causing kernicterus, especially in newborns with immature conjugating systems.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 20,
    question: 'What finding suggests biliary obstruction?',
    options: [
      'Dark urine and pale stools',
      'Dark stools and pale urine',
      'Elevated unconjugated bilirubin',
      'Normal urobilinogen in urine'
    ],
    correctIndex: 0,
    explanation: 'Dark urine (due to bilirubinuria) and pale stools (due to absence of stercobilin) suggest biliary obstruction with retention of conjugated bilirubin.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 21,
    question: 'Which enzyme is induced by alcohol and certain drugs like phenobarbital?',
    options: [
      'ALT',
      'AST',
      'ALP',
      'GGT'
    ],
    correctIndex: 3,
    explanation: 'GGT is derived from endoplasmic reticulum and its synthesis is induced by prolonged alcohol intake and drugs like phenobarbital and phenytoin.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 22,
    question: 'What is the definition of chronic hepatitis?',
    options: [
      'Hepatic inflammation lasting >1 month',
      'Hepatic inflammation lasting >3 months',
      'Hepatic inflammation lasting >6 months',
      'Hepatic inflammation with cirrhosis'
    ],
    correctIndex: 2,
    explanation: 'Chronic hepatitis is defined as hepatic inflammation persisting for more than 6 months.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 23,
    question: 'Which finding suggests chronicity of liver disease?',
    options: [
      'Elevated ALT',
      'Prolonged prothrombin time',
      'Plasma albumin below reference limit',
      'Elevated GGT'
    ],
    correctIndex: 2,
    explanation: 'A plasma albumin concentration below the lower reference limit may imply hepatic disease chronicity, as albumin has a long half-life.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 24,
    question: 'What correction test helps distinguish between hepatocellular and cholestatic causes of prolonged prothrombin time?',
    options: [
      'Vitamin K administration',
      'Albumin infusion',
      'Bile acid supplementation',
      'Fresh frozen plasma'
    ],
    correctIndex: 0,
    explanation: 'Parenteral vitamin K administration corrects prolonged prothrombin time in cholestasis but not in hepatocellular failure.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 25,
    question: 'Which condition is characterized by elevated urinary urobilinogen?',
    options: [
      'Complete biliary obstruction',
      'Hemolysis',
      'Gilbert\'s syndrome',
      'Crigler-Najjar syndrome'
    ],
    correctIndex: 1,
    explanation: 'In severe hemolysis, increased bilirubin conversion to urobilinogen exceeds hepatic re-excretion capacity, leading to urinary urobilinogen excretion.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 26,
    question: 'What is the primary source of bilirubin?',
    options: [
      'Muscle breakdown',
      'Bone marrow immature red cells',
      'Hemoglobin from senescent red cells',
      'Hepatic cytochrome breakdown'
    ],
    correctIndex: 2,
    explanation: 'About 80% of bilirubin is derived from hemoglobin within the reticuloendothelial system from senescent red blood cells.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 27,
    question: 'Which transport protein carries bilirubin to the liver?',
    options: [
      'Transferrin',
      'Albumin',
      'Ligandin',
      'Hemopexin'
    ],
    correctIndex: 1,
    explanation: 'Bilirubin is transported to the liver bound to albumin as unconjugated bilirubin.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 28,
    question: 'What is the characteristic feature of physiological jaundice in newborns?',
    options: [
      'Appears on first day of life',
      'Bilirubin >100 µmol/L',
      'Conjugated hyperbilirubinemia',
      'Occurs between days 2-8, rarely exceeds 100 µmol/L'
    ],
    correctIndex: 3,
    explanation: 'Physiological jaundice in normal full-term babies occurs between days 2 and 8 of life and rarely exceeds 100 µmol/L.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 29,
    question: 'Which condition represents intrahepatic cholestasis?',
    options: [
      'Gallstones',
      'Pancreatic head carcinoma',
      'Primary biliary cirrhosis',
      'Biliary atresia'
    ],
    correctIndex: 2,
    explanation: 'Primary biliary cirrhosis is an autoimmune disorder causing intrahepatic cholestasis, while the others cause extrahepatic obstruction.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 30,
    question: 'What is the end result of many chronic liver diseases characterized by fibrous scar tissue and regenerating nodules?',
    options: [
      'Acute hepatitis',
      'Cholestasis',
      'Cirrhosis',
      'Steatosis'
    ],
    correctIndex: 2,
    explanation: 'Cirrhosis is the end result of many inflammatory and metabolic liver diseases, characterized by fibrous scar tissue distorting hepatic architecture with regenerating nodules.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

// Clinical Case MCQs (31-40)
ClinicalChemistryCaseItem(
    id: 31,
    question: 'A 45-year-old woman presents with pruritus and jaundice. Laboratory tests show elevated ALP (5x upper limit), normal aminotransferases, and elevated IgM. Liver biopsy shows destruction of bile ducts. What is the most likely diagnosis?',
    options: [
      'Acute viral hepatitis',
      'Primary biliary cirrhosis',
      'Alcoholic liver disease',
      'Gilbert\'s syndrome'
    ],
    correctIndex: 1,
    explanation: 'The presentation with pruritus, cholestatic pattern (elevated ALP), elevated IgM, and bile duct destruction on biopsy is classic for primary biliary cirrhosis.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 32,
    question: 'A 25-year-old medical student returns from overseas with nausea, fatigue, and dark urine. Labs show ALT 850 U/L, AST 780 U/L, bilirubin 65 µmol/L (mostly conjugated). What is the most likely mode of transmission?',
    options: [
      'Blood transfusion',
      'Sexual contact',
      'Fecal-oral route',
      'Respiratory droplets'
    ],
    correctIndex: 2,
    explanation: 'The acute hepatitis picture with high aminotransferases and travel history suggests Hepatitis A, which is transmitted via the fecal-oral route.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 33,
    question: 'A 55-year-old male with chronic alcohol use presents with mild jaundice. Labs show AST 120 U/L, ALT 45 U/L, GGT 280 U/L, MCV 102 fL. What is the most likely diagnosis?',
    options: [
      'Viral hepatitis',
      'Alcoholic hepatitis',
      'Biliary obstruction',
      'Gilbert\'s syndrome'
    ],
    correctIndex: 1,
    explanation: 'The AST:ALT ratio >2, elevated GGT, macrocytosis (high MCV), and alcohol history are characteristic of alcoholic liver disease.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 34,
    question: 'A newborn develops jaundice on day 2 of life with bilirubin 85 µmol/L (unconjugated). The baby is feeding well and has no other symptoms. What is the most likely cause?',
    options: [
      'Biliary atresia',
      'Physiological jaundice',
      'Hemolytic disease',
      'Crigler-Najjar syndrome'
    ],
    correctIndex: 1,
    explanation: 'Unconjugated hyperbilirubinemia appearing on day 2-3 in a well-appearing newborn is characteristic of physiological jaundice due to immature hepatic conjugation.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 35,
    question: 'A patient presents with pale stools, dark urine, and jaundice. Ultrasound shows dilated bile ducts. Prothrombin time is prolonged but corrects with vitamin K injection. What is the location of the pathology?',
    options: [
      'Hepatocellular',
      'Intrahepatic cholestasis',
      'Extrahepatic obstruction',
      'Hemolytic'
    ],
    correctIndex: 2,
    explanation: 'The cholestatic pattern (pale stools, dark urine), dilated bile ducts on ultrasound, and vitamin K-responsive coagulopathy indicate extrahepatic biliary obstruction.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 36,
    question: 'A 30-year-old asymptomatic man has persistent unconjugated bilirubin of 45 µmol/L. All other liver tests are normal. There is no evidence of hemolysis. What is the most likely diagnosis?',
    options: [
      'Dubin-Johnson syndrome',
      'Gilbert\'s syndrome',
      'Primary biliary cirrhosis',
      'Alcoholic liver disease'
    ],
    correctIndex: 1,
    explanation: 'Asymptomatic mild unconjugated hyperbilirubinemia with otherwise normal liver function tests is characteristic of Gilbert\'s syndrome.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 37,
    question: 'A patient with chronic hepatitis C develops worsening liver function. Labs show albumin 28 g/L, prolonged prothrombin time not corrected by vitamin K, and mild elevation of aminotransferases. What is the most likely underlying pathology?',
    options: [
      'Acute cholangitis',
      'Hepatocellular carcinoma',
      'Cirrhosis with synthetic failure',
      'Drug-induced liver injury'
    ],
    correctIndex: 2,
    explanation: 'The findings of hypoalbuminemia, prolonged PT not corrected by vitamin K, and chronic hepatitis C history indicate cirrhosis with impaired synthetic function.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 38,
    question: 'A premature newborn develops severe jaundice with bilirubin 350 µmol/L (unconjugated). The baby develops opisthotonos and high-pitched cry. What is the most feared complication?',
    options: [
      'Hepatic failure',
      'Kernicterus',
      'Biliary atresia',
      'Hepatorenal syndrome'
    ],
    correctIndex: 1,
    explanation: 'Very high unconjugated bilirubin in a premature newborn can cause kernicterus, characterized by neurological symptoms like opisthotonos and irreversible brain damage.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 39,
    question: 'A patient taking chlorpromazine for schizophrenia presents with jaundice, pruritus, and elevated ALP. Aminotransferases are mildly elevated. What is the most likely mechanism?',
    options: [
      'Direct hepatotoxicity',
      'Cholestatic drug reaction',
      'Viral hepatitis',
      'Autoimmune hepatitis'
    ],
    correctIndex: 1,
    explanation: 'Chlorpromazine is known to cause cholestatic drug reactions, presenting with jaundice, pruritus, and elevated ALP out of proportion to aminotransferases.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

ClinicalChemistryCaseItem(
    id: 40,
    question: 'A patient with jaundice has bilirubin 150 µmol/L (80% conjugated), no bilirubin in urine, but elevated urinary urobilinogen. What is the most likely type of jaundice?',
    options: [
      'Hemolytic',
      'Hepatocellular',
      'Obstructive',
      'Physiological'
    ],
    correctIndex: 1,
    explanation: 'The presence of conjugated hyperbilirubinemia with urinary urobilinogen suggests hepatocellular jaundice, as the liver can conjugate bilirubin but cannot excrete it properly, while some still reaches the intestine.',
    categories: {ClinicalChemistryCategory.lec2},
  ),

  // Regular MCQs (1-30)
ClinicalChemistryCaseItem(
    id: 1,
    question: 'What is the primary diagnostic value of measuring plasma enzyme activities?',
    options: [
      'To measure metabolic rate',
      'To assess nutritional status',
      'To detect cell damage or organ dysfunction',
      'To monitor hormone levels'
    ],
    correctIndex: 2,
    explanation: 'Measurement of plasma enzyme activities serves as a valuable diagnostic tool for detecting cell damage and organ dysfunction, as enzymes leak into blood when cells are damaged.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 2,
    question: 'Which factor does NOT typically affect plasma enzyme assay results?',
    options: [
      'Reaction temperature',
      'Substrate concentration',
      'Patient\'s eye color',
      'Reaction pH'
    ],
    correctIndex: 2,
    explanation: 'Patient\'s eye color does not affect enzyme assays. Analytical factors like temperature, pH, substrate concentration, and presence of activators/inhibitors do affect results.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 3,
    question: 'During which period is plasma ALP activity physiologically highest?',
    options: [
      'Infancy',
      'Pubertal growth spurt',
      'Middle age',
      'Elderly years'
    ],
    correctIndex: 1,
    explanation: 'Plasma ALP activity of bony origin peaks during the pubertal bone growth spurt due to increased osteoblastic activity before falling to adult levels.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 4,
    question: 'Which enzyme shows higher plasma activity in males compared to females?',
    options: [
      'ALT',
      'AST',
      'GGT',
      'Amylase'
    ],
    correctIndex: 2,
    explanation: 'Plasma GGT activity is higher in men than in women, likely due to differences in body composition and possibly alcohol consumption patterns.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 5,
    question: 'Which enzyme is most specific for hepatic disease?',
    options: [
      'AST',
      'ALT',
      'LDH',
      'CK'
    ],
    correctIndex: 1,
    explanation: 'ALT is more specific for hepatic disease than AST, as ALT is predominantly found in liver cells while AST is widely distributed in multiple tissues.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 6,
    question: 'Which LDH isoenzyme predominates in cardiac muscle and erythrocytes?',
    options: [
      'LDH1',
      'LDH2',
      'LDH3',
      'LDH5'
    ],
    correctIndex: 0,
    explanation: 'LDH1 is the fastest migrating isoenzyme and predominates in cardiac muscle, erythrocytes, and kidney cells.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 7,
    question: 'Which CK isoenzyme is most specific for myocardial damage?',
    options: [
      'CK-MM',
      'CK-MB',
      'CK-BB',
      'CK-Total'
    ],
    correctIndex: 1,
    explanation: 'CK-MB accounts for about 35% of total CK activity in cardiac muscle but less than 5% in skeletal muscle, making it relatively specific for myocardial damage.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 8,
    question: 'In which condition would you expect very high LDH activity with minimal AST change?',
    options: [
      'Myocardial infarction',
      'Hepatitis',
      'Megaloblastic anemia',
      'Muscular dystrophy'
    ],
    correctIndex: 2,
    explanation: 'Very high LDH activities with minimal AST changes are characteristic of megaloblastic anemias and leukemias where bone marrow activity is abnormal.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 9,
    question: 'Which enzyme is most useful for diagnosing acute pancreatitis?',
    options: [
      'ALT',
      'AST',
      'Amylase',
      'GGT'
    ],
    correctIndex: 2,
    explanation: 'Plasma amylase estimation is mainly requested to help diagnose acute pancreatitis, where plasma activity may be very high due to pancreatic cell damage.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 10,
    question: 'Which enzyme is more specific than amylase for pancreatic pathology and has a longer half-life?',
    options: [
      'Lipase',
      'ALT',
      'AST',
      'ALP'
    ],
    correctIndex: 0,
    explanation: 'Lipase is more specific for pancreatic pathology than amylase and has a longer half-life, making it more useful for diagnosing late-presenting acute pancreatitis.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 11,
    question: 'What is macroamylasemia?',
    options: [
      'Increased amylase production',
      'Amylase bound to IgA forming large complexes',
      'Pancreatic amylase hypersecretion',
      'Genetic amylase deficiency'
    ],
    correctIndex: 1,
    explanation: 'Macroamylasemia is a benign condition where amylase binds to IgA, forming large complexes (270 kDa) that are not readily excreted by kidneys, causing persistently high plasma amylase.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 12,
    question: 'In adults, plasma ALP is mainly derived from which tissues?',
    options: [
      'Liver and intestine',
      'Bone and liver',
      'Placenta and kidney',
      'Bone and prostate'
    ],
    correctIndex: 1,
    explanation: 'In adults, plasma ALP is derived mainly from bone and liver in approximately equal proportions, with bone fraction increasing during increased osteoblastic activity.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 13,
    question: 'Which test has largely replaced acid phosphatase for prostate cancer monitoring?',
    options: [
      'ALT',
      'PSA',
      'GGT',
      'LDH'
    ],
    correctIndex: 1,
    explanation: 'Prostate-specific antigen (PSA) measurement has largely replaced acid phosphatase for diagnosing and monitoring prostatic carcinoma due to better specificity and sensitivity.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 14,
    question: 'Which enzyme activity increases during the last trimester of pregnancy?',
    options: [
      'CK',
      'ALT',
      'ALP',
      'AST'
    ],
    correctIndex: 2,
    explanation: 'Plasma ALP activity rises during the last trimester of pregnancy due to the presence of placental isoenzyme.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 15,
    question: 'Which enzyme is most specific for muscle disease?',
    options: [
      'LDH',
      'AST',
      'CK',
      'ALT'
    ],
    correctIndex: 2,
    explanation: 'Plasma CK estimation is more specific than LDH and AST for muscle disease, with CK-MM being the predominant isoenzyme in muscular dystrophies.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 16,
    question: 'What causes decreased plasma cholinesterase activity?',
    options: [
      'Nephrotic syndrome',
      'Liver regeneration',
      'Organophosphate exposure',
      'High protein diet'
    ],
    correctIndex: 2,
    explanation: 'Decreased plasma cholinesterase activity occurs with organophosphate exposure (anticholinesterases), hepatic disease, inherited variants, and pregnancy.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 17,
    question: 'Which enzyme is useful for monitoring organophosphate exposure?',
    options: [
      'Plasma cholinesterase',
      'Erythrocyte acetylcholinesterase',
      'Both A and B',
      'Neither A nor B'
    ],
    correctIndex: 2,
    explanation: 'Both plasma cholinesterase and erythrocyte acetylcholinesterase are useful for monitoring organophosphate exposure, with erythrocyte acetylcholinesterase being more specific for nervous tissue effects.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 18,
    question: 'Which LDH isoenzyme pattern is characteristic of myocardial infarction?',
    options: [
      'LDH1 > LDH2',
      'LDH5 > LDH4',
      'LDH3 predominance',
      'Equal LDH1-5'
    ],
    correctIndex: 0,
    explanation: 'Myocardial infarction shows predominant elevation of LDH1 and LDH2 with LDH1 greater than LDH2 (flipped LDH ratio).',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 19,
    question: 'What is the significance of serial enzyme estimations?',
    options: [
      'To reduce cost',
      'To determine enzyme structure',
      'To assess rate of change and chronicity',
      'To identify genetic variants'
    ],
    correctIndex: 2,
    explanation: 'Serial enzyme estimations help assess the rate of change of plasma enzyme activity, which reflects the balance between entry and removal rates, and can indicate chronic disorders.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 20,
    question: 'Which enzyme rises moderately after strenuous exercise?',
    options: [
      'Amylase',
      'Lipase',
      'CK and AST',
      'ALP'
    ],
    correctIndex: 2,
    explanation: 'Plasma CK and AST activities rise moderately during and immediately after strenuous exercise due to muscle cell damage and leakage.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 21,
    question: 'Which CK isoenzyme is found in brain and smooth muscle?',
    options: [
      'CK-MM',
      'CK-MB',
      'CK-BB',
      'CK-NN'
    ],
    correctIndex: 2,
    explanation: 'CK-BB is present in high concentrations in brain and smooth muscle of gastrointestinal and genital tracts.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 22,
    question: 'What is the main advantage of isoenzyme determination?',
    options: [
      'Lower cost',
      'Faster results',
      'Tissue specificity',
      'Higher sensitivity'
    ],
    correctIndex: 2,
    explanation: 'Isoenzyme determination provides tissue specificity, as different isoenzymes originate from different tissues, giving more diagnostic information than total enzyme activity.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 23,
    question: 'Which enzyme is released during mast cell degranulation in anaphylaxis?',
    options: [
      'Tryptase',
      'Amylase',
      'Lipase',
      'Cholinesterase'
    ],
    correctIndex: 0,
    explanation: 'Tryptase is a serine protease found in mast cells that rises within 1 hour and remains elevated for 4-6 hours during systemic anaphylaxis due to mast cell degranulation.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 24,
    question: 'Why should hemolyzed samples be avoided for ACP measurement?',
    options: [
      'ACP is inhibited by hemoglobin',
      'ACP is found in erythrocytes',
      'Hemolysis increases ACP stability',
      'Hemolysis decreases ACP activity'
    ],
    correctIndex: 1,
    explanation: 'Hemolyzed blood samples should be avoided for ACP measurement because ACP is found in erythrocytes and hemolysis can falsely elevate plasma ACP levels.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 25,
    question: 'Which population has higher baseline plasma CK activity?',
    options: [
      'White females',
      'Asian males',
      'Black people/Afro-Caribbeans',
      'Elderly women'
    ],
    correctIndex: 2,
    explanation: 'Plasma CK activity is higher in black people and Afro-Caribbeans than in white people, which should be considered when interpreting results.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 26,
    question: 'What causes increased plasma cholinesterase activity?',
    options: [
      'Liver failure',
      'Organophosphate poisoning',
      'Nephrotic syndrome',
      'Pregnancy'
    ],
    correctIndex: 2,
    explanation: 'Increased plasma cholinesterase activity occurs in nephrotic syndrome and during recovery from liver damage (actively growing hepatocytes).',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 27,
    question: 'Which enzyme is least useful for muscle disease diagnosis?',
    options: [
      'CK',
      'Aldolase',
      'Amylase',
      'LDH'
    ],
    correctIndex: 2,
    explanation: 'Amylase is not useful for muscle disease diagnosis. CK is most specific, while aldolase and LDH can also indicate muscle damage but are less specific.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 28,
    question: 'When does plasma LDH3 elevation typically occur?',
    options: [
      'Myocardial infarction',
      'Liver damage',
      'Malignancies',
      'Muscular dystrophy'
    ],
    correctIndex: 2,
    explanation: 'LDH3 is the main isoenzyme elevated in malignancies of many tissues and in acute leukemia.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 29,
    question: 'What is the molecular weight of amylase?',
    options: [
      '15 kDa',
      '45 kDa',
      '100 kDa',
      '270 kDa'
    ],
    correctIndex: 1,
    explanation: 'Amylase has a molecular weight of 45 kDa, which is relatively low, allowing it to be excreted in urine.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 30,
    question: 'Which condition can cause low plasma CK activity?',
    options: [
      'Muscular dystrophy',
      'Myocardial infarction',
      'Cachexia with reduced muscle mass',
      'Strenuous exercise'
    ],
    correctIndex: 2,
    explanation: 'Low plasma CK activity can occur in cachetic states with reduced muscle mass, such as alcoholism, undernutrition, and patients in intensive care.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

// Clinical Case MCQs (31-40)
ClinicalChemistryCaseItem(
    id: 31,
    question: 'A 55-year-old male presents with chest pain. CK-MB is elevated and LDH shows LDH1 > LDH2 pattern. What is the most likely diagnosis?',
    options: [
      'Acute pancreatitis',
      'Myocardial infarction',
      'Liver cirrhosis',
      'Muscular dystrophy'
    ],
    correctIndex: 1,
    explanation: 'Elevated CK-MB with flipped LDH ratio (LDH1 > LDH2) is characteristic of myocardial infarction.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 32,
    question: 'A 40-year-old woman with abdominal pain has amylase 1200 U/L and lipase 150 U/L. Ultrasound shows gallstones. What is the most likely diagnosis?',
    options: [
      'Acute pancreatitis',
      'Myocardial infarction',
      'Hepatitis',
      'Macroamylasemia'
    ],
    correctIndex: 0,
    explanation: 'Markedly elevated amylase and lipase with abdominal pain and gallstones on ultrasound suggest acute pancreatitis.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 33,
    question: 'A 16-year-old boy has persistently elevated CK (2000 U/L) with normal other enzymes. Muscle biopsy shows dystrophic changes. Which isoenzyme is most likely elevated?',
    options: [
      'CK-BB',
      'CK-MB',
      'CK-MM',
      'All isoenzymes equally'
    ],
    correctIndex: 2,
    explanation: 'In muscular dystrophies like Duchenne\'s, CK-MM is the predominant isoenzyme elevated due to skeletal muscle damage.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 34,
    question: 'A farmer exposed to pesticides develops muscle weakness. Which enzyme pattern would confirm organophosphate exposure?',
    options: [
      'Elevated amylase and lipase',
      'Decreased cholinesterase and acetylcholinesterase',
      'Elevated LDH1 and LDH2',
      'Increased CK-MB'
    ],
    correctIndex: 1,
    explanation: 'Organophosphate pesticides inhibit both plasma cholinesterase and erythrocyte acetylcholinesterase, causing decreased activity of both enzymes.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 35,
    question: 'A patient with persistent high amylase but no abdominal pain and normal lipase. Urine amylase is normal. What is the most likely explanation?',
    options: [
      'Chronic pancreatitis',
      'Macroamylasemia',
      'Pancreatic cancer',
      'Salivary gland disease'
    ],
    correctIndex: 1,
    explanation: 'Persistently high plasma amylase with normal urine amylase and no symptoms suggests macroamylasemia, where amylase forms large complexes that are not readily excreted.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 36,
    question: 'A 65-year-old man with prostate cancer has elevated acid phosphatase. After rectal examination, his ACP increases further. What is the best course of action?',
    options: [
      'Start chemotherapy',
      'Repeat test after 48 hours',
      'Immediate prostatectomy',
      'Monitor PSA instead'
    ],
    correctIndex: 1,
    explanation: 'ACP can increase after rectal examination due to prostate manipulation. The test should be repeated after 48 hours to allow levels to return to baseline.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 37,
    question: 'A patient develops urticaria and bronchospasm after bee sting. Tryptase is elevated. What is the most likely mechanism?',
    options: [
      'Pancreatic damage',
      'Mast cell degranulation',
      'Liver dysfunction',
      'Muscle injury'
    ],
    correctIndex: 1,
    explanation: 'Elevated tryptase indicates mast cell degranulation, which occurs in systemic anaphylaxis reactions like those to bee stings.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 38,
    question: 'A pregnant woman in her third trimester has elevated ALP but normal other liver enzymes. What is the most likely cause?',
    options: [
      'Liver disease',
      'Bone disease',
      'Placental isoenzyme',
      'Laboratory error'
    ],
    correctIndex: 2,
    explanation: 'Elevated ALP in the third trimester of pregnancy is typically due to placental isoenzyme and is a normal physiological finding.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 39,
    question: 'A patient with leukemia has very high LDH (2000 U/L) but only mildly elevated AST. Which LDH isoenzyme pattern is most expected?',
    options: [
      'LDH1 and LDH2 elevation',
      'LDH2 and LDH3 elevation',
      'LDH4 and LDH5 elevation',
      'Equal elevation of all isoenzymes'
    ],
    correctIndex: 1,
    explanation: 'In acute leukemia, there is predominant elevation of LDH2 and LDH3, with LDH3 being the main isoenzyme elevated in malignancies.',
    categories: {ClinicalChemistryCategory.lec3},
  ),

ClinicalChemistryCaseItem(
    id: 40,
    question: 'A black athlete has baseline CK of 400 U/L (reference: 30-200 U/L) but no symptoms. What is the most appropriate interpretation?',
    options: [
      'Muscular dystrophy',
      'Myocardial damage',
      'Normal racial variation',
      'Rhabdomyolysis'
    ],
    correctIndex: 2,
    explanation: 'Black individuals and athletes typically have higher baseline CK levels due to racial variation and muscle mass. Asymptomatic elevation without other abnormalities is likely normal.',
    categories: {ClinicalChemistryCategory.lec3},
  ),
  // Regular MCQs (1-30)
ClinicalChemistryCaseItem(
    id: 1,
    question: 'Which tissues rely exclusively on glucose as their primary energy source?',
    options: [
      'Liver and muscle',
      'Erythrocytes and central nervous system',
      'Adipose tissue and kidney',
      'Pancreas and lungs'
    ],
    correctIndex: 1,
    explanation: 'Erythrocytes (no mitochondria) and the central nervous system rely exclusively on glucose as their primary energy source under physiological conditions.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 2,
    question: 'What is the main endogenous source of glucose during prolonged fasting?',
    options: [
      'Glycogenolysis',
      'Gluconeogenesis',
      'Lipolysis',
      'Proteolysis'
    ],
    correctIndex: 1,
    explanation: 'After hepatic glycogen stores are depleted (about 24 hours), gluconeogenesis from amino acids and glycerol becomes the principal source of glucose.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 3,
    question: 'Which hormone is considered the most important counter-regulatory hormone to insulin?',
    options: [
      'Cortisol',
      'Growth hormone',
      'Glucagon',
      'Epinephrine'
    ],
    correctIndex: 2,
    explanation: 'Glucagon is the most important counter-regulatory hormone to insulin, with opposite effects on glucose metabolism.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 4,
    question: 'What is the primary mechanism by which insulin stimulates glucose uptake in liver cells?',
    options: [
      'GLUT-4 translocation',
      'Induction of glucokinase',
      'Stimulation of glycogenolysis',
      'Inhibition of gluconeogenesis'
    ],
    correctIndex: 1,
    explanation: 'Insulin induces glucokinase in liver cells, which phosphorylates glucose to glucose-6-phosphate, maintaining a concentration gradient that facilitates glucose uptake.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 5,
    question: 'Which enzyme activation is key to glucagon\'s stimulation of hepatic glucose production?',
    options: [
      'Glycogen synthase',
      'Glycogen phosphorylase',
      'Glucokinase',
      'Protein phosphatase 1'
    ],
    correctIndex: 1,
    explanation: 'Glucagon activates glycogen phosphorylase through phosphorylation, stimulating glycogen breakdown and glucose release.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 6,
    question: 'What percentage of diagnosed diabetes cases in the US are Type 2 diabetes?',
    options: [
      '10%',
      '50%',
      '75%',
      '90%'
    ],
    correctIndex: 3,
    explanation: 'Type 2 diabetes constitutes approximately 90% of diagnosed diabetic cases in the United States.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 7,
    question: 'What is the primary pathological mechanism in Type 1 diabetes?',
    options: [
      'Insulin resistance',
      'Autoimmune destruction of beta cells',
      'Hepatic glucose overproduction',
      'Peripheral tissue insensitivity'
    ],
    correctIndex: 1,
    explanation: 'Type 1 diabetes is characterized by autoimmune destruction of pancreatic beta cells, leading to absolute insulin deficiency.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 8,
    question: 'Which of the following is NOT part of the classic triad of symptoms in diabetes?',
    options: [
      'Polyuria',
      'Polydipsia',
      'Polyphagia',
      'Polycythemia'
    ],
    correctIndex: 3,
    explanation: 'The classic triad includes polyuria (frequent urination), polydipsia (excessive thirst), and polyphagia (excessive hunger). Polycythemia is not a symptom.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 9,
    question: 'What is the diagnostic fasting blood glucose level for diabetes?',
    options: [
      '>100 mg/dl',
      '>126 mg/dl',
      '>140 mg/dl',
      '>200 mg/dl'
    ],
    correctIndex: 1,
    explanation: 'A fasting blood glucose greater than 126 mg/dl is diagnostic for diabetes mellitus.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 10,
    question: 'Why is ketosis common in Type 1 diabetes but rare in Type 2 diabetes?',
    options: [
      'Different genetic backgrounds',
      'Presence of some insulin in Type 2',
      'Age difference between patients',
      'Different dietary patterns'
    ],
    correctIndex: 1,
    explanation: 'Ketosis is minimal in Type 2 diabetes because the presence of insulin (even with resistance) restrains hepatic ketogenesis.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 11,
    question: 'What causes hypertriacylglycerolemia in untreated diabetes?',
    options: [
      'Increased lipoprotein lipase activity',
      'Decreased VLDL production',
      'Reduced chylomicron synthesis',
      'Decreased lipoprotein lipase activity'
    ],
    correctIndex: 3,
    explanation: 'Low insulin levels decrease lipoprotein lipase synthesis, reducing clearance of chylomicrons and VLDL, leading to hypertriacylglycerolemia.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 12,
    question: 'What is "hypoglycemia unawareness" in long-standing Type 1 diabetes?',
    options: [
      'Inability to taste sweet foods',
      'Deficiency of glucagon and epinephrine response',
      'Psychological denial of symptoms',
      'Autonomic neuropathy causing pain insensitivity'
    ],
    correctIndex: 1,
    explanation: 'Hypoglycemia unawareness results from combined deficiency of glucagon and epinephrine secretion, impairing the counter-regulatory response to hypoglycemia.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 13,
    question: 'What is the most common cause of insulin resistance?',
    options: [
      'Genetic mutations',
      'Viral infections',
      'Obesity',
      'Aging'
    ],
    correctIndex: 2,
    explanation: 'Obesity is the most common cause of insulin resistance, though not all obese individuals develop diabetes.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 14,
    question: 'What does glycated hemoglobin (HbA1c) measure?',
    options: [
      'Current blood glucose level',
      'Mean plasma glucose over 2-3 days',
      'Mean plasma glucose over 6-8 weeks',
      'Pancreatic beta cell function'
    ],
    correctIndex: 2,
    explanation: 'HbA1c provides a retrospective assessment of mean plasma glucose concentration during the preceding 6-8 weeks.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 15,
    question: 'Which complication is the most common cause of death in diabetes?',
    options: [
      'Renal failure',
      'Blindness',
      'Cardiovascular disease',
      'Infections'
    ],
    correctIndex: 2,
    explanation: 'Cardiovascular disease, including myocardial infarction, is the most common cause of death in diabetic patients.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 16,
    question: 'What is the primary treatment goal for Type 2 diabetes?',
    options: [
      'Complete insulin independence',
      'Normalization of blood glucose',
      'Weight gain',
      'Increased ketone production'
    ],
    correctIndex: 1,
    explanation: 'The goal is to maintain blood glucose concentrations within normal limits and prevent long-term complications.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 17,
    question: 'Which process is stimulated by both glucagon and epinephrine?',
    options: [
      'Glycogen synthesis',
      'Lipogenesis',
      'Glycogenolysis',
      'Protein synthesis'
    ],
    correctIndex: 2,
    explanation: 'Both glucagon and epinephrine stimulate glycogenolysis, though glucagon acts primarily on liver while epinephrine acts on both liver and muscle.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 18,
    question: 'What happens to blood glucose concentration after approximately 72 hours of fasting?',
    options: [
      'Continues to fall steadily',
      'Rises dramatically',
      'Stabilizes and remains constant',
      'Becomes undetectable'
    ],
    correctIndex: 2,
    explanation: 'After about 72 hours of fasting, blood glucose concentration stabilizes and can remain constant due to adaptive metabolic changes.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 19,
    question: 'Which tissue is NOT a major site of insulin action in glucose homeostasis?',
    options: [
      'Liver',
      'Skeletal muscle',
      'Adipose tissue',
      'Erythrocytes'
    ],
    correctIndex: 3,
    explanation: 'Erythrocytes do not require insulin for glucose uptake as they lack insulin receptors and use GLUT1 transporters.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 20,
    question: 'What is the effect of insulin on protein phosphatase 1?',
    options: [
      'Inhibits its activity',
      'Has no effect',
      'Activates it',
      'Degrades it'
    ],
    correctIndex: 2,
    explanation: 'Insulin activates protein phosphatase 1, which dephosphorylates and activates glycogen synthase while inactivating phosphorylase kinase.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 21,
    question: 'Which characteristic is typical of Type 1 diabetes but not Type 2?',
    options: [
      'Strong genetic predisposition',
      'Common ketosis',
      'Obesity at onset',
      'Responsive to oral hypoglycemics'
    ],
    correctIndex: 1,
    explanation: 'Ketosis is common in Type 1 diabetes due to absolute insulin deficiency, but rare in Type 2 where some insulin is present.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 22,
    question: 'What is the primary energy substrate during prolonged starvation?',
    options: [
      'Glucose',
      'Amino acids',
      'Ketones',
      'Fatty acids'
    ],
    correctIndex: 2,
    explanation: 'During prolonged starvation, ketones derived from fat become the major energy substrate, sparing glucose for essential tissues.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 23,
    question: 'Which hormone stimulates both gluconeogenesis and glycogenolysis?',
    options: [
      'Insulin',
      'Glucagon',
      'Growth hormone',
      'Cortisol'
    ],
    correctIndex: 1,
    explanation: 'Glucagon stimulates both gluconeogenesis and glycogenolysis in the liver to increase blood glucose levels.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 24,
    question: 'What is the mechanism behind hyperglycemia in diabetes?',
    options: [
      'Decreased hepatic glucose production',
      'Increased peripheral glucose uptake',
      'Increased hepatic production and decreased peripheral use',
      'Enhanced renal glucose reabsorption'
    ],
    correctIndex: 2,
    explanation: 'Hyperglycemia results from increased hepatic glucose production combined with diminished peripheral utilization due to insulin deficiency/resistance.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 25,
    question: 'Which complication results from microvascular disease in diabetes?',
    options: [
      'Coronary artery disease',
      'Cerebrovascular disease',
      'Diabetic retinopathy',
      'Peripheral vascular disease'
    ],
    correctIndex: 2,
    explanation: 'Diabetic retinopathy is a microvascular complication affecting small blood vessels in the retina.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 26,
    question: 'What is the typical age of onset for Type 1 diabetes?',
    options: [
      'Infancy',
      'Childhood or puberty',
      'Early adulthood',
      'After age 35'
    ],
    correctIndex: 1,
    explanation: 'Type 1 diabetes typically develops during childhood or puberty, with symptoms appearing rapidly.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 27,
    question: 'Why do non-diabetic obese individuals maintain normal blood glucose?',
    options: [
      'Increased insulin sensitivity',
      'Decreased glucose production',
      'Compensatory hyperinsulinemia',
      'Enhanced ketone utilization'
    ],
    correctIndex: 2,
    explanation: 'Obese non-diabetics compensate for insulin resistance with elevated insulin secretion (2-3 times higher), maintaining normal blood glucose.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 28,
    question: 'What percentage of beta cells are typically destroyed when Type 1 diabetes symptoms appear?',
    options: [
      '20-30%',
      '50-60%',
      '80-90%',
      '100%'
    ],
    correctIndex: 2,
    explanation: 'Symptoms of Type 1 diabetes appear abruptly when 80-90% of beta cells have been destroyed by autoimmune attack.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 29,
    question: 'Which enzyme is inhibited by glucagon to promote ketogenesis?',
    options: [
      'Hormone-sensitive lipase',
      'Acetyl CoA carboxylase',
      'Carnitine acyltransferase',
      'Lipoprotein lipase'
    ],
    correctIndex: 1,
    explanation: 'Glucagon inhibits acetyl CoA carboxylase, reducing malonyl CoA, which normally inhibits carnitine acyltransferase, thus promoting fatty acid transport into mitochondria for ketogenesis.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 30,
    question: 'What is the most disturbing trend in Type 2 diabetes epidemiology?',
    options: [
      'Decrease in elderly cases',
      'Increase in children',
      'Equal gender distribution',
      'Higher incidence in athletes'
    ],
    correctIndex: 1,
    explanation: 'The increasing prevalence of Type 2 diabetes in children is particularly disturbing, linked to rising obesity and sedentary lifestyles.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

// Clinical Case MCQs (31-40)
ClinicalChemistryCaseItem(
    id: 31,
    question: 'A 12-year-old boy presents with polyuria, polydipsia, and weight loss. He appears dehydrated. Blood glucose is 450 mg/dl and ketones are present in urine. What is the most likely diagnosis?',
    options: [
      'Type 2 diabetes',
      'Type 1 diabetes with ketoacidosis',
      'Metabolic syndrome',
      'Cushing syndrome'
    ],
    correctIndex: 1,
    explanation: 'The acute onset in childhood with severe hyperglycemia, ketosis, and classic symptoms suggests Type 1 diabetes with diabetic ketoacidosis.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 32,
    question: 'A 55-year-old obese woman has a fasting glucose of 140 mg/dl. She has no ketones in urine. Her HbA1c is 7.5%. What is the most appropriate initial management?',
    options: [
      'Immediate insulin therapy',
      'Weight reduction, exercise, and diet',
      'Hospitalization for ketoacidosis',
      'No treatment needed'
    ],
    correctIndex: 1,
    explanation: 'This presentation is classic for Type 2 diabetes. Initial management should focus on lifestyle modifications: weight reduction, exercise, and dietary changes.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 33,
    question: 'A patient with long-standing Type 1 diabetes frequently experiences severe hypoglycemia without warning symptoms. What is the underlying mechanism?',
    options: [
      'Excessive insulin production',
      'Deficiency of glucagon and epinephrine response',
      'Increased hepatic glucose output',
      'Enhanced insulin sensitivity'
    ],
    correctIndex: 1,
    explanation: 'Long-standing Type 1 diabetes leads to deficiency of both glucagon and epinephrine counter-regulatory responses, causing "hypoglycemia unawareness".',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 34,
    question: 'A diabetic patient presents with blurred vision and retinal hemorrhages on examination. What is the most likely complication?',
    options: [
      'Diabetic retinopathy',
      'Cataracts',
      'Glaucoma',
      'Macular degeneration'
    ],
    correctIndex: 0,
    explanation: 'Retinal hemorrhages and blurred vision in a diabetic patient suggest diabetic retinopathy, a microvascular complication.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 35,
    question: 'An obese individual has fasting insulin levels 3 times normal but normal blood glucose. What is the most likely explanation?',
    options: [
      'Type 1 diabetes',
      'Compensated insulin resistance',
      'Pancreatic tumor',
      'Liver failure'
    ],
    correctIndex: 1,
    explanation: 'Elevated insulin with normal glucose indicates compensated insulin resistance, where hyperinsulinemia maintains euglycemia despite tissue insensitivity.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 36,
    question: 'A patient with Type 1 diabetes develops severe hypertriglyceridemia. What is the mechanism?',
    options: [
      'Increased lipoprotein lipase activity',
      'Enhanced chylomicron clearance',
      'Decreased lipoprotein lipase synthesis',
      'Reduced VLDL production'
    ],
    correctIndex: 2,
    explanation: 'Insulin deficiency decreases lipoprotein lipase synthesis, reducing clearance of chylomicrons and VLDL, leading to hypertriacylglycerolemia.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 37,
    question: 'After 48 hours of fasting, a patient maintains stable blood glucose. What is the primary metabolic adaptation?',
    options: [
      'Increased glycogenolysis',
      'Enhanced gluconeogenesis',
      'Reduced energy expenditure',
      'Increased ketone utilization'
    ],
    correctIndex: 1,
    explanation: 'After glycogen depletion (~24 hours), gluconeogenesis from amino acids and glycerol becomes the main glucose source, maintaining stable blood glucose.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 38,
    question: 'A patient with diabetes has HbA1c of 10%. What does this indicate about their glycemic control?',
    options: [
      'Excellent control',
      'Good control',
      'Poor control',
      'Cannot determine from HbA1c'
    ],
    correctIndex: 2,
    explanation: 'HbA1c of 10% indicates poor glycemic control, reflecting high average blood glucose levels over the preceding 6-8 weeks.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 39,
    question: 'A Type 2 diabetic patient has normal blood glucose but elevated insulin levels. They start losing weight and their glucose rises despite same insulin dose. What has developed?',
    options: [
      'Improved insulin sensitivity',
      'Beta cell failure progression',
      'Autoimmune destruction',
      'Enhanced counter-regulation'
    ],
    correctIndex: 1,
    explanation: 'This pattern suggests progressive beta cell failure in Type 2 diabetes, where compensatory hyperinsulinemia can no longer maintain euglycemia.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

ClinicalChemistryCaseItem(
    id: 40,
    question: 'A diabetic patient presents with coronary artery disease, peripheral vascular disease, and hypertension. What type of diabetic complication is this?',
    options: [
      'Microvascular',
      'Macrovascular',
      'Neuropathic',
      'Metabolic'
    ],
    correctIndex: 1,
    explanation: 'Coronary artery, cerebrovascular, and peripheral vascular diseases represent macrovascular complications of diabetes, related to lipid abnormalities and hypertension.',
    categories: {ClinicalChemistryCategory.lec4},
  ),

  // MCQs from exam related to previous subjects - lec5
ClinicalChemistryCaseItem(
    id: 1,
    question: 'Insulin resistance is',
    options: [
      'Increased insulin production',
      'Enhanced glucose uptake by target tissues',
      'Decreased ability of target tissues to respond to insulin',
      'Elevated blood sugar levels'
    ],
    correctIndex: 2,
    explanation: 'Insulin resistance is the decreased ability of target tissues (liver, adipose, muscle) to respond properly to normal circulating concentrations of insulin.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 2,
    question: 'What is the primary biochemical characteristic associated with untreated diabetes mellitus?',
    options: [
      'Hyperinsulinemia',
      'Hyperglycemia and ketosis',
      'Hypoglycemia',
      'Elevated blood pressure'
    ],
    correctIndex: 1,
    explanation: 'Elevated levels of blood glucose (hyperglycemia) and ketones (ketosis) are the hallmarks of untreated diabetes mellitus.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 3,
    question: 'How is glycated hemoglobin formed in the context of diabetes?',
    options: [
      'Enzymatic conversion of hemoglobin',
      'Nonenzymatic glycation of hemoglobin',
      'Oxidation of hemoglobin',
      'Phosphorylation of hemoglobin'
    ],
    correctIndex: 1,
    explanation: 'Glycated hemoglobin is formed by nonenzymatic glycation of hemoglobin and is dependent on mean plasma glucose concentrations.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 4,
    question: 'Which microvascular diseases are particularly associated with abnormalities of small blood vessels in diabetes, affecting the retina and kidney?',
    options: [
      'Diabetic neuropathy',
      'Diabetic retinopathy and nephropathy',
      'Diabetic foot ulcers',
      'Diabetic ketoacidosis'
    ],
    correctIndex: 1,
    explanation: 'Microvascular disease due to abnormalities of small blood vessels particularly affects the retina (diabetic retinopathy) and the kidney (nephropathy).',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 5,
    question: 'How can patients with type 1 diabetes typically be recognized due to symptoms?',
    options: [
      'Gradual weight loss and fatigue',
      'Sudden decrease in appetite',
      'Abrupt appearance of polyuria, polydipsia, and polyphagia',
      'Increased tolerance to stress and illness'
    ],
    correctIndex: 2,
    explanation: 'Patients with type 1 diabetes can usually be recognized by the abrupt appearance of polyuria (frequent urination), polydipsia (excessive thirst), and polyphagia (excessive hunger).',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 6,
    question: 'What is the primary mechanism leading to ketosis in the context of diabetes?',
    options: [
      'Decreased mobilization of fatty acids',
      'Inhibited hepatic synthesis of ketones',
      'Increased mobilization of fatty acids and accelerated hepatic synthesis of ketones',
      'Increased glucose uptake by adipose tissue'
    ],
    correctIndex: 2,
    explanation: 'Ketosis results from increased mobilization of fatty acids from adipose tissue, combined with accelerated hepatic synthesis of 3-hydroxybutyrate and acetoacetate.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 7,
    question: 'How is ketoacidosis typically treated, with a focus on fluid and electrolyte balance and hyperglycemia correction?',
    options: [
      'Administration of high-dose insulin to rapidly correct hyperglycemia',
      'Fluid and electrolyte replacement only',
      'Administration of low-dose insulin to gradually correct hyperglycemia',
      'Immediate initiation of a high-carbohydrate diet'
    ],
    correctIndex: 2,
    explanation: 'Ketoacidosis is treated by replacing fluid and electrolytes, followed by administration of low-dose insulin to gradually correct hyperglycemia without precipitating hypoglycemia.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 8,
    question: 'Why do diabetics often exhibit elevated plasma chylomicron and VLDL levels, leading to hypertriacylglycerolemia?',
    options: [
      'Increased lipoprotein lipase activity',
      'Enhanced synthesis of lipoprotein lipase',
      'Decreased lipoprotein lipase activity due to high insulin levels',
      'Decreased lipoprotein lipase activity due to low insulin levels'
    ],
    correctIndex: 3,
    explanation: 'Lipoprotein degradation catalyzed by lipoprotein lipase in adipose tissue is low in diabetics because synthesis of the enzyme is decreased when insulin levels are low.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 9,
    question: 'What condition is characterized by high plasma cholesterol concentrations that are present from early childhood and do not depend upon the presence of environmental factors?',
    options: [
      'Hyperthyroidism',
      'Familial hypercholesterolemia',
      'Type 2 diabetes',
      'Atherosclerosis'
    ],
    correctIndex: 1,
    explanation: 'Familial hypercholesterolemia is an autosomal dominant condition characterized by high plasma cholesterol from early childhood, not dependent on environmental factors.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 10,
    question: 'What is the cause of fasting chylomicronemia in two rare hyperlipidemias with autosomal recessive inheritance?',
    options: [
      'Deficiency of apolipoprotein B',
      'Deficiency of lipoprotein lipase',
      'Deficiency of apolipoprotein C-II',
      'Deficiency of apolipoprotein A-I'
    ],
    correctIndex: 1,
    explanation: 'Familial lipoprotein lipase deficiency (Type I hyperlipoproteinemia) causes fasting chylomicronemia due to impaired clearance of chylomicrons.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 11,
    question: 'What clinical features characterize a condition with hyperplastic, orange tonsils and the accumulation of cholesteryl esters in other reticuloendothelial tissues, primarily due to accelerated catabolism of apo A-I?',
    options: [
      'Tangier disease',
      'Familial hypercholesterolemia',
      'Hyperlipoproteinemia type I',
      'Sitosterolemia'
    ],
    correctIndex: 0,
    explanation: 'Tangier disease is characterized by large yellow-orange tonsils, hepatomegaly, and accumulation of cholesterol esters in the reticuloendothelial system due to ABC1 gene defect.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 12,
    question: 'How can enzymology be defined in the context of medical diagnostics?',
    options: [
      'The study of enzyme kinetics in laboratory settings',
      'The assay of enzymes in body fluids, usually blood, for diagnostic or clinical monitoring purposes',
      'The synthesis of enzymes for therapeutic purposes',
      'The structural analysis of enzymes using X-ray crystallography'
    ],
    correctIndex: 1,
    explanation: 'Diagnostic enzymology involves the study of enzymes and changes in enzyme activity in body fluids for diagnostic purposes and testing organ function.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 13,
    question: 'How can changes in plasma enzyme activities be utilized in medical practice?',
    options: [
      'To analyze the structure of enzymes',
      'To synthesize new enzymes for therapeutic purposes',
      'To detect and localize tissue cell damage or proliferation',
      'To assess the nutritional status of an individual'
    ],
    correctIndex: 2,
    explanation: 'Changes in plasma enzyme activities are valuable for detecting and localizing tissue cell damage or proliferation, serving as diagnostic tools.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 14,
    question: 'Why do small amounts of intracellular enzymes appear in the blood, and what happens when damage to cells occurs?',
    options: [
      'Intracellular enzymes are actively transported to the blood for diagnostic purposes',
      'Small amounts of enzymes in the blood indicate a healthy cell turnover',
      'Increased amounts of enzymes are released into the blood as a result of normal cell turnover',
      'Increased amounts of enzymes are released into the blood when damage to cells occurs'
    ],
    correctIndex: 3,
    explanation: 'When cell damage occurs, increased amounts of intracellular enzymes are released into the blood, making them useful diagnostic markers.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 15,
    question: 'When comparing alanine aminotransferase (ALT) and aspartate aminotransferase (AST), which of the following statements is true?',
    options: [
      'AST is more specific for hepatic disease than ALT',
      'ALT is more specific for hepatic disease than AST',
      'Both ALT and AST are equally specific for hepatic disease',
      'Neither ALT nor AST is specific for hepatic disease'
    ],
    correctIndex: 1,
    explanation: 'ALT is more specific for hepatic disease than AST, as ALT is predominantly found in liver cells while AST is widely distributed in multiple tissues.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 16,
    question: 'When considering lactate dehydrogenase (LDH) isoenzymes, which statement is accurate regarding the elevation of LDH5?',
    options: [
      'LDH5 elevation is specific to liver damage',
      'LDH5 elevation is specific to skeletal muscle damage',
      'LDH5 elevation occurs after damage to both the liver and skeletal muscle',
      'LDH5 is not associated with damage to the liver or skeletal muscle'
    ],
    correctIndex: 2,
    explanation: 'LDH5 elevation occurs after damage to both the liver and skeletal muscle, as it is the most abundant form in these tissues.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 17,
    question: 'Which isoenzyme is predominant in skeletal and cardiac muscle and is detectable in the plasma of normal subjects?',
    options: [
      'LDH1',
      'CK-BB',
      'CK-MM',
      'AST'
    ],
    correctIndex: 2,
    explanation: 'CK-MM is the predominant isoenzyme in skeletal and cardiac muscle and is detectable in the plasma of normal subjects.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 18,
    question: 'Why is the estimation of plasma amylase activity mainly requested, and in which condition can the plasma activity be significantly elevated?',
    options: [
      'To diagnose liver diseases; elevated in cirrhosis',
      'To diagnose kidney diseases; elevated in glomerulonephritis',
      'To diagnose acute pancreatitis; plasma activity may be very high',
      'To assess cardiac health; elevated in myocardial infarction'
    ],
    correctIndex: 2,
    explanation: 'Estimation of plasma amylase activity is mainly requested to help diagnose acute pancreatitis, in which the plasma activity may be very high.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 19,
    question: 'Which enzyme, derived from the pancreas, is more specific for pancreatic pathology?',
    options: [
      'Amylase',
      'Lipase',
      'Alanine aminotransferase (ALT)',
      'Creatine kinase (CK)'
    ],
    correctIndex: 1,
    explanation: 'Lipase is more specific for pancreatic pathology than amylase and has a longer half-life, making it more useful for pancreatic diagnosis.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 20,
    question: 'What group of enzymes hydrolyze organic phosphates at high pH and are present in most tissues, with particularly high concentrations in osteoblasts of bone, cells of the hepatobiliary tract, intestinal wall, renal tubules, and placenta?',
    options: [
      'Amylases',
      'Lipases',
      'Alkaline phosphatases',
      'Alanine aminotransferase'
    ],
    correctIndex: 2,
    explanation: 'Alkaline phosphatases hydrolyze organic phosphates at high pH and are present in high concentrations in bone, liver, intestine, kidney, and placenta.',
    categories: {ClinicalChemistryCategory.lec5},
  ),

ClinicalChemistryCaseItem(
    id: 21,
    question: 'What is the more specific and sensitive test for the diagnosis and monitoring of prostatic carcinoma, rendering the plasma acid phosphatase (ACP) assay obsolete?',
    options: [
      'Prostate-specific antigen (PSA)',
      'Prostate-specific acid phosphatase (PSAP)',
      'Prostate-specific lipase (PSL)',
      'Prostate-specific aminotransferase (PSAT)'
    ],
    correctIndex: 0,
    explanation: 'Prostate-specific antigen (PSA) is more specific and sensitive for diagnosis and monitoring prostatic carcinoma, making ACP assay obsolete.',
    categories: {ClinicalChemistryCategory.lec5},
  ),
];