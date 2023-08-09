-- Drop table
DROP TABLE IF EXISTS Department CASCADE;
DROP TABLE IF EXISTS Employee CASCADE;

-- Create the Department table
CREATE TABLE IF NOT EXISTS Department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Insert dummy values into the Department table
INSERT INTO Department (department_name, location)
VALUES
    ('Engineering', 'New York'),
    ('Sales', 'San Francisco'),
    ('Marketing', 'Chicago'),
    ('Human Resources', 'Los Angeles');

-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    department_id INTEGER NOT NULL REFERENCES Department(department_id),
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL
);

-- Insert dummy values into the Employee table
INSERT INTO Employee (first_name, last_name, job_title, department_id, hire_date, salary)
VALUES
    ('John', 'Doe', 'Software Engineer', 1, '2023-01-15', 75000),
    ('Jane', 'Smith', 'Sales Manager', 2, '2022-12-01', 90000),
    ('Michael', 'Johnson', 'Marketing Specialist', 3, '2023-02-20', 60000),
    ('Emily', 'Williams', 'HR Coordinator', 4, '2023-03-10', 55000),
    ('David', 'Brown', 'Software Engineer', 1, '2023-04-05', 80000),
    ('Sarah', 'Miller', 'Sales Representative', 2, '2023-05-22', 65000),
    ('Andrew', 'Taylor', 'Marketing Analyst', 3, '2023-06-17', 58000),
    ('Jessica', 'Wilson', 'Software Engineer', 1, '2023-07-10', 72000),
    ('Ryan', 'Davis', 'Sales Representative', 2, '2023-08-15', 63000),
    ('Olivia', 'Martinez', 'Marketing Specialist', 3, '2023-09-23', 62000),
    ('William', 'Anderson', 'HR Manager', 4, '2023-10-05', 80000),
    ('Sophia', 'Thomas', 'Software Engineer', 1, '2023-11-08', 78000),
    ('Daniel', 'Rodriguez', 'Sales Manager', 2, '2023-12-14', 95000),
    ('Ava', 'Garcia', 'Marketing Analyst', 3, '2024-01-02', 59000),
    ('James', 'Hernandez', 'Sales Representative', 2, '2024-02-20', 67000),
    ('Mia', 'Lopez', 'Software Engineer', 1, '2024-03-18', 77000),
    ('Benjamin', 'Turner', 'Marketing Specialist', 3, '2024-04-10', 60000),
    ('Evelyn', 'Parker', 'HR Coordinator', 4, '2024-05-25', 56000),
    ('Alexander', 'Gonzalez', 'Software Engineer', 1, '2024-06-12', 79000),
    ('Chloe', 'Moore', 'Sales Representative', 2, '2024-07-09', 64000);
