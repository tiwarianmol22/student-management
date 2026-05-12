<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        a.btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        a.btn:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions a {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
        }
        .edit-btn:hover {
            background-color: #218838;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Management System</h1>
        <a href="StudentServlet?action=add" class="btn">Add New Student</a>
        
        <% 
            java.util.List<com.student.servlet.Student> students = 
                (java.util.List<com.student.servlet.Student>) request.getAttribute("students");
            
            if(students != null && students.size() > 0) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
        <% 
                for(com.student.servlet.Student student : students) {
        %>
                <tr>
                    <td><%= student.getRollNo() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getPhone() %></td>
                    <td><%= student.getCourse() %></td>
                    <td>
                        <div class="actions">
                            <a href="StudentServlet?action=edit&rollNo=<%= student.getRollNo() %>" class="edit-btn">Edit</a>
                            <a href="StudentServlet?action=delete&rollNo=<%= student.getRollNo() %>" class="delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                        </div>
                    </td>
                </tr>
        <% 
                }
        %>
            </tbody>
        </table>
        <% 
            } else {
        %>
        <div class="no-data">
            <p>No students found. <a href="StudentServlet?action=add">Add a new student</a></p>
        </div>
        <% 
            }
        %>
    </div>
</body>
</html>
