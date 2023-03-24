
-- demuestre que es posible crear una consulta o varias para saber cuánto se gasto,
-- cuánto se ganó por semana en todo el negocio,
-- además de saber cuánto se le debe pagar a cada copero.

-- los gastos de items se pueden filtar en la tabla inventory_logs
SELECT item_id, movement_type, WEEK(log_time), MIN(log_time), MAX(log_time), SUM(movement_amount)
FROM inventory_logs
GROUP BY item_id, movement_type, WEEK(log_time);
-- Ventas por semana
SELECT YEARWEEK(transaction_date) AS week,
       MIN(transaction_date) AS week_start,
       MAX(transaction_date) AS week_end,
       SUM(total_price) AS total_earnings
  FROM caso2.sales
 WHERE deleted = 0
 GROUP BY YEARWEEK(transaction_date)
 ORDER BY YEARWEEK(transaction_date);

 -- cuánto se le debe pagar a cada copero se consulta en employee_salary_logs

 -- esto se obtiene de la tabla employee salary logs