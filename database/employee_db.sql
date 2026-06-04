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

-- Insert main employee data
INSERT INTO employee VALUES ('EMP001', 'Aarav Sharma', 'Sector 21, Dwarka, New Delhi', '1992-03-15', 75000.00, 8.0);
INSERT INTO employee VALUES ('EMP002', 'Priya Patel', 'Koramangala, Bangalore, Karnataka', '1995-07-22', 82000.00, 8.0);
INSERT INTO employee VALUES ('EMP003', 'Rohit Verma', 'Andheri West, Mumbai, Maharashtra', '1990-11-03', 90000.00, 8.0);
INSERT INTO employee VALUES ('EMP004', 'Sneha Reddy', 'Banjara Hills, Hyderabad, Telangana', '1988-02-28', 68000.00, 8.0);
INSERT INTO employee VALUES ('EMP005', 'Karan Mehta', 'Salt Lake City, Kolkata, West Bengal', '1993-09-10', 95000.00, 8.0);
INSERT INTO employee VALUES ('EMP006', 'Aakash Sagar', '7421 Frankford rd', '2001-06-04', 0.00, 8.0);

-- Insert eligibility test data
-- Age < 25 (Ineligible - Too Young)
INSERT INTO employee VALUES ('EMP009', 'Young Test', 'Mumbai, Maharashtra', '2005-01-01', 40000.00, 8.0);
-- Age 45-55 (Considerable)
INSERT INTO employee VALUES ('EMP010', 'Mid Test', 'New Delhi', '1975-01-01', 80000.00, 8.0);
-- Age > 55 (Ineligible - Too Old)
INSERT INTO employee VALUES ('EMP011', 'Senior Test', 'Chennai, Tamil Nadu', '1965-01-01', 90000.00, 8.0);