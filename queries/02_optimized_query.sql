-- Optimized using LEFT JOIN instead of subquery and removing function in WHERE
SELECT e.id, e.name, d.name AS department, COALESCE(SUM(b.amount), 0) AS bonus_total,
       s.basic_salary + s.allowance AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN salaries s ON e.id = s.employee_id
LEFT JOIN bonuses b ON e.id = b.employee_id
WHERE s.month = '2024-12'
GROUP BY e.id, e.name, d.name, s.basic_salary, s.allowance;
