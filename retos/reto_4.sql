-- además demuestre que es posible mostrarle al dueño cada semana datos que confirmen que no se están 
-- robando o malgastando los ingredientes en la elaboración de los productos, entender los márgenes de 
-- ingredientes usados en ventas versus los ingredientes que se cargan en el carrito.
-- cree vistas que le ayuden a realizar esta extracción de datos.

SELECT DATE_FORMAT(DATE_ADD(wsl.log_date, INTERVAL(-WEEKDAY(wsl.log_date)) DAY), '%Y-%m-%d') AS week_start_date,
       DATE_FORMAT(DATE_ADD(wsl.log_date, INTERVAL(6 - WEEKDAY(wsl.log_date)) DAY), '%Y-%m-%d') AS week_end_date,
       il.item_id,
       SUM(il.movement_amount) AS total_movement,
       wsl.employee_id
FROM inventory_logs il
JOIN work_schedule_logs wsl ON il.work_schedule_log_id = wsl.work_schedule_log_id
GROUP BY WEEK(wsl.log_date), YEAR(wsl.log_date), il.item_id, wsl.employee_id
ORDER BY il.item_id, week_start_date;