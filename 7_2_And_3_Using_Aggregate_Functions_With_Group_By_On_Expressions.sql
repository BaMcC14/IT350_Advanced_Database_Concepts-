--7-2 Using the GROUP BY Clause
SELECT CustomerID, SUM(TotalDue) AS TotalPerCustomer
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

SELECT TerritoryID, AVG(TotalDue) AS AveragePerTerritory
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID;


--7-3 Using the GROUP BY Clause on an Expression
SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrdersYear
FROM Sales.SalesOrderHeader
GROUP BY OrderDate;
--This query shows incorrect information as the GROUP BY Clause is incorrect. 
--The GROUP BY Clause should be done with the expression to show one result per year.
--See example below.

SELECT COUNT(*) AS CountOfOrders, Year(OrderDate) AS OrderYear
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate);