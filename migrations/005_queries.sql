-- READ 1: List all 'Open' sections and the professor teaching them
SELECT "Courses"."courseName", "Sections"."sectionNumber", "Instructors"."lastName" AS "Professor"
FROM "Sections"
JOIN "Courses" ON "Sections"."courseID" = "Courses"."id"
JOIN "SectionStatus" ON "Sections"."statusID" = "SectionStatus"."id"
JOIN "Instructors" ON "Sections"."instructorID" = "Instructors"."id"
WHERE "SectionStatus"."statusName" = 'Open';

-- READ 2: create a table with student's first name, section of enrollment
SELECT "Students"."firstName", "Enrollments"."sectionID" 
FROM "Students" 
JOIN "Enrollments" ON "Students"."id" = "Enrollments"."studentID";

-- READ 3: List Students first name, course name, and section number, where firstName is 'joe
SELECT "Students"."firstName", "Courses","courseName", "Sections"."sectionNumber"
FROM "Students"
JOIN "Enrollments" ON "Students"."id" = "Enrollments"."studentID"
JOIN "Sections" ON "Enrollments"."sectionID" = "Sections"."id"
JOIN "Courses" ON "Sections"."courseID" = "Courses"."id"
WHERE "Students"."firstName" = 'Joe';

-- READ 4: Count the total number of students enrolled in each section
SELECT "Courses"."courseName", "Sections"."sectionNumber", COUNT("Enrollments"."studentID") AS "totalStudents"
FROM "Sections"
JOIN "Courses" ON "Sections"."courseID" = "Courses"."id"
LEFT JOIN "Enrollments" ON "Sections"."id" = "Enrollments"."sectionID"
GROUP BY "Courses"."courseName", "Sections"."sectionNumber", "Sections"."id";

-- READ 5: Show staff names alongside their salaries (1:1 JOIN)
SELECT "Staff"."firstName", "Staff"."lastName", "Payroll"."salary"
FROM "Staff"
JOIN "Payroll" ON "Staff"."id" = "Payroll"."id";

-- READ 6: Show department names and their head instructor's last name
SELECT "Departments"."departmentName", "Instructors"."lastName" AS "Head_Instructor"
FROM "Departments"
JOIN "Instructors" ON "Departments"."headOfDepartmentID" = "Instructors"."id";

-- UPDATE 1: Change a student's email address
UPDATE "Students" 
SET "email" = 'joe.newemail@example.com' 
WHERE "id" = 1;

-- UPDATE 2: Give a staff member a raise
UPDATE "Payroll" 
SET "salary" = 65000.00 
WHERE "id" = 2;

-- UPDATE 3: Change a section's status to 'Closed' (statusID = 2)
UPDATE "Sections" 
SET "statusID" = 2 
WHERE "id" = 1;

-- UPDATE 4: Promote a staff member to a new role
UPDATE "Staff" 
SET "role" = 'Senior Academic Advisor' 
WHERE "id" = 1;

-- UPDATE 5: Correct a course name
UPDATE "Courses" 
SET "courseName" = 'Intro to Computer Programming' 
WHERE "id" = 1;

-- UPDATE 6: Reassign a section to a different instructor
UPDATE "Sections" 
SET "instructorID" = 2 
WHERE "id" = 3;

-- DELETE 1: A student drops a specific class (Safe to delete leaf data)
DELETE FROM "Enrollments" 
WHERE "studentID" = 1 AND "sectionID" = 1;

-- DELETE 2: Student 5 drops out entirely (Clear their enrollments first)
DELETE FROM "Enrollments" 
WHERE "studentID" = 5;

-- DELETE 3: Now safe to delete Student 5 from the system
DELETE FROM "Students" 
WHERE "id" = 5;

-- DELETE 4: Remove a canceled section (Section 5)
DELETE FROM "Sections" 
WHERE "id" = 5;

-- DELETE 5: Remove a resigning staff member's payroll record first
DELETE FROM "Payroll" 
WHERE "id" = 5;

-- DELETE 6: Now safe to delete the resigning staff member
DELETE FROM "Staff" 
WHERE "id" = 5;

