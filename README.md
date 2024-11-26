# Porting RDBMS to MongoDB and querying using Apache Spark

## Project Overview
This project demonstrates the process of migrating a relational database schema (PostgreSQL) to a NoSQL schema (MongoDB). It covers schema design, data migration using the ETL process, and performance optimization.

## Repository Structure
<ol>
<li><b>/docs</b>: Detailed documentation and diagrams.</li>
<li><b>/src</b>: Python scripts for ETL and query optimization.</li>
<li><b>/data</b>: Sample datasets used for migration and validation.</li>
<li><b>/tests</b>: Scripts for data consistency checks.</li>
</ol>

## Relational Schema Design
The relational schema was implemented in PostgreSQL with the following tables:
1. **Students**
2. **Departments**
3. **Courses**
4. **Instructors**
5. **Enrollments**

## MongoDB Schema Design
The MongoDB schema employs denormalization and embedding to optimize read-heavy operations. Key collections include:
1. **Students**
   - Embedded enrollments array for academic records.
2. **Departments**
   - Embedded courses array for department-level queries.
3. **Instructors**
   - Embedded courses_taught array for teaching history.

## ETL Process
The migration was executed using a structured ETL pipeline:
1. **Extraction:** Data extracted from PostgreSQL using `psycopg2`.
2. **Transformation:** Data reshaped for MongoDB compatibility:
   - Embedded relationships.
   - Denormalized structures.
   - Data cleaning.
3. **Loading:** Transformed data loaded into MongoDB using `pymongo`.

## Performance Optimization
- **Indexing:** Optimized for frequent query patterns.
  - `Students`: Indexed on `enrollments.course_id` and `department_id`.
  - `Instructors`: Indexed on `courses_taught.course_id`.
  - `Departments`: Indexed on `courses.course_id` and `department_name`.
- **Query Optimization:** Improved query performance by leveraging field selection, caching, and broadcast joins.

## Results and Validation
Post-migration query time wascomparing query results from PostgreSQL and MongoDB. Performance enhancements were tested through real-world query scenarios.

## Tools and Libraries
- **PostgreSQL**
- **MongoDB**
- **Python Libraries:**
  - `psycopg2` for data extraction.
  - `pandas` for data transformation.
  - `pymongo` for data loading.
