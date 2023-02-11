-- Query 1
SELECT v.VirusName as Parent, vv.VariantName as Variant , g.GeneType, g.genelength_nt as Nucleotide_Length
FROM  Virus v NATURAL JOIN Variant vv NATURAL JOIN Gene g; 

-- Query 2
SELECT vv.VariantName as Variant , vv.Origin as First_Discovered_Location,  COUNT(l.locationID) as Spread_To_Locs
FROM Variant vv NATURAL JOIN variant_location l 
GROUP BY Variant
ORDER BY Spread_To_Locs DESC; 

-- Query3
SELECT vv.VariantName as Variant ,  t.transmissiontype as Transmitted_By
FROM Variant vv NATURAL JOIN transmission_mode   NATURAL JOIN transmission t 
ORDER BY Variant ASC ; 

-- Query 4
SELECT vv.VariantName as Variant ,  r.researchername as Researcher, r.instituition as Affiliated
FROM Variant vv NATURAL JOIN researchers   NATURAL JOIN researcher r 
ORDER BY Researcher ASC ; 

-- Query 5
SELECT COUNT(vv.VariantID) as No_Variants ,  r.ResearcherName as Researcher, r.Instituition as Affiliated
FROM Variant vv NATURAL JOIN Researchers   NATURAL JOIN Researcher r 
GROUP BY Researcher 
ORDER BY  No_Variants DESC; 