% ---------- CLASSES ----------
chronicdisease(asthma).
chronicdisease(diabetes).
chronicdisease(hypertension).

infectiousdisease(covid_19).
infectiousdisease(influenza).

patient(john_smith).
patient(david_lee).
patient(mary_johnson).
% ---- Medical facts for Mary Johnson ----
diagnosewith(mary_johnson, hypertension).
hassymptom(hypertension, headache).
hassymptom(hypertension, fatigue).
treatedby(hypertension, lisinopril).
takesmedication(mary_johnson, lisinopril).
diagnosewith(john_smith, diabetes).
hassymptom(diabetes, highbloodsugar).
treatedby(diabetes, metformin).
diagnosewith(john_smith, diabetes).
hassymptom(diabetes, highbloodsugar).
treatedby(diabetes, metformin).
diagnosewith(john_smith, diabetes).
hassymptom(diabetes, highbloodsugar).
treatedby(diabetes, metformin).

patient(mary_johnson).
hasage(mary_johnson, 62).
diagnosewith(mary_johnson, hypertension).
hassymptom(hypertension, headache).
hassymptom(hypertension, fatigue).
treatedby(hypertension, lisinopril).
chronicdisease(hypertension).

takesmedication(john_smith, aspirin).
takesmedication(john_smith, ibuprofen).
contraindicatedwith(aspirin, ibuprofen).

% ---------- ATTRIBUTES ----------
hasage(john_smith, 45).
hasage(david_lee, 28).
hasage(mary_johnson, 62).

% ---------- SYMPTOMS ----------
physicalsymptom(highbloodsugar).
physicalsymptom(shortnessofbreath).

hassymptom(diabetes, highbloodsugar).

% ---------- DIAGNOSIS ----------
diagnosewith(john_smith, diabetes).

% ---------- TREATMENT ----------
medication(metformin).
treatedby(diabetes, metformin).
takesmedication(john_smith, metformin).

% ---------- SEVERITY ----------
severesymptom(highbloodsugar).
