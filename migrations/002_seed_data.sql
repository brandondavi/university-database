-- 002_seed_data.sql
-- Description: Sample data insertion (Min 5 rows per table)

-- 1. independent tables
INSERT INTO "CourseLevels" ("levelName") VALUES
('Lower Division introductory courses'),
('Lower Division intermediate courses'),
('Upper-division courses'),
('Senior courses'),
('Graduate courses'),
('Advanced graduate courses');

INSERT INTO "SectionStatus" ("statusName") VALUES
('Open'),
('Closed'),
('In Progress'),
('Waitlisted'),
('Canceled');

INSERT INTO "Students" ("firstName", "lastName", "email") VALUES
('Joe', 'Smith', 'joesmith5123@gmail.com'),
('Ana', 'OppenHeimer', 'anaopp123@gmail.com'),
('Robert', 'Miles', 'robmi@gmail.com'),
('Ana', 'Grace', 'anagrace12@gmail.com'),
('Joey', 'Cuomo', 'joecuomo@gmail.com');

INSERT INTO "Departments" ("departmentName") VALUES
('Computer Science'),
('Mathematics'),
('Biology'),
('English'),
('Business');

INSERT INTO "Instructors" ("firstName", "lastName", "startDate", "departmentID") VALUES
('John', 'Doe', '2015-08-20', 1), -- cs
('Jane', 'Smith', '2018-01-15', 2), -- math
('Michael', 'Johnson', '2012-09-01', 3), -- biology
('Emily', 'Davis', '2020-08-15', 4), -- eng
('David', 'Wilson', '2019-01-10', 5); -- bus

UPDATE "Departments" SET "headOfDepartmentID" = 1 WHERE "id" = 1;
UPDATE "Departments" SET "headOfDepartmentID" = 2 WHERE "id" = 2;
UPDATE "Departments" SET "headOfDepartmentID" = 3 WHERE "id" = 3;
UPDATE "Departments" SET "headOfDepartmentID" = 4 WHERE "id" = 4;
UPDATE "Departments" SET "headOfDepartmentID" = 5 WHERE "id" = 5;

INSERT INTO "Courses" ("courseNumber", "courseName", "departmentID", "levelID") VALUES
('CS101', 'Introduction to Programming', 1, 1),
('MATH201', 'Calculus I', 2, 2),
('BIO301', 'Advanced Biology', 3, 3),
('ENG401', 'English Composition', 4, 4),
('BUS501', 'Business Management', 5, 5);

INSERT INTO "Sections" ("sectionNumber", "semester", "year", "courseID", "instructorID", "statusID") VALUES
('01', 'Fall', 2026, 1, 1, 1), -- section 01, fall semester, 2026, CS101, Prof. John Doe, Open
('01', 'Fall', 2026, 2, 2, 1), 
('01', 'Fall', 2026, 3, 3, 1), -- section 01, fall semester, 2026, BIO101, Prof. Johnson, Open
('01', 'Fall', 2026, 4, 4, 2), -- section 01, fall semester, 2026, ENG101, Prof. Davis, Closed
('01', 'Fall', 2026, 5, 5, 2);

INSERT INTO "Staff" ("firstName", "lastName", "startDate", "role") VALUES
('Amanda', 'Taylor', '2021-03-15', 'Academic Advisor'),
('Brian', 'Moore', '2019-11-01', 'Janitorial Worker'),
('Catherine', 'Lee', '2022-06-20', 'Academic Advisor'),
('Daniel', 'Clark', '2018-02-10', 'Facilities Manager'),
('Evelyn', 'Hall', '2020-09-05', 'University Registrar');

INSERT INTO "Payroll" ("id", "salary", "payPeriod") VALUES
(1, 55000.00, 'Monthly'), -- Payroll.id = 1, 55000 annual salary, paid monthly
(2, 62000.00, 'Bi-Weekly'),
(3, 48000.00, 'Bi-Weekly'),
(4, 58000.00, 'Monthly'),
(5, 75000.00, 'Monthly');

INSERT INTO "Enrollments" ("studentID", "sectionID", "enrollmentDate") VALUES
(1, 1, '2025-08-01'), -- Student 1 enrolled in Section with unique ID 1 (not section number)
(2, 1, '2025-08-02'),
(3, 2, '2025-08-05'),
(4, 3, '2025-08-10'),
(5, 5, '2025-01-15');