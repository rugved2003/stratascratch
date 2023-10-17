select title, budget,
CEILING((DATEDIFF(end_date , start_date)* SUM(salary)/365)) AS prorated_employee_expense
FROM linkedin_projects a
INNER JOIN linkedin_emp_projects b ON a.id = b.project_id
INNER JOIN linkedin_employees c ON c.id = b.emp_id
GROUP BY title, budget
HAVING prorated_employee_expense > budget
ORDER BY title ASC
