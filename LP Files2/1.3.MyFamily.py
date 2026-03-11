from rdflib import Graph, Namespace, Literal, RDF, RDFS

g = Graph()
FAM = Namespace("http://example.com/owl/families#")
g.bind("fam", FAM)
g.add((FAM.Person, RDF.type, RDFS.Class))

# Properties
g.add((FAM.hasChild, RDF.type, RDF.Property))
g.add((FAM.hasParent, RDF.type, RDF.Property))
g.add((FAM.hasSibling, RDF.type, RDF.Property))
g.add((FAM.hasSpouse, RDF.type, RDF.Property))
g.add((FAM.hasName, RDF.type, RDF.Property))

# Individuals
g.add((FAM.Ardra_Suresh, RDF.type, FAM.Person))
g.add((FAM.Suresh_Babu, RDF.type, FAM.Person))      # Father
g.add((FAM.Jaysree_Suresh, RDF.type, FAM.Person))   # Mother
g.add((FAM.Arsha_Suresh, RDF.type, FAM.Person))     # Sister
g.add((FAM.Arun_Prathan, RDF.type, FAM.Person))     # Husband

# Relationships
g.add((FAM.Ardra_Suresh, FAM.hasParent, FAM.Suresh_Babu))
g.add((FAM.Ardra_Suresh, FAM.hasParent, FAM.Jaysree_Suresh))
g.add((FAM.Ardra_Suresh, FAM.hasSibling, FAM.Arsha_Suresh))
g.add((FAM.Ardra_Suresh, FAM.hasSpouse, FAM.Arun_Prathan))
g.add((FAM.Suresh_Babu, FAM.hasChild, FAM.Ardra_Suresh))
g.add((FAM.Jaysree_Suresh, FAM.hasChild, FAM.Ardra_Suresh))
g.add((FAM.Suresh_Babu, FAM.hasChild, FAM.Arsha_Suresh))
g.add((FAM.Jaysree_Suresh, FAM.hasChild, FAM.Arsha_Suresh))
g.add((FAM.Arun_Prathan, FAM.hasSpouse, FAM.Ardra_Suresh))

# literal names
g.add((FAM.Ardra_Suresh, FAM.hasName, Literal("Ardra Suresh")))
g.add((FAM.Suresh_Babu, FAM.hasName, Literal("Suresh Babu")))
g.add((FAM.Jaysree_Suresh, FAM.hasName, Literal("Jaysree Suresh")))
g.add((FAM.Arsha_Suresh, FAM.hasName, Literal("Arsha Suresh")))
g.add((FAM.Arun_Prathan, FAM.hasName, Literal("Arun Prathan")))

g.serialize("family.ttl", format="turtle")
print("family.ttl created successfully!")
