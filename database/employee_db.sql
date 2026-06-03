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
INSERT INTO employee VALUES ('EMP001', 'Alice Johnson', '123 Main St, Dallas, TX', '1990-04-15', 75000.00, 8.0);
INSERT INTO employee VALUES ('EMP002', 'Bob Smith', '456 Oak Ave, Austin, TX', '1985-07-22', 82000.00, 8.0);
INSERT INTO employee VALUES ('EMP003', 'Carol White', '789 Pine Rd, Houston, TX', '1992-11-03', 90000.00, 8.0);
INSERT INTO employee VALUES ('EMP004', 'David Brown', '321 Elm St, San Antonio, TX', '1988-02-28', 68000.00, 8.0);
INSERT INTO employee VALUES ('EMP005', 'Eva Martinez', '654 Maple Dr, Fort Worth, TX', '1995-09-10', 95000.00, 8.0);