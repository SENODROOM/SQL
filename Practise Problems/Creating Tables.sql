USE MDPharmacy;

CREATE TABLE Medicines(
 id INT,
 name VARCHAR(200),
 price INT
);

INSERT INTO Medicines VALUES("1", "Panadol" , "200");
INSERT INTO Medicines VALUES("2", "Lamenent" , "200");
INSERT INTO Medicines VALUES("3", "Risp" , "300");
INSERT INTO Medicines VALUES("4", "Rivotril" , "300");

SELECT * FROM MDPharmacy;