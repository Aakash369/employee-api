-- Create and use the database
CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- Create employee table
CREATE TABLE IF NOT EXISTS employee (
                                        employee_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    tax DOUBLE NOT NULL DEFAULT 0.0
    );

-- Insert dummy data
INSERT INTO employee VALUES ('EMP001', 'Aarav Sharma', 'Sector 21, Dwarka, New Delhi', '1992-03-15', 75000.00, 8.0);
INSERT INTO employee VALUES ('EMP002', 'Priya Patel', 'Koramangala, Bangalore, Karnataka', '1995-07-22', 82000.00, 8.0);
INSERT INTO employee VALUES ('EMP003', 'Rohit Verma', 'Andheri West, Mumbai, Maharashtra', '1990-11-03', 90000.00, 8.0);
INSERT INTO employee VALUES ('EMP004', 'Sneha Reddy', 'Banjara Hills, Hyderabad, Telangana', '1988-02-28', 68000.00, 8.0);
INSERT INTO employee VALUES ('EMP005', 'Karan Mehta', 'Salt Lake City, Kolkata, West Bengal', '1993-09-10', 95000.00, 8.0);