-- VIEW: Create a reusable view for the public course catalog
CREATE VIEW "CourseCatalog" AS
SELECT "Courses"."courseNumber", "Courses"."courseName", "Departments"."departmentName"
FROM "Courses"
JOIN "Departments" ON "Courses"."departmentID" = "Departments"."id";
