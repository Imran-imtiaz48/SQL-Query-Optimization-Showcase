-- Payroll calculation with multiple joins and subqueries
SELECT e.id, e.name, d.name AS department, 
       (SELECT SUM(amount) FROM bonuses WHERE employee_id = e.id) AS bonus_total,
       s.basic_salary + s.allowance AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN salaries s ON e.id = s.employee_id
WHERE s.month = '2024-12';
