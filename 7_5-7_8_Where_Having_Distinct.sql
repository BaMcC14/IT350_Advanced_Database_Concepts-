--7-5 WHERE Clause
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
WHERE TerritoryID in (5,6)
GROUP BY CustomerID;


--7-6 Using the HAVING Clause
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > 5000;

SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) = 10 and SUM(TotalDue) > 5000;

SELECT CustomerID, Sum(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING CustomerID > 27858;

--7-7 Using DISTINCT and GROUP BY
--Same results for each query.
SELECT DISTINCT SalesOrderID
FROM Sales.SalesOrderDetail;

SELECT SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

--7-8 Using DISTINCT in an Aggregate Expression 
SELECT COUNT(*) AS CountOfRows, COUNT(SalesPersonID) AS CountOfSalesPeople,
COUNT(DISTINCT SalesPersonID) AS CountOfUniqueSalesPerson
FROM Sales.SalesOrderHeader;

SELECT SUM(TotalDue) AS TotalOfAllOrders,
SUM(DISTINCT TotalDue) AS TotalOfDistinctTotalDue
FROM Sales.SalesOrderHeader;

