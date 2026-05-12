# Manual Compilation and Deployment Guide

## Prerequisites
- Java Development Kit (JDK) 8 or higher installed
- Apache Tomcat 9 downloaded
- MySQL Server installed and running
- MySQL JDBC driver (mysql-connector-java-x.x.x.jar)

## Step 1: Compile Java Classes (Manual Method)

### On Mac/Linux/Unix:
```bash
cd StudentManagementSystem

# Create output directory
mkdir -p build/classes

# Compile all Java files
javac -d build/classes \
    src/com/student/servlet/Student.java \
    src/com/student/servlet/StudentDAO.java \
    src/com/student/servlet/StudentServlet.java
```

### On Windows (Command Prompt):
```cmd
cd StudentManagementSystem

REM Create output directory
mkdir build\classes

REM Compile all Java files
javac -d build\classes ^
    src\com\student\servlet\Student.java ^
    src\com\student\servlet\StudentDAO.java ^
    src\com\student\servlet\StudentServlet.java
```

## Step 2: Create Directory Structure in Tomcat

### On Mac/Linux/Unix:
```bash
# Assuming TOMCAT_HOME is your Tomcat installation directory
export TOMCAT_HOME=/path/to/apache-tomcat-9.x.x

# Create application directory
mkdir -p $TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/classes
mkdir -p $TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/lib
mkdir -p $TOMCAT_HOME/webapps/StudentManagementSystem/JSP
```

### On Windows:
```cmd
REM Set your Tomcat location
set TOMCAT_HOME=C:\apache-tomcat-9.x.x

REM Create directories
mkdir %TOMCAT_HOME%\webapps\StudentManagementSystem\WEB-INF\classes
mkdir %TOMCAT_HOME%\webapps\StudentManagementSystem\WEB-INF\lib
mkdir %TOMCAT_HOME%\webapps\StudentManagementSystem\JSP
```

## Step 3: Copy Compiled Classes

### On Mac/Linux/Unix:
```bash
# Copy compiled classes to Tomcat
cp -r build/classes/* $TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/classes/
```

### On Windows:
```cmd
REM Copy compiled classes to Tomcat
xcopy /E /I /Y build\classes %TOMCAT_HOME%\webapps\StudentManagementSystem\WEB-INF\classes\
```

## Step 4: Copy JSP Files and Configuration

### On Mac/Linux/Unix:
```bash
# Copy JSP files
cp WebContent/index.jsp $TOMCAT_HOME/webapps/StudentManagementSystem/
cp WebContent/JSP/*.jsp $TOMCAT_HOME/webapps/StudentManagementSystem/JSP/

# Copy web.xml
cp WebContent/WEB-INF/web.xml $TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/
```

### On Windows:
```cmd
REM Copy JSP files
copy WebContent\index.jsp %TOMCAT_HOME%\webapps\StudentManagementSystem\
xcopy /E /I /Y WebContent\JSP %TOMCAT_HOME%\webapps\StudentManagementSystem\JSP\

REM Copy web.xml
copy WebContent\WEB-INF\web.xml %TOMCAT_HOME%\webapps\StudentManagementSystem\WEB-INF\
```

## Step 5: Copy MySQL JDBC Driver

### Download:
Visit: https://dev.mysql.com/downloads/connector/j/
Download: mysql-connector-java-x.x.x.jar (version 8.x or 9.x)

### Copy to Tomcat:
```bash
# On Mac/Linux/Unix
cp mysql-connector-java-x.x.x.jar $TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/lib/

# On Windows
copy mysql-connector-java-x.x.x.jar %TOMCAT_HOME%\webapps\StudentManagementSystem\WEB-INF\lib\
```

## Step 6: Database Setup

### Create Database in MySQL:
```sql
-- Login to MySQL
mysql -u root -p

-- Run these commands:
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

-- Insert sample data (optional)
INSERT INTO students (name, email, phone, course) VALUES
('Arjun Singh', 'arjun@example.com', '9876543210', 'B.Tech'),
('Priya Sharma', 'priya@example.com', '9876543211', 'B.Tech'),
('Rajesh Kumar', 'rajesh@example.com', '9876543212', 'M.Tech');
```

## Step 7: Update Database Credentials

Edit: `$TOMCAT_HOME/webapps/StudentManagementSystem/WEB-INF/classes/com/student/servlet/StudentDAO.class`

Or better: Update source and recompile:
Edit: `src/com/student/servlet/StudentDAO.java`

```java
private String jdbcURL = "jdbc:mysql://localhost:3306/student_db";
private String jdbcUsername = "root";      // Your MySQL username
private String jdbcPassword = "";          // Your MySQL password (if any)
```

## Step 8: Start Tomcat

### On Mac/Linux/Unix:
```bash
# Make startup script executable (first time only)
chmod +x $TOMCAT_HOME/bin/startup.sh

# Start Tomcat
$TOMCAT_HOME/bin/startup.sh

# View logs (optional)
tail -f $TOMCAT_HOME/logs/catalina.out
```

### On Windows:
```cmd
REM Start Tomcat
%TOMCAT_HOME%\bin\startup.bat

REM Or double-click: startup.bat file directly
```

## Step 9: Access the Application

Open your web browser and navigate to:
```
http://localhost:8080/StudentManagementSystem/
```

You should see the home page with options to view and manage students.

---

## Final Directory Structure (After Deployment)

```
apache-tomcat-9.x.x/webapps/StudentManagementSystem/
│
├── index.jsp
│
├── JSP/
│   ├── list.jsp
│   └── form.jsp
│
└── WEB-INF/
    ├── web.xml
    ├── classes/
    │   └── com/student/servlet/
    │       ├── Student.class
    │       ├── StudentDAO.class
    │       └── StudentServlet.class
    │
    └── lib/
        └── mysql-connector-java-x.x.x.jar
```

---

## Verification Checklist

- [ ] Tomcat is running (check: http://localhost:8080)
- [ ] MySQL is running and student_db exists
- [ ] All Java classes compiled to .class files
- [ ] MySQL JDBC driver in WEB-INF/lib/
- [ ] JSP files in correct locations
- [ ] web.xml in WEB-INF/
- [ ] Database credentials updated
- [ ] Can access http://localhost:8080/StudentManagementSystem/

---

## Stopping Tomcat

### On Mac/Linux/Unix:
```bash
$TOMCAT_HOME/bin/shutdown.sh
```

### On Windows:
```cmd
%TOMCAT_HOME%\bin\shutdown.bat
```

---

## Common Errors and Solutions

### Error: "JDBC Driver not found"
- **Solution:** Ensure mysql-connector-java JAR is in WEB-INF/lib/
- Restart Tomcat after adding JAR

### Error: "Connection refused"
- **Solution:** Check MySQL is running
- Verify credentials in StudentDAO.java
- Check database 'student_db' exists

### Error: "404 Page Not Found"
- **Solution:** Check URL: http://localhost:8080/StudentManagementSystem/
- Verify files deployed to correct directory
- Restart Tomcat

### Error: "Cannot compile" (javac not found)
- **Solution:** Set JAVA_HOME environment variable
- Add %JAVA_HOME%\bin to PATH (Windows)
- Or use full path: /usr/libexec/java_home/bin/javac (Mac)

---

## For Eclipse IDE Users

If you prefer using Eclipse:

1. File → New → Dynamic Web Project
2. Project Name: StudentManagementSystem
3. Right-click → Properties → Project Facets
4. Convert to faceted form → Dynamic Web Module 3.1
5. Copy source files into project
6. Right-click → Run As → Run on Server
7. Select Tomcat 9 server

---

**Your application is now ready to run!**
