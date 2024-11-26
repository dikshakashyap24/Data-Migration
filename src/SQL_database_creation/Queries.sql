--QUERY-1 Fetching all students enrolled in a specific course
SELECT s.student_id, s.student_name, s.email, s.dob, s.phone
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 'CSE101';

--QUERY-2 Calculating the average number of students enrolled in courses offered by a particular instructor
SELECT AVG(student_count) AS avg_students
FROM (
    SELECT e.course_id, COUNT(e.student_id) AS student_count
    FROM enrollments e
    WHERE e.instructor_id = 'MEC001'
    GROUP BY e.course_id
) AS course_enrollments;

--QUERY-3 Listing all courses offered by a specific department
SELECT c.course_id, c.course_name, c.credits, c.category
FROM courses c
WHERE c.department_id = 'CSE';

--QUERY-4 Finding the total number of students per department
SELECT d.department_name, COUNT(DISTINCT s.student_id) AS total_students
FROM department d
JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name;

--QUERY-5 Finding instructors who have taught all the BTech CSE core courses:
SELECT i.instructor_id, i.instructor_name
FROM instructors i
WHERE i.department_id = 'CSE' AND NOT EXISTS (
    SELECT c.course_id
    FROM courses c
    WHERE c.department_id = 'CSE' AND c.category = 'Core'
    EXCEPT
    SELECT e.course_id
    FROM enrollments e
    WHERE e.instructor_id = i.instructor_id
);

--QUERY-6 Finding the top-10 courses with the highest enrollments
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_enrollments
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_enrollments DESC
LIMIT 10;
