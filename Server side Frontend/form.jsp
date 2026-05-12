<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }
        input[type="hidden"] {
            display: none;
        }
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }
        button {
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }
        .submit-btn {
            background-color: #007bff;
            color: white;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
        .cancel-btn {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            padding: 10px 30px;
            display: inline-block;
        }
        .cancel-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            com.student.servlet.Student student = 
                (com.student.servlet.Student) request.getAttribute("student");
            
            String formTitle = (student == null) ? "Add New Student" : "Edit Student";
            String action = (student == null) ? "insert" : "update";
        %>
        <h1><%= formTitle %></h1>
        
        <form action="StudentServlet" method="POST">
            <input type="hidden" name="action" value="<%= action %>">
            
            <% if(student != null) { %>
            <input type="hidden" name="rollNo" value="<%= student.getRollNo() %>">
            <div class="form-group">
                <label for="rollNo">Roll No:</label>
                <input type="text" id="rollNo" name="rollNo" value="<%= student.getRollNo() %>" readonly>
            </div>
            <% } %>
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= (student != null) ? student.getName() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= (student != null) ? student.getEmail() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="<%= (student != null) ? student.getPhone() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="course">Course:</label>
                <select id="course" name="course" required>
                    <option value="">Select a Course</option>
                    <option value="B.Tech" <%= (student != null && "B.Tech".equals(student.getCourse())) ? "selected" : "" %>>B.Tech</option>
                    <option value="M.Tech" <%= (student != null && "M.Tech".equals(student.getCourse())) ? "selected" : "" %>>M.Tech</option>
                    <option value="BCA" <%= (student != null && "BCA".equals(student.getCourse())) ? "selected" : "" %>>BCA</option>
                    <option value="MCA" <%= (student != null && "MCA".equals(student.getCourse())) ? "selected" : "" %>>MCA</option>
                    <option value="B.Sc" <%= (student != null && "B.Sc".equals(student.getCourse())) ? "selected" : "" %>>B.Sc</option>
                </select>
            </div>
            
            <div class="button-group">
                <button type="submit" class="submit-btn">Save</button>
                <a href="StudentServlet" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
