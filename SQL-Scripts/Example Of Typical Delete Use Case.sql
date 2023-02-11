-- Example Of Deleting Rows.

DELETE FROM researchers WHERE VariantID = 101013;
DELETE FROM transmission_mode WHERE VariantID = 101013;
DELETE FROM varriant_vaccine WHERE VariantID = 101013;
DELETE FROM variant_host WHERE VariantID = 101013;
DELETE FROM variant_location WHERE VariantID = 101013;
DELETE FROM variant WHERE VariantID = 101013;
DELETE FROM gene WHERE GeneID = 1110013;

-- To See Changes
SELECT * FROM Variant;