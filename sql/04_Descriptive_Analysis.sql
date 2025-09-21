-- --------- DESCRIPTIVE ANALYSIS ------------

-- Total Revenue
SELECT SUM(TotalRevenue) AS Total_Revenue FROM Orders;

-- Revenue by location
SELECT c.Location, SUM(o.TotalRevenue) AS Revenue
FROM Customers c JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.Location
ORDER BY Revenue DESC;

-- Customer Segment Distribution
SELECT CustomerSegment, COUNT(*) AS Count
FROM Customers
GROUP BY CustomerSegment;

-- Average Satisfaction score by churn status
SELECT Churned, ROUND(AVG(SatisfactionScore),2) AS Acg_satisf_score
FROM Engagement
GROUP BY Churned;

-- Signup trends by year
SELECT DATE_TRUNC('year', SignupDate)::DATE AS signup_year, COUNT(*) AS customers_acquired
FROM customers
GROUP BY signup_year
ORDER BY signup_year;

SELECT c.CustomerID, c.Name, o.TotalRevenue
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
ORDER BY o.TotalRevenue DESC 
LIMIT 5;

-- Preferred category
SELECT PreferredCategory, COUNT(*) AS CustomerCount
FROM Orders
GROUP BY PreferredCategory
ORDER BY CustomerCount DESC;

-- Churned and Active customer count
SELECT Churned, COUNT(*) AS Cust_count
FROM Engagement
GROUP BY Churned
ORDER BY Cust_count;
