from rdflib import Graph, RDF, RDFS, OWL, Literal

INPUT_RDF = r"healthcare.rdf"
OUTPUT_ASP = "generated_ontology.lp"

g = Graph()
g.parse(INPUT_RDF)

def clean(x):
    name = x.split("#")[-1] if "#" in x else x.split("/")[-1]
    return name.lower().replace("-", "_")

with open(OUTPUT_ASP, "w") as f:
    f.write("% AUTO-GENERATED ASP FROM RDF\n\n")

    # -------- Classes --------
    classes = set()
    for cls in g.subjects(RDF.type, OWL.Class):
        classes.add(cls)
        f.write(f"class({clean(cls)}).\n")

    f.write("\n")

    # -------- Individuals --------
    for s, o in g.subject_objects(RDF.type):
        if o in classes:
            f.write(f"{clean(o)}({clean(s)}).\n")

    f.write("\n")

    # -------- Properties --------
    for s, p, o in g:
        if p in [RDF.type, RDFS.subClassOf]:
            continue

        pred = clean(p)

        if isinstance(o, Literal):
            f.write(f"{pred}({clean(s)}, {o}).\n")
        else:
            f.write(f"{pred}({clean(s)}, {clean(o)}).\n")

print("✅ RDF converted to ASP successfully")
