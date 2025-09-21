-- --------- Diagnostic analysis ----------- 

-- Churned vs Non Churned
SELECT e.Churned, ROUND(AVG(o.TotalRevenue),2) AS Avg_Revenue
FROM Engagement e JOIN Orders o
ON e.CustomerID = o.CustomerID
GROUP BY e.Churned;

-- Comparing Support Ticket
SELECT Churned, Round(AVG(SupportTickets),2) AS Avg_SupportTicket
FROM Engagement
GROUP BY Churned;

-- Comparing OrderValue
SELECT e.Churned, ROUND(AVG(o.AvgOrderValue),2) AS Avg_Order_Value
FROM Engagement e JOIN Orders o
ON e.CustomerID = o.CustomerID
GROUP BY e.Churned;

-- TotalOrders vs TotalRevenue
SELECT TotalOrders, TotalRevenue
FROM Orders;-