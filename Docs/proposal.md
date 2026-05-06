Phase 1: Proposal
The proposed university database is designed to address the specific requirements of a university environment. The system will provide access to faculty and staff, with role-based access control to ensure least privilege The system tracks a student's first and last name, email, and student ID. It will track academic departments, its name, department ID, and its respective head of department.  The system will track instructor information, their ID, first and last name, start of employment, and their department.The system will track courses, its course ID, course number, course name, and course ID. The system will track student enrollment of courses, and payroll. The workflow supports faculty and staff by allowing the appropriate roles to manage course offerings, assign instructors, maintain department and course information, and monitor student enrollment in sections.
Scope:
●	The system will store student records
●	The system will manage academic departments and the associated courses
●	The system will store student records and academic information
●	The system will create and maintain course records and course levels
●	The system will record student enrollments in course sections	
●	The system will track salaries, and total hours worked.
●	The system will manage academic departments and their associated courses.
●	The system will store instructor information and department assignments.
●	The system will create and maintain course records and course levels.
●	The system will manage section offerings for each course.
●	The system will assign instructors to specific course sections.
●	The system will track section status information for active, closed, or completed sections.
●	The system will allow faculty and staff to view and update university academic records.
●	The system will support role-based access for faculty and staff users.
UML Overview:
-	Students : studentID, firstName, lastName, email
-	Courses : courseID, courseNumber, courseName, departmentID
-	Sections : sectionID, sectionNumber, semester, year, courseID, instructorID, statusID
-	Departments : departmentID, departmentName, headOfDepartmentID
-	Instructors : instructorID, firstName, lastName, startDate, departmentID
-	Staff : staffID, firstName, lastName, startDate, role
-	Enrollments : enrollmentID, studentID, sectionID, enrollmentDate
-	Payroll : staffID, salary, payPeriod
-	CourseLevels : levelID, levelName
-	SectionStatus : statusID, statusName
Constraints:
-	email must be unique
-	status must be one of {Open, In Progress, Closed}
-	end_date must be after start_date
-	Each student has a unique studentID
-	InstructorID needs to be unique for all instructors
-	A course can’t exist if it’s not assigned to a valid department
-	Section has to reference course and instructor
-	Student can’t be enrolled in the same section more than one time
-	Department needs to have one head of department
-	Course numbers needs to be unique within each department
-	Section meeting times can’t overlap when they have the same instructor
Relationships with Cardinality:
-	Department 1:N Courses
-	Department 1:N Instructors
-	Course 1:N Sections
-	Instructor 1:N Sections
-	Students M:N Sections
-	Staff 1:1 Payroll
-	CourseLevel 1:N Courses
-	SectionStatus 1:N Sections
-	Section M:N Students
 
