select ABS(
    (select max(salary)  
from db_employee 
Where department_id = '4' ) - (select max(salary)  
from db_employee 
Where department_id = '1' )
) AS salary_difference
