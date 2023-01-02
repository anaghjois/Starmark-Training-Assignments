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

SELECT firstname, lastname 
FROM employees 
WHERE (employee_id IN (SELECT manager_id FROM employees));

SELECT firstname, lastname, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT firstname, lastname, salary 
FROM employees 
WHERE employees.salary = (SELECT min_salary
FROM jobs
WHERE employees.job_id = jobs.job_id);

SELECT firstname, lastname, salary 
FROM employees 
WHERE department_id IN 
(SELECT department_id FROM departments WHERE department_name LIKE 'IT%') 
AND salary > (SELECT avg(salary) FROM employees);

SELECT firstname, lastname, salary 
FROM employees 
WHERE salary > 
(SELECT salary FROM employees WHERE lastname = 'Bell') ORDER BY firstname;

SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT * FROM employees 
WHERE salary > 
ALL(SELECT avg(salary)FROM employees GROUP BY department_id);

SELECT firstname,lastname, job_id, salary 
FROM employees 
WHERE salary > 
ALL (SELECT salary FROM employees WHERE job_id = 'SH_CLERK') ORDER BY salary;

SELECT b.firstname,b.lastname 
FROM employees b 
WHERE NOT EXISTS (SELECT * FROM employees a WHERE a.manager_id = b.employee_id);

SELECT employee_id, firstname, lastname, 
(SELECT department_name FROM departments d
 WHERE e.department_id = d.department_id) department 
 FROM employees e ORDER BY department;


 SELECT employee_id, firstname 
FROM employees AS A 
WHERE salary > 
(SELECT AVG(salary) FROM employees WHERE department_id = A.department_id);

SELECT employee_id FROM employees
WHERE employee_id%2 = 0;

/*SELECT DISTINCT salary 
FROM employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) n-1
FROM employees  e2 
WHERE e2.salary >= e1.salary);

SELECT DISTINCT salary 
FROM employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT salary) n-1
FROM employees  e2 
WHERE e2.salary <= e1.salary);*/

select top 10 * from EMPLOYEES order by EMPLOYEE_ID desc;

SELECT * FROM departments 
WHERE department_id 
 in (select department_id FROM employees );  

SELECT DISTINCT salary 
FROM employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) /*n-1*/
FROM employees b 
WHERE b.salary >= a.salary) 
ORDER BY a.salary DESC;

SELECT DISTINCT salary 
FROM employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) /*n-1*/
FROM employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;

SELECT *
FROM employees emp1
WHERE (1) = (
SELECT COUNT(DISTINCT(emp2.salary))
FROM employees emp2
WHERE emp2.salary > emp1.salary);

SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l,COUNTRIES c where l.COUNTRY_ID=c.COUNTRY_ID;

SELECT e.firstname, e.lastname, d.department_id, d.department_name 
FROM employees e,DEPARTMENTS d where e.DEPARTMENT_ID=d.DEPARTMENT_ID;

SELECT e.firstname, e.lastname, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

SELECT e.employee_id 'Emp_Id', e.lastname 'Employee', 
m.employee_id 'Mgr_Id', m.lastname 'Manager' 
FROM employees e 
join employees m 
ON (e.manager_id = m.employee_id);

SELECT e.firstname, e.lastname, e.hire_date 
FROM employees e 
JOIN employees jones 
ON (jones.lastname = 'Jones') 
WHERE jones.hire_date < e.hire_date;

/*SELECT employee_id, job_title, end_date-start_date Days FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;*/

SELECT d.department_id, d.department_name, d.manager_id, e.firstname 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);

SELECT d.department_name, e.firstname, l.city 
FROM departments d 
JOIN employees e 
ON (d.manager_id = e.employee_id) 
JOIN locations l on l.location_id=d.LOCATION_ID;

SELECT j.job_title, AVG(e.salary) 
FROM employees e join jobs j  
on e.JOB_ID=j.JOB_ID group by j.JOB_TITLE;

SELECT j.job_title, e.firstname, e.SALARY 'Salary - Min_Salary' 
FROM employees e,jobs j where j.JOB_ID=e.JOB_ID group by j.JOB_TITLE,e.FIRSTNAME,e.SALARY;

select salary-min(salary) from EMPLOYEES group by SALARY;
sp_columns EMPLOYEES
sp_columns departments
sp_columns countries
sp_columns job_history
sp_columns jobs
sp_columns locations
sp_columns regions