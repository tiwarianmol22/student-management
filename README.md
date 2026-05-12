# Student Management System - Setup Instructions

## Project Overview
This is a simple Student Management System built using:
- **Servlets** - For handling HTTP requests
- **JSP** - For presentation layer
- **JDBC** - For database connectivity
- **Apache Tomcat 9** - Application server
- **MySQL** - Database

## Prerequisites
1. Apache Tomcat 9 (already downloaded)
2. MySQL Server
3. MySQL JDBC Driver (mysql-connector-java-x.x.x.jar)
4. Java Development Kit (JDK 8 or higher)

## Setup Steps

### Step 1: Database Setup
1. Open MySQL command line or MySQL Workbench
2. Run the commands from `database_setup.sql`:
   ```sql
   CREATE DATABASE student_db;
   USE student_db;
   CREATE TABLE students (
       roll_no INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(100) NOT NULL UNIQUE,
       phone VARCHAR(15) NOT NULL,
       course VARCHAR(50) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   ```

### Step 2: Configure MySQL Credentials
Update the following in `src/com/student/servlet/StudentDAO.java`:
- `jdbcURL`: jdbc:mysql://localhost:3306/student_db
- `jdbcUsername`: root (or your MySQL username)
- `jdbcPassword`: "" (your MySQL password)

### Step 3: Copy MySQL JDBC Driver
1. Download: mysql-connector-java (version 8.x or 9.x)
2. Copy the JAR file to: `WebContent/WEB-INF/lib/`

### Step 4: Create WAR file or Deploy
**Option A: Using Command Line**
```bash
cd StudentManagementSystem
jar -cvf StudentManagementSystem.war -C WebContent .
cp StudentManagementSystem.war $TOMCAT_HOME/webapps/
```

**Option B: Using Eclipse**
1. Right-click on project → Run As → Run on Server
2. Select Tomcat 9 server
3. Click Finish

### Step 5: Access the Application
Open your browser and navigate to:
```
http://localhost:8080/StudentManagementSystem/
```

## Project Structure
```
StudentManagementSystem/
├── src/
│   └── com/student/servlet/
│       ├── Student.java           (Model class)
│       ├── StudentDAO.java         (Database operations)
│       └── StudentServlet.java     (Request handler)
├── WebContent/
│   ├── index.jsp                 (Home page)
│   ├── JSP/
│   │   ├── list.jsp              (Display all students)
│   │   └── form.jsp              (Add/Edit student form)
│   └── WEB-INF/
│       ├── web.xml               (Configuration)
│       └── lib/
│           └── mysql-connector-java-x.x.jar
└── database_setup.sql            (Database initialization)
```

## Features
1. **View Students** - Display all students in a table
2. **Add Student** - Add new student with form validation
3. **Edit Student** - Update student information
4. **Delete Student** - Remove student records with confirmation

## Servlet Methods
- **doGet()** - Handles: list, add form, edit form, delete operations
- **doPost()** - Handles: insert, update operations

## Database Operations
The StudentDAO class implements:
- `insertStudent()` - Add new student
- `selectAllStudents()` - Get all students
- `selectStudent()` - Get specific student by roll number
- `updateStudent()` - Update student details
- `deleteStudent()` - Delete student record

## Troubleshooting

**Issue: Class not found: com.mysql.cj.jdbc.Driver**
- Solution: Add mysql-connector-java JAR to WEB-INF/lib/

**Issue: Cannot connect to MySQL**
- Solution: Check MySQL credentials in StudentDAO.java
- Solution: Ensure MySQL server is running
- Solution: Verify database and table exist

**Issue: Form not submitting**
- Solution: Check StudentServlet routing in web.xml
- Solution: Verify JSP form action attribute

## Additional Notes
- The application uses auto-increment for Roll No
- Email field has unique constraint
- All fields are required in the form
- Bootstrap CSS can be added for better styling (optional)
