

EXEC sp_execute_external_script @language = N'Python',

@script = N'

import pandas as pd
import numpy as np
A = np.arange(24).reshape(4,6)

df = pd.DataFrame(A)
OutputDataSet = df

'


CReate Database Students;

USE Students;

Create Table StudentsInfo
(Name varchar(8000),
DOB Date,
Age int,
Address varchar(8000),
PhoneNumber bigint,
Country varchar(5000),
Class Varchar(8000))

-- DRop Database Students;

-- Drop Table StudentsInfo


Insert Into StudentsInfo Values
(1,'Olawale', '12-02-1995', 23, '47, Abeje Street', 07036272181, 'Nigeria', 'PHD'),
(2,'Kemi', '12-02-1997', 23, '17, Evie Street', 07036272181, 'Ghana', 'College'),
(3,'Segun', '12-02-1997', 23, '20, Razak Okoya Street', 07036272181, 'Nigeria', 'Master'),
(4,'Femi', '12-02-1995', 23, '7, Ligali Street', 07036272181, 'USA', 'Graduate'),
(5,'Funmi', '12-02-1955', 23, '17, Ateboh Street', 07036272181, 'France', 'Graduate'),
(6,'kIng', '12-02-1995', 23, '45, Turner Street', 07036272181, 'China', 'College'),
(7,'Wallace', '12-02-1985', 23, '4,  Street', 07036272181, 'UK', 'High School');


SElect Name, Age, Year(DOB) Year From StudentsInfo;

Select * From StudentsInfo


-- Drop Table StudentsInfo;


ALter Table StudentsInfo Add City Varchar(100); -- dding column
ALTER TABle StudentsInfo drop column City; -- Dropping column
ALTER Table StudentsInfo Alter Column DOB Datetime; -- Changing column data type
--ALTER TAble StudentInfo Rename Column Age StudentAge (Renaming colum with Alter Table  ot working, will still find out)
--sp_rename 'StudentsInfo.Age' 'StudentsAge', COLUMN;  (Renaming column with sp_rename not working)

sp_rename 'StudentsInfo', 'StudentsInformation'; -- Renaming Tables

Select * From StudentsInformation;

DROP Table StudentInfo;



Create Table StudentInfo
(
StudentID int,
Name varchar(2000) NOT NUll,
DOB Date,
Age int,
Continent varchar(2000) Default 'Africa', -- Adding a default Value
Address varchar(2000) NOT NULL,
PhoneNumber bigint,
Country varchar(2000) check (Country = 'Nigeria'),
Class Varchar(2000)
CONSTRAINT pk_Student_ID UNIQUE (StudentID),
CONSTRAINT pk_Phone PRIMARY KEY (PhoneNumber)

);



Insert Into StudentInfo Values
(1,'Olawale', '12-02-1995', 29, 'Africa', 'Adekeye Street', 07036472181, 'Nigeria', 'PHD'),  -- Null will ot fit in due to the contraint
(2,'Kemi', '12-02-1997', 83, 'Africa', '17, Evie Street', 07036272381, 'Nigeria', 'College'),
(3,'Segun', '12-02-1997', 63, 'Africa', 'Razak Okoya Street', 07536272181, 'Nigeria', 'Master'),
(4,'Femi', '12-02-1995', 23, NULL, 'Ligali Street', 07036273181, 'Nigeria', 'Graduate'),
(5,'Funmi', '12-02-1955', 43, 'America', 'Ateboh Street', 07036072181, 'Nigeria', 'Graduate'),
(6,'kIng', '12-02-1995', 28, NULL, 'Turner Street', 07036212181, 'Nigeria', 'College'),
(7,'Wallace', '12-02-1985', 27, NULL, 'Evie Street', 07036272101, 'Nigeria', 'High School');

SELECT TOP 3 * from StudentInfo
ORDER by STudentID DESC

SELECT TOP 3 * FROM StudentInfo
ORDER BY StudentID




CREATE TABLE SourceTable (
StudentID int,
StudentName varchar(100),
StudentMark int
)



CREATE TABLE TargetTable (
StudentID int,
StudentName varchar(100),
StudentMark int
)


Insert Into SourceTable VALUES
(1, 'Louis', 56),
(2, 'wale', 78),
(3, 'Yusuf', 56);


Insert Into TargetTable VAlues
(1, 'Louis', 70),
(2, 'wale', 80),
(3, 'Yusuf', 90);

SELECT * FROm SourceTable
SELECT * FROM TargetTable


SELECT * FROM SourceTable S
INNER JOIN TargetTable T
ON T.STudentID = T.StudentID;


-- Grouping And Aggregating Query

 SELECT *, 'Hello' AS string from StudentInfo;
 
 SELect Class, Count(Name) Total_Number_Of_Classes 
 FROM StudentInfo
 Group by Class
 Having Class <> 'High School';


 SELect Class, Count(Name) Total_Number_Of_Classes 
 FROM StudentInfo
 Group by Cube(Class)  -- Function of the cube to be find out
 Having Class <> 'High School';

SELECT * INTO PseudoTable FROM StudentInfo  -- CReating and adding data to tabe in SQL Server

SELECT * FROM PseudoTable














