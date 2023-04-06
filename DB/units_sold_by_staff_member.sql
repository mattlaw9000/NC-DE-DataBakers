SELECT sales_staff_id, first_name, last_name, units_sold
FROM fact_sales_order
JOIN project_team_2.dim_staff
ON project_team_2.dim_staff.staff_id = project_team_2.fact_sales_order.sales_staff_id
ORDER BY units_sold DESC;