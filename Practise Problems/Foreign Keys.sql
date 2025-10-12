USE MDPharmacy;
CREATE TABLE IF NOT EXISTS Orders(
  orderID INT auto_increment PRIMARY KEY,
  userID INT,
  Orders VARCHAR(1000),
  FOREIGN KEY (userID) REFERENCES Accounts(userID)
);



INSERT INTO Orders(Orders)
VALUES (
 "PANADOL"
);



DROP TABLE IF EXISTS Orders;

SELECT * FROM Orders;