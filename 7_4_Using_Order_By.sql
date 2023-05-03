--7-4 Using ORDER BY

SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TerritoryID;

--The error in this code is that the nonaggregate column (TerritoryID) dose not also appear in the GROUP BY clause.
--If a nonaggregate column appears in the ORDER BY clause, it must also appear in the GROUP BY clause. 

--Correcting the above code.
--1
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID
--2
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer 
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY MAX(TotalDue) DESC;
--3 You can use the aggregate alias in the ORDER BY clause.
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalPerCustomer DESC;