/*USE MASTER
GO

IF NOT EXISTS (
    SELECT [name]
    FROM sys.databases
    WHERE [name] = N'StudentExercises'
)
CREATE DATABASE StudentExercises
GO

USE StudentExercises
GO*/

DROP TABLE IF EXISTS StudentExercise;

DROP TABLE IF EXISTS Student;

DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Cohort;

DROP TABLE IF EXISTS Exercise;


CREATE TABLE Cohort (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name VARCHAR(55) NOT NULL
);

CREATE TABLE Student (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    FirstName VARCHAR(55) NOT NULL,
    LastName VARCHAR(55) NOT NULL,
    SlackHandle VARCHAR(55) NOT NULL,
    CohortId INT NOT NULL,
    CONSTRAINT FK_CohortId FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Instructor (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    FirstName VARCHAR(55) NOT NULL,
    LastName VARCHAR(55) NOT NULL,
    SlackHandle VARCHAR(55) NOT NULL,
    CohortId INT,
    Specialty VARCHAR(55),
    CONSTRAINT FK_CohortIdInstructor FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Exercise (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name VARCHAR(55) NOT NULL,
    Language VARCHAR(55) NOT NULL
);

CREATE TABLE StudentExercise (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    StudentId INT NOT NULL,
    ExerciseId INT NOT NULL,
    CONSTRAINT FK_StudentId FOREIGN KEY(StudentId) REFERENCES Student(Id),
    CONSTRAINT FK_ExerciseId FOREIGN KEY(ExerciseId) REFERENCES Exercise(Id)
);

-- create cohorts
INSERT INTO Cohort (Name) VALUES ('c29');
INSERT INTO Cohort (Name) VALUES ('c31');
INSERT INTO Cohort (Name) VALUES ('c26');

-- create students
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Nick','Hansen', 'Nick', 1);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Rose','Witzosky', 'rose', 2);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Meag','Mueller', 'meag', 2);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Natasha','Cox', 'ncox', 3);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('William','Kimball', 'willkill', 3);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Mary','Remo', 'mary', 1);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Ashwin','Prakash', 'ash', 1);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Robert','Leedy', 'robert', 3);
INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Jameka','Echols', 'jameka', 2);

-- create instructors
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Jisie', 'Davis', 'jisie', 3, 'Ruby');
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Andy', 'Collins', 'askingalot', 1, 'C#');
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Steve', 'Brownlee', 'coach', 2, 'Full Stack');
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Joe', 'Shepherd', 'joe', 2, 'Python');
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Leah', 'Hoefling', 'leah', 3, 'C#');
INSERT INTO Instructor (FirstName, LastName, SlackHandle, CohortId, Specialty) VALUES ('Madi', 'Peper', 'Madi', 3, 'JavaScript');

-- create exercises
INSERT INTO Exercise (Name, Language) VALUES ('Chicken Monkey', 'JavaScript');
INSERT INTO Exercise (Name, Language) VALUES ('Planets', 'C#');
INSERT INTO Exercise (Name, Language) VALUES ('Kennel', 'React');
INSERT INTO Exercise (Name, Language) VALUES ('Legos', 'JavaScript');
INSERT INTO Exercise (Name, Language) VALUES ('Stocks', 'C#');

-- create student's exercises
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (1,3);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (1,2);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (2,1);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (2,4);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (3,5);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (3,1);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (4,2);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (4,3);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (5,1);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (5,4);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (6,2);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (6,3);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (7,2);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (7,5);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (8,1);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (8,4);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (9,3);
INSERT INTO  StudentExercise (StudentId, ExerciseId) VALUES (9,5);



SELECT s.Id,
                                s.FirstName,
                                s.LastName,
                                s.SlackHandle,
                                s.CohortId,
                                se.ExerciseId
                            FROM Student s
                            LEFT JOIN StudentExercise se on s.Id = se.StudentId
                            WHERE s.Id= 2;