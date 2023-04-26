-- 14-4 Adding a Foreign Key 

--1 
--Clearning table1 and table2
IF OBJECT_ID('table1') IS NOT NULL BEGIN
DROP TABLE table1;
END;
IF OBJECT_ID('table2') IS NOT NULL BEGIN
DROP TABLE table2;
END;

--2
--Creating table1 with three columns 
CREATE TABLE table1 (col1 INT NOT NULL, col2 VARCHAR(20), col3 DATETIME
CONSTRAINT PK_table1_Col1 PRIMARY KEY(col1));


--3
--Creating table2 with two columns 
CREATE TABLE table2 (col4 INT NULL, col5 VARCHAR(20) NOT NULL, 
CONSTRAINT pk_table2 PRIMARY KEY (col5),
CONSTRAINT fk_table2_table1 FOREIGN KEY (col4) REFERENCES table1(col1)
    );
GO

--4 
-- Adding values to table1
PRINT 'Adding to table1'
INSERT INTO table1 (col1,col2,col3)
VALUES(1,'a','2014/01/01'),(2,'b','2014/01/01'),(3,'c','1/3/2014');

--5
--Adding values to table2
PRINT 'Adding to table2';
INSERT INTO table2(col4, col5)
VALUES (1,'abc'), (2,'def');

--6 
-- Attempting to add to table2
PRINT 'Violating foreign key with insert';
INSERT INTO table2(col4, col5)
VALUES (7,'aaa');

--7
--Attempting to add to table2
PRINT 'Violating foreign key with update';
UPDATE table2 SET col4 = 6
WHERE col4 = 1;