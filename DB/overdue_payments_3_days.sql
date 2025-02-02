SELECT fact_sales_order.sales_order_id,
fact_sales_order.units_sold,
fact_sales_order.unit_price * fact_sales_order.units_sold AS total_owed,
project_team_2.fact_sales_order.agreed_delivery_date - project_team_2.fact_sales_order.agreed_payment_date as days_behind,
project_team_2.dim_location.location_id
FROM project_team_2.fact_sales_order
JOIN project_team_2.dim_location
ON project_team_2.dim_location.location_id = project_team_2.fact_sales_order.agreed_delivery_location_id
WHERE agreed_payment_date > agreed_delivery_date AND  project_team_2.fact_sales_order.agreed_delivery_date - project_team_2.fact_sales_order.agreed_payment_date < -3
ORDER BY days_behind ASC