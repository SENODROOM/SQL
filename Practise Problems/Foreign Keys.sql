CREATE TABLE Orders(
 userID INT PRIMARY KEY,
 FOREIGN KEY (userID) references Accounts (userID),
 userName VARCHAR(100),
 userEmail VARCHAR(100) UNIQUE,
 userAddress VARCHAR(255),
 userPhone VARCHAR(20),
 userPassword VARCHAR(100),
 userJoinDate VARCHAR(50),
 FOREIGN KEY (userName) references Accounts (userName),
 FOREIGN KEY (userEmail) references Accounts (userEmail),
 FOREIGN KEY (userAddress) references Accounts (userAddress),
 FOREIGN KEY (userPhone) references Accounts (userPhone),
 FOREIGN KEY (userPassword) references Accounts (userPassword),
 FOREIGN KEY (userJoinDate) references Accounts (userJoinDate)
);

DROP TABLE IF EXISTS Orders;

SELECT * FROM Orders;