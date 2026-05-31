CREATE DATABASE StudentGradessTracker;
GO
USE StudentGradesTracker;
GO

DROP TABLE IF EXISTS StudentEvaluations;
DROP TABLE IF EXISTS Tests; 
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Participants;
GO

CREATE TABLE Participants (
    StudentID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Intake VARCHAR(20) NOT NULL,
    Age INT,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Courses (
    CourseID VARCHAR(20) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);

CREATE TABLE Assignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    CourseID VARCHAR(20) NOT NULL,
    StudentID VARCHAR(20) NOT NULL,
    Score DECIMAL(5, 2) NOT NULL,
    Grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Participants(StudentID) ON DELETE CASCADE
);

CREATE TABLE Tests (
    TestID INT IDENTITY(1,1) PRIMARY KEY,
    CourseID VARCHAR(20) NOT NULL,
    StudentID VARCHAR(20) NOT NULL,
    Score DECIMAL(5, 2) NOT NULL,
    Grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Participants(StudentID) ON DELETE CASCADE
);

CREATE TABLE StudentEvaluations (
    EvaluationID INT IDENTITY(1,1) PRIMARY KEY,
    CourseID VARCHAR(20) NOT NULL,
    StudentID VARCHAR(20) NOT NULL,
    SatisfactionScore INT CHECK (SatisfactionScore BETWEEN 1 AND 5),
    Feedback VARCHAR(MAX), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Participants(StudentID) ON DELETE CASCADE
);
GO

INSERT INTO Courses (CourseID, CourseName) 
VALUES ('MAT209', 'Advanced Mathematics');

INSERT INTO Participants (StudentID, Name, Intake, Age, Email) VALUES
('CST2604532','John Smith', '2026/04', 20, 'johnsmith@gmail.com'),
('CST2604179','Bobby Jones', '2026/04', 21, 'bobbyjones@example.com'),
('MAT2509336','Charlie Brown', '2025/09', 20, 'charliebrown@example.com'),
('MAT2602942','Diana Prince', '2026/02', 22, 'dianprincea@gmail.com'),
('CST2604775','Evan Wright', '2026/04', 21, 'evanwright@gmail.com'),
('MAT2602408','Fiona Smith', '2026/02', 20, 'fionasmith@gmail.com'),
('CST2602311','George Clark', '2026/02', 21, 'georgeclark@gmail.com'),
('CST2509826','Michelle Tan', '2025/09', 20, 'michelletan@gmail.com'),
('CST2604465','Marcus Cooper', '2026/04', 20, 'marcuscooper@gmail.com'),
('MAT2604820','Heng Lee', '2026/04', 22, 'henglee@gmail.com');

INSERT INTO Assignments (CourseID, StudentID, Score, Grade) VALUES
('MAT209', 'CST2604775', 80.00, 'B'),  
('MAT209', 'MAT2602942', 100.00, 'A'),   
('MAT209', 'CST2604465', 90.00, 'A-'), 
('MAT209', 'CST2604179', 60.00, 'C'),   
('MAT209', 'CST2602311', 70.00, 'B-'),  
('MAT209', 'MAT2509336', 90.00, 'A-'), 
('MAT209', 'MAT2604820', 80.00, 'B'),
('MAT209', 'CST2604532', 90.00, 'A-'),
('MAT209', 'MAT2602408', 90.00, 'A-'), 
('MAT209', 'CST2509826', 90.00, 'A-');  

INSERT INTO Tests (CourseID, StudentID, Score, Grade) VALUES
('MAT209', 'MAT2602408', 60.00, 'C'),     
('MAT209', 'CST2604465',80.00, 'B'),   
('MAT209', 'MAT2509336',60.00, 'C'), 
('MAT209', 'CST2604775',70.00, 'B-'),  
('MAT209', 'CST2509826',90.00, 'A-'),  
('MAT209', 'MAT2602942',100.00, 'A'), 
('MAT209', 'CST2604532',100.00, 'A'),     
('MAT209', 'CST2604179', 90.00, 'A-'), 
('MAT209', 'MAT2604820',90.00, 'A-'),
('MAT209', 'CST2602311',80.00, 'B');  

INSERT INTO StudentEvaluations (CourseID, StudentID, SatisfactionScore, Feedback) VALUES
('MAT209', 'CST2604179', 3, 'The lessons are engaging, but I struggle a bit with the algebra equations.'),
('MAT209', 'CST2604532', 5, 'Loved the class! The professor breaks down complex mathematical theorems perfectly.'),
('MAT209', 'MAT2604820', 4, 'The teacher explains everything clearly. The math exercises are very challenging yet fun.'),
('MAT209', 'CST2602311', 4, 'I really enjoyed the class. The practical examples made abstract math easier to visualize.'),
('MAT209', 'CST2509826', 4, 'Good pace, clear explanations, and the weekly review helps a lot in understanding the formulas.'),
('MAT209', 'MAT2602408', 3, 'Interesting topics, but it requires a lot of self-study after class to fully understand.'),
('MAT209', 'CST2604775', 5, 'I fully understand all the explanations given by the teacher. Great formulas walkthroughs!'),
('MAT209', 'MAT2509336', 5, 'Perfect teaching speed. The lectures are highly engaging and well-structured.'),
('MAT209', 'CST2604465', 5, 'Excellent teacher! The step-by-step math problem solving was very easy to follow.'),
('MAT209', 'MAT2602942', 5, 'Really enjoyed how the teacher taught and I understand all topics');
GO