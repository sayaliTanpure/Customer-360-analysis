-- ---------Feature Engineering -----------

--1) Customer Tenure in days (Customers Table)
ALTER TABLE Customers ADD COLUMN CustomerTenure INT;

UPDATE Customers
SET CustomerTenure = CURRENT_DATE - SignupDate;

SELECT * FROM Customers;

--2) Revenue per Visit (Orders Table)

ALTER TABLE Orders ADD COLUMN RevenuePerVisit DECIMAL(10,2);

       --returns NULL if TotalVisits = 0
       --This prevents a division by zero error.
UPDATE Orders o
SET RevenuePerVisit = o.TotalRevenue / NULLIF(e.TotalVisits, 0)
FROM Engagement e
WHERE o.CustomerID = e.CustomerID;

SELECT * FROM Orders;

-- 3) Churn Flag (0 = active, 1 = churned) (Engagement Table)
ALTER TABLE Engagement ADD COLUMN ChurnFlag INT;

UPDATE Engagement
SET ChurnFlag = CASE WHEN Churned = 'Yes' THEN 1 ELSE 0 END;

SELECT * FROM Engagement;
