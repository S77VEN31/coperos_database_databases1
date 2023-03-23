DELIMITER $$
CREATE PROCEDURE sales_money_movements()
BEGIN
  -- Actualizar la columna total_price para cada venta existente en la tabla sales
  UPDATE sales
  INNER JOIN (
      SELECT sales.sale_id, SUM(products.price * products_x_sales.amount) AS total_sin_tax, location_taxes.location_tax
      FROM sales
      INNER JOIN products_x_sales ON sales.sale_id = products_x_sales.sale_id
      INNER JOIN products ON products_x_sales.product_id = products.product_id
      INNER JOIN work_schedule_logs ON sales.work_schedule_log_id = work_schedule_logs.work_schedule_log_id
      INNER JOIN locations ON work_schedule_logs.location_id = locations.location_id
      INNER JOIN location_taxes ON locations.location_id = location_taxes.location_id
      GROUP BY sales.sale_id, location_taxes.location_tax
  ) AS subquery ON sales.sale_id = subquery.sale_id
  SET sales.total_price = subquery.total_sin_tax * (1 + subquery.location_tax),
      sales.change = IF(sales.pay_type = 0, 
                         (CEILING((subquery.total_sin_tax * (1 + subquery.location_tax)) / 1000) * 1000) - subquery.total_sin_tax * (1 + subquery.location_tax), 
                         sales.change);
END $$
DELIMITER ;

CALL sales_money_movements();