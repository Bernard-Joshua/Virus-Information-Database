-- Example of updating vaccines table
INSERT INTO Vaccine VALUES ("312114", "Johnson");

-- Have to update the weak entity too.
INSERT INTO Varriant_Vaccine VALUES ("101004", "312114", "P" );

-- Example Updating Status For Variants.
UPDATE Variant SET Status = "Not-Active" WHERE VariantID = 101013;


