-- ---------Customers table --------
  
CREATE TABLE customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(50),
    SignupDate DATE,
    CustomerSegment VARCHAR(50)
);

COPY customers (CustomerID, Name, Age, Gender, Location, SignupDate, CustomerSegment)
FROM 'D:\Customer 360+ Final_Project\Dataset\Customers_table.csv'
CSV HEADER;

SELECT * FROM customers;

-- ---------Orders table ------------
CREATE TABLE orders (
    CustomerID VARCHAR(10),
    TotalOrders INTEGER,
    TotalRevenue NUMERIC(10, 2),
    AvgOrderValue NUMERIC(10, 4),
    PreferredCategory VARCHAR(50),
    LastPurchaseDate DATE,
    RFM_Score INTEGER,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

COPY orders (CustomerID, TotalOrders, TotalRevenue, AvgOrderValue, PreferredCategory, LastPurchaseDate, RFM_score)
FROM 'D:\Customer 360+ Final_Project\Dataset\Orders_table.csv'
CSV HEADER;

SELECT * FROM Orders;

-- ---------Engagement table -----------

CREATE TABLE Engagement (
    CustomerID VARCHAR(10),
    TotalVisits INTEGER,
    LastVisitDate DATE,
    SupportTickets INTEGER,
    SatisfactionScore INTEGER,
    Churned BOOLEAN,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

COPY Engagement (CustomerID, TotalVisits, LastVisitDate, SupportTickets, SatisfactionScore, Churned)
FROM 'D:\Customer 360+ Final_Project\Dataset\Engagement_table.csv'
CSV HEADER;

SELECT * FROM Engagement;
