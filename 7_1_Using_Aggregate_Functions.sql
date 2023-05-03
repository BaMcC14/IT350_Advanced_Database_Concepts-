SELECT COUNT(*) AS CountOfRows, 
MAX(TotalDue) AS MaxTotal,
MIN(TotalDue) AS MinTotal,
SUM(TotalDue) AS SumOfTotal,
AVG(TotalDue) AS AvgTotal
FROM Sales.SalesOrderHeader;

SELECT MIN(Name) AS MinName,
MAX(Name) AS MaxName,
MIN(SellStartDate) AS MinSellStartDate
FROM Production.product;

SELECT COUNT(*) AS CountOfRows,
COUNT(Color) AS CountOfColor,
Count(DISTINCT Color) AS CountOfDistinctColor
FROM Production.Product;

