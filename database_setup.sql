-- Create Database
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

-- Create Students Table
CREATE TABLE IF NOT EXISTS students (
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
