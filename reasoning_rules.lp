% =========================================================
% HEALTHCARE KNOWLEDGE REASONING RULES (ASP)
% =========================================================
% This file supports UI queries:
% symptoms, treatments, age, risk, severe,
% diagnosis, unsafe, untreated
% Updated to match healthcare_kb.lp camelCase predicates
% =========================================================

% ---------------------------------------------------------
% BASIC CLASS INFERENCE
% ---------------------------------------------------------
treatment(X) :- drug(X).
treatment(X) :- medication(X).
treatment(X) :- therapy(X).

disease(X) :- chronicDisease(X).
disease(X) :- infectiousDisease(X).

% ---------------------------------------------------------
% SYMPTOMS OF A PATIENT
% ---------------------------------------------------------
patienthassymptom(P, S) :-
    diagnoseWith(P, D),
    hasSymptom(D, S).

% ---------------------------------------------------------
% RECOMMENDED TREATMENTS
% ---------------------------------------------------------
recommendtreatment(P, T) :-
    diagnoseWith(P, D),
    treatedBy(D, T).

% ---------------------------------------------------------
% PATIENT AGE (DIRECT FACT)
% ---------------------------------------------------------
showage(P, A) :-
    hasAge(P, A).

% ---------------------------------------------------------
% HIGH-RISK REASONING
% ---------------------------------------------------------
% Risk due to age
riskreason(P, age) :-
    hasAge(P, A),
    A > 60.

% Risk due to chronic disease
riskreason(P, chronic) :-
    diagnoseWith(P, D),
    chronicDisease(D).

% Overall high-risk patient
highriskpatient(P) :-
    riskreason(P, _).

% ---------------------------------------------------------
% SEVERE PATIENT REASONING
% ---------------------------------------------------------
% Define severe symptoms
severesymptom(shortnessOfBreath).
severesymptom(highBloodSugar).
severesymptom(chestPain).

severepatient(P) :-
    diagnoseWith(P, D),
    hasSymptom(D, S),
    severesymptom(S).

% ---------------------------------------------------------
% POSSIBLE DIAGNOSIS (SYMPTOM MATCHING)
% ---------------------------------------------------------
possiblediagnosis(P, D) :-
    patient(P),
    disease(D),
    patienthassymptom(P, S),
    hasSymptom(D, S).

% ---------------------------------------------------------
% UNSAFE MEDICATION COMBINATIONS
% ---------------------------------------------------------
unsafeMedication(P, M1, M2) :-
    takesMedication(P, M1),
    takesMedication(P, M2),
    contraindicatedWith(M1, M2),
    M1 != M2.

% ---------------------------------------------------------
% UNTREATED DISEASE
% ---------------------------------------------------------
untreatedPatient(P, D) :-
    diagnoseWith(P, D),
    not recommendtreatment(P, _),
    not takesMedication(P, _).

% ---------------------------------------------------------
% SHOW DIRECTIVES (ONLY WHAT UI NEEDS)
% ---------------------------------------------------------
#show patienthassymptom/2.
#show recommendtreatment/2.
#show showage/2.
#show highriskpatient/1.
#show riskreason/2.
#show severepatient/1.
#show possiblediagnosis/2.
#show unsafeMedication/3.
#show untreatedPatient/2.




