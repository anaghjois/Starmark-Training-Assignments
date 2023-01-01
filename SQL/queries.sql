SELECT e.LASTNAME, e.department_id, d.department_name
	FROM employees e, departments d
	WHERE e.department_id = d.department_id;

SELECT DISTINCT job_id, location_id
	FROM employees, departments
	WHERE employees.department_id = departments.department_id
	AND employees.department_id = 30;

SELECT e.lastname, d.department_name, d.location_id, l.city
	FROM employees e, departments d, locations l
	WHERE e.department_id = d.department_id
	AND
	d.location_id = l.location_id
	AND e.commission_pct IS NOT NULL;

SELECT lastname, department_name
	FROM employees, departments
	WHERE employees.department_id = departments.department_id
	AND lastname LIKE '%a%';

SELECT 	e.lastname, e.job_id, e.department_id,d.department_name
	FROM 	employees e JOIN departments d
	ON 	(e.department_id = d.department_id)
	JOIN 	locations l
	ON 	(d.location_id = l.location_id)
	WHERE 	l.city = 'toronto';

SELECT	 w.lastname "Employee", w.employee_id "EMP#",
	         m.lastname "Manager", m.employee_id "Mgr#"
	FROM     employees w join employees m
	ON       (w.manager_id = m.employee_id);

SELECT w.lastname "Employee", w.employee_id "EMP#",
	m.lastname "Manager", m.employee_id "Mgr#"
	FROM employees w
	LEFT OUTER JOIN employees m
	ON (w.manager_id = m.employee_id);

SELECT e.department_id department, e.lastname employee,
	c.lastname colleague
	FROM employees e JOIN employees c
	ON (e.department_id = c.department_id)
	WHERE e.employee_id != c.employee_id
	ORDER BY e.department_id, e.lastname, c.lastname;

/*SELECT e.lastname, e.job_id, d.department_name,
	e.salary, j.grade_level
	FROM employees e, departments d, job_grades j
	WHERE e.department_id = d.department_id
	AND e.salary BETWEEN j.lowest_sal AND j.highest_sal;*/

SELECT e.lastname, e.hire_date
	FROM employees e, employees davies
	WHERE davies.lastname = 'Davies'
	AND davies.hire_date < e.hire_date

SELECT w.lastname, w.hire_date, m.lastname, m.hire_date
	FROM employees w, employees m
	WHERE w.manager_id = m.employee_id
	AND w.hire_date < m.hire_date;

SELECT MAX(salary) "Maximum",
	MIN(salary) "Minimum",
	SUM(salary) "Sum",
	AVG(salary) "Average"
	FROM employees;

SELECT job_id,MAX(salary) "Maximum",
	MIN(salary) "Minimum",
	SUM(salary) "Sum",
	AVG(salary) "Average"
	FROM employees 
	group by job_id;

SELECT job_id, COUNT(*) Number_of_People
FROM employees
GROUP BY job_id;

SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM employees;

SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;

SELECT manager_id, MIN(salary) Salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

/*SELECT d. dname AS 'department name', d. loc AS 'department location', 
COUNT(*) AS 'Number of People', ROUND(AVG(sal),2) AS 'Salary' FROM dept d INNER JOIN emp e ON d. deptno = e*/

SELECT lastname, hire_date
	FROM employees
	WHERE department_id = (SELECT department_id
	FROM employees
	WHERE lastname = 'Zlotkey')
	AND lastname != 'Zlotkey';

SELECT employee_id, lastname
	FROM employees
	WHERE salary > (SELECT AVG(salary)
			FROM employees)
	ORDER BY salary;

SELECT employee_id, lastname
	FROM employees
	WHERE department_id IN (SELECT department_id
				FROM employees
				WHERE lastname like '%u%');

SELECT lastname, department_id, job_id
	FROM employees
	WHERE department_id IN (SELECT department_id
				FROM departments
				WHERE location_id = 1700);

SELECT lastname, salary
	FROM employees
	WHERE manager_id in (SELECT employee_id
			    FROM employees
			    WHERE lastname = 'King');

SELECT department_id, lastname, job_id
	FROM employees
	WHERE department_id IN (SELECT department_id
				FROM departments
				WHERE department_name = 'Executive');

SELECT employee_id, lastname, salary
	FROM employees
	WHERE department_id IN (SELECT department_id
				FROM employees
				WHERE lastname like '%u%')
	AND salary > (SELECT AVG(salary)FROM employees);

select distinct(department_id) from employees

SELECT * 
	FROM employees 
	ORDER BY firstname DESC;

SELECT firstname, lastname, salary, salary*.15 PF 
	FROM employees;

SELECT employee_id, firstname, lastname, salary 
    FROM employees 
    ORDER BY salary;

SELECT SUM(salary) Total_Salary 
     FROM employees;

SELECT MAX(salary) max_sal, MIN(salary) min_sal
     FROM employees;

SELECT AVG(salary) av_sal, COUNT(*) no_of_emps
     FROM employees;

SELECT COUNT(*) 
    FROM employees;

SELECT COUNT(DISTINCT job_id) 
FROM employees;

SELECT UPPER(firstname) 
   FROM employees;

SELECT SUBSTRING(firstname,1,3) 
     FROM employees;

SELECT  CONCAT(firstname,' ', lastname) 'Employee Name' 
     FROM employees;

SELECT TRIM(firstname) 
    FROM employees;

SELECT firstname,lastname, LEN(firstname)+LEN(lastname)  'Length of  Names' 
    FROM employees;

SELECT * 
   FROM employees 
   WHERE  firstname like'[0-9]%';/*regexp*/


SELECT top 10 employee_id, firstname 
    FROM employees;

SELECT firstname, lastname, round(salary/12,2) as 'Monthly Salary' 
   FROM employees;

SELECT firstname, lastname, salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

SELECT firstname, lastname, department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY  department_id  ASC;


SELECT firstname, lastname, hire_date 
FROM employees 
WHERE YEAR(hire_date)  LIKE '1987%';

SELECT firstname
FROM employees
WHERE firstname LIKE '%b%'
AND firstname LIKE '%c%';

SELECT lastname, job_id, salary
FROM employees
WHERE job_id IN ('IT_PROG', 'SH_CLERK')
AND salary NOT IN (4500,10000, 15000);

SELECT lastname FROM employees WHERE lastname LIKE '______';

SELECT lastname FROM employees WHERE lastname LIKE '__e%';

SELECT DISTINCT job_id  FROM employees;

SELECT firstname, lastname, salary, salary*.15 PF from employees;

SELECT * 
FROM employees 
WHERE lastname IN('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');

SELECT COUNT(DISTINCT job_id) 
FROM employees;

SELECT SUM(salary) 
     FROM employees;

SELECT MAX(salary), MIN(salary) 
     FROM employees;

SELECT MAX(salary) 
FROM employees 
WHERE job_id = 'IT_PROG';

SELECT AVG(salary),count(*) 
FROM employees 
WHERE department_id = 90;

SELECT ROUND(MAX(salary),0) 'Maximum',
ROUND(MIN(salary),0) 'Minimum',
ROUND(SUM(salary),0) 'Sum',
ROUND(AVG(salary),0) 'Average'
FROM employees;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) DESC;

SELECT department_id, SUM(salary)
FROM employees 
GROUP BY department_id;

SELECT job_id, AVG(salary) 
FROM employees 
WHERE job_id != 'IT_PROG' 
GROUP BY job_id;

SELECT job_id, SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employees 
WHERE department_id = '90' 
GROUP BY job_id;

SELECT job_id, MAX(salary) 
FROM employees 
GROUP BY job_id 
HAVING MAX(salary) >=4000;

SELECT department_id, AVG(salary), COUNT(*) 
FROM employees 
GROUP BY department_id
HAVING COUNT(*) > 10;

SELECT FIRSTNAME, LASTNAME, SALARY 
FROM employees 
WHERE SALARY > 
(SELECT salary FROM employees WHERE lastname = 'Bull');

SELECT firstname, lastname 
FROM employees 
WHERE department_id 
IN (SELECT department_id FROM departments WHERE department_name='IT');

SELECT firstname, lastname FROM employees 
WHERE manager_id in (select employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (select location_id from locations where country_id='US')));
sp_columns EMPLOYEES
sp_columns departments
sp_columns countries
sp_columns job_history
sp_columns jobs
sp_columns locations
sp_columns region