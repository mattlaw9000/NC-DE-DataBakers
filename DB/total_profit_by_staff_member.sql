SELECT sales_staff_id,
project_team_2.dim_location.city,
first_name,
last_name,
SUM(units_sold * unit_price) AS total_profit
FROM project_team_2.fact_sales_order
JOIN project_team_2.dim_location
ON project_team_2.dim_location.location_id = project_team_2.fact_sales_order.agreed_delivery_location_id
JOIN project_team_2.dim_staff
ON project_team_2.dim_staff.staff_id = project_team_2.fact_sales_order.sales_staff_id
GROUP BY sales_staff_id, first_name, last_name, project_team_2.dim_location.city
ORDER BY total_profit DESC
LIMIT 10;