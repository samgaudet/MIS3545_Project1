CREATE DATABASE REI_Database;
GO

USE REI_Database;
GO

-- Create the Customer and Order tables
CREATE TABLE Customer(
  CustomertID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL);


---- Create the relationship: the first FK in CourseEnrollment
--ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Student 
--FOREIGN KEY (StudentID) REFERENCES Student(StudentID);
--GO

--ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Course 
--FOREIGN KEY (CourseID) REFERENCES Course(CourseID);
--GO

---- Add a few students
--INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
--(1, 'Yinmeng', 'Tian'),
--(2, 'Samuel', 'Gaudet'),
--(3, 'Anthony', 'Krichevskiy'),
--(4, 'Christian', 'Thompson'),
--(5, 'Sang Won', 'Baek'),
--(6, 'Matthew', 'Michalke'),
--(7, 'Jonathan', 'Marchetti'),
--(8, 'Edward', 'Lehr'),
--(9, 'Patrick', 'Carney'),
--(10, 'Emma', 'Sewell');

---- Add a few courses
--INSERT INTO Course(CourseID, CourseTitle, Instuctor) VALUES 
--(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),
--(2, 'MIS3690-WEB TECHNOLOGIES', 'Shankar'),
--(3, 'QTM3000-CASE STUDIES IN BUSINESS ANALYTICS', 'Nathan'),
--(4, 'QTM3625-FINANCIAL SIMULATION', 'Dessi'),
--(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
--GO

---- If we want to delete SME2012
--DELETE FROM Course
--WHERE CourseTitle like 'SME%';
--GO