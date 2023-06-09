--14-10 Creating and Using User-Defined Scalar Functions 

--1 
IF OBJECT_ID('dbo.udf_Product') IS NOT NULL BEGIN
	DROP FUNCTION dbo.udf_Product;
END;
IF OBJECT_ID('dbo.udf.Delim') IS NOT NULL BEGIN
	DROP FUNCTION dbo.udf_Delim;
END;
GO

--2
CREATE FUNCTION dbo.udf_Product(@num1 INT, @num2 INT) RETURNS INT AS BEGIN

	DECLARE @Product INT;
	SET @Product = ISNULL(@num1,0) * ISNULL(@num2,0);
	RETURN @Product;

END;
GO

--3
CREATE FUNCTION dbo.udf_Delim(@String VARCHAR(100), @Delimiter CHAR(1))
	RETURNS VARCHAR(200) AS
BEGIN
	DECLARE @NewString VARCHAR(200) = '';
	DECLARE @Count INT = 1;

	WHILE @Count <= LEN(@String) BEGIN
		SET @NewString += SUBSTRING(@String, @Count,1) + @Delimiter;
		SET @Count += 1;
	END

	RETURN @NewString;
END
GO

--4
SELECT StoreID, TerritoryID, dbo.udf_Product(StoreID, TerritoryID) AS TheProduct,
dbo.udf_Delim(FirstName,',') AS FirstNameWtihCommas
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID;