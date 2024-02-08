CREATE DATABASE EMPLOYEE

use EMPLOYEE

CREATE TABLE EmployeeDetail(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary INT NOT NULL,
JoiningDate DATETIME,
Department VARCHAR(20),
Gender VARCHAR(10));


INSERT INTO EmployeeDetail VALUES(1,'Vikas','Ahlawat',600000,'2/12/2013 11:16','IT','Male'),
      (2,'nikita','Jain', 530000,'2/14/2013 11:16','HR','Female'),
      (3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','Male'),
      (4,'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','Male'),
      (5, 'anish','kadian',500000,'2/16/2013 11:16','Paroll','Male');

SELECT * FROM EmployeeDetail;

SELECT FirstName FROM EmployeeDetail;

SELECT FirstName as First_Name FROM EmployeeDetail 

select CONCAT(FirstName,' ',LastName)as Name from EmployeeDetail

SELECT* FROM EmployeeDetail
WHERE FirstName = 'Vikas'

SELECT* FROM EmployeeDetail
WHERE FirstName LIKE 'A%';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE 'H%';

SELECT * FROM EmployeeDetail
WHERE FirstName like'[A-P]%';

SELECT * FROM EmployeeDetail
WHERE FirstName NOT like'[A-P]%';

SELECT * FROM EmployeeDetail
WHERE Gender like'__le';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE 'A____';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE '%!%%' ESCAPE '!';

SELECT DISTINCT Department FROM EmployeeDetail;

SELECT MAX(Salary) FROM EmployeeDetail;

SELECT MIN(Salary) FROM EmployeeDetail;

SELECT FORMAT(JoiningDate,'dd mm yyyy') from EmployeeDetail

SELECT CONVERT(VARCHAR(12),JoiningDate,106) AS JoiningDate  FROM EmployeeDetail

SELECT CONVERT(VARCHAR(12),JoiningDate,111) AS JoiningDate  FROM EmployeeDetail

SELECT YEAR(JoiningDate) AS JoiningDate  FROM EmployeeDetail;

SELECT MONTH(JoiningDate) AS JoiningDate  FROM EmployeeDetail;

SELECT CONVERT(DATE,GETDATE()) AS SystemDate
FROM EmployeeDetail;

SELECT CONVERT(DATE,GETUTCDATE()) AS SystemDate
FROM EmployeeDetail;

SELECT FirstName,GETDATE() AS CurrentDate,JoiningDate,DateDiff(MONTH,JoiningDate,GETDATE()) AS MonthsDifference FROM EmployeeDetail;

SELECT FirstName,GETDATE() AS CurrentDate,JoiningDate, DATEDIFF(Day,JoiningDate,GETDATE()) AS DayDifference From EmployeeDetail;

SELECT * FROM EmployeeDetail
WHERE YEAR(JoiningDate)= 2013;

SELECT * FROM EmployeeDetail
WHERE MONTH(JoiningDate)= 1;

SELECT COUNT(EmployeeID) FROM EmployeeDetail;

SELECT TOP 1 * FROM EmployeeDetail;

SELECT * FROM EmployeeDetail
WHERE FirstName NOT IN ('Vikas','Ashish','Nikhil');

SELECT LTRIM(FirstName) AS TrimmedName FROM EmployeeDetail;

SELECT 
   FirstName,
   CASE
       WHEN Gender = 'Male' THEN 'M'
	   WHEN Gender = 'Female' THEN 'F'
	   ELSE NULL
   END AS GenderAfterChange
FROM EmployeeDetail;

SELECT CONCAT('Hello  ',FirstName) AS Greeting FROM EmployeeDetail;

SELECT * FROM EmployeeDetail
WHERE Salary>600000;

SELECT * FROM EmployeeDetail
WHERE Salary<700000;

SELECT * FROM EmployeeDetail
WHERE Salary BETWEEN 500000 AND 600000;

CREATE TABLE ProjectDetail(
ProjectDetailID INT PRIMARY KEY,
EmployeeDetailID INT NOT NULL,
ProjectName VARCHAR(80)
);
INSERT INTO ProjectDetail (ProjectDetailID,EmployeeDetailID,ProjectName) VALUES
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Managment'),
(4,2,'HR Management'),
(5,3,'Task Track'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR Management'),
(9,6,'GL Management');

SELECT * FROM ProjectDetail;

SELECT Department, SUM(Salary) AS TOTAL_Salary FROM EmployeeDetail
GROUP BY Department;

SELECT Department, SUM(Salary) AS TOTAL_Salary FROM EmployeeDetail
GROUP BY Department
ORDER BY TOTAL_Salary ASC;

 
SELECT Department, SUM(Salary) AS TOTAL_Salary FROM EmployeeDetail
GROUP BY Department
ORDER BY TOTAL_Salary DESC;

SELECT
    Department,
	COUNT(*) AS Total_Department,
	SUM(Salary) as Total_Salary
FROM EmployeeDetail
GROUP BY Department;

SELECT Department,AVG(Salary) AS Total_Salary  FROM EmployeeDetail
GROUP BY Department
ORDER BY Total_Salary ASC;

SELECT Department,MAX(Salary) AS Total_Salary  FROM EmployeeDetail
GROUP BY Department
ORDER BY Total_Salary ASC;

SELECT Department,MIN(Salary) AS Total_Salary  FROM EmployeeDetail
GROUP BY Department
ORDER BY Total_Salary ASC;

SELECT EmployeeDetail.*,
ProjectDetail.*
FROM EmployeeDetail
JOIN
ProjectDetail
ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;


SELECT 
    EmployeeDetail.FirstName AS EmployeeName,
    ProjectDetail.ProjectName
FROM 
    EmployeeDetail
JOIN 
    ProjectDetail 
ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID

ORDER BY 
    EmployeeDetail.FirstName;


SELECT 
    EmployeeDetail.FirstName,
    ProjectDetail.ProjectName
FROM 
    EmployeeDetail
LEFT JOIN
    ProjectDetail
ON
    EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
ORDER BY
    EmployeeDetail.FirstName;
  

SELECT 
    EmployeeDetail.FirstName,
    COALESCE(ProjectDetail.ProjectName,'-No Project Assigned') as ProjectName
FROM 
    EmployeeDetail
LEFT JOIN
    ProjectDetail
ON
    EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
ORDER BY
    EmployeeDetail.FirstName;


SELECT 
    EmployeeDetail.FirstName,
    ProjectDetail.ProjectName
FROM 
    EmployeeDetail
RIGHT JOIN
    ProjectDetail
ON
    EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
ORDER BY
    EmployeeDetail.FirstName;

SELECT 
    EmployeeDetail.FirstName,
    ProjectDetail.ProjectName
FROM 
    EmployeeDetail
FULL JOIN
    ProjectDetail
ON
    EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
ORDER BY
    EmployeeDetail.FirstName;


SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName
FROM EmployeeDetail
INNER JOIN  
ProjectDetail 
ON 
EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID
WHERE 
EmployeeDetail.EmployeeID IN (
SELECT 
EmployeeDetailID
FROM 
ProjectDetail
GROUP BY EmployeeDetailID
    HAVING COUNT(*) > 1
);



SELECT ProjectDetail.ProjectName, EmployeeDetail.FirstName
FROM ProjectDetail
INNER JOIN EmployeeDetail ON ProjectDetail.EmployeeDetailID = EmployeeDetail.EmployeeID
WHERE ProjectDetail.ProjectName IN (
    SELECT ProjectName
    FROM ProjectDetail
    GROUP BY ProjectName
    HAVING COUNT(*) > 1
);


SELECT EmployeeDetail.FirstName,
       ProjectDetail.ProjectName
FROM EmployeeDetail
CROSS JOIN
     ProjectDetail;


