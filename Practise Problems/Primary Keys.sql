USE MDPharmacy;

CREATE TABLE IF NOT EXISTS Accounts (
  userID INT PRIMARY KEY NOT NULL,
  userName VARCHAR(100),
  userEmail VARCHAR(100) UNIQUE,
  userAddress VARCHAR(255),
  userPhone VARCHAR(20),
  userPassword VARCHAR(100),
  userJoinDate VARCHAR(50)
);



DROP TABLE IF EXISTS Accounts;

INSERT INTO Accounts VALUES (
1,
"Muhammad Aqib Javed", 
"aqibjvd93@gmail.com", 
"Janiper Block, BTL", 
"03357127121", 
"ponjuf-zuRriz-wiwti5", 
"2024-07-09"
);

INSERT INTO Accounts VALUES(
2, 
"faisal", 
"faisalashraf7172@gmail.com", 
"bharia town", 
"03058088100", 
"12345678", 
"2024-07-15"
);

INSERT INTO Accounts VALUES(
3,
"Muhammad Saad Amin",
"saadamin691@gmail.com",
"6/12 A block",
"03078795534",
"23457890",
"July 2, 2024"
);


SHOW TABLES;

USE MDPharmacy;
SELECT * FROM Accounts;