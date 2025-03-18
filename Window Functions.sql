-- window functions

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
 
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;
    
    
SELECT 
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees;
 
drop table employees;
create database window_funcs;
use window_funcs;

select department, avg(salary) 
from employees
group by department;

-- OVER()

select avg(salary) over() 
from employees;

select emp_no , department, salary, avg(salary) OVER()
from employees;


select 
	emp_no , 
    department, 
    salary, 
    min(salary) OVER(),
    max(salary) over()
from employees;

select 
	emp_no,
    department,
    salary,
    round(avg(salary) over(partition by department), 2) as dep_avg,
	avg(salary) over() as company_avg
from employees;

select
	emp_no,
    department,
    count(emp_no) over(partition by department) as dep_count
from employees;

select 
	emp_no, 
    department,
    salary,
    sum(salary) over(PARTITION BY department) as dep_sum,
    sum(salary) over() as total_payroll
from employees;

select 
	emp_no, 
    department,
    salary,
    sum(salary) over(PARTITION BY department ) as dep_sum,
    sum(salary) over(PARTITION BY department order by salary desc) as rolling_dep_sum_desc,
    sum(salary) over(PARTITION BY department order by salary ) as rolling_dep_sum
from employees;

select
	emp_no,
    department,
    salary,
    min(salary) over(partition by department order by salary desc) as rolling_min
from employees;

-- RANK()

select
	emp_no,
    department,
    salary,
    rank() over(partition by department order by salary desc) as dep_salary_rank,
    rank() over(order by salary desc) as overall_salary_rank
from employees order by department;

-- row_number()

select
	emp_no,
    department,
    salary,
    ROW_NUMBER() over (partition by department order by salary desc) as dep_salary_rownr,
    rank() over(partition by department order by salary desc) as dep_salary_rank,
    rank() over(order by salary desc) as overall_rank,
    DENSE_RANK() over(order by salary desc) as overall_dense_rank,
    ROW_NUMBER() over(order by salary desc) as overall_row_number
from employees order by overall_rank;
-- dense rank o sa reia numaratoarea desii sunt 2 randuri cu acelasi numar

-- ntile()

select
	emp_no,
    department,
    salary,
    ntile(4) over(partition by department order by salary desc) as dep_salary_quartile,
    ntile(4) over(order by salary desc) as salary_quartile
from employees order by department;
-- desparte o fereastra in diferite buckets si imparte valorile in fiecare bucket

-- FIRST VALUE

select
	emp_no,
    department,
    salary,
    FIRST_VALUE (emp_no) over(order by salary desc) as highesty_oaid_overall,
    FIRST_VALUE (emp_no) over(partition by department order by salary desc) as highest_paid_indep
from employees order by department;

-- lead and lag

select
	emp_no,
    department,
    salary,
    salary - lag(salary) over (order by salary desc) as sal_diff,
    salary - lag(salary) over (partition by department order by salary desc) as dep_sal_diff,
    lag(salary, 2) over (order by salary desc) as sal_diff -- arata cu 2 randuri in urma diferenta;
from employees;

-- lag si lead arata valorile din coloana respectiva de inainte sau de dupa valoarea respectiva


