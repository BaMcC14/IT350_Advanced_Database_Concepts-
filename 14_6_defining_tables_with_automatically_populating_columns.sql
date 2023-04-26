--14-6 Defining Tables with Automatically Populating Columns

USE tempdb;
GO
--1 Drops MySequence and adds it back 
IF OBJECT_ID('MySequence') IS NOT NULL BEGIN 
    DROP SEQUENCE MySequence;
END;

CREATE SEQUENCE MySequence START WITH 1;

--2 Dropps table3 and adds it back
IF OBJECT_ID('table3') IS NOT NULL BEGIN
    DROP TABLE table3;
END;

CREATE TABLE table3 (col1 CHAR(1), 
	idCol INT NOT NULL IDENTITY,
	rvCol ROWVERSION,
	defCol DATETIME2 DEFAULT GETDATE(),
	Seqcol INT DEFAULT NEXT VALUE FOR dbo.MySequence,
	calcCol1 AS DATEADD(m,1,defCol),
	calcCol2 AS col1 + ':' + col1
);
GO


--3 Inserting values into table3
INSERT INTO table3 (col1)
VALUES ('a'),('b'),('c'),('d'),('e'),('g');

--4 Inserting values into table3
INSERT INTO table3 (col1, defCol)
VALUES ('h', NULL),('i', '2014/01/01');

--5 displaying columns from table3
SELECT col1, idCol, rvCol, defCol, calcCol1, calcCol2, SeqCol
FROM table3;