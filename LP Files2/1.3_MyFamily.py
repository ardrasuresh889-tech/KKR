
from rdflib import Graph, Namespace, Literal, URIRef
from rdflib.namespace import RDF, RDFS, XSD

g = Graph()
FAM = Namespace("http://example.com/owl/families#")
EX = Namespace("http://example.com/family/suresh/")

# Bind prefixes for readable output
g.bind("fam", FAM)
g.bind("ex", EX)
g.bind("rdf", RDF)
g.bind("rdfs", RDFS)
g.bind("xsd", XSD)

# You (Ardra) and your husband
ardra = EX.ArdraSuresh
arun = EX.ArunPrathan
# Parents
sureshBabu = EX.SureshBabu
jaysree = EX.JaysreeSuresh
# Sister
arsha = EX.ArshaSuresh

# Add Person types 
g.add((ardra, RDF.type, FAM.Woman))
g.add((arun, RDF.type, FAM.Man))
g.add((sureshBabu, RDF.type, FAM.Man))
g.add((jaysree, RDF.type, FAM.Woman))
g.add((arsha, RDF.type, FAM.Woman))

# Adding names...
g.add((ardra, FAM.hasName, Literal("Ardra Suresh", datatype=XSD.string)))
g.add((arun, FAM.hasName, Literal("Arun Prathan", datatype=XSD.string)))
g.add((sureshBabu, FAM.hasName, Literal("Suresh Babu", datatype=XSD.string)))
g.add((jaysree, FAM.hasName, Literal("Jaysree Suresh", datatype=XSD.string)))
g.add((arsha, FAM.hasName, Literal("Arsha Suresh", datatype=XSD.string)))

# Adding ages...
g.add((ardra, FAM.hasAge, Literal(27, datatype=XSD.integer)))
g.add((arun, FAM.hasAge, Literal(27, datatype=XSD.integer)))
g.add((sureshBabu, FAM.hasAge, Literal(60, datatype=XSD.integer)))
g.add((jaysree, FAM.hasAge, Literal(55, datatype=XSD.integer)))
g.add((arsha, FAM.hasAge, Literal(29, datatype=XSD.integer)))

# Adding marriage relationships...
g.add((ardra, FAM.hasSpouse, arun))
g.add((arun, FAM.hasSpouse, ardra))

# Your parents' marriage
g.add((sureshBabu, FAM.hasSpouse, jaysree))
g.add((jaysree, FAM.hasSpouse, sureshBabu))

# Add hasHusband and hasWife (more specific)
g.add((ardra, FAM.hasHusband, arun))
g.add((arun, FAM.hasWife, ardra))
g.add((jaysree, FAM.hasHusband, sureshBabu))
g.add((sureshBabu, FAM.hasWife, jaysree))

# Suresh Babu's children
g.add((sureshBabu, FAM.hasChild, ardra))
g.add((sureshBabu, FAM.hasChild, arsha))

# Jaysree's children
g.add((jaysree, FAM.hasChild, ardra))
g.add((jaysree, FAM.hasChild, arsha))

# Inverse relationships - children to parents
g.add((ardra, FAM.hasParent, sureshBabu))
g.add((ardra, FAM.hasParent, jaysree))
g.add((arsha, FAM.hasParent, sureshBabu))
g.add((arsha, FAM.hasParent, jaysree))

# More specific relationships (hasFather and hasMother)
g.add((ardra, FAM.hasFather, sureshBabu))
g.add((ardra, FAM.hasMother, jaysree))
g.add((arsha, FAM.hasFather, sureshBabu))
g.add((arsha, FAM.hasMother, jaysree))

# Add hasDaughter relationships
g.add((sureshBabu, FAM.hasDaughter, ardra))
g.add((sureshBabu, FAM.hasDaughter, arsha))
g.add((jaysree, FAM.hasDaughter, ardra))
g.add((jaysree, FAM.hasDaughter, arsha))

# Ardra and Arsha are sisters
g.add((ardra, FAM.hasSibling, arsha))
g.add((arsha, FAM.hasSibling, ardra))

# More specific - they are sisters
g.add((ardra, FAM.hasSister, arsha))
g.add((arsha, FAM.hasSister, ardra))

# Add gender property
g.add((ardra, FAM.hasGender, Literal("Female", datatype=XSD.string)))
g.add((arun, FAM.hasGender, Literal("Male", datatype=XSD.string)))
g.add((sureshBabu, FAM.hasGender, Literal("Male", datatype=XSD.string)))
g.add((jaysree, FAM.hasGender, Literal("Female", datatype=XSD.string)))
g.add((arsha, FAM.hasGender, Literal("Female", datatype=XSD.string)))

# Add in-law relationships
g.add((arun, FAM.hasFatherInLaw, sureshBabu))
g.add((arun, FAM.hasMotherInLaw, jaysree))
g.add((sureshBabu, FAM.hasSonInLaw, arun))
g.add((jaysree, FAM.hasSonInLaw, arun))
g.add((arsha, FAM.hasBrotherInLaw, arun))
g.add((arun, FAM.hasSisterInLaw, arsha))

g.serialize("Myfamily.ttl", format="turtle")
print("family.ttl created successfully!")


