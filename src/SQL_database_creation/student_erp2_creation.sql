CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY, 
    student_name VARCHAR(255) NOT NULL, 
    email VARCHAR(255), 
    dob DATE, 
    phone VARCHAR(15),
	admission_year INT,
    gender TEXT,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE department (
    department_id VARCHAR(10) PRIMARY KEY, 
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
    course_id VARCHAR(6) PRIMARY KEY, 
    course_name VARCHAR(255) NOT NULL, 
    credits INT CHECK (credits IN (2, 4)),
    category VARCHAR(10) CHECK (category IN ('Core', 'Elective')), 
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE instructors (
    instructor_id VARCHAR(10) PRIMARY KEY, 
    instructor_name VARCHAR(255) NOT NULL, 
    email VARCHAR(255), 
    phone VARCHAR(15),
	department_id VARCHAR(10),
	FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(10),
    course_id VARCHAR(6),
	instructor_id VARCHAR(10),
	enrolled_semester INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE SET NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE SET NULL, 
    UNIQUE (student_id, course_id, instructor_id)
);


