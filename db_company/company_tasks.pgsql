SELECT * FROM employee;
SELECT * FROM department;

--q1: Fetch staff details who are working in Sales and Marketing department and whose salary is more than 60000

SELECT
    (e.first_name||' '||e.last_name) as name,
    d.department_name,
    CASE
        WHEN department_name = 'Marketing'
        THEN 'M'

        WHEN department_name = 'Sales'
        THEN 'S'

    END as Code
FROM
    employee e
    JOIN
    department d
    ON
    e.department_id = d.department_id
WHERE   
    department_name IN ('Sales','Marketing');


-- Syntax rules:
-- 1. Number of columns should be the same
-- 2. UNION ALL displays duplicates
-- 3. UNION deletes deuplicates

SELECT 1 as x, 10 as y
UNION 
SELECT 2,3
UNION
SELECT 2,3
UNION
SELECT 4,5
UNION 
SELECT 6,7;

--q2: Fetch number of employees working in each department sort it in descending order

SELECT  
    department_name,
    COUNT(1) as number_of_employees
    -- MEANING: count number of rows in column 1
    -- Here 1 indicates the column number
    -- * indicates all columns
FROM
    employee e
    JOIN
    department d
    ON e.department_id = d.department_id
GROUP BY
    department_name
-- HAVING
--     COUNT(1) >=5
ORDER BY 
    number_of_employees DESC;

--q3: Fetch the information of employees(Their first and last name, their job title) whose salary is more than 80000 and are working in the Sales department and make sure the department is situated in San Francisco


SELECT
    (first_name||' '||last_name) as name,
    d.department_name,
    e.job_title,
    salary
FROM
    employee e
    JOIN
    department d
    ON
    e.department_id = d.department_id
WHERE 
    e.salary>=80000
    AND
    d.department_name = 'Sales'
    AND
    d.location = 'San Francisco';

--q3: Apply a tax slab of 10% on the salary of employees who are working in the sales department and display their net salary. Make sure they are situated in San Francisco.

SELECT
    (first_name||' '||last_name) as name,
    d.department_name,
    e.job_title,
    ROUND((0.1*salary),0) as tax,
    round((salary-0.1*salary),0) as net_salary
FROM
    employee e
    JOIN
    department d
    ON
    e.department_id = d.department_id
WHERE 
    e.salary>=80000
    AND
    -- BEGIN
    d.department_name = 'Sales'
    AND
    d.location = 'San Francisco';
    -- END


-- ALternate way of writing sub-query
SELECT
    (first_name||' '||last_name) as name,
    d.department_name,
    d.location,
    e.job_title,
    ROUND((0.1*salary),0) as tax,
    cast(round((salary-0.1*salary),2) as INTEGER) as net_salary
FROM
    employee e
    JOIN
    department d
    ON
    e.department_id = d.department_id
WHERE 
    e.salary>=80000
    AND
    -- BEGIN
    e.department_id IN (
        SELECT 
            department_id
        FROM
            department
        WHERE
            department_name = 'Sales'
            AND
            location = 'San Francisco'
    );
    -- END

-- q4: Select name of employees which have 'an' in their namesend
SELECT
    (first_name||' '||last_name) as name
FROM
    employee e
    JOIN
    department d
    ON
    e.department_id = d.department_id
WHERE
    first_name like '%an%';


