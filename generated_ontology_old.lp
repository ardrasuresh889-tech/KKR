% AUTO-GENERATED ASP FROM RDF

class(antibiotic).
class(antiviral).
class(chronicdisease).
class(disease).
class(doctor).
class(drug).
class(geneticdisease).
class(infectiousdisease).
class(medication).
class(painkiller).
class(patient).
class(physicalsymptom).
class(psychologicalsymptom).
class(surgery).
class(symptom).
class(therapy).
class(treatment).

antibiotic(amoxicillin).
psychologicalsymptom(anxiety).
psychologicalsymptom(depression).
psychologicalsymptom(irritability).
psychologicalsymptom(moodswings).
psychologicalsymptom(panicattacks).
therapy(arttherapy).
therapy(dialecticalbehaviortherapy).
therapy(physicaltherapy).
therapy(psychodynamictherapy).
therapy(speechtherapy).
painkiller(aspirin).
painkiller(ibuprofen).
chronicdisease(asthma).
chronicdisease(diabetes).
chronicdisease(hypertension).
chronicdisease(migraine).
medication(atorvastatin).
medication(diazepam).
medication(sertraline).
infectiousdisease(covid_19).
infectiousdisease(influenza).
infectiousdisease(pneumonia).
infectiousdisease(tuberculosis).
surgery(cataractsurgery).
surgery(cesareansection).
surgery(heartbypasssurgery).
surgery(kneereplacement).
surgery(tonsillectomy).
physicalsymptom(cough).
physicalsymptom(fatigue).
physicalsymptom(fever).
physicalsymptom(headache).
physicalsymptom(highbloodsugar).
physicalsymptom(nausea).
physicalsymptom(shortnessofbreath).
geneticdisease(cysticfibrosis).
geneticdisease(hemophilia).
geneticdisease(huntingtondisease).
geneticdisease(sicklecellanemia).
patient(david_lee).
patient(john_smith).
patient(mariya_sam).
patient(mary_johnson).
doctor(dr.alex).
doctor(dr.clara).
doctor(dr.smith).
doctor(dr.susan).
drug(insulin).
drug(lisinopril).
drug(metformin).
drug(paracetamol).
antiviral(oseltamivir).

range(hasdosage, string).
comment(sicklecellanemia, Blood disorder).
onproperty(nc7a2f94931ef4491806719fb6306c280, symptom).
domain(hasage, n519a25ecd4e142edbdb0e10d8d597a2f).
comment(cataractsurgery, Eye lens replacement).
comment(hassideeffect, Drug causes side effect).
somevaluesfrom(nbfec1e9138924590b193f42035b368cf, rational).
comment(hasseverity, Severity level).
comment(paracetamol, Fever / pain).
ondatarange(n5ccb80c0a90b4f2a9bb221338bedd06a, rational).
prescribes(paracetamol, paracetamol).
somevaluesfrom(nfed2e02537774386a3ff96ae9c043cd4, rational).
domain(hasname, thing).
prescribes(dr.alex, amoxicillin).
comment(moodswings, Rapid emotional changes).
somevaluesfrom(n60402b9a8e3044739f031653cee2a8db, rational).
comment(diazepam, Anxiety).
comment(heartbypasssurgery, Coronary artery bypass).
rest(n6b6082f6273747a9ab2cc137cb8cc20c, n8a12e06b040e4c5c963c96c520e6314c).
treatedby(diabetes, metformin).
ondatarange(nc3ef6af3fe0a4da3882c012ddb47e3aa, rational).
somevaluesfrom(nc7a2f94931ef4491806719fb6306c280, rational).
hassymptom(john_smith, cough).
domain(hassymptom, nf509e6ec5e1d4c06894ee14e26bc1b52).
somevaluesfrom(n91b58c32bfe144d6a20658154ee4f2fe, rational).
onproperty(n568a3bed56c1424fa854eb3171bff863, treatment).
domain(takesmedication, nf033abc0eae148c890e9e60c0160a6f1).
comment(irritability, Easily annoyed or angered).
comment(atorvastatin, Cholesterol).
comment(speechtherapy, Communication therapy).
hasage(dr.alex, 65).
minqualifiedcardinality(nc3ef6af3fe0a4da3882c012ddb47e3aa, 1).
domain(requires, n568a3bed56c1424fa854eb3171bff863).
somevaluesfrom(nf033abc0eae148c890e9e60c0160a6f1, rational).
domain(hassideeffect, nfed2e02537774386a3ff96ae9c043cd4).
comment(requires, Treatment requires drug).
minqualifiedcardinality(n5ccb80c0a90b4f2a9bb221338bedd06a, 1).
range(treatedby, n852bf1c83e9845da99887a825912e9d2).
hasage(mary_johnson, 62).
onproperty(n320de68ab8a243f487abf027aced5b1e, drug).
onproperty(n5e69d0b876a7468f9c45d483578d7049, drug).
hasage(david_lee, 28).
hasage(paracetamol, 33).
onproperty(n9f6be47936f5423a9e57112b713d4fa4, disease).
comment(lisinopril, Drug for Hypertension).
somevaluesfrom(n568a3bed56c1424fa854eb3171bff863, rational).
takesmedication(john_smith, metformin).
comment(kneereplacement, Joint replacement).
comment(contraindicatedwith, Drug conflicts with another drug).
comment(depression, Persistent low mood).
range(hasname, string).
comment(metformin, Drug for Diabetes).
somevaluesfrom(ned62114981844c14b7cc964a6462c884, rational).
rest(nf2ef2d43b52143388e73bb9454b9a033, n6b6082f6273747a9ab2cc137cb8cc20c).
equivalentclass(symptom, nc3ef6af3fe0a4da3882c012ddb47e3aa).
comment(hasage, Patient's age).
members(n08a1072f8ad24407a9d457e16ec45448, nf2ef2d43b52143388e73bb9454b9a033).
onproperty(nf033abc0eae148c890e9e60c0160a6f1, patient).
onproperty(n91b58c32bfe144d6a20658154ee4f2fe, symptom).
comment(tonsillectomy, Removal of tonsils).
onproperty(n4f4d89114c544a7180d222442a8af3f7, patient).
range(takesmedication, n5bf7992ec6d148719f44ce6625115d4a).
comment(sertraline, Depression / anxiety).
first(n6b6082f6273747a9ab2cc137cb8cc20c, drug).
comment(panicattacks, Sudden episodes of fear).
range(diagnosewith, n9f6be47936f5423a9e57112b713d4fa4).
comment(huntingtondisease, Neurodegenerative).
onproperty(n30a0326642b349169235418299845e2b, drug).
onproperty(n60402b9a8e3044739f031653cee2a8db, doctor).
range(prescribes, n320de68ab8a243f487abf027aced5b1e).
comment(cysticfibrosis, Inherited disorder).
diagnosewith(john_smith, diabetes).
hassymptom(diabetes, highbloodsugar).
comment(treatedby, Disease is treated by treatment).
hasage(migraine, 34).
somevaluesfrom(n320de68ab8a243f487abf027aced5b1e, rational).
somevaluesfrom(n852bf1c83e9845da99887a825912e9d2, rational).
hasage(mariya_sam, 34).
somevaluesfrom(n5e69d0b876a7468f9c45d483578d7049, rational).
onproperty(n852bf1c83e9845da99887a825912e9d2, treatment).
onproperty(n5ccb80c0a90b4f2a9bb221338bedd06a, topdataproperty).
comment(insulin, Drug for Diabetes).
comment(hassymptom, Disease manifests symptoms).
range(hasseverity, string).
somevaluesfrom(n4f4d89114c544a7180d222442a8af3f7, rational).
comment(hasname, Name of entity).
hasage(depression, 54).
comment(physicaltherapy, Rehabilitation).
comment(hemophilia, Blood clotting disorder).
onproperty(nc3ef6af3fe0a4da3882c012ddb47e3aa, topdataproperty).
hassymptom(asthma, asthma).
comment(dialecticalbehaviortherapy, Emotional regulation).
range(requires, ned62114981844c14b7cc964a6462c884).
first(nf2ef2d43b52143388e73bb9454b9a033, disease).
somevaluesfrom(n9f6be47936f5423a9e57112b713d4fa4, rational).
onproperty(nf509e6ec5e1d4c06894ee14e26bc1b52, disease).
range(hassymptom, ne3d7af04e17e4042b4f42c78d18b9a7d).
rest(n8a12e06b040e4c5c963c96c520e6314c, nil).
comment(takesmedication, Patient takes medication).
onproperty(ndd65a3ffc3874a94addd5b3aab7c9fef, drug).
domain(prescribes, n60402b9a8e3044739f031653cee2a8db).
hassideeffect(depression, depression).
somevaluesfrom(n30a0326642b349169235418299845e2b, rational).
onproperty(nfed2e02537774386a3ff96ae9c043cd4, drug).
hasage(john_smith, 45).
equivalentclass(treatment, n5ccb80c0a90b4f2a9bb221338bedd06a).
comment(prescribes, Doctor prescribes drug).
domain(treatedby, nbfec1e9138924590b193f42035b368cf).
diagnosewith(migraine, migraine).
comment(cesareansection, Surgical childbirth).
range(hassideeffect, n91b58c32bfe144d6a20658154ee4f2fe).
domain(diagnosewith, n4f4d89114c544a7180d222442a8af3f7).
somevaluesfrom(ne3d7af04e17e4042b4f42c78d18b9a7d, rational).
comment(psychodynamictherapy, Insight-oriented therapy).
domain(hasdosage, n30a0326642b349169235418299845e2b).
onproperty(n5bf7992ec6d148719f44ce6625115d4a, drug).
somevaluesfrom(nf509e6ec5e1d4c06894ee14e26bc1b52, rational).
comment(diagnosewith, Patient diagnosed with disease).
domain(contraindicatedwith, n5e69d0b876a7468f9c45d483578d7049).
range(hasage, integer).
somevaluesfrom(ndd65a3ffc3874a94addd5b3aab7c9fef, rational).
comment(hasdosage, Drug dosage).
onproperty(n519a25ecd4e142edbdb0e10d8d597a2f, patient).
somevaluesfrom(n5bf7992ec6d148719f44ce6625115d4a, rational).
domain(hasseverity, nc7a2f94931ef4491806719fb6306c280).
first(n8a12e06b040e4c5c963c96c520e6314c, symptom).
onproperty(ne3d7af04e17e4042b4f42c78d18b9a7d, symptom).
onproperty(ned62114981844c14b7cc964a6462c884, drug).
range(contraindicatedwith, ndd65a3ffc3874a94addd5b3aab7c9fef).
comment(arttherapy, Expressive therapy).
onproperty(nbfec1e9138924590b193f42035b368cf, disease).
diagnosewith(tuberculosis, pneumonia).
somevaluesfrom(n519a25ecd4e142edbdb0e10d8d597a2f, rational).
