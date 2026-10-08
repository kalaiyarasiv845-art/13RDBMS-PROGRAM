

CREATE DATABASE CollegeDB;

USE CollegeDB;



CREATE TABLE Student_1NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseName VARCHAR(50),
    FacultyName VARCHAR(50),
    DepartmentName VARCHAR(50)
);


INSERT INTO Student_1NF
VALUES
(101, 'Kalaiyarasi', 'B.Sc IT', 'Dr. Kumar', 'Information Technology'),
(102, 'Monika', 'B.Sc IT', 'Dr. Kumar', 'Information Technology'),
(103, 'Jeevan', 'BCA', 'Dr. Ravi', 'Computer Applications'),
(104, 'Menaga', 'BCA', 'Dr. Ravi', 'Computer Applications');


SELECT * FROM Student_1NF;



CREATE TABLE Course_2NF (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyName VARCHAR(50),
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student_2NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    
    FOREIGN KEY (CourseID)
    REFERENCES Course_2NF(CourseID)
);



INSERT INTO Course_2NF
VALUES
(1, 'B.Sc IT', 'Dr. Kumar', 'Information Technology'),
(2, 'BCA', 'Dr. Ravi', 'Computer Applications');


INSERT INTO Student_2NF
VALUES
(101, 'Kalaiyarasi', 1),
(102, 'Monika', 1),
(103, 'Jeevan', 2),
(104, 'Menaga', 2);



SELECT * FROM Student_2NF;
SELECT * FROM Course_2NF;





CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);



CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
    REFERENCES Department(DepartmentID)
);



CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,

    FOREIGN KEY (FacultyID)
    REFERENCES Faculty(FacultyID)
);



CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,

    FOREIGN KEY (CourseID)
    REFERENCES Course(CourseID)
);



INSERT INTO Department
VALUES
(1, 'Information Technology'),
(2, 'Computer Applications');




INSERT INTO Faculty
VALUES
(101, 'Dr. Kumar', 1),
(102, 'Dr. Ravi', 2);



INSERT INTO Course
VALUES
(201, 'B.Sc IT', 101),
(202, 'BCA', 102);



INSERT INTO Student
VALUES
(1001, 'Kalaiyarasi', 201),
(1002, 'Monika', 201),
(1003, 'Jeevan', 202),
(1004, 'Menaga', 202);




SELECT * FROM Department;

SELECT * FROM Faculty;

SELECT * FROM Course;

SELECT * FROM Student;


-- =========================================
-- DISPLAY COMPLETE STUDENT DETAILS
-- =========================================

SELECT
    S.StudentID,
    S.StudentName,
    C.CourseName,
    F.FacultyName,
    D.DepartmentName
FROM Student S
JOIN Course C
    ON S.CourseID = C.CourseID
JOIN Faculty F
    ON C.FacultyID = F.FacultyID
JOIN Department D
    ON F.DepartmentID = D.DepartmentID;
