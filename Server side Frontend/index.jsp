<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student Management System - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            max-width: 500px;
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 16px;
        }
        .features {
            text-align: left;
            margin: 30px 0;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            border-left: 4px solid #667eea;
        }
        .features h3 {
            color: #667eea;
            margin-top: 0;
        }
        .features ul {
            list-style-position: inside;
            color: #555;
            line-height: 1.8;
        }
        .features li {
            margin-bottom: 8px;
        }
        .btn-group {
            margin-top: 30px;
        }
        a.btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        a.btn:hover {
            background-color: #764ba2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Management System</h1>
        <p class="subtitle">Manage your student records efficiently</p>
        
        <div class="features">
            <h3>Features:</h3>
            <ul>
                <li>Add new student records</li>
                <li>View all students</li>
                <li>Edit student information</li>
                <li>Delete student records</li>
                <li>Database connectivity using JDBC</li>
            </ul>
        </div>
        
        <div class="btn-group">
            <a href="StudentServlet" class="btn">View Students</a>
            <a href="StudentServlet?action=add" class="btn">Add Student</a>
        </div>
    </div>
</body>
</html>
