% ============================================
% CLASS DEFINITIONS
% ============================================
class(disease).
class(infectiousDisease).
class(chronicDisease).
class(symptom).
class(drug).
class(antibiotic).
class(painkiller).
class(treatment).
class(patient).
class(doctor).

% Class hierarchy (subclass relations)
subclass(infectiousDisease, disease).
subclass(chronicDisease, disease).
subclass(antibiotic, drug).
subclass(painkiller, drug).

% ============================================
% PROPERTY DEFINITIONS
% ============================================
objectProperty(hasSymptom).
objectProperty(treatedBy).
objectProperty(prescribes).
objectProperty(takesMedication).
objectProperty(diagnoseWith).
objectProperty(contraindicatedWith).
objectProperty(hasSideEffect).

dataProperty(hasAge).
dataProperty(hasDosage).
dataProperty(hasSeverity).

% ============================================
% INSTANCES - DISEASES
% ============================================
disease(diabetes).
disease(influenza).
disease(hypertension).
disease(asthma).
disease(covid19).

chronicDisease(diabetes).
chronicDisease(hypertension).
chronicDisease(asthma).

infectiousDisease(influenza).
infectiousDisease(covid19).

% ============================================
% INSTANCES - SYMPTOMS
% ============================================
symptom(fever).
symptom(cough).
symptom(fatigue).
symptom(headache).
symptom(highBloodSugar).
symptom(shortnessOfBreath).
symptom(chestPain).

% ============================================
% INSTANCES - DRUGS
% ============================================
drug(metformin).
drug(insulin).
drug(aspirin).
drug(ibuprofen).
drug(amoxicillin).
drug(oseltamivir).
drug(lisinopril).

antibiotic(amoxicillin).
painkiller(aspirin).
painkiller(ibuprofen).

% ============================================
% INSTANCES - PATIENTS
% ============================================
patient(john_smith).
patient(mary_johnson).
patient(david_lee).
patient(sarah_wilson).

% ============================================
% DATA PROPERTIES
% ============================================
hasAge(john_smith, 45).
hasAge(mary_johnson, 62).
hasAge(david_lee, 28).
hasAge(sarah_wilson, 35).

hasDosage(metformin, "500mg twice daily").
hasDosage(insulin, "10 units before meals").
hasDosage(aspirin, "81mg daily").

% ============================================
% OBJECT PROPERTIES - Disease to Symptom
% ============================================
hasSymptom(diabetes, highBloodSugar).
hasSymptom(diabetes, fatigue).
hasSymptom(influenza, fever).
hasSymptom(influenza, cough).
hasSymptom(influenza, fatigue).
hasSymptom(hypertension, headache).
hasSymptom(asthma, shortnessOfBreath).
hasSymptom(asthma, cough).
hasSymptom(covid19, fever).
hasSymptom(covid19, cough).
hasSymptom(covid19, fatigue).
hasSymptom(covid19, shortnessOfBreath).

% ============================================
% OBJECT PROPERTIES - Disease Treatment
% ============================================
treatedBy(diabetes, metformin).
treatedBy(diabetes, insulin).
treatedBy(influenza, oseltamivir).
treatedBy(hypertension, lisinopril).
treatedBy(asthma, albuterol).

% ============================================
% OBJECT PROPERTIES - Patient Diagnosis
% ============================================
diagnoseWith(john_smith, diabetes).
diagnoseWith(john_smith, hypertension).
diagnoseWith(mary_johnson, diabetes).
diagnoseWith(david_lee, influenza).
diagnoseWith(sarah_wilson, asthma).

% ============================================
% OBJECT PROPERTIES - Patient Medication
% ============================================
takesMedication(john_smith, metformin).
takesMedication(john_smith, lisinopril).
takesMedication(mary_johnson, insulin).
takesMedication(david_lee, oseltamivir).

% ============================================
% DRUG CONTRAINDICATIONS
% ============================================
contraindicatedWith(aspirin, ibuprofen).
contraindicatedWith(metformin, alcohol).

% ============================================
% SIDE EFFECTS
% ============================================
hasSideEffect(metformin, nausea).
hasSideEffect(insulin, lowBloodSugar).
hasSideEffect(aspirin, stomachPain).