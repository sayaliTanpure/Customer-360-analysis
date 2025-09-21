-- -------DATA CLEANING --------

-- Check for NULL Values
SELECT Count(*) FROM Customers
WHERE Age IS NULL;

SELECT COUNT(*) FROM Engagement
WHERE SupportTickets IS NULL; 


-- Remove duplicate customers
DELETE FROM Customers
WHERE CustomerID NOT IN (
    SELECT MIN(CustomerID) FROM Customers GROUP BY Name, SignupDate
);


-- Replacing 'Unknown' with 'NULL' OF Location column
    -- Filter out records with "unknown" locations
    SELECT * FROM Customers
    WHERE Location <> 'Unknown';

    -- Replace "unknown" with NULL
    UPDATE Customers
    SET Location = NULL
    WHERE Location = 'Unknown';
