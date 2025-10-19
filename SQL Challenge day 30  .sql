CREATE DATABASE University;
USE University;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    course VARCHAR(50),
    gpa DECIMAL(3,2),
    email VARCHAR(100)
);

INSERT INTO Students (student_name, department, course, gpa, email)
VALUES
('Alice', 'Computer Science', 'CS101', 3.8, 'alice@gmail.com'),
('Bob', 'Computer Science', 'CS102', 3.4, NULL),
('Charlie', 'Mechanical', 'ME201', 3.2, 'charlie@gmail.com'),
('David', 'Electrical', 'EE101', 2.9, NULL),
('Ella', 'Mechanical', 'ME202', 3.7, 'ella@gmail.com'),
('Frank', 'Civil', 'CE101', 3.5, NULL);

-- DISTINCT & WHERE
SELECT DISTINCT department
FROM Students;

-- IS NULL & NOT NULL
SELECT student_name, department
FROM Students
WHERE email IS NULL;
SELECT student_name, department, email
FROM Students
WHERE email IS NOT NULL;

-- IN, BETWEEN, NOT BETWEEN
SELECT student_name, course
FROM Students
WHERE course IN ('CS101', 'ME201', 'EE101');
SELECT student_name, gpa
FROM Students
WHERE gpa BETWEEN 3.0 AND 3.7;
SELECT student_name, gpa
FROM Students
WHERE gpa NOT BETWEEN 3.0 AND 3.7;
