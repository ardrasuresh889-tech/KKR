from flask import Flask, render_template, request, redirect, url_for
import subprocess
import json
import os

# -------------------------------------------------
# CONFIG
# -------------------------------------------------
import clingo

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
ONTOLOGY_FILE = os.path.join(BASE_DIR, "healthcare_kb.lp")
RULES_FILE = os.path.join(BASE_DIR, "reasoning_rules.lp")

def run_clingo_solver():
    """Run clingo using Python API and return list of atoms"""
    ctl = clingo.Control()
    ctl.load(ONTOLOGY_FILE)
    ctl.load(RULES_FILE)
    ctl.ground([("base", [])])
    
    atoms = []
    def on_model(model):
        for atom in model.symbols(shown=True):
            atoms.append(str(atom))
    
    ctl.solve(on_model=on_model)
    return atoms

app = Flask(__name__)

# -------------------------------------------------
# NORMALIZATION HELPERS
# -------------------------------------------------
def canonical_patient(s):
    if not s:
        return ""
    return "_".join(s.strip().lower().split())

def canonical_query(s):
    if not s:
        return ""
    s = s.lower().strip()
    s = s.replace("patient ", "").replace("recommended ", "").replace("-", " ")
    s = "_".join(s.split())

    mapping = {
        "symptom": "symptoms",
        "patient_symptoms": "symptoms",

        "recommended_treatments": "treatments",
        "treatment": "treatments",

        "high_risk_patient": "risk",
        "highrisk": "risk",

        "possible_diagnosis": "diagnosis",
        "diagnosis": "diagnosis",

        "severe_patient": "severe",
        "severity": "severe",

        "unsafe_medication": "unsafe",
        "drug_conflict": "unsafe",

        "untreated_disease": "untreated",
        "untreated_patient": "untreated",

        "patient_age": "age",
    }
    return mapping.get(s, s)

# -------------------------------------------------
# ASP ATOM PARSING
# -------------------------------------------------
def parse_atom(atom):
    if "(" not in atom or not atom.endswith(")"):
        return atom, []
    pred, rest = atom.split("(", 1)
    args = rest[:-1].split(",")
    return pred.strip(), [a.strip() for a in args]

def prettify(atom):
    if atom.startswith("patienthassymptom"):
        p, s = atom.split("(")[1][:-1].split(",")
        return f"{p.replace('_',' ').title()} has symptom: {s.replace('_',' ').title()}"

    if atom.startswith("recommendtreatment"):
        p, t = atom.split("(")[1][:-1].split(",")
        return f"Recommended treatment for {p.replace('_',' ').title()}: {t.replace('_',' ').title()}"

    if atom.startswith("riskreason"):
        p, r = atom.split("(")[1][:-1].split(",")
        return f"{p.replace('_',' ').title()} is high risk due to {r.replace('_',' ')}"

    if atom.startswith("highriskpatient"):
        p = atom.split("(")[1][:-1]
        return f"{p.replace('_',' ').title()} is a high-risk patient."

    if atom.startswith("hasage"):
        p, a = atom.split("(")[1][:-1].split(",")
        return f"{p.replace('_',' ').title()} has age {a}"

    return atom.replace("_", " ")

# -------------------------------------------------
# ROUTES
# -------------------------------------------------
@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        patient = canonical_patient(request.form.get("patient"))
        query = canonical_query(request.form.get("query"))
        return redirect(url_for("result_page", patient=patient, query=query))

    return render_template("index.html")

@app.route("/result")
def result_page():
    patient = canonical_patient(request.args.get("patient"))
    query = canonical_query(request.args.get("query"))

    display_patient = patient.replace("_", " ").title()
    display_query = query.replace("_", " ").title()

    try:
        # ---------------- RUN CLINGO ----------------
        atoms = run_clingo_solver()
        
        if not atoms:
            return render_template(
                "result.html",
                patient=display_patient,
                query=display_query,
                result=["No model found."]
            )

        answers = []

        for atom in atoms:
            pred, args = parse_atom(atom)

            if not args or args[0] != patient:
                continue

            if query == "symptoms" and pred == "patienthassymptom":
                answers.append(prettify(atom))

            elif query == "treatments" and pred == "recommendtreatment":
                answers.append(prettify(atom))

            elif query == "risk" and pred in {"highriskpatient", "riskreason"}:
                answers.append(prettify(atom))

            elif query == "diagnosis" and pred == "possiblediagnosis":
                answers.append(
                    f"Possible diagnosis for {display_patient}: {args[1].replace('_',' ').title()}"
                )

            elif query == "severe" and pred == "severepatient":
                answers.append(
                    f"{display_patient} is a severe patient due to critical symptoms."
                )

            elif query == "unsafe" and pred == "unsafeMedication":
                answers.append(
                    f"⚠ Unsafe medication combination: "
                    f"{args[1].replace('_',' ').title()} + {args[2].replace('_',' ').title()}"
                )

            elif query == "untreated" and pred == "untreatedPatient":
                answers.append(
                    f"{display_patient} has untreated disease: {args[1].replace('_',' ').title()}"
                )

            elif query == "age" and pred == "hasage":
                answers.append(prettify(atom))

        if not answers:
            answers = ["No relevant medical information found."]

        return render_template(
            "result.html",
            patient=display_patient,
            query=display_query,
            result=answers
        )

    except Exception as e:
        return render_template(
            "result.html",
            patient=display_patient,
            query=display_query,
            result=[f"System error: {str(e)}"]
        )

# -------------------------------------------------
# START SERVER
# -------------------------------------------------
if __name__ == "__main__":
    app.run(debug=True)
