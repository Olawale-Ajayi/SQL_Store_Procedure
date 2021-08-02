USE MASTER;

SELECT * FROM StudentInfo

CREATE PROCEDURE spHigher_Education_Students
AS
BEGIN
SELECT *
FROM StudentInfo
WHERE Class != 'High School'
END

spHigher_Education_Students



ALTER PROCEDURE spHigher_Education_Students
AS
BEGIN
	SELECT *
	FROM StudentInfo
	WHERE Class != 'High School'
END

EXEC spHigher_Education_Students



ALTER PROCEDURE spHigher_Education_Students

@SetClass nvarchar(100), @SetAge int

AS

BEGIN

SET NOCOUNT ON;

	SELECT *
	FROM StudentInfo
	WHERE Class != @SetClass AND Age < @SetAge
END







EXEC spHigher_Education_Students  'PHD', 30



CReate Procedure spGet_Name
@SetName nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * 
	FROM StudentInfo
	Where Name = @SetName
END

EXEC spGet_Name 'Femi'




-- USING IF ELSE Statement in Procedure


Create Procedure spGet_Age_Ranges
@SetAge int
AS
BEGIN

SET NOCOUNT ON;

if @SetAge  < 30
	BEGIN
		SELECT StudentID, Name, Age, 'Young' As AgeRange
		FROM StudentInfo
		WHERE Age = @SetAge

	END
ELSE
	BEGIN
		SELECT StudentID, Name, Age, 'Old' As AgeRange
		FROM StudentInfo
		WHERE Age = @SetAge
	END

END


EXEC spGet_Age_Ranges 20





ALTER PROCEDURE AgeRange
Declare @SetAge int

AS

BEGIN 

SET NOCOUNT ON;

SELECT StudentID, Name, Age,
 CASE	When Age < @SetAge
			THEN 'Young'
		ELSE 'Old'
END AgeRange

FROM StudentInfo

END



ALTER PROCEDURE AgeRange
@SetAge int

AS

BEGIN 

SET NOCOUNT ON;



SELECT StudentID, Name, Age,
 CASE	When Age < @SetAge
			THEN 'Young'
		ELSE 'Old'
END AgeRange

FROM StudentInfo

END


EXEC AgeRange 35





SELECT StudentID, Name, Age,
 CASE	When Age < 30
			THEN 'Yotung'
		ELSE 'Old'
END AgeRange

FROM StudentInfo


-- Declaring a Variable


Declare @Age int = 30

SELECT @Age


-- Setting Up Python In SQL Server.

EXEC sp_configure
EXEC sp_configure 'external scripts enabled'
RECONFIGURE WITH OVERRIDE

EXEC sp_execute_external_script
@language = N'Python',
@script = N'OutputDataSet = InputDataSet;',
@input_data_1 = N'SELECT 1 AS Python'
WITH RESULT SETS (([Python] INT NOT NULL)); -- renaming the column for output and assigning a data type
GO

























