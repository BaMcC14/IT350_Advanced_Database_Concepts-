--7-11 Working with STATISTICS
SET STATISTICS IO ON;
GO

SELECT *
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader;