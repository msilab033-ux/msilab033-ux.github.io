// applied.dart
enum AppliedTherapeuticsCategory {
  lec1('Acute Coronary Syndrome'),
  lec2('PE & DVT'),
  lec3('Shock '),
  lec4('Glaucoma'),
  lec5('Acute Kidney Injury'),
  lec6('Chronic Kidney Injury'),
  lec7('Coming later'),
  lec8('Coming later'),
  lec9('Coming later');

  const AppliedTherapeuticsCategory(this.displayName);
  final String displayName;
}

class AppliedCaseItem {
  final int id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Set<AppliedTherapeuticsCategory> categories;

  const AppliedCaseItem({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.categories,
  });
}

// Sample applied therapeutics and clinical toxicology cases
final List<AppliedCaseItem> appliedTherapeuticsCaseList = [
  // ========== CASE STUDY 1 ==========
AppliedCaseItem(
  
  id: 26,
  question: 'A 65-year-old male presents with sudden, severe crushing chest pain radiating to his left arm, associated with nausea and diaphoresis for 20 minutes. His ECG shows ST-segment elevation in leads V2-V4. What is the most appropriate immediate reperfusion strategy?',
  options: [
    'Initiate fibrinolysis with tenecteplase',
    'Schedule a stress test for tomorrow',
    'Perform primary PCI as soon as possible',
    'Start medical management with DAPT and plan for angiography in 72 hours'
  ],
  correctIndex: 2,
  explanation: 'This patient has STEMI. Primary PCI is the preferred reperfusion strategy if it can be performed within 90 minutes of first medical contact.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A 58-year-old female with a history of diabetes presents with 30 minutes of epigastric discomfort and shortness of breath. Her ECG shows ST-segment depression in the inferior leads. Troponin is elevated. What is her most likely diagnosis?',
  options: [
    'Unstable Angina (UA)',
    'ST-elevation MI (STEMI)',
    'Non-ST-elevation MI (NSTEMI)',
    'Stable Angina'
  ],
  correctIndex: 2,
  explanation: 'She has ischemic symptoms, ST-depression on ECG, and elevated troponin, which confirms NSTEMI (a type of NSTE-ACS).',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A 70-year-old man with a history of ischemic stroke 2 months ago presents with symptoms suggestive of STEMI. Which of the following reperfusion therapies is absolutely contraindicated?',
  options: [
    'Primary PCI',
    'Fibrinolysis',
    'DAPT with Aspirin and Clopidogrel',
    'Unfractionated Heparin'
  ],
  correctIndex: 1,
  explanation: 'A recent ischemic stroke (within 3 months) is an absolute contraindication for fibrinolytic therapy due to the high risk of hemorrhagic transformation.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A 45-year-old male is diagnosed with NSTEMI. He is at high risk with recurrent angina. Which management strategy is most appropriate?',
  options: [
    'Discharge home with aspirin and follow-up in 1 week',
    'Ischemia-guided strategy with stress testing',
    'Early invasive approach with angiography within 24 hours',
    'Fibrinolytic therapy'
  ],
  correctIndex: 2,
  explanation: 'For high-risk NSTE-ACS patients (e.g., with recurrent ischemia), an early invasive approach with angiography within 24 hours is recommended.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'A patient with STEMI is about to receive primary PCI. He has not been pre-loaded with a P2Y12 inhibitor. Which additional antiplatelet agent might be considered during the procedure if he is not receiving bivalirudin?',
  options: [
    'Warfarin',
    'Glycoprotein IIb/IIIa Inhibitor (GPI)',
    'Fondaparinux',
    'Streptokinase'
  ],
  correctIndex: 1,
  explanation: 'GPIs can be considered for patients with STEMI undergoing PCI who have not been pre-loaded with a P2Y12 inhibitor and are not being treated with bivalirudin.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A 55-year-old man post-STEMI (treated with PCI) has an LVEF of 35%. For how long should he continue β-blocker therapy?',
  options: [
    '1 year',
    '3 years',
    'Lifelong',
    'Discontinue now'
  ],
  correctIndex: 2,
  explanation: 'In patients with LV dysfunction (LVEF <40%), β-blocker therapy is typically lifelong.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'A patient with NSTE-ACS is determined to be at low risk. Which management strategy is most suitable?',
  options: [
    'Immediate transfer for primary PCI',
    'Ischemia-guided strategy with antiplatelet and anticoagulant therapy',
    'Fibrinolytic therapy',
    'No antiplatelet therapy needed'
  ],
  correctIndex: 1,
  explanation: 'For low-risk NSTE-ACS patients, an ischemia-guided strategy is employed, where antiplatelet and anticoagulant therapies are administered without immediate PCI.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'A patient develops severe thrombocytopenia after receiving UFH and a GPI for NSTE-ACS. What is a crucial differential diagnosis?',
  options: [
    'Idiopathic Thrombocytopenic Purpura (ITP)',
    'GPIIb/IIIa inhibitor-induced thrombocytopenia vs. Heparin-Induced Thrombocytopenia (HIT)',
    'Disseminated Intravascular Coagulation (DIC)',
    'Vitamin K deficiency'
  ],
  correctIndex: 1,
  explanation: 'Because GPIs are often given with heparin, it is important to differentiate GPI-induced thrombocytopenia from HIT, as the management differs significantly.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'A patient with ACS and a major GI intolerance to aspirin is about to be treated. What is the best alternative antiplatelet agent?',
  options: [
    'Ticagrelor',
    'Prasugrel',
    'Clopidogrel',
    'Dipyridamole'
  ],
  correctIndex: 2,
  explanation: 'Contraindications to aspirin include major GI intolerance. In these cases, clopidogrel should be used as an alternative.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'A 60-year-old woman post-MI has an LDL-C of 95 mg/dL on atorvastatin 40 mg daily. What is the next appropriate step in lipid management?',
  options: [
    'Discontinue statin',
    'Increase atorvastatin to 80 mg daily',
    'Add Ezetimibe',
    'Options B or C are reasonable'
  ],
  correctIndex: 3,
  explanation: 'High-intensity statin (atorvastatin 80 mg) is a goal. If LDL-C remains >70 mg/dL on maximally tolerated statin, non-statin agents like Ezetimibe can be added.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'Which patient with STEMI should NOT receive Prasugrel as part of DAPT?',
  options: [
    'A 45-year-old man with no history of stroke',
    'A 50-year-old woman weighing 65 kg',
    'A 75-year-old man with a history of TIA',
    'A 60-year-old man undergoing primary PCI'
  ],
  correctIndex: 2,
  explanation: 'Prasugrel is contraindicated in patients with a history of transient ischemic attack (TIA) or stroke.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'A patient received fibrinolytic therapy for STEMI. Which P2Y12 inhibitor loading dose is appropriate?',
  options: [
    'Prasugrel 60 mg',
    'Ticagrelor 180 mg',
    'Clopidogrel 300 mg',
    'Cangrelor 30 mcg/kg bolus'
  ],
  correctIndex: 2,
  explanation: 'For patients receiving fibrinolytic therapy, the recommended loading dose for clopidogrel is 300 mg.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'Which medication should be initiated within 48 hours post-MI, especially in patients with LV dysfunction?',
  options: [
    'Nitroglycerin patch',
    'ACE Inhibitor',
    'Aldosterone Antagonist',
    'Dihydropyridine CCB'
  ],
  correctIndex: 1,
  explanation: 'ACE inhibitors/ARBs are initiated within 48 hours, especially in patients with LV dysfunction or at high risk.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'A patient with NSTEMI is managed conservatively. His troponin levels normalize, and he has no further chest pain. A stress test is scheduled but he has a positive stress test. What is the next step?',
  options: [
    'Discharge home',
    'Perform coronary angiography',
    'Repeat troponin in 6 hours',
    'Start fibrinolytic therapy'
  ],
  correctIndex: 1,
  explanation: 'In an ischemia-guided strategy, if the patient has a positive stress test, the next step is typically coronary angiography and possible revascularization.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'What is a critical component of "discharge planning" for an ACS patient to ensure long-term success?',
  options: [
    'Stopping all medications to avoid side effects',
    'Medication reconciliation and ensuring initiation of all appropriate therapies',
    'Recommending a high-fat diet',
    'Advising against any physical activity for 6 months'
  ],
  correctIndex: 1,
  explanation: 'Discharge planning includes medication reconciliation and ensuring the initiation of all appropriate evidence-based therapies (e.g., DAPT, statin, β-blocker, ACEI) to optimize long-term outcomes.',
  categories: {AppliedTherapeuticsCategory.lec1},
),

 AppliedCaseItem(
    id: 1,
    question: 'What is the primary cause of Acute Coronary Syndrome (ACS)?',
    options: [
      'Chronic hypertension',
      'A sudden imbalance between myocardial oxygen supply and demand',
      'Cardiac valve dysfunction',
      'Cardiomyopathy'
    ],
    correctIndex: 1,
    explanation: 'ACS is caused by a sudden imbalance between myocardial oxygen demand and supply, leading to ischemia.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'How is Acute Coronary Syndrome (ACS) classified based on ECG findings?',
    options: [
      'Stable and Unstable Angina',
      'ST-segment elevation MI (STEMI) and non-ST-segment elevation ACS (NSTE-ACS)',
      'Anterior and Inferior MI',
      'Prinzmetal and Silent Ischemia'
    ],
    correctIndex: 1,
    explanation: 'ACS is classified into two main types: ST-segment elevation myocardial infarction (STEMI) and non-ST-segment elevation ACS (NSTE-ACS), which includes NSTEMI and unstable angina.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'Which of the following is a key characteristic of a vulnerable atherosclerotic plaque?',
    options: [
      'Thick fibrous cap',
      'Small necrotic core',
      'Thin fibrous cap and large necrotic core',
      'Heavily calcified'
    ],
    correctIndex: 2,
    explanation: 'Vulnerable plaques typically have thin fibrous caps and large necrotic cores, making them prone to rupture.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'What is the final common pathway for platelet aggregation?',
    options: [
      'Activation via GP VI receptors',
      'Binding of fibrinogen to activated GP IIb/IIIa receptors',
      'Release of thromboxane A2',
      'Adhesion via von Willebrand factor'
    ],
    correctIndex: 1,
    explanation: 'Platelet aggregation occurs via GP IIb/IIIa receptors forming bridges with fibrinogen.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'Which biomarker is most specific for confirming myocardial injury in ACS?',
    options: [
      'Creatine Kinase (CK)',
      'Myoglobin',
      'Troponin',
      'C-reactive Protein (CRP)'
    ],
    correctIndex: 2,
    explanation: 'Cardiac troponin levels are measured at presentation and repeated 3–6 hours later; elevated levels confirm myocardial injury.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'What is the preferred reperfusion strategy for a STEMI patient if it can be performed within 90 minutes of first medical contact?',
    options: [
      'Fibrinolysis',
      'Primary Percutaneous Coronary Intervention (PCI)',
      'Coronary Artery Bypass Graft (CABG)',
      'Medical management only'
    ],
    correctIndex: 1,
    explanation: 'Primary PCI is the preferred strategy, involving mechanical reperfusion within 90 minutes of first medical contact.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'When is fibrinolysis indicated in STEMI?',
    options: [
      'As first-line treatment for all STEMI patients',
      'When PCI cannot be performed within 120 minutes and no contraindications exist',
      'Only in patients with contraindications to aspirin',
      'For NSTEMI patients with elevated troponin'
    ],
    correctIndex: 1,
    explanation: 'Fibrinolysis is indicated when PCI cannot be performed within 120 minutes and no contraindications exist.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'Which of the following is an absolute contraindication for fibrinolytic therapy?',
    options: [
      'Age over 75 years',
      'Prior hemorrhagic stroke',
      'Diabetes mellitus',
      'History of stable angina'
    ],
    correctIndex: 1,
    explanation: 'Absolute contraindications for fibrinolysis include prior hemorrhagic stroke, recent ischemic stroke, intracranial neoplasm, active bleeding, aortic dissection, and recent significant trauma/surgery.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'What is the recommended initial loading dose of aspirin for a patient with suspected ACS?',
    options: [
      '81 mg',
      '162-325 mg',
      '500 mg',
      '650 mg'
    ],
    correctIndex: 1,
    explanation: 'Aspirin is recommended for all patients unless contraindicated, with an initial dose of 162–325 mg chewed immediately.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'In which patient population should intravenous (IV) β-blockers be reserved for in STEMI?',
    options: [
      'All STEMI patients upon presentation',
      'Patients with bradycardia',
      'Patients with uncontrolled hypertension or refractory symptoms',
      'Patients with asthma'
    ],
    correctIndex: 2,
    explanation: 'Intravenous (IV) β-blockers are reserved for STEMI patients with uncontrolled hypertension or refractory symptoms.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'When are Calcium Channel Blockers (CCBs) recommended in ACS?',
    options: [
      'As first-line anti-ischemic therapy for all patients',
      'Only when β-blockers are contraindicated, intolerant, or ineffective, in the absence of LV dysfunction',
      'In combination with β-blockers for all NSTE-ACS patients',
      'Only for patients with heart failure'
    ],
    correctIndex: 1,
    explanation: 'Non-dihydropyridine CCBs are recommended only when β-blockers are contraindicated, intolerant, or ineffective, and in the absence of LV dysfunction or conduction issues.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'What is the minimum recommended duration of Dual Antiplatelet Therapy (DAPT) for a patient with STEMI treated with fibrinolysis?',
    options: [
      '7 days',
      '14 days',
      '1 month',
      '12 months'
    ],
    correctIndex: 1,
    explanation: 'For patients with STEMI treated with fibrinolysis, the minimum recommended duration of DAPT is 14 days.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'Which anticoagulant is NOT recommended for primary PCI in STEMI due to a higher risk of catheter-related thrombosis?',
    options: [
      'Unfractionated Heparin (UFH)',
      'Enoxaparin',
      'Bivalirudin',
      'Fondaparinux'
    ],
    correctIndex: 3,
    explanation: 'Fondaparinux is not recommended for primary PCI in STEMI due to a higher catheter-related thrombosis risk.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'Which P2Y12 inhibitor requires a dose reduction to 5 mg daily for patients weighing less than 60 kg?',
    options: [
      'Clopidogrel',
      'Prasugrel',
      'Ticagrelor',
      'Cangrelor'
    ],
    correctIndex: 1,
    explanation: 'Prasugrel maintenance dose is 10 mg daily, or 5 mg if the patient weighs <60 kg.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'In the context of NSTE-ACS, which strategy involves performing diagnostic angiography within 24 hours?',
    options: [
      'Ischemia-guided strategy',
      'Conservative management',
      'Early invasive approach',
      'Fibrinolytic strategy'
    ],
    correctIndex: 2,
    explanation: 'An early invasive approach for NSTE-ACS involves performing diagnostic angiography within 24 hours, especially for intermediate to high-risk patients.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Which of the following is a long-term goal in the management of ACS?',
    options: [
      'Immediate relief of chest pain',
      'Prevention of future cardiovascular events',
      'Rapid transfer to the catheterization lab',
      'Administration of a fibrinolytic agent'
    ],
    correctIndex: 1,
    explanation: 'Long-term goals focus on controlling cardiovascular risk factors and preventing future cardiovascular events.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'What is a major risk associated with Glycoprotein IIb/IIIa Inhibitors (GPIs)?',
    options: [
      'Hyperkalemia',
      'Significant thrombocytopenia',
      'Liver toxicity',
      'Renal failure'
    ],
    correctIndex: 1,
    explanation: 'Besides bleeding, GPIs cause significant thrombocytopenia in about 0.5% of patients.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'For how long should β-blockers be continued in a post-ACS patient with normal left ventricular function?',
    options: [
      '1 month',
      '6 months',
      'At least 3 years',
      'Lifelong, regardless of function'
    ],
    correctIndex: 2,
    explanation: 'β-blockers should be initiated within 24 hours and continued for at least 3 years in those with normal left ventricular function.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'Which symptom is considered an "atypical" presentation of ACS, commonly seen in older adults, women, and diabetics?',
    options: [
      'Chest pain radiating to the left arm',
      'Sweating',
      'Epigastric pain or indigestion',
      'Shortness of breath'
    ],
    correctIndex: 2,
    explanation: 'Atypical symptoms like epigastric pain or indigestion may occur in older adults, women, and those with diabetes or renal impairment.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'What is the recommended high-intensity statin therapy for secondary prevention post-ACS?',
    options: [
      'Atorvastatin 10 mg',
      'Rosuvastatin 5 mg',
      'Atorvastatin 80 mg or Rosuvastatin 20-40 mg',
      'Simvastatin 40 mg'
    ],
    correctIndex: 2,
    explanation: 'High-intensity statin therapy (e.g., atorvastatin 80 mg or rosuvastatin 20-40 mg) is recommended to be continued indefinitely.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'Which anticoagulant has a lower incidence of Heparin-Induced Thrombocytopenia (HIT) compared to Unfractionated Heparin (UFH)?',
    options: [
      'Bivalirudin',
      'Fondaparinux',
      'Low-Molecular-Weight Heparin (LMWH)',
      'Warfarin'
    ],
    correctIndex: 2,
    explanation: 'The incidence of HIT is lower with LMWH (<2%) than with UFH (2%~5%).',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'When is morphine use recommended in NSTE-ACS?',
    options: [
      'For all patients with chest pain',
      'As first-line therapy alongside aspirin',
      'Only in refractory cases',
      'It is contraindicated in NSTE-ACS'
    ],
    correctIndex: 2,
    explanation: 'Morphine may be used for pain relief in STEMI but is only recommended in refractory cases for NSTE-ACS.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'What is the role of oxygen therapy in ACS?',
    options: [
      'Administer to all patients with chest pain',
      'Reserved for patients with saturation below 90%',
      'Used primarily to reduce anxiety',
      'Contraindicated in STEMI'
    ],
    correctIndex: 1,
    explanation: 'Oxygen therapy is reserved for patients with saturation below 90% due to potential adverse effects.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'Which of the following systems is chronically hyperactivated post-MI, leading to ventricular remodeling?',
    options: [
      'Sympathetic Nervous System (SNS) and Renin-Angiotensin-Aldosterone System (RAAS)',
      'Parasympathetic Nervous System',
      'Hypothalamic-Pituitary-Adrenal (HPA) axis',
      'Thyroid axis'
    ],
    correctIndex: 0,
    explanation: 'Chronic hyperactivation of the SNS and RAAS post-MI leads to ventricular remodeling, hypertrophy, and impaired contractility.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'What is a key diagnostic step that should be obtained within 10 minutes for a patient with suspected ACS?',
    options: [
      'Chest X-ray',
      'Echocardiogram',
      '12-lead ECG',
      'Cardiac MRI'
    ],
    correctIndex: 2,
    explanation: 'An immediate 12-lead ECG should be obtained within 10 minutes to detect signs of acute ischemia.',
    categories: {AppliedTherapeuticsCategory.lec1},
  ),

 
  // ========== MCQ 1 ==========
  AppliedCaseItem(
    id: 1,
    question: 'What are the two primary clinical manifestations of Venous Thromboembolism (VTE)?',
    options: [
      'Myocardial Infarction and Stroke',
      'Deep Vein Thrombosis (DVT) and Pulmonary Embolism (PE)',
      'Atherosclerosis and Aneurysm',
      'Varicose Veins and Chronic Venous Insufficiency'
    ],
    correctIndex: 1,
    explanation: 'VTE results from clot formation within the venous circulation and is manifested as deep vein thrombosis (DVT) and/or pulmonary embolism (PE).',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'Which component of Virchow\'s Triad is described by "immobility or paralysis"?',
    options: [
      'Vascular Wall Injury',
      'Hypercoagulability',
      'Venous Stasis',
      'Endothelial Dysfunction'
    ],
    correctIndex: 2,
    explanation: 'The three primary determinants of VTE (Virchow\'s triad) are venous stasis (e.g., immobility), vascular wall injury (e.g., surgery), and hypercoagulability (e.g., thrombophilia).',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'What is the most effective way to reduce mortality and morbidity from VTE?',
    options: [
      'Prompt diagnosis with D-dimer',
      'Primary prophylaxis in at-risk patients',
      'Routine use of IVC filters',
      'Treatment with thrombolytics'
    ],
    correctIndex: 1,
    explanation: 'The most effective way to reduce mortality and morbidity from VTE is to use primary prophylaxis in patients at risk for VTE, particularly during hospitalization.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'Which diagnostic test is typically used to diagnose a Deep Vein Thrombosis (DVT)?',
    options: [
      'Computed Tomography (CT) scan',
      'Ventilation-Perfusion (V/Q) scan',
      'Compression Ultrasonography',
      'Pulmonary Angiography'
    ],
    correctIndex: 2,
    explanation: 'Imaging studies like compression ultrasonography is typically used to diagnose a DVT.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'For a patient with acute DVT and a creatinine clearance (CrCl) of 25 mL/min, which anticoagulant is CONTRAINDICATED?',
    options: [
      'Unfractionated Heparin (UFH)',
      'Enoxaparin (LMWH)',
      'Fondaparinux',
      'Warfarin'
    ],
    correctIndex: 2,
    explanation: 'Fondaparinux is contraindicated if CrCl is <30 mL/min. UFH is often preferred in significant renal impairment.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'What is the minimum recommended duration of anticoagulation therapy for a provoked VTE?',
    options: [
      '1 month',
      '3 months',
      '6 months',
      '12 months'
    ],
    correctIndex: 1,
    explanation: 'Anticoagulation therapy should be continued for a minimum of 3 months. Patients should receive 3 months of anticoagulation therapy after provoked VTE.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'Which laboratory test is generally recommended for monitoring Unfractionated Heparin (UFH) therapy?',
    options: [
      'International Normalized Ratio (INR)',
      'Activated Partial Thromboplastin Time (aPTT)',
      'Anti-Factor Xa level',
      'D-dimer'
    ],
    correctIndex: 1,
    explanation: 'The activated partial thromboplastin time (aPTT) is generally recommended for monitoring UFH.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'What is the specific antidote for reversing the anticoagulant effect of Unfractionated Heparin (UFH)?',
    options: [
      'Vitamin K',
      'Idarucizumab',
      'Protamine Sulfate',
      'Andexanet Alfa'
    ],
    correctIndex: 2,
    explanation: 'If major bleeding occurs with UFH, discontinue it immediately and give IV protamine sulfate.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'A major advantage of Low-Molecular-Weight Heparin (LMWH) over Unfractionated Heparin (UFH) is:',
    options: [
      'Requires more frequent monitoring',
      'Has a higher incidence of Heparin-Induced Thrombocytopenia (HIT)',
      'Has a predictable anticoagulation dose response',
      'Is exclusively administered intravenously'
    ],
    correctIndex: 2,
    explanation: 'Advantages of LMWH over UFH include a predictable anticoagulation dose response, improved SC bioavailability, and less need for routine laboratory monitoring.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'In which of the following patient populations are LMWHs the preferred agents for long-term VTE treatment?',
    options: [
      'Elderly patients with hypertension',
      'Patients with active cancer',
      'Patients with a history of GI bleeding',
      'Athletes'
    ],
    correctIndex: 1,
    explanation: 'In patients with cancer, LMWHs are the preferred agents during long-term and extended treatment phases due to better safety or efficacy.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'Why is warfarin contraindicated during pregnancy?',
    options: [
      'It causes hypertension',
      'It is ineffective in preventing clots during pregnancy',
      'Risk of teratogenicity and fetal bleeding',
      'It increases the risk of pre-eclampsia'
    ],
    correctIndex: 2,
    explanation: 'Warfarin is contraindicated during pregnancy due to risk of teratogenicity and fetal bleeding. LMWH does not cross the placenta and is preferred.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'When initiating warfarin for acute VTE, how long should it be overlapped with a rapid-acting parenteral anticoagulant?',
    options: [
      'For 24 hours',
      'For a minimum of 5 days and until the INR is ≥2 for 24 hours',
      'Until the first dose of warfarin is administered',
      'For 2 weeks'
    ],
    correctIndex: 1,
    explanation: 'The parenteral agent (UFH, LMWH, fondaparinux) should be overlapped with warfarin for a minimum of 5 days and until the INR is greater than or equal to 2 for at least 24 hours.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'Which Target-Specific Oral Anticoagulant (TOAC) is a direct thrombin inhibitor?',
    options: [
      'Rivaroxaban',
      'Apixaban',
      'Edoxaban',
      'Dabigatran'
    ],
    correctIndex: 3,
    explanation: 'Dabigatran is an oral selective, reversible, direct factor IIa (thrombin) inhibitor. The others (rivaroxaban, apixaban, edoxaban) are factor Xa inhibitors.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'What is the reversal agent for Dabigatran?',
    options: [
      'Andexanet Alfa',
      'Idarucizumab',
      'Protamine Sulfate',
      'Vitamin K'
    ],
    correctIndex: 1,
    explanation: 'Idarucizumab (Praxbind) rapidly reverses the dabigatran anticoagulant effect.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'For which serious adverse effect must Heparin (UFH/LMWH) be immediately discontinued and an alternative anticoagulant initiated?',
    options: [
      'Osteoporosis',
      'Alopecia',
      'Hyperkalemia',
      'Heparin-Induced Thrombocytopenia (HIT)'
    ],
    correctIndex: 3,
    explanation: 'Heparin-Induced Thrombocytopenia (HIT) is a serious immune-mediated problem that requires immediate intervention: discontinue heparin and initiate alternative anticoagulation.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Which of the following is a key characteristic of Fondaparinux?',
    options: [
      'It requires routine aPTT monitoring',
      'It inhibits both Factor Xa and Thrombin',
      'It inhibits only Factor Xa activity',
      'It is administered orally'
    ],
    correctIndex: 2,
    explanation: 'Unlike UFH or LMWH, fondaparinux inhibits only factor Xa activity through its interaction with antithrombin.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'When is thrombolytic therapy MOST indicated in VTE?',
    options: [
      'For all patients with a first unprovoked DVT',
      'For patients with massive PE and hemodynamic compromise',
      'As prophylaxis following orthopedic surgery',
      'For patients with a high bleeding risk'
    ],
    correctIndex: 1,
    explanation: 'Patients with massive PE and evidence of hemodynamic compromise (hypotension or shock) should receive thrombolytic therapy unless contraindicated by bleeding risk.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'What is the target INR range for warfarin therapy in VTE treatment?',
    options: [
      '1.5 - 2.0',
      '2.0 - 3.0 (Target 2.5)',
      '2.5 - 3.5',
      '3.0 - 4.0'
    ],
    correctIndex: 1,
    explanation: 'In patients with DVT of the leg or PE who are treated with warfarin, a therapeutic INR range of 2-3 (target INR of 2.5) is recommended.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'Which mechanical method is used for VTE prophylaxis by preventing venous stasis?',
    options: [
      'Aspirin',
      'Inferior Vena Cava (IVC) Filter',
      'Graduated Compression Stockings (GCS)',
      'Warfarin'
    ],
    correctIndex: 2,
    explanation: 'Mechanical methods, including graduated compression stockings (GCS) and intermittent pneumatic compression (IPC) devices, prevent venous stasis.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'The "paradoxical hypercoagulable state" during initial warfarin therapy is due to:',
    options: [
      'Rapid depletion of Factor II',
      'Inhibition of anticoagulant proteins C and S before clotting factors',
      'Interaction with Vitamin K-rich foods',
      'Induction of platelet aggregation'
    ],
    correctIndex: 1,
    explanation: 'Warfarin reduces the concentration of natural anticoagulants (proteins C and S) before the clotting factors are depleted, which can lead to a transient hypercoagulable state.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'Which laboratory value is most useful combined with clinical probability scores to rule out VTE?',
    options: [
      'Elevated C-reactive protein',
      'D-dimer value <500 ng/mL',
      'INR > 3.0',
      'Positive anti-nuclear antibody'
    ],
    correctIndex: 1,
    explanation: 'Serum concentration of D-dimer is nearly always elevated in VTE; values <500 ng/mL (mcg/L) combined with clinical probability scores are useful in ruling out VTE.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'Which of the following is a reversible risk factor for VTE?',
    options: [
      'Cancer',
      'Thrombophilia',
      'Estrogen use',
      'Previous history of VTE'
    ],
    correctIndex: 2,
    explanation: 'Certain risk factors are reversible (eg, estrogen use, recent orthopedic surgery, smoking, prolonged immobility) and may be eliminated over time.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'What is the primary reason for using an Inferior Vena Cava (IVC) filter?',
    options: [
      'As first-line prophylaxis for all hospitalized patients',
      'When anticoagulants are contraindicated due to active bleeding',
      'To enhance the effect of warfarin',
      'As a long-term replacement for DOACs'
    ],
    correctIndex: 1,
    explanation: 'IVC filters should only be used when anticoagulants are contraindicated due to active bleeding.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'Which TOACs can be used as single-drug therapy for VTE (i.e., do not require initial parenteral overlap)?',
    options: [
      'Dabigatran and Edoxaban',
      'Rivaroxaban and Apixaban',
      'Warfarin and Fondaparinux',
      'Betrixaban and Lepirudin'
    ],
    correctIndex: 1,
    explanation: 'Single-drug oral therapy with rivaroxaban or apixaban produces similar rates of recurrent VTE compared to traditional therapy. They are initiated with a higher dose and subsequently reduced.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'What is the most serious complication of warfarin therapy?',
    options: [
      'Skin rash',
      'Alopecia',
      'Intracranial hemorrhage',
      'Purple toe syndrome'
    ],
    correctIndex: 2,
    explanation: 'Intracranial hemorrhage is the most serious complication of warfarin and often results in permanent disability and death.',
    categories: {AppliedTherapeuticsCategory.lec2},
  ),
  // ========== CASE STUDY 1 ==========
AppliedCaseItem(
  id: 26,
  question: 'A 72-year-old woman is admitted to the hospital for heart failure exacerbation. She has limited mobility. Her bleeding risk is low. What is the most appropriate VTE prophylaxis for her?',
  options: [
    'No prophylaxis needed',
    'Graduated compression stockings (GCS) only',
    'Pharmacologic prophylaxis with LMWH, LDUH, or fondaparinux',
    'Insertion of an IVC filter'
  ],
  correctIndex: 2,
  explanation: 'Hospitalized and acutely ill medical patients at high VTE risk and low bleeding risk should receive pharmacologic prophylaxis with LDUH, LMWH, fondaparinux, or betrixaban.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A 45-year-old man presents with sudden onset shortness of breath, pleuritic chest pain, and tachycardia. A CT pulmonary angiogram confirms a pulmonary embolism (PE). His hemodynamics are stable. He has no renal impairment. Which anticoagulant regimen is most appropriate for initial treatment?',
  options: [
    'Warfarin alone',
    'IV UFH overlapped with warfarin',
    'A DOAC like rivaroxaban or apixaban',
    'Subcutaneous fondaparinux overlapped with warfarin'
  ],
  correctIndex: 2,
  explanation: 'In patients with acute DVT or PE, a DOAC is suggested over warfarin therapy. Rivaroxaban and apixaban can be used as single-drug regimens.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A 60-year-old patient with active cancer is diagnosed with a proximal DVT. What is the preferred long-term (first 3 months) anticoagulant for this patient?',
  options: [
    'Warfarin',
    'Dabigatran',
    'Low-Molecular-Weight Heparin (LMWH)',
    'Aspirin'
  ],
  correctIndex: 2,
  explanation: 'In patients with cancer, LMWHs are the preferred agents during long-term and extended treatment phases due to better safety or efficacy compared to warfarin.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A patient receiving intravenous Unfractionated Heparin (UFH) for a massive DVT develops a significant drop in platelet count on day 6 of therapy. HIT is suspected. What is the most critical next step?',
  options: [
    'Continue UFH and monitor platelets closely',
    'Switch to an LMWH',
    'Discontinue all heparin and start a non-heparin anticoagulant (e.g., argatroban)',
    'Administer protamine sulfate'
  ],
  correctIndex: 2,
  explanation: 'HIT is a serious immune-mediated problem that requires immediate intervention: Discontinue heparin and initiate alternative anticoagulation with a parenteral direct thrombin inhibitor (DTI).',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'A 28-year-old woman in her first trimester of pregnancy is diagnosed with an unprovoked DVT. Which anticoagulant is SAFEST to use during pregnancy?',
  options: [
    'Warfarin',
    'Rivaroxaban',
    'Low-Molecular-Weight Heparin (LMWH)',
    'Fondaparinux'
  ],
  correctIndex: 2,
  explanation: 'LMWH does not cross the placenta and is the preferred agent in pregnancy. Warfarin is contraindicated due to teratogenicity.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A patient with a mechanical heart valve on warfarin presents with a life-threatening GI bleed. INR is 8.0. What is the most appropriate reversal agent?',
  options: [
    'Protamine Sulfate',
    'Idarucizumab',
    'Andexanet Alfa',
    'Vitamin K and Prothrombin Complex Concentrate (PCC)'
  ],
  correctIndex: 3,
  explanation: 'For major bleeding with warfarin, Vitamin K reverses the long-term effect, but PCC provides immediate reversal by supplying functional clotting factors.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'A 55-year-old man with CrCl of 15 mL/min is diagnosed with a PE. Which anticoagulant is MOST appropriate for initial treatment?',
  options: [
    'Enoxaparin',
    'Fondaparinux',
    'Rivaroxaban',
    'Intravenous Unfractionated Heparin (UFH)'
  ],
  correctIndex: 3,
  explanation: 'UFH is preferred in patients with severe renal impairment (CrCl <30 mL/min) as it is not renally cleared. LMWH, fondaparinux, and most DOACs are contraindicated or require caution.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'A patient presents with a large, limb-threatening ileofemoral DVT. Symptoms began 5 days ago. The patient has no major bleeding risk. What intervention might be considered beyond standard anticoagulation?',
  options: [
    'Insertion of an IVC filter',
    'Thrombolytic therapy',
    'Double the dose of LMWH',
    'Switch from DOAC to warfarin'
  ],
  correctIndex: 1,
  explanation: 'Thrombolytic therapy should be reserved for patients who present with extensive proximal (eg, ileofemoral) DVT within 14 days of symptom onset, have good functional status, and are at low risk of bleeding.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'A patient with atrial fibrillation on dabigatran presents to the ER after a car accident with significant internal bleeding. What is the specific reversal agent that should be administered?',
  options: [
    'Protamine Sulfate',
    'Andexanet Alfa',
    'Idarucizumab',
    'Vitamin K'
  ],
  correctIndex: 2,
  explanation: 'Idarucizumab (Praxbind) is the specific reversal agent for dabigatran.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'A patient with an unprovoked DVT completed 3 months of anticoagulation with apixaban. They have no ongoing risk factors and a low bleeding risk. What is the next step regarding anticoagulation?',
  options: [
    'Discontinue anticoagulation immediately',
    'Continue anticoagulation indefinitely',
    'Switch to aspirin 81 mg daily',
    'The decision involves weighing the long-term risk of recurrence vs. bleeding'
  ],
  correctIndex: 3,
  explanation: 'For patients with unprovoked VTE, the long-term risks of anticoagulant use (bleeding) must be weighed against the risk of repeated thrombosis after completing a minimum of 3 months of therapy.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'Which patient is the best candidate for an Inferior Vena Cava (IVC) filter?',
  options: [
    'A patient with a provoked DVT and low bleeding risk',
    'A patient with a PE who is stable on rivaroxaban',
    'A patient with a recent major trauma who develops a DVT but has active GI bleeding',
    'A patient with unprovoked DVT who prefers an oral medication'
  ],
  correctIndex: 2,
  explanation: 'IVC filters should only be used when anticoagulants are contraindicated due to active bleeding.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'A patient is started on warfarin for a DVT. On day 3, the INR is 1.4. The patient is still receiving therapeutic enoxaparin. What is the correct action?',
  options: [
    'Discontinue enoxaparin because warfarin has been started',
    'Continue enoxaparin and warfarin until the INR is ≥2 for at least 24 hours',
    'Increase the warfarin dose dramatically to achieve therapeutic INR faster',
    'Switch to a DOAC immediately'
  ],
  correctIndex: 1,
  explanation: 'The parenteral agent (e.g., enoxaparin) should be overlapped with warfarin for a minimum of 5 days and until the INR is greater than or equal to 2 for at least 24 hours.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'What is the primary mechanism of action of Fondaparinux?',
  options: [
    'Direct inhibition of thrombin',
    'Direct inhibition of Factor Xa',
    'Indirect inhibition of Factor Xa via Antithrombin',
    'Inhibition of Vitamin K epoxide reductase'
  ],
  correctIndex: 2,
  explanation: 'Fondaparinux prevents thrombus generation by indirectly inhibiting factor Xa activity through its interaction with antithrombin.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'A patient on rivaroxaban for VTE treatment experiences a life-threatening intracranial hemorrhage. Which reversal agent is most appropriate?',
  options: [
    'Idarucizumab',
    'Protamine Sulfate',
    'Andexanet Alfa',
    'Vitamin K'
  ],
  correctIndex: 2,
  explanation: 'Andexanet alfa is a reversal agent for factor Xa inhibitors like rivaroxaban and apixaban.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'Which laboratory test is most appropriate for monitoring a patient on therapeutic enoxaparin who is morbidly obese?',
  options: [
    'aPTT',
    'INR',
    'Anti-Factor Xa level',
    'D-dimer'
  ],
  correctIndex: 2,
  explanation: 'Measuring anti–factor Xa activity is the most widely used method to monitor LMWH and may be considered in patients who are morbidly obese, have renal impairment, or are pregnant.',
  categories: {AppliedTherapeuticsCategory.lec2},
),

  AppliedCaseItem(
    id: 1,
    question: 'What is the defining characteristic of shock?',
    options: [
      'Localized tissue infection',
      'Widespread circulatory failure leading to inadequate oxygen delivery',
      'Acute hypertension',
      'Isolated respiratory failure'
    ],
    correctIndex: 1,
    explanation: 'Shock is a condition characterized by widespread circulatory failure that leads to insufficient blood flow and oxygen delivery to tissues and organs.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'Which of the following blood pressure readings typically identifies a state of shock?',
    options: [
      'Systolic BP > 140 mm Hg',
      'Systolic BP below 90 mm Hg or a significant drop from baseline',
      'Diastolic BP > 100 mm Hg',
      'Mean Arterial Pressure (MAP) > 90 mm Hg'
    ],
    correctIndex: 1,
    explanation: 'Shock is typically identified by a systolic blood pressure below 90 mm Hg or a significant drop from the patient\'s baseline, or a mean arterial pressure under 70 mm Hg.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'Which type of shock is caused by a physical obstruction that impedes blood flow, such as a tension pneumothorax or pulmonary embolism?',
    options: [
      'Hypovolemic Shock',
      'Cardiogenic Shock',
      'Obstructive Shock',
      'Distributive Shock'
    ],
    correctIndex: 2,
    explanation: 'Obstructive shock is caused by physical obstructions such as tension pneumothorax, tamponade, or embolism that impede blood flow.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'What is the primary initial fluid of choice for resuscitation in most types of shock?',
    options: [
      'Colloids (e.g., Albumin)',
      'Dextran',
      'Crystalloids (e.g., Lactated Ringer\'s, Normal Saline)',
      'Hydroxyethyl Starch'
    ],
    correctIndex: 2,
    explanation: 'Crystalloids (e.g., lactated Ringer’s, normal saline) are preferred initially for fluid resuscitation.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'Which vasopressor is considered first-line for managing septic shock when fluid resuscitation is insufficient?',
    options: [
      'Dopamine',
      'Phenylephrine',
      'Norepinephrine',
      'Epinephrine'
    ],
    correctIndex: 2,
    explanation: 'Norepinephrine is the first-line vasopressor when mean arterial pressure (MAP) is below 65 mm Hg or organ perfusion is inadequate in septic shock.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'In hypovolemic hemorrhagic shock, what is the primary treatment priority?',
    options: [
      'Immediate administration of high-dose vasopressors',
      'Surgical control of bleeding',
      'Administration of corticosteroids',
      'Fluid restriction'
    ],
    correctIndex: 1,
    explanation: 'In hypovolemic (hemorrhagic) shock, the priority is surgical control of bleeding.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'What is a typical target Mean Arterial Pressure (MAP) to ensure organ perfusion in shock management?',
    options: [
      '> 55 mm Hg',
      '> 65 mm Hg',
      '> 75 mm Hg',
      '> 85 mm Hg'
    ],
    correctIndex: 1,
    explanation: 'A typical target MAP is >65 mm Hg to ensure organ perfusion, tailored to individual patient factors.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'Which inotrope is ideal for patients with low cardiac output and high preload pressures, as it increases contractility without significant vasoconstriction?',
    options: [
      'Norepinephrine',
      'Dopamine',
      'Dobutamine',
      'Phenylephrine'
    ],
    correctIndex: 2,
    explanation: 'Dobutamine is a selective β1-agonist that produces strong inotropic effects without vasoconstriction, making it ideal for patients with low cardiac output and high preload pressures.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'What is the recommended initial crystalloid fluid volume for resuscitation in distributive (septic) shock?',
    options: [
      '10 mL/kg within 1 hour',
      '30 mL/kg within 3 hours',
      '50 mL/kg within 30 minutes',
      '5 mL/kg bolus'
    ],
    correctIndex: 1,
    explanation: 'In distributive (septic) shock, initial resuscitation recommends about 30 mL/kg of crystalloids within 3 hours.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'Which of the following is a key laboratory finding indicative of tissue hypoperfusion in shock?',
    options: [
      'Low Blood Urea Nitrogen (BUN)',
      'Elevated blood lactate',
      'Decreased serum creatinine',
      'Hypoglycemia'
    ],
    correctIndex: 1,
    explanation: 'Laboratory findings in shock can include elevated blood lactate, which indicates a shift to anaerobic metabolism due to tissue hypoperfusion.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'The use of vasopressors in hypovolemic shock is generally:',
    options: [
      'The first-line treatment',
      'Used temporarily or as a last resort when other methods fail',
      'Contraindicated',
      'Used to replace fluid resuscitation'
    ],
    correctIndex: 1,
    explanation: 'In hypovolemic shock, vasopressors are generally used temporarily or when all other methods fail, as early or excessive use can worsen peripheral resistance.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'Which diagnostic tool is essential for a quick diagnosis of the cause of shock, typically within five minutes?',
    options: [
      'Computed Tomography (CT) Scan',
      'Rapid Transthoracic Echocardiography',
      'Electrocardiogram (ECG)',
      'Chest X-Ray'
    ],
    correctIndex: 1,
    explanation: 'Rapid transthoracic echocardiography is essential for quick diagnosis of shock causes, typically within five minutes.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'What is the role of corticosteroids in the management of septic shock?',
    options: [
      'First-line treatment instead of vasopressors',
      'To improve hemodynamics and facilitate lower vasopressor doses',
      'To prevent infection',
      'To increase heart rate'
    ],
    correctIndex: 1,
    explanation: 'Corticosteroids improve hemodynamic parameters and facilitate lower vasopressor doses, especially when fluid and vasopressors are insufficient.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'Which vasopressor is a pure α1-agonist and may be suitable for patients intolerant to tachycardia?',
    options: [
      'Norepinephrine',
      'Epinephrine',
      'Phenylephrine',
      'Dopamine'
    ],
    correctIndex: 2,
    explanation: 'Phenylephrine is a pure α1-agonist that raises BP mainly via vasoconstriction, with low risk of tachyarrhythmias.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'What is the primary goal of the "Salvage" phase in shock treatment?',
    options: [
      'To gradually discontinue medications',
      'To prevent further organ dysfunction',
      'To restore basic perfusion pressure and ensure survival',
      'To maintain adequate organ perfusion'
    ],
    correctIndex: 2,
    explanation: 'The Salvage phase aims to restore basic perfusion pressure and cardiac output to ensure survival and address the underlying cause.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Which of the following is a potential adverse effect associated with corticosteroid use in shock?',
    options: [
      'Hypoglycemia',
      'Bradycardia',
      'Hypernatremia and hyperglycemia',
      'Hypokalemia'
    ],
    correctIndex: 2,
    explanation: 'Short-term, low-dose corticosteroid therapy may increase risks of hypernatremia, hyperglycemia, neuromuscular weakness, and elevated serum BUN and WBCs.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'In hemorrhagic shock, what is the restrictive transfusion threshold for hemoglobin once bleeding is controlled?',
    options: [
      'Hemoglobin ≤ 10 g/dL',
      'Hemoglobin ≤ 9 g/dL',
      'Hemoglobin ≤ 7 g/dL',
      'Hemoglobin ≤ 5 g/dL'
    ],
    correctIndex: 2,
    explanation: 'Once bleeding is controlled, transfusions follow a restrictive threshold (hemoglobin ≤7 g/dL) unless cardiac ischemia occurs.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'Which agent is used as an adjunct to norepinephrine in septic shock but may cause lactate elevation?',
    options: [
      'Vasopressin',
      'Phenylephrine',
      'Epinephrine',
      'Dobutamine'
    ],
    correctIndex: 2,
    explanation: 'Epinephrine serves as an adjunct to norepinephrine but may cause tachydysrhythmias, lactate elevation, and pH variability.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'What is the recommended maximum dose for Vasopressin when used adjunctively in shock?',
    options: [
      '0.01 units/min',
      '0.04 units/min',
      '0.1 units/min',
      '1.0 units/min'
    ],
    correctIndex: 1,
    explanation: 'Vasopressin is used to prevent adrenergic dose escalation, with doses generally at 0.03–0.04 units/min. Doses above 0.04 units/min may impair perfusion.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'Which type of shock results from loss of vascular tone and decreased systemic vascular resistance?',
    options: [
      'Hypovolemic Shock',
      'Cardiogenic Shock',
      'Obstructive Shock',
      'Distributive Shock'
    ],
    correctIndex: 3,
    explanation: 'Vasodilatory/distributive shock is characterized by loss of vascular tone and decreased systemic vascular resistance.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'Why is Hydroxyethyl Starch (HES) generally contraindicated in critically ill patients?',
    options: [
      'It is too expensive',
      'It is linked to renal issues',
      'It has a very short duration of action',
      'It causes severe hypertension'
    ],
    correctIndex: 1,
    explanation: 'Colloids like hydroxyethyl starch are costly and linked to renal issues; HES is contraindicated in critically ill patients.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'What is the primary mechanism by which norepinephrine increases blood pressure?',
    options: [
      'By increasing heart rate only',
      'By causing vasodilation',
      'By potent vasoconstriction (α1 effect) and modestly increasing stroke volume (β1 effect)',
      'By inhibiting angiotensin II'
    ],
    correctIndex: 2,
    explanation: 'Norepinephrine is a potent vasoconstrictor with strong α1 and modest β1 effects, increasing Systemic Vascular Resistance (SVR) and stroke volume.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'Which parameter is monitored to assess tissue oxygenation and perfusion improvement?',
    options: [
      'Serum Sodium',
      'Blood Lactate levels',
      'Platelet count',
      'Total Cholesterol'
    ],
    correctIndex: 1,
    explanation: 'Serial lactate measurements are used to gauge perfusion improvement. Elevated lactate indicates anaerobic metabolism from hypoperfusion.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'In the management algorithm for shock, when should norepinephrine typically be initiated?',
    options: [
      'As the first step before any fluid challenge',
      'After fluid challenge fails to improve signs of tissue hypoperfusion',
      'Only in cardiogenic shock',
      'When urine output is normal'
    ],
    correctIndex: 1,
    explanation: 'According to the algorithm, if signs of tissue hypoperfusion persist after a negative fluid responsiveness assessment, start norepinephrine.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'What is a common clinical sign of shock related to the skin?',
    options: [
      'Diaphoresis (sweating)',
      'Warm and flushed skin always',
      'Impaired capillary refill',
      'Jaundice'
    ],
    correctIndex: 2,
    explanation: 'Physical examination in shock may reveal skin changes such as vasodilation or vasoconstriction, and impaired capillary refill.',
    categories: {AppliedTherapeuticsCategory.lec3},
  ),
  // ========== CASE STUDY 1 ==========
AppliedCaseItem(
  id: 26,
  question: 'A 68-year-old man is admitted with fever, hypotension (BP 78/50 mm Hg), and confusion. He is diagnosed with septic shock from pneumonia. After an initial 30 mL/kg crystalloid bolus, his MAP remains at 55 mm Hg. What is the most appropriate next step in pharmacologic management?',
  options: [
    'Administer another 50 mL/kg crystalloid bolus',
    'Start a norepinephrine infusion',
    'Initiate dobutamine',
    'Start phenylephrine'
  ],
  correctIndex: 1,
  explanation: 'In septic shock, if fluid resuscitation fails to restore adequate perfusion pressure (MAP >65 mm Hg), the first-line vasopressor is norepinephrine.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A 45-year-old trauma patient presents with a BP of 70/40 mm Hg, tachycardia, and pale, cool skin. Focused assessment with sonography for trauma (FAST) exam is positive for free fluid in the abdomen. What is the most critical initial intervention?',
  options: [
    'Immediate administration of norepinephrine',
    'Rapid infusion of 2 liters of normal saline',
    'Emergent surgical consultation for control of bleeding',
    'Administration of packed red blood cells'
  ],
  correctIndex: 2,
  explanation: 'In hypovolemic hemorrhagic shock, the priority is surgical control of bleeding. Fluids and blood products are secondary to stopping the source of volume loss.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A patient with known severe cardiomyopathy presents with profound hypotension, pulmonary edema, and cold extremities. Echocardiography shows severe global hypokinesis. Which inotrope is most appropriate for this patient?',
  options: [
    'Phenylephrine',
    'Norepinephrine',
    'Dobutamine',
    'Vasopressin'
  ],
  correctIndex: 2,
  explanation: 'This patient is in cardiogenic shock. Dobutamine is an inotrope that increases cardiac contractility and output without significant vasoconstriction, making it suitable for low output states.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A patient in septic shock is receiving norepinephrine at 0.3 mcg/kg/min to maintain a MAP of 65 mm Hg. The clinical team wants to add an adjunctive agent to reduce the norepinephrine dose. Which agent is commonly used for this purpose?',
  options: [
    'Dobutamine',
    'Phenylephrine',
    'Vasopressin',
    'Epinephrine'
  ],
  correctIndex: 2,
  explanation: 'Vasopressin is used adjunctively to prevent adrenergic dose escalation, typically at doses of 0.03-0.04 units/min.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'A patient with septic shock has been adequately fluid resuscitated and is on norepinephrine. Despite this, hypotension persists and cardiac output is noted to be low on advanced monitoring. Which agent should be added to address the low cardiac output?',
  options: [
    'Phenylephrine',
    'Dobutamine',
    'Vasopressin',
    'Angiotensin II'
  ],
  correctIndex: 1,
  explanation: 'Dobutamine is recommended for septic patients with myocardial dysfunction to improve myocardial performance and cardiac output.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A patient with an acute myocardial infarction develops cardiogenic shock. The team is concerned about increasing myocardial oxygen demand. Which agent should be used cautiously in this scenario due to this specific risk?',
  options: [
    'Norepinephrine',
    'Dobutamine',
    'Phenylephrine',
    'Vasopressin'
  ],
  correctIndex: 1,
  explanation: 'Dobutamine, while increasing contractility and output, also increases myocardial oxygen demand, which can be detrimental in ischemic cardiogenic shock. Cautious use is needed.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'In the "Optimization" phase of shock management, what is the primary focus?',
  options: [
    'Restoring basic perfusion pressure',
    'Discontinuing vasoactive medications',
    'Maintaining adequate organ perfusion and oxygen delivery',
    'Preventing further organ dysfunction'
  ],
  correctIndex: 2,
  explanation: 'The Optimization phase focuses on maintaining adequate organ perfusion and oxygen delivery after initial salvage.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'A patient in septic shock requires vasopressor support. The nurse notes the patient has developed significant tachycardia. Which vasopressor could be considered as an alternative to minimize heart rate effects?',
  options: [
    'Epinephrine',
    'Dopamine',
    'Phenylephrine',
    'Dobutamine'
  ],
  correctIndex: 2,
  explanation: 'Phenylephrine is a pure α1-agonist that raises BP via vasoconstriction with a low risk of tachyarrhythmias, making it suitable for patients intolerant to tachycardia.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'Which finding on venous oximetry (SvO2) most strongly indicates tissue hypoxia in a patient in shock?',
  options: [
    'SvO2 > 80%',
    'SvO2 between 65-75%',
    'SvO2 below 50%',
    'SvO2 of 100%'
  ],
  correctIndex: 2,
  explanation: 'Venous oximetry (SvO2, ScvO2) values below 50% indicate hypoxia, as it reflects the amount of oxygen remaining in the blood after tissue extraction.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'A patient with hemorrhagic shock has had their bleeding surgically controlled. Their current hemoglobin is 6.8 g/dL, and they are hemodynamically stable. What is the most appropriate action regarding transfusion?',
  options: [
    'Transfuse to a target hemoglobin > 10 g/dL',
    'Transfuse packed red blood cells now',
    'Do not transfuse; hemoglobin is acceptable',
    'Transfuse only if symptoms of cardiac ischemia develop'
  ],
  correctIndex: 1,
  explanation: 'Once bleeding is controlled, a restrictive transfusion strategy (threshold hemoglobin ≤7 g/dL) is recommended. This patient\'s Hb is 6.8 g/dL, indicating a need for transfusion.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'What is the primary reason for avoiding excessive fluid administration in patients with septic shock after the initial salvage phase?',
  options: [
    'To save costs',
    'To prevent fluid overload and pulmonary edema',
    'To encourage vasopressor use',
    'To reduce urine output'
  ],
  correctIndex: 1,
  explanation: 'After initial salvage, fluids are given cautiously to avoid fluid overload and pulmonary edema, balancing benefits with potential risks.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'Which clinical sign is part of the initial monitoring for a patient in shock?',
  options: [
    'Serum cholesterol levels',
    'Urine output',
    'Bone density',
    'Thyroid function tests'
  ],
  correctIndex: 1,
  explanation: 'Initial monitoring in shock includes vital signs, blood lactate, urine output, and mental status. Urine output is a key indicator of renal perfusion.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'A patient in refractory septic shock is receiving high-dose norepinephrine and vasopressin. The team is considering adding an agent for which the role is "unclear" but used adjunctively. Which agent fits this description?',
  options: [
    'Dobutamine',
    'Angiotensin II',
    'Phenylephrine',
    'Epinephrine'
  ],
  correctIndex: 1,
  explanation: 'The role of angiotensin II remains unclear but is used adjunctively in shock to increase blood pressure by raising SVR.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'For which type of shock is dobutamine considered an "inodilator"?',
  options: [
    'Hypovolemic Shock',
    'Obstructive Shock',
    'Cardiogenic Shock',
    'Neurogenic Shock'
  ],
  correctIndex: 2,
  explanation: 'Dobutamine is an inodilator; it increases cardiac output (inotropy) and can cause some vasodilation (β2 effect), making it useful in cardiogenic shock with high systemic vascular resistance.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'According to the management algorithm, what is the step immediately following a "negative" assessment of fluid responsiveness in a patient with persistent signs of tissue hypoperfusion?',
  options: [
    'Give another fluid challenge',
    'Start norepinephrine',
    'Initiate dobutamine',
    'Administer corticosteroids'
  ],
  correctIndex: 1,
  explanation: 'The algorithm states that if the fluid responsiveness assessment is negative and signs of hypoperfusion persist, the next step is to start norepinephrine.',
  categories: {AppliedTherapeuticsCategory.lec3},
),

  // ========== MCQ 1 ==========
  AppliedCaseItem(
    id: 1,
    question: 'What is the primary pathological process in glaucoma?',
    options: [
      'Lens opacity',
      'Retinal detachment',
      'Optic neuropathy leading to vision loss',
      'Corneal scarring'
    ],
    correctIndex: 2,
    explanation: 'Glaucoma is the term used to describe a group of ocular diseases in which optic neuropathy leads to vision loss.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'How is Primary Open-Angle Glaucoma (POAG) typically characterized?',
    options: [
      'Acute, painful episodes with sudden vision loss',
      'Bilateral, often asymmetric, and usually asymptomatic until substantial visual field loss',
      'Unilateral, rapidly progressing with early symptoms',
      'Always associated with severely elevated IOP at diagnosis'
    ],
    correctIndex: 1,
    explanation: 'Primary open-angle glaucoma (POAG) is bilateral, often asymmetric, progresses slowly, and is usually asymptomatic until onset of substantial visual field loss.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'What is the primary goal of glaucoma pharmacotherapy?',
    options: [
      'To cure the underlying optic neuropathy',
      'To decrease intraocular pressure (IOP)',
      'To improve blood flow to the retina',
      'To reverse visual field loss'
    ],
    correctIndex: 1,
    explanation: 'The goal of glaucoma treatment is to decrease the IOP (the only modifiable risk factor in chronic primary open-angle glaucoma), thus delaying or preventing disease progression.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'Which class of medications is considered first-line for POAG due to superior efficacy and safety?',
    options: [
      'Topical β-blockers',
      'Topical carbonic anhydrase inhibitors',
      'Ocular hypotensive lipids (Prostaglandin analogs)',
      'Topical α2-adrenergic agonists'
    ],
    correctIndex: 2,
    explanation: 'The ocular hypotensive lipids (prostaglandin analogs) are considered first-line agents along with β-blockers because of their superior efficacy and safety profiles.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'What is a common local adverse effect of prostaglandin analogs?',
    options: [
      'Bradycardia',
      'Bronchospasm',
      'Conjunctival hyperemia',
      'Dry mouth'
    ],
    correctIndex: 2,
    explanation: 'Local effects of ocular hypotensive lipids include conjunctival hyperemia, stinging on instillation, increase in iris pigmentation, and darkening of the eyelashes.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'Why are topical β-blockers generally considered second-line after prostaglandin analogs?',
    options: [
      'They are less effective',
      'They require more frequent dosing',
      'They can cause significant systemic adverse effects',
      'They are more expensive'
    ],
    correctIndex: 2,
    explanation: 'Topical β-blockers can cause significant systemic adverse effects (e.g., bronchospasm, bradycardia) through systemic absorption and are generally contraindicated in patients with asthma, COPD, or certain cardiac conditions.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'Which topical β-blocker is relatively selective for β1 receptors and may cause less exacerbation of pulmonary disease?',
    options: [
      'Timolol',
      'Betaxolol',
      'Levobunolol',
      'Carteolol'
    ],
    correctIndex: 1,
    explanation: 'The β1-selective properties of betaxolol may cause less exacerbation of pulmonary disease compared to non-selective β-blockers.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'What is the primary mechanism of action for brimonidine?',
    options: [
      'Increase aqueous outflow',
      'Decrease aqueous production',
      'Create an osmotic gradient',
      'Inhibit carbonic anhydrase'
    ],
    correctIndex: 1,
    explanation: 'Brimonidine, an α2-adrenergic agonist, decreases IOP by reducing aqueous humor production.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'Which adjunctive therapy may exhibit a neuroprotective effect and has been shown to delay visual field progression compared to timolol?',
    options: [
      'Dorzolamide',
      'Brimonidine',
      'Pilocarpine',
      'Acetazolamide'
    ],
    correctIndex: 1,
    explanation: 'Brimonidine may exhibit a neuroprotective effect and has been shown to delay visual field progression compared with timolol.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'What is a key advantage of using fixed-combination products in glaucoma therapy?',
    options: [
      'They are always preservative-free',
      'They reduce the number of daily doses and may improve adherence',
      'They are more potent than any single agent',
      'They have no systemic side effects'
    ],
    correctIndex: 1,
    explanation: 'Fixed combination products reduce the number of daily doses, which might improve adherence and prevent washout effect. They also reduce exposure to ophthalmic preservatives.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'Which class of drugs is contraindicated in patients with a sulfonamide allergy?',
    options: [
      'Prostaglandin analogs',
      'β-blockers',
      'Carbonic anhydrase inhibitors',
      'α2-adrenergic agonists'
    ],
    correctIndex: 2,
    explanation: 'Both topical (dorzolamide, brinzolamide) and systemic (acetazolamide) carbonic anhydrase inhibitors are sulfonamides and are contraindicated in patients with a history of sulfonamide hypersensitivity.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'Why is systemic acetazolamide typically reserved as a third or fourth-line agent?',
    options: [
      'It is not effective',
      'It requires frequent monitoring',
      'It has significant systemic adverse effects',
      'It is very expensive'
    ],
    correctIndex: 2,
    explanation: 'Systemic carbonic anhydrase inhibitors like acetazolamide are reserved as third-line to fourth-line agents because of their significant adverse effects, which include paresthesias, metabolic acidosis, and electrolyte imbalances.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'Which hyperosmotic agent is preferred in patients with diabetes?',
    options: [
      'Glycerin',
      'Mannitol',
      'Isosorbide',
      'Urea'
    ],
    correctIndex: 2,
    explanation: 'Isosorbide is preferred in patients with diabetes because it is not metabolized into glucose, unlike glycerin.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'What is a common systemic adverse effect of brimonidine?',
    options: [
      'Bronchospasm',
      'Bradycardia',
      'Headache and dry mouth',
      'Paresthesias'
    ],
    correctIndex: 2,
    explanation: 'Systemic effects of brimonidine include headache, dry mouth, and fatigue.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'Which medication class can precipitate angle closure in susceptible patients?',
    options: [
      'Prostaglandin analogs',
      'Drugs with anticholinergic or sympathomimetic properties',
      'Carbonic anhydrase inhibitors',
      'β-blockers'
    ],
    correctIndex: 1,
    explanation: 'Medications with anticholinergic or sympathomimetic properties can precipitate angle closure by pushing the iris forward and narrowing the anterior chamber angle.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Which route of corticosteroid administration carries the highest risk of increasing IOP?',
    options: [
      'Oral',
      'Intravenous',
      'Inhaled',
      'Ophthalmic'
    ],
    correctIndex: 3,
    explanation: 'Ophthalmic corticosteroid preparations carry the highest risk of increasing IOP.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'What is the recommended dosing frequency for ocular hypotensive lipids (prostaglandin analogs)?',
    options: [
      'Twice daily',
      'Three times daily',
      'Once daily at bedtime',
      'Once weekly'
    ],
    correctIndex: 2,
    explanation: 'The ocular hypotensive lipids are administered once daily at bedtime. Increasing to twice daily may decrease effectiveness.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'What technique should be counseled to patients using topical β-blockers or brimonidine to reduce systemic absorption?',
    options: [
      'Cooling the bottle before use',
      'Nasolacrimal occlusion',
      'Instilling drops with eyes closed',
      'Using only in the morning'
    ],
    correctIndex: 1,
    explanation: 'Patients prescribed topical β-blockers or brimonidine should be counseled on the nasolacrimal occlusion technique (pressing on the tear duct) to decrease systemic absorption and adverse effects.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'Which topical carbonic anhydrase inhibitor is formulated in a neutral pH solution, potentially causing fewer local side effects?',
    options: [
      'Dorzolamide',
      'Brinzolamide',
      'Acetazolamide',
      'Methazolamide'
    ],
    correctIndex: 1,
    explanation: 'Brinzolamide may have fewer incidences of local side effects like burning and stinging since the drug is in a neutral pH solution.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'What is a potential cosmetic effect of prostaglandin analogs that patients should be informed about?',
    options: [
      'Hair loss',
      'Increased iris pigmentation and darkening of eyelashes',
      'Skin depigmentation',
      'Nail brittleness'
    ],
    correctIndex: 1,
    explanation: 'Local effects of prostaglandin analogs include increase in iris pigmentation, hypertrichosis, and darkening of the eyelashes. Increased iris pigmentation appears to be only a cosmetic effect.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'Which of the following is a symptom of an acute angle-closure glaucoma attack?',
    options: [
      'Asymptomatic visual field loss',
      'Ocular pain, nausea, and vomiting',
      'Gradual blurring of vision over years',
      'Floaters and flashes of light'
    ],
    correctIndex: 1,
    explanation: 'Acute episodes of angle-closure glaucoma produce symptoms associated with a cloudy, edematous cornea; ocular pain; nausea, vomiting, and abdominal pain; and diaphoresis.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'For which patient population is the IV formulation of acetazolamide particularly useful?',
    options: [
      'Patients with sulfa allergy',
      'Patients experiencing nausea and vomiting during an acute angle-closure attack',
      'Patients with renal failure',
      'Patients with diabetes'
    ],
    correctIndex: 1,
    explanation: 'Acetazolamide has an IV formulation that can be used in patients who are experiencing nausea due to the angle-closure attack, as they may not be able to tolerate oral medications.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'What is the most common preservative in eye drops that can cause ocular surface damage and allergic reactions?',
    options: [
      'Purite',
      'Sodium perborate',
      'Benzalkonium chloride',
      'Edetate disodium'
    ],
    correctIndex: 2,
    explanation: 'Benzalkonium chloride is the most common preservative in eye drops. Prolonged exposure can result in superficial damage to the ocular surface and cause symptoms such as irritation, dryness, itchiness and burning.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'Which agent is a Rho kinase inhibitor recently approved for glaucoma treatment?',
    options: [
      'Netarsudil',
      'Latanoprost',
      'Brimonidine',
      'Dorzolamide'
    ],
    correctIndex: 0,
    explanation: 'Netarsudil is the first approved Rho kinase inhibitor. Efficacy appears to be similar to that of β-blockers.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'When is surgical intervention (e.g., laser trabeculoplasty) typically considered in glaucoma management?',
    options: [
      'As first-line treatment for all patients',
      'When drug therapy fails, is not tolerated, or is excessively complicated',
      'Only for acute angle-closure attacks',
      'For patients with allergic conjunctivitis'
    ],
    correctIndex: 1,
    explanation: 'Surgical procedures such as laser trabeculoplasty or surgical trabeculectomy can be considered when drug therapy fails, is not tolerated, or is excessively complicated.',
    categories: {AppliedTherapeuticsCategory.lec4},
  ),
// ========== CASE STUDY 1 ==========
AppliedCaseItem(
  id: 26,
  question: 'A 65-year-old patient is newly diagnosed with Primary Open-Angle Glaucoma (POAG). The ophthalmologist wants to start a first-line agent with once-daily dosing and a good safety profile. Which medication class is most appropriate?',
  options: [
    'Topical β-blocker',
    'Topical α2-agonist (Brimonidine)',
    'Ocular hypotensive lipid (Prostaglandin analog)',
    'Topical Carbonic Anhydrase Inhibitor'
  ],
  correctIndex: 2,
  explanation: 'Prostaglandin analogs (ocular hypotensive lipids) are considered first-line due to superior efficacy, once-daily dosing, and a favorable safety profile. They are typically dosed at bedtime.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A patient with well-controlled asthma and POAG is being considered for a topical β-blocker. Which agent might be the safest choice for this patient?',
  options: [
    'Timolol',
    'Levobunolol',
    'Betaxolol',
    'Carteolol'
  ],
  correctIndex: 2,
  explanation: 'Betaxolol is a relatively selective β1-blocker and may cause less exacerbation of pulmonary disease compared to non-selective β-blockers like timolol. However, caution is still advised.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A patient on latanoprost reports that their eye color seems to be getting darker and their eyelashes are longer and darker. How should the clinician respond?',
  options: [
    'Immediately discontinue latanoprost as this indicates toxicity.',
    'Reassure the patient that these are known, typically benign, cosmetic effects.',
    'Switch to a β-blocker immediately.',
    'Order urgent liver function tests.'
  ],
  correctIndex: 1,
  explanation: 'Increased iris pigmentation and darkening/thickening of eyelashes are well-documented, benign cosmetic effects of prostaglandin analogs. They are not harmful but should be discussed with the patient.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A patient with POAG and a known sulfa allergy requires an adjunctive agent. Which of the following should be AVOIDED?',
  options: [
    'Brimonidine',
    'Dorzolamide',
    'Timolol',
    'Latanoprost'
  ],
  correctIndex: 1,
  explanation: 'Topical carbonic anhydrase inhibitors (dorzolamide, brinzolamide) are sulfonamides and are contraindicated in patients with a history of sulfonamide hypersensitivity.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'An elderly patient presents to the emergency department with severe ocular pain, nausea, vomiting, and blurred vision with halos around lights. Their pupil is mid-dilated and non-reactive. What is the most likely diagnosis and initial drug treatment?',
  options: [
    'POAG; start latanoprost',
    'Acute Angle-Closure Glaucoma; start systemic acetazolamide and topical agents',
    'Cataract; refer for surgery',
    'Conjunctivitis; start antibiotic drops'
  ],
  correctIndex: 1,
  explanation: 'The symptoms are classic for acute angle-closure glaucoma. Initial treatment aims to rapidly lower IOP and may include systemic carbonic anhydrase inhibitors (e.g., IV acetazolamide if nauseated), hyperosmotics, and topical agents like pilocarpine and β-blockers. This is a medical emergency.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A patient on timolol drops for glaucoma reports feeling fatigued and short of breath. They have a history of mild COPD. What is the most likely cause and best action?',
  options: [
    'This is expected; continue therapy.',
    'The patient may be experiencing systemic β-blockade; discontinue timolol and switch to a different class.',
    'Increase the dose of timolol.',
    'Add an inhaled bronchodilator.'
  ],
  correctIndex: 1,
  explanation: 'Topical β-blockers can be absorbed systemically and cause adverse effects like bronchospasm and fatigue. In a patient with COPD, timolol (a non-selective β-blocker) should be discontinued, and an alternative class (e.g., prostaglandin analog) should be used.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'A patient using brimonidine twice daily complains of significant dry mouth and fatigue. What counseling point could help reduce these systemic effects?',
  options: [
    'Take the medication with food.',
    'Use the drops more frequently.',
    'Perform nasolacrimal occlusion for 1-2 minutes after instillation.',
    'Switch to the brand-name product only.'
  ],
  correctIndex: 2,
  explanation: 'Systemic absorption of eye drops can be minimized by using the nasolacrimal occlusion technique (pressing on the inner corner of the eye), which reduces drainage into the nasopharynx and subsequent systemic absorption.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'Which patient scenario is a strong indication for the use of a hyperosmotic agent like oral isosorbide or IV mannitol?',
  options: [
    'Long-term maintenance therapy for POAG',
    'A patient with allergic conjunctivitis',
    'To rapidly lower IOP in an acute angle-closure attack',
    'As a first-line agent for ocular hypertension'
  ],
  correctIndex: 2,
  explanation: 'Hyperosmotic agents are used to rapidly lower IOP in emergency situations, such as acute angle-closure glaucoma, by creating an osmotic gradient that draws fluid out of the vitreous humor.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'A patient with controlled POAG is prescribed a nasal decongestant containing pseudoephedrine for a cold. What is the potential concern?',
  options: [
    'No concern at all',
    'It may worsen dry eye.',
    'It may precipitate an acute angle-closure attack.',
    'It will enhance the effect of their glaucoma drops.'
  ],
  correctIndex: 2,
  explanation: 'Sympathomimetics like pseudoephedrine can cause mydriasis (pupil dilation), which may precipitate angle closure in susceptible individuals. However, patients who have had a laser iridotomy are generally protected.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'Why might a patient be switched from the brimonidine 0.2% solution to Alphagan-P (brimonidine purite 0.1% or 0.15%)?',
  options: [
    'To reduce cost',
    'To increase dosing frequency',
    'To improve tolerability by using a different preservative (purite)',
    'To make the medication more potent'
  ],
  correctIndex: 2,
  explanation: 'Alphagan-P is preserved with purite rather than benzalkonium chloride (BAK). This can reduce ocular surface irritation and damage, improving tolerability for patients sensitive to BAK.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'What is the primary reason for initiating drug therapy in a stepwise manner, starting with a single agent?',
  options: [
    'To minimize cost',
    'To identify the agent causing side effects if they occur and simplify the regimen',
    'To ensure the patient uses the most potent agent first',
    'To comply with insurance requirements'
  ],
  correctIndex: 1,
  explanation: 'Initiating therapy with a single agent allows for assessment of efficacy and tolerability. If side effects occur, the causative agent is easily identified. It also keeps the regimen simple for the patient.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'A patient on long-term steroid eye drops for uveitis develops elevated IOP. What is the most likely cause?',
  options: [
    'The uveitis is worsening.',
    'Corticosteroid-induced glaucoma.',
    'The patient has developed cataracts.',
    'Nonadherence to glaucoma medication.'
  ],
  correctIndex: 1,
  explanation: 'All administered forms of corticosteroids, especially ophthalmic preparations, can raise IOP, leading to corticosteroid-induced glaucoma.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'Which topical carbonic anhydrase inhibitor is typically dosed every 8 hours but might be effectively dosed every 12 hours if used with nasolacrimal occlusion?',
  options: [
    'Acetazolamide',
    'Dorzolamide',
    'Brinzolamide',
    'Both B and C'
  ],
  correctIndex: 3,
  explanation: 'Both dorzolamide and brinzolamide are dosed every 8 hours. However, nasolacrimal occlusion may allow for an every-12-hour dosing interval by increasing corneal contact time and reducing systemic drainage.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'A patient complains of a bitter taste in their mouth after using their eye drops. Which class of medication is most likely causing this?',
  options: [
    'Prostaglandin analogs',
    'β-blockers',
    'Carbonic anhydrase inhibitors',
    'α2-agonists'
  ],
  correctIndex: 2,
  explanation: 'Taste abnormalities (bitter or metallic taste) have been reported with topical carbonic anhydrase inhibitors (dorzolamide, brinzolamide) due to drainage via the nasolacrimal duct.',
  categories: {AppliedTherapeuticsCategory.lec4},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'When is the use of a fixed-combination product like dorzolamide-timolol (Cosopt) most appropriate?',
  options: [
    'As initial monotherapy for all patients',
    'When a patient requires more than one agent to control IOP',
    'Only for patients with angle-closure glaucoma',
    'For patients allergic to preservatives'
  ],
  correctIndex: 1,
  explanation: 'Fixed-combination products are useful when a patient requires more than one medication. They simplify the regimen (improving adherence), reduce preservative exposure, and prevent the washout effect that can occur when drops are instilled too close together.',
  categories: {AppliedTherapeuticsCategory.lec4},
),


  // ========== MCQ 1 ==========
  AppliedCaseItem(
    id: 1,
    question: 'What is the defining characteristic of Acute Kidney Injury (AKI)?',
    options: [
      'A slow, progressive decline in renal function over months',
      'An abrupt and often reversible decrease in renal function over hours to days',
      'Permanent structural damage to the glomeruli',
      'Exclusively caused by urinary tract obstruction'
    ],
    correctIndex: 1,
    explanation: 'AKI is characterized by an abrupt (and often reversible) decrease in renal function over a period of hours to days (or weeks).',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'According to the diagnostic criteria, which finding confirms AKI?',
    options: [
      'A single elevated serum creatinine level',
      'An increase in serum creatinine of at least 0.3 mg/dL within 48 hours',
      'A urine output of 1 mL/kg/hour for 4 hours',
      'A gradual rise in BUN over one month'
    ],
    correctIndex: 1,
    explanation: 'AKI is defined as an increase in serum creatinine (SCr) of at least 0.3 mg/dL within 48 hours, a 50% increase in baseline SCr within 7 days, or a urine output of less than 0.5 mL/kg/hour for at least 6 hours.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'Which category of AKI results from decreased renal perfusion with undamaged parenchymal tissue?',
    options: [
      'Intrinsic Renal',
      'Postrenal',
      'Prerenal',
      'Glomerular'
    ],
    correctIndex: 2,
    explanation: 'Prerenal AKI results from decreased renal perfusion in the setting of undamaged parenchymal tissue.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'Which of the following is a major risk factor for developing AKI?',
    options: [
      'Young age',
      'Preexisting Chronic Kidney Disease (CKD)',
      'High fluid intake',
      'Hypotension'
    ],
    correctIndex: 1,
    explanation: 'Preexisting CKD (eGFR less than 60 mL/minute/1.73 m2) is a significant risk factor for AKI.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'Which class of medications is commonly associated with drug-induced kidney injury?',
    options: [
      'Proton Pump Inhibitors (PPIs)',
      'Antihistamines',
      'Nonsteroidal Anti-inflammatory Drugs (NSAIDs)',
      'Beta-blockers'
    ],
    correctIndex: 2,
    explanation: 'Nephrotoxic agents include NSAIDs, COX-2 inhibitors, aminoglycosides, IV radiocontrast, ACEIs, and ARBs.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'What is the primary goal in managing a patient with AKI?',
    options: [
      'Immediately initiate renal replacement therapy',
      'Correct the underlying cause',
      'Administer high-dose diuretics',
      'Restrict all fluid intake'
    ],
    correctIndex: 1,
    explanation: 'The primary goal in the care of patients with AKI is correcting the underlying causes of AKI such as hypovolemia, nephrotoxic drugs, or ureter obstruction.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'Which diuretic class is considered first-line for managing volume overload in AKI?',
    options: [
      'Thiazide Diuretics',
      'Loop Diuretics',
      'Osmotic Diuretics (Mannitol)',
      'Potassium-Sparing Diuretics'
    ],
    correctIndex: 1,
    explanation: 'Loop diuretics are the diuretics of choice for managing volume overload in AKI.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'In a patient with AKI and severe hyperkalemia (K+ > 6.5 mmol/L), what is the initial treatment to stabilize the myocardium?',
    options: [
      'Intravenous Insulin and Glucose',
      'Sodium Polystyrene Sulfonate (Kayexalate)',
      'Intravenous Calcium',
      'Sodium Bicarbonate'
    ],
    correctIndex: 2,
    explanation: 'Administer calcium to stabilize the myocardium and prevent life-threatening arrhythmias. This is a temporizing measure while definitive potassium removal is arranged.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'What is a common electrolyte disturbance in AKI that is often asymptomatic and usually does not require therapy?',
    options: [
      'Hyperkalemia',
      'Hypocalcemia',
      'Hyperphosphatemia',
      'Hyponatremia'
    ],
    correctIndex: 1,
    explanation: 'Hypocalcemia is a common but asymptomatic finding in AKI and usually does not require therapy.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'For a patient with AKI, how should daily fluid intake generally be managed once initial resuscitation is complete?',
    options: [
      'Strictly restrict to 500 mL/day',
      'Match to urine output plus 500 mL per day',
      'Encourage high fluid intake to flush the kidneys',
      'Match exactly to urine output'
    ],
    correctIndex: 1,
    explanation: 'Once initial resuscitation has been performed, fluid intake should be matched to urine output plus 500 mL per day to cover insensible losses.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'Which of the following is an indication for Renal Replacement Therapy (RRT) in AKI?',
    options: [
      'Mild hyperkalemia (K+ = 5.5 mmol/L)',
      'Metabolic acidosis with pH < 7.2',
      'Asymptomatic hypocalcemia',
      'Stable uremia without complications'
    ],
    correctIndex: 1,
    explanation: 'Indications for RRT include severe metabolic acidosis (especially if pH < 7.2), severe hyperkalemia, fluid overload unresponsive to diuretics, and uremic complications.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'What is the suggested blood glucose target range for critically ill patients with AKI?',
    options: [
      '80-110 mg/dL',
      '110-149 mg/dL',
      '150-180 mg/dL',
      '>180 mg/dL'
    ],
    correctIndex: 1,
    explanation: 'Current KDIGO guidelines suggest moderate control of blood glucose to levels of 110 to 149 mg/dL with insulin therapy.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'Which thiazide diuretic is effective for diuresis even at low GFR (<20 mL/min) and is commonly used in combination with loop diuretics?',
    options: [
      'Hydrochlorothiazide',
      'Chlorthalidone',
      'Metolazone',
      'Indapamide'
    ],
    correctIndex: 2,
    explanation: 'Metolazone is commonly used with a loop diuretic because, unlike other thiazides, it produces effective diuresis at GFR less than 20 mL/min.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'In post-renal AKI, what is the cornerstone of management?',
    options: [
      'Administration of high-dose loop diuretics',
      'Relieving the obstruction',
      'Immediate initiation of RRT',
      'Fluid restriction'
    ],
    correctIndex: 1,
    explanation: 'In post-renal AKI, the obstruction should be relieved as soon as possible (e.g., via catheterization, stent, or nephrostomy).',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'Which of the following is a nonspecific symptom of uremia in AKI?',
    options: [
      'Bradycardia',
      'Hypertension',
      'Nausea and vomiting',
      'Polyuria'
    ],
    correctIndex: 2,
    explanation: 'Uremia can cause nonspecific symptoms such as nausea, vomiting, malaise, and altered sensorium.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Why are H2-receptor antagonists or PPIs recommended in patients with AKI?',
    options: [
      'To treat metabolic acidosis',
      'To improve renal blood flow',
      'To prevent gastrointestinal bleeding',
      'To enhance potassium excretion'
    ],
    correctIndex: 2,
    explanation: 'H2-receptor antagonists or PPIs should be given to prevent gastrointestinal bleeding, as patients with AKI are at increased risk.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'What hemodynamic support might be needed for a patient with prerenal AKI due to septic shock?',
    options: [
      'Beta-blockers',
      'Vasopressors (e.g., norepinephrine)',
      'Calcium channel blockers',
      'Antihypertensive agents'
    ],
    correctIndex: 1,
    explanation: 'In addition to fluids, vasopressors (i.e., norepinephrine, dopamine, vasopressin) may be needed in patients with septic shock to treat prerenal AKI.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'Which of the following is a characteristic of the recovery phase of AKI?',
    options: [
      'Progressive oliguria',
      'A gradual return of urine output and improvement in plasma biochemistry',
      'Worsening hyperkalemia',
      'Onset of anuria'
    ],
    correctIndex: 1,
    explanation: 'Recovery is heralded by a gradual return of urine output and a steady improvement in plasma biochemistry.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'Significant hyperphosphatemia in AKI is often managed with:',
    options: [
      'Intravenous calcium',
      'Oral phosphate binders',
      'Loop diuretics',
      'Sodium bicarbonate'
    ],
    correctIndex: 1,
    explanation: 'Significant hyperphosphatemia may occur but often can be managed with oral phosphate binders.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'In which patient population is the mortality rate from AKI highest?',
    options: [
      'Otherwise healthy young adults',
      'Patients with AKI associated with sepsis and multiple organ failure',
      'Patients with post-renal AKI from BPH',
      'Patients with mild prerenal AKI'
    ],
    correctIndex: 1,
    explanation: 'In AKI associated with sepsis and multiple organ failure, mortality is 50–70%.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'What is the recommended initial fluid of choice for volume resuscitation in hypovolemic AKI?',
    options: [
      'Colloids',
      'Hypertonic Saline',
      'Isotonic Crystalloids',
      'Dextrose in Water'
    ],
    correctIndex: 2,
    explanation: 'Evidence supports the use of isotonic crystalloids over colloids for volume resuscitation.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'Loop diuretics should be avoided in which scenario?',
    options: [
      'Volume overload with pulmonary edema',
      'Euvolemic or hypovolemic individuals to prevent AKI',
      'In combination with thiazides for diuretic resistance',
      'As a continuous infusion'
    ],
    correctIndex: 1,
    explanation: 'Loop diuretics should be reserved for the treatment of volume overload and should not be given to prevent AKI or hasten recovery of kidney function in euvolemic or hypovolemic individuals.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'Which finding on physical exam is suggestive of post-renal AKI?',
    options: [
      'Jugular Venous Distention (JVD)',
      'Bladder distention',
      'Rash',
      'Orthostatic hypotension'
    ],
    correctIndex: 1,
    explanation: 'A distended bladder is a physical examination finding associated with post-renal AKI due to bladder outlet obstruction.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'What is a potential consequence of excessive fluid administration in AKI?',
    options: [
      'Improved renal recovery',
      'Pulmonary edema',
      'Resolution of hyperkalemia',
      'Correction of metabolic acidosis'
    ],
    correctIndex: 1,
    explanation: 'Excessive administration of fluid should be avoided, since this can provoke pulmonary edema and worsen outcome in AKI.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'Which type of Renal Replacement Therapy (RRT) is suggested for hemodynamically unstable patients with AKI?',
    options: [
      'Intermittent Hemodialysis',
      'Peritoneal Dialysis',
      'Continuous RRT',
      'Sustained Low-Efficiency Dialysis (SLED)'
    ],
    correctIndex: 2,
    explanation: 'Current KDIGO guidelines suggest using continuous RRT over intermittent hemodialysis in hemodynamically unstable patients.',
    categories: {AppliedTherapeuticsCategory.lec5},
  ),

  // ========== CASE STUDY 1 ==========
AppliedCaseItem(
  id: 26,
  question: 'A 70-year-old man with a history of hypertension and CKD is admitted with community-acquired pneumonia and sepsis. His blood pressure is 85/50 mm Hg. Over 24 hours, his serum creatinine rises from a baseline of 1.5 mg/dL to 2.3 mg/dL, and he becomes oliguric. What is the most likely category of his AKI and the initial primary treatment?',
  options: [
    'Postrenal; insert a Foley catheter',
    'Intrinsic; start high-dose steroids',
    'Prerenal; administer IV fluids and vasopressors',
    'Prerenal; start a loop diuretic'
  ],
  correctIndex: 2,
  explanation: 'The scenario describes hypoperfusion (hypotension, sepsis) leading to a rapid rise in creatinine and oliguria, consistent with Prerenal AKI. The initial management is to correct the underlying cause: IV fluids for volume resuscitation and vasopressors to support blood pressure in septic shock.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A patient develops AKI after a course of IV gentamicin for a severe infection. Urinalysis shows granular casts. What is the most likely cause and the most important management step?',
  options: [
    'Prerenal AKI; administer IV fluids',
    'Acute Tubular Necrosis (Intrinsic); discontinue gentamicin',
    'Acute Interstitial Nephritis (Intrinsic); start corticosteroids',
    'Postrenal AKI; relieve obstruction'
  ],
  correctIndex: 1,
  explanation: 'Aminoglycosides like gentamicin are classic causes of Acute Tubular Necrosis (ATN), a form of Intrinsic AKI. Granular casts on urinalysis support ATN. The most critical step is to remove the offending agent (gentamicin).',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A patient with AKI is found to have a serum potassium level of 6.8 mmol/L with peaked T-waves on ECG. What is the correct sequence of initial management?',
  options: [
    'Administer sodium polystyrene sulfonate (Kayexalate) and monitor',
    'Administer IV calcium gluconate, then IV insulin and glucose',
    'Initiate hemodialysis immediately',
    'Administer IV sodium bicarbonate only'
  ],
  correctIndex: 1,
  explanation: 'For life-threatening hyperkalemia with ECG changes, the first step is to stabilize the myocardium with IV calcium. The next step is to shift potassium into cells with IV insulin and glucose. These are temporary measures while arranging definitive potassium removal (e.g., dialysis).',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A patient with AKI is fluid-overloaded, with pulmonary edema and oxygen saturation dropping to 88%. A bolus of IV furosemide has produced no diuresis. What is the most appropriate next step?',
  options: [
    'Administer a second, higher bolus of IV furosemide',
    'Start a continuous IV infusion of furosemide',
    'Initiate Renal Replacement Therapy (RRT)',
    'Administer metolazone orally'
  ],
  correctIndex: 2,
  explanation: 'This patient has life-threatening fluid overload (pulmonary edema) that is unresponsive to diuretics. This is a clear indication for urgent Renal Replacement Therapy (RRT) to remove fluid.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'An elderly man with benign prostatic hyperplasia (BPH) presents with anuria for 12 hours and a distended bladder. Serum creatinine is elevated from his baseline. What is the most likely diagnosis and immediate intervention?',
  options: [
    'Prerenal AKI; IV fluids',
    'Intrinsic AKI; kidney biopsy',
    'Postrenal AKI; urinary catheterization',
    'Prerenal AKI; vasopressors'
  ],
  correctIndex: 2,
  explanation: 'Anuria and a distended bladder in an elderly man with BPH are classic for Postrenal AKI due to bladder outlet obstruction. The immediate intervention is to relieve the obstruction via urinary catheterization.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A patient with diabetic ketoacidosis and AKI has a blood pH of 7.15. The medical team is considering Sodium Bicarbonate therapy. According to guidelines, when is IV sodium bicarbonate generally considered for acidosis in AKI?',
  options: [
    'For any pH below 7.4',
    'Only if pH is less than 7.0',
    'For severe hyperkalemia regardless of pH',
    'It is never recommended'
  ],
  correctIndex: 1,
  explanation: 'Consider administering sodium bicarbonate to correct acidosis if H+ is (pH < 7.0). For less severe acidosis, management typically focuses on treating the underlying cause.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'Which of the following medications should be discontinued in a patient with newly diagnosed AKI, especially if the cause is not yet clear?',
  options: [
    'Insulin',
    'Proton Pump Inhibitor (PPI)',
    'Lisiniopril (an ACE Inhibitor)',
    'Acetaminophen'
  ],
  correctIndex: 2,
  explanation: 'Vasoactive medications like ACE inhibitors (and ARBs, NSAIDs) can reduce renal perfusion and may prolong AKI. They should be discontinued during an acute episode.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'A patient with AKI is in the recovery phase and has a high urine output of 3-4 L/day. What is an important consideration for fluid management during this "diuretic phase"?',
  options: [
    'Restrict fluids to prevent overload',
    'Match fluid intake to the high urine output to prevent dehydration',
    'Administer diuretics to enhance recovery',
    'Ignore urine output, focus on serum creatinine'
  ],
  correctIndex: 1,
  explanation: 'During the diuretic phase of AKI recovery, patients are at risk of dehydration and electrolyte imbalances due to large urine outputs. Fluid intake should be matched to output (plus insensible losses) to maintain euvolemia.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'What is the primary role of N-acetylcysteine or ascorbic acid in the context of AKI?',
  options: [
    'To treat established ATN',
    'To prevent Contrast-Induced Nephropathy (CIN)',
    'To correct metabolic acidosis',
    'To act as a potassium binder'
  ],
  correctIndex: 1,
  explanation: 'Ascorbic acid and N-acetylcysteine are antioxidant options studied for the prevention of Contrast-Induced Nephropathy (CIN), though evidence for their efficacy is inconsistent.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'A patient with AKI has a hemoglobin of 7.5 g/dL but is asymptomatic, with no chest pain or shortness of breath. What is the most appropriate management for the anemia?',
  options: [
    'Transfuse packed red blood cells immediately',
    'Administer intravenous iron',
    'Start erythropoietin stimulating agents',
    'Typically, no treatment is required at this time'
  ],
  correctIndex: 3,
  explanation: 'Anemia in AKI typically does not require treatment unless it is severe, is symptomatic, or contributes to cardiac dysfunction. This asymptomatic patient likely does not require immediate intervention.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'Which strategy is recommended to overcome diuretic resistance in a fluid-overloaded patient with AKI who is not responding adequately to IV furosemide boluses?',
  options: [
    'Discontinue all diuretics',
    'Switch to a thiazide diuretic alone',
    'Use a continuous infusion of a loop diuretic or add a thiazide (e.g., metolazone)',
    'Double the bolus dose of furosemide'
  ],
  correctIndex: 2,
  explanation: 'Continuous infusions of loop diuretics appear to overcome diuretic resistance. Combination therapy with a thiazide diuretic (like metolazone, which works at a different nephron site) can be synergistic.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'What is the recommended nutritional approach for a hypercatabolic patient with AKI due to sepsis?',
  options: [
    'High-protein, high-calorie diet',
    'Protein restriction to reduce urea production',
    'Adequate energy and adequate (not high) protein intake',
    'Total parenteral nutrition with high potassium content'
  ],
  correctIndex: 2,
  explanation: 'Adequate nutritional support should be ensured with sufficient energy and adequate amounts of protein; high protein intake should be avoided. This is particularly important in hypercatabolic patients.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'A patient develops AKI after starting a new antibiotic. They also have a maculopapular rash and eosinophilia. What is the most likely cause and the key diagnostic finding on urinalysis?',
  options: [
    'Acute Tubular Necrosis; muddy brown casts',
    'Acute Interstitial Nephritis; white blood cell casts',
    'Prerenal AKI; hyaline casts',
    'Postrenal AKI; no specific casts'
  ],
  correctIndex: 1,
  explanation: 'The triad of AKI, rash, and eosinophilia following drug exposure is classic for Acute Interstitial Nephritis (AIN). Urinalysis may show white blood cell casts, eosinophiluria, and pyuria.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'Why are patients with AKI at substantial risk of infection?',
  options: [
    'They are always on broad-spectrum antibiotics',
    'Humoral and cellular immune mechanisms are depressed',
    'AKI causes fever directly',
    'They require frequent invasive procedures'
  ],
  correctIndex: 1,
  explanation: 'Patients with AKI are at substantial risk of intercurrent infection because humoral and cellular immune mechanisms are depressed.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'What is the significance of the "AEIOU" mnemonic in the context of AKI?',
  options: [
    'It lists the causes of AKI',
    'It outlines the steps for fluid resuscitation',
    'It summarizes the indications for Renal Replacement Therapy (RRT)',
    'It describes the symptoms of uremia'
  ],
  correctIndex: 2,
  explanation: 'The "AEIOU" mnemonic (Acidosis, Electrolytes, Intoxications, Overload, Uremia) is a helpful way to remember the common indications for initiating Renal Replacement Therapy in AKI.',
  categories: {AppliedTherapeuticsCategory.lec5},
),

  // ========== MCQ 1 ==========
  AppliedCaseItem(
    id: 1,
    question: 'What is the minimum duration required for abnormalities in kidney structure or function to be defined as Chronic Kidney Disease (CKD)?',
    options: [
      '1 week',
      '1 month',
      '3 months',
      '6 months'
    ],
    correctIndex: 2,
    explanation: 'CKD is defined as abnormalities in kidney structure or function, present for 3 months or longer.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 2 ==========
  AppliedCaseItem(
    id: 2,
    question: 'According to KDIGO 2012, which GFR category defines "Kidney Failure"?',
    options: [
      'G3a (45–59 mL/min/1.73 m²)',
      'G4 (15–29 mL/min/1.73 m²)',
      'G5 (<15 mL/min/1.73 m²)',
      'G2 (60–89 mL/min/1.73 m²)'
    ],
    correctIndex: 2,
    explanation: 'Stage G5, with a GFR of less than 15 mL/min/1.73 m², is classified as Kidney Failure.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 3 ==========
  AppliedCaseItem(
    id: 3,
    question: 'What is the most important marker for kidney damage in the diagnosis of CKD?',
    options: [
      'Elevated Serum Creatinine',
      'Hematuria',
      'Albuminuria',
      'Imaging Abnormalities'
    ],
    correctIndex: 2,
    explanation: 'The most important marker for kidney damage is Albuminuria. A urinary ACR of 30 mg/g or more is considered significant.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 4 ==========
  AppliedCaseItem(
    id: 4,
    question: 'Which of the following is NOT one of the three most common causes of CKD in the United States?',
    options: [
      'Diabetes Mellitus',
      'Hypertension',
      'Glomerulonephritis',
      'Polycystic Kidney Disease'
    ],
    correctIndex: 3,
    explanation: 'The three most common causes are diabetes mellitus, hypertension, and glomerulonephritis, accounting for about 82% of cases. Polycystic kidney disease is a less common cause.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 5 ==========
  AppliedCaseItem(
    id: 5,
    question: 'What is the primary pathophysiological mechanism that leads to anemia in CKD?',
    options: [
      'Iron deficiency due to poor diet',
      'Reduced renal production of erythropoietin',
      'Chronic blood loss',
      'Vitamin B12 deficiency'
    ],
    correctIndex: 1,
    explanation: 'Reduction in the number of functioning nephrons decreases renal production of erythropoietin, which is the primary cause of anemia in patients with CKD.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 6 ==========
  AppliedCaseItem(
    id: 6,
    question: 'What is the first-line pharmacologic therapy for reducing proteinuria in a patient with diabetic CKD and a uACR of 100 mg/g?',
    options: [
      'Dihydropyridine Calcium Channel Blocker',
      'ACE Inhibitor or ARB',
      'Thiazide Diuretic',
      'SGLT2 Inhibitor'
    ],
    correctIndex: 1,
    explanation: 'First-line therapy for patients with diabetic CKD should include an ACEI or ARB if the patient’s urine albumin excretion is in category A2 or greater (uACR between 30 and 300 mg/g).',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 7 ==========
  AppliedCaseItem(
    id: 7,
    question: 'According to guidelines, when should metformin be discontinued in a patient with CKD?',
    options: [
      'When eGFR is <60 mL/min/1.73 m²',
      'When eGFR is <45 mL/min/1.73 m²',
      'When eGFR is <30 mL/min/1.73 m²',
      'It is safe at all levels of renal function'
    ],
    correctIndex: 2,
    explanation: 'Discontinue metformin when eGFR <30 mL/min/1.73 m² due to an increased risk of lactic acidosis.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 8 ==========
  AppliedCaseItem(
    id: 8,
    question: 'What is the recommended hemoglobin (Hb) target range for anemia management in CKD patients?',
    options: [
      '9-10 g/dL',
      '11-12 g/dL',
      '13-14 g/dL',
      '>15 g/dL'
    ],
    correctIndex: 1,
    explanation: 'KDOQI guidelines suggest a Hb range of 11–12 g/dL for all CKD patients.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 9 ==========
  AppliedCaseItem(
    id: 9,
    question: 'Which of the following phosphate binders has the added benefit of reducing LDL cholesterol?',
    options: [
      'Calcium Carbonate',
      'Sevelamer',
      'Lanthanum',
      'Aluminum Hydroxide'
    ],
    correctIndex: 1,
    explanation: 'Sevelamer is a cationic polymer that has an added benefit of reducing LDL-C by up to 30% and increasing HDL-C levels.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 10 ==========
  AppliedCaseItem(
    id: 10,
    question: 'For which group of CKD patients is the initiation of statin therapy generally NOT recommended?',
    options: [
      'Patients with diabetes',
      'Patients aged 50 and older with CKD',
      'Patients already on dialysis',
      'Patients with a history of CVD'
    ],
    correctIndex: 2,
    explanation: 'Statins should not be initiated in patients on dialysis, unless they were receiving statins prior to starting dialysis.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 11 ==========
  AppliedCaseItem(
    id: 11,
    question: 'What is the primary mechanism of action of calcimimetics like Cinacalcet?',
    options: [
      'They bind dietary phosphate in the gut',
      'They act as active Vitamin D analogs',
      'They increase the sensitivity of the calcium-sensing receptor',
      'They directly stimulate erythropoiesis'
    ],
    correctIndex: 2,
    explanation: 'Calcimimetics reduce PTH secretion by increasing the sensitivity of the calcium-sensing receptor on the parathyroid gland.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 12 ==========
  AppliedCaseItem(
    id: 12,
    question: 'Which IV iron preparation is associated with the lowest risk of anaphylaxis?',
    options: [
      'Iron Dextran',
      'Ferric Gluconate',
      'Iron Sucrose',
      'Ferumoxytol'
    ],
    correctIndex: 2,
    explanation: 'The risk of anaphylaxis is highest with iron dextran and lowest with iron sucrose.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 13 ==========
  AppliedCaseItem(
    id: 13,
    question: 'What is the preferred route of administration for Erythropoiesis-Stimulating Agents (ESAs) in non-dialysis CKD patients?',
    options: [
      'Intravenous (IV)',
      'Subcutaneous (SC)',
      'Intramuscular (IM)',
      'Oral'
    ],
    correctIndex: 1,
    explanation: 'SC administration of ESA is the preferred route for all agents because it produces a more predictable and sustained response, and lower doses are generally needed.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 14 ==========
  AppliedCaseItem(
    id: 14,
    question: 'Which class of drugs is recommended to be added to an ACEI/ARB for a diabetic CKD patient with uncontrolled hypertension?',
    options: [
      'Thiazide Diuretic',
      'Dihydropyridine Calcium Channel Blocker',
      'Beta-Blocker',
      'Aldosterone Antagonist'
    ],
    correctIndex: 1,
    explanation: 'If blood pressure is not controlled with an ACEI/ARB, add a dihydropyridine CCB if the patient is diabetic.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 15 ==========
  AppliedCaseItem(
    id: 15,
    question: 'What is the target blood pressure for most patients with CKD according to the lecture?',
    options: [
      '< 140/90 mm Hg',
      '< 130/80 mm Hg',
      '< 120/80 mm Hg',
      '< 150/90 mm Hg'
    ],
    correctIndex: 1,
    explanation: 'The target blood pressure is < 130/80 mm Hg for all patients with CKD.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 16 ==========
  AppliedCaseItem(
    id: 16,
    question: 'Which of the following is a key non-pharmacologic recommendation for all CKD patients?',
    options: [
      'High-protein diet',
      'Low-sodium diet (<2g/day)',
      'Unrestricted potassium intake',
      'Bed rest'
    ],
    correctIndex: 1,
    explanation: 'General nonpharmacologic recommendations include following a low-sodium diet (less than 2 g per day) if hypertensive.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 17 ==========
  AppliedCaseItem(
    id: 17,
    question: 'At what Hemoglobin (Hb) level does KDIGO recommend considering initiation of an ESA?',
    options: [
      'Hb < 8 g/dL',
      'Hb < 10 g/dL',
      'Hb < 12 g/dL',
      'Hb < 14 g/dL'
    ],
    correctIndex: 1,
    explanation: 'The KDIGO guidelines recommend considering initiating ESAs when Hgb is less than 10 g/dL.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 18 ==========
  AppliedCaseItem(
    id: 18,
    question: 'Which phosphate binder is a first-line agent and also useful for patients with hypocalcemia?',
    options: [
      'Sevelamer',
      'Lanthanum',
      'Calcium Acetate',
      'Sucroferric Oxyhydroxide'
    ],
    correctIndex: 2,
    explanation: 'Oral calcium compounds (calcium carbonate, calcium acetate) are first-line agents and are particularly useful for patients with hypocalcemia.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 19 ==========
  AppliedCaseItem(
    id: 19,
    question: 'What is the recommended daily protein intake for a non-dialysis patient with a GFR less than 30 mL/min/1.73 m²?',
    options: [
      '0.4 g/kg/day',
      '0.8 g/kg/day',
      '1.2 g/kg/day',
      '1.5 g/kg/day'
    ],
    correctIndex: 1,
    explanation: 'KDIGO recommends an adequate protein intake of 0.8 g/kg/d in all nondialysis patients with CKD who have a GFR less than 30 mL/min/1.73 m².',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 20 ==========
  AppliedCaseItem(
    id: 20,
    question: 'Which of the following agents is used to treat metabolic acidosis in CKD?',
    options: [
      'Sodium Polystyrene Sulfonate',
      'Sodium Bicarbonate',
      'Fludrocortisone',
      'Acetazolamide'
    ],
    correctIndex: 1,
    explanation: 'Pharmacologic therapy of metabolic acidosis with sodium bicarbonate or citrate/citric acid preparations may be needed in patients with CKD.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 21 ==========
  AppliedCaseItem(
    id: 21,
    question: 'What is the most common adverse effect associated with Erythropoiesis-Stimulating Agents (ESAs)?',
    options: [
      'Hypotension',
      'Hyperkalemia',
      'Increased Blood Pressure',
      'Seizures'
    ],
    correctIndex: 2,
    explanation: 'The most common adverse effect seen with ESAs is increased blood pressure, which may require antihypertensive agents to control.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 22 ==========
  AppliedCaseItem(
    id: 22,
    question: 'Which vitamin D analog may be associated with less hypercalcemia and hyperphosphatemia?',
    options: [
      'Ergocalciferol',
      'Calcitriol',
      'Paricalcitol',
      'Cholecalciferol'
    ],
    correctIndex: 2,
    explanation: 'The newer vitamin D analogs paricalcitol and doxercalciferol may be associated with less hypercalcemia and hyperphosphatemia compared to calcitriol.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 23 ==========
  AppliedCaseItem(
    id: 23,
    question: 'For iron supplementation in a non-dialysis CKD patient, what is the first-line treatment?',
    options: [
      'Intravenous Iron Sucrose',
      'Oral Iron Supplements',
      'Iron Dextran IM injection',
      'Transfusion of Packed Red Blood Cells'
    ],
    correctIndex: 1,
    explanation: 'Oral iron supplements are generally the first-line treatment for iron supplementation for patients with CKD not receiving HD.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 24 ==========
  AppliedCaseItem(
    id: 24,
    question: 'Which class of diabetes medications has been shown to slow the progression of Diabetic CKD by reducing glomerular hyperfiltration?',
    options: [
      'Sulfonylureas',
      'DPP-4 Inhibitors',
      'SGLT2 Inhibitors',
      'GLP-1 Receptor Agonists'
    ],
    correctIndex: 2,
    explanation: 'Sodium glucose transport-2 inhibitors (SGLT-2) slow progression of DCKD by reducing glomerular hyperfiltration and glomerular hypertension.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),

  // ========== MCQ 25 ==========
  AppliedCaseItem(
    id: 25,
    question: 'What is the most effective management for severe hyperkalemia in a patient with CKD?',
    options: [
      'Loop Diuretics',
      'Sodium Polystyrene Sulfonate',
      'Hemodialysis',
      'IV Calcium Gluconate'
    ],
    correctIndex: 2,
    explanation: 'Severe hyperkalemia is most effectively managed by HD. Acute hyperkalemia can be managed medically until dialysis can be initiated.',
    categories: {AppliedTherapeuticsCategory.lec6},
  ),
// ========== CASE STUDY 1 ==========
AppliedCaseItem(
  id: 26,
  question: 'A 58-year-old patient with Type 2 Diabetes and hypertension has a persistent uACR of 250 mg/g and an eGFR of 55 mL/min/1.73 m². What is the most appropriate first-line pharmacotherapy to slow CKD progression?',
  options: [
    'Start a Dihydropyridine CCB (e.g., Amlodipine)',
    'Start an ACE Inhibitor or ARB',
    'Start Metformin',
    'Start a Thiazide Diuretic'
  ],
  correctIndex: 1,
  explanation: 'For a patient with diabetic CKD and albuminuria (uACR in category A2 or A3), first-line therapy should include an ACEI or ARB to reduce proteinuria and slow progression.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 2 ==========
AppliedCaseItem(
  id: 27,
  question: 'A patient with CKD Stage G4 (eGFR 18 mL/min/1.73 m²) has a hemoglobin of 9.5 g/dL, ferritin 350 ng/mL, and TSat 18%. According to KDIGO, what is the next best step in managing their anemia?',
  options: [
    'Initiate an ESA immediately',
    'Transfuse packed red blood cells',
    'Start oral iron supplementation',
    'Start IV iron supplementation'
  ],
  correctIndex: 2,
  explanation: 'The patient meets criteria for iron deficiency (TSat <30%, ferritin <500 ng/mL). For a non-dialysis patient, oral iron is first-line. An ESA could be considered as the Hb is <10 g/dL, but correcting iron stores is a priority.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 3 ==========
AppliedCaseItem(
  id: 28,
  question: 'A dialysis patient has persistent hyperphosphatemia despite dietary restrictions. They are on calcium acetate but have developed hypercalcemia. What is the most appropriate change to their phosphate binder regimen?',
  options: [
    'Increase the dose of calcium acetate',
    'Switch to a non-calcium containing binder like sevelamer',
    'Add aluminum hydroxide',
    'Discontinue all phosphate binders'
  ],
  correctIndex: 1,
  explanation: 'If hypercalcemia develops, a non-calcium containing phosphate binder, such as sevelamer or lanthanum, should be used.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 4 ==========
AppliedCaseItem(
  id: 29,
  question: 'A 65-year-old man with CKD Stage G3b (eGFR 35 mL/min/1.73 m²) and no history of CVD has an LDL-C of 130 mg/dL. What is the recommended management for his hyperlipidemia?',
  options: [
    'No statin therapy is indicated',
    'Initiate a high-intensity statin',
    'Initiate ezetimibe only',
    'Recommend dietary changes only'
  ],
  correctIndex: 1,
  explanation: 'KDIGO recommends statins for all patients with nondialysis-dependent CKD aged 50 years and older, regardless of GFR category.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 5 ==========
AppliedCaseItem(
  id: 30,
  question: 'A patient with CKD Stage G5 (eGFR 12 mL/min/1.73 m²) has severe secondary hyperparathyroidism with PTH levels consistently above 800 pg/mL. Serum calcium is normal, and phosphorus is elevated. They are already on sevelamer. What additional pharmacologic therapy is most appropriate?',
  options: [
    'Start oral calcitriol',
    'Start Cinacalcet',
    'Start Cholecalciferol',
    'Start Paricalcitol'
  ],
  correctIndex: 1,
  explanation: 'For severe and progressive hyperparathyroidism in advanced CKD/dialysis patients, a calcimimetic like Cinacalcet is indicated. Vitamin D analogs would be less suitable here due to the existing hyperphosphatemia, as they can increase phosphorus absorption.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 6 ==========
AppliedCaseItem(
  id: 31,
  question: 'A patient with CKD and metabolic acidosis (serum bicarbonate 18 mEq/L) is asymptomatic. What is the appropriate pharmacologic treatment?',
  options: [
    'Sodium Bicarbonate',
    'Sodium Polystyrene Sulfonate',
    'Acetazolamide',
    'No treatment is needed'
  ],
  correctIndex: 0,
  explanation: 'Pharmacologic therapy of metabolic acidosis with sodium bicarbonate may be needed in patients with CKD G3 or higher to replenish body stores of bicarbonate and slow CKD progression.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 7 ==========
AppliedCaseItem(
  id: 32,
  question: 'Which patient should have their metformin therapy reviewed for potential discontinuation?',
  options: [
    'A patient with Type 2 DM and an eGFR of 55 mL/min/1.73 m²',
    'A patient with Type 2 DM and an eGFR of 28 mL/min/1.73 m²',
    'A patient with Type 2 DM and an eGFR of 65 mL/min/1.73 m²',
    'A patient with Type 2 DM and normal renal function'
  ],
  correctIndex: 1,
  explanation: 'Metformin should be discontinued when eGFR is <30 mL/min/1.73 m² due to the increased risk of lactic acidosis.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 8 ==========
AppliedCaseItem(
  id: 33,
  question: 'A non-dialysis CKD patient with anemia has a Hgb of 10.8 g/dL after 3 months of oral iron therapy. Their ferritin is now 450 ng/mL and TSat is 32%. What is the next step?',
  options: [
    'Continue oral iron alone',
    'Switch to IV iron',
    'Initiate an ESA',
    'No further action is needed; target has been met'
  ],
  correctIndex: 3,
  explanation: 'The patient\'s iron stores are now replete (ferritin >100, TSat >20), and their Hgb is within the target range of 11-12 g/dL. No further intervention is required at this time.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 9 ==========
AppliedCaseItem(
  id: 34,
  question: 'What is the primary reason for avoiding aluminum-containing phosphate binders for long-term use in CKD?',
  options: [
    'They are ineffective',
    'They cause severe diarrhea',
    'Risk of aluminum accumulation and toxicity',
    'They are too expensive'
  ],
  correctIndex: 2,
  explanation: 'Aluminum-containing phosphate-binding agents are not recommended for chronic use in patients with CKD to avoid aluminum accumulation, which can lead to bone disease and encephalopathy.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 10 ==========
AppliedCaseItem(
  id: 35,
  question: 'A patient with CKD Stage G4 and hypertension is already on lisinopril (ACEI) and amlodipine (CCB). Their BP is 135/85 mm Hg. What would be an appropriate next step?',
  options: [
    'Add an aldosterone antagonist',
    'Add a thiazide diuretic (e.g., chlorthalidone)',
    'Increase the dose of lisinopril',
    'Switch amlodipine to a beta-blocker'
  ],
  correctIndex: 1,
  explanation: 'For a non-diabetic CKD patient with uncontrolled hypertension on an ACEI and CCB, the next step is to add a thiazide diuretic, especially if volume overload is suspected.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 11 ==========
AppliedCaseItem(
  id: 36,
  question: 'Which iron-based phosphate binder offers the potential advantage of improving iron stores?',
  options: [
    'Sucroferric Oxyhydroxide',
    'Ferric Citrate',
    'Lanthanum Carbonate',
    'Sevelamer Carbonate'
  ],
  correctIndex: 1,
  explanation: 'Ferric citrate offers the potential advantage of increasing iron indices (TSat and ferritin) while lowering IV iron and ESA use.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 12 ==========
AppliedCaseItem(
  id: 37,
  question: 'What is the main caution associated with using aldosterone antagonists for proteinuria reduction in CKD?',
  options: [
    'They cause hypoglycemia',
    'They double the risk of hyperkalemia',
    'They cause significant hypotension',
    'They reduce bone density'
  ],
  correctIndex: 1,
  explanation: 'Aldosterone antagonists significantly reduced proteinuria and blood pressure, but doubled the risk of hyperkalemia, requiring careful monitoring.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 13 ==========
AppliedCaseItem(
  id: 38,
  question: 'For a patient on hemodialysis, which ESA allows for less frequent dosing due to its prolonged half-life?',
  options: [
    'Epoetin Alfa',
    'Darbepoetin Alfa',
    'They all have the same dosing frequency',
    'None of the above'
  ],
  correctIndex: 1,
  explanation: 'The prolonged half-lives of darbepoetin alfa and methoxy PEG-epoetin beta allow for less frequent dosing compared to epoetin alfa.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 14 ==========
AppliedCaseItem(
  id: 39,
  question: 'A patient with CKD has a serum potassium level of 5.8 mmol/L. They are on lisinopril and spironolactone. What is the most appropriate initial action?',
  options: [
    'Administer IV calcium gluconate',
    'Initiate hemodialysis immediately',
    'Discontinue spironolactone',
    'Administer sodium polystyrene sulfonate'
  ],
  correctIndex: 2,
  explanation: 'The first step in managing mild-moderate hyperkalemia is to review and discontinue any offending medications. Spironolactone (an aldosterone antagonist) and lisinopril (an ACEI) are common culprits.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

// ========== CASE STUDY 15 ==========
AppliedCaseItem(
  id: 40,
  question: 'What is the primary goal of CKD management?',
  options: [
    'Cure the underlying kidney disease',
    'Immediately initiate dialysis',
    'Slow progression, prevent complications and cardiovascular events',
    'Focus solely on blood pressure control'
  ],
  correctIndex: 2,
  explanation: 'The primary goal is to slow and prevent the progression of CKD and to prevent a cardiovascular event, CKD complications, and the need for kidney replacement therapy.',
  categories: {AppliedTherapeuticsCategory.lec6},
),

];













