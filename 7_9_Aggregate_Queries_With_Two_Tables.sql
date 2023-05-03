--7-9 Writing Aggregate Queries with Two Tables
--1
SELECT c.CustomerID, c.AccountNumber, COUNT(*) AS CountOfOrders,
SUM(TotalDue) AS SumOfTotalDue
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.AccountNumber
ORDER BY c.CustomerID;
--2
SELECT c.CustomerID, c.AccountNumber, COUNT(*) AS CountOfOrders,
SUM(TotalDue) AS SumOfTotalDue
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s 
ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.AccountNumber
ORDER BY c.CustomerID;
--3
SELECT c.CustomerID, c.AccountNumber, COUNT(s.SalesOrderID) AS CountOfOrders,
SUM(COALESCE(TotalDue,0)) AS SumOfTotalDue
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.AccountNumber
ORDER BY c.CustomerID


