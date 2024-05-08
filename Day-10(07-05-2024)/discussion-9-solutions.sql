
#Aggregate Functions - hr database .

#Queries

--vailable in the employees table.
 SELECT COUNT(DISTINCT JOB_ID) FROM employees;

--Write a query to get the total salaries payable to employees.
 SELECT SUM(SALARY)FROM EMPLOYEES;

--Write a query to get the minimum salary from the employees table.
SELECT MIN(SALARY)FROM EMPLOYEES;

--Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(SALARY)FROM EMPLOYEES INNER JOIN JOBS USING(JOB_ID)  WHERE JOB_TITLE = 'Programmer';

--Write a query to get the average salary and number of employees working in department 90.
SELECT AVG(SALARY) AS AVERAGE, COUNT(*) AS TOTAL FROM EMPLOYEES WHERE DEPARTMENT_ID = '90';

--Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(SALARY) AS MAX ,MIN(SALARY) AS MIN ,SUM(SALARY) AS TOTAL ,AVG(SALARY) AS AVERAGE FROM EMPLOYEES;

--Write a query to get the number of employees with the same job.
SELECT JOB_ID, COUNT(*) AS TOTAL FROM EMPLOYEES GROUP BY JOB_ID;

--Write a query to get the difference between the highest and lowest salaries.
SELECT (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE FROM EMPLOYEES ;

--Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT MANAGER_ID, MIN(SALARY) AS LOWESTSALARY FROM EMPLOYEES GROUP BY MANAGER_ID;

--Write a query to get the department ID and the total salary payable in each department.
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--Write a query to get the average salary for each job ID excluding programmer.
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES INNER JOIN JOBS  USING(JOB_ID) WHERE JOB_TITLE = "Programmer" GROUP BY  JOB_ID;

--Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT JOB_ID, SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 90 GROUP  BY JOB_ID;

--Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JOB_ID, MAX(SALARY) AS SALARY FROM EMPLOYEES WHERE SALARY >= 4000 GROUP BY JOB_ID;

--Write a query to get the average salary for all departments employing more than 10 employees.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(DEPARTMENT_ID) > 10
