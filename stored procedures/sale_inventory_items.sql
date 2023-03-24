
DROP PROCEDURE IF EXISTS sale_inventory_items;
DELIMITER $$
CREATE PROCEDURE sale_inventory_items()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE sale_id INT;
    DECLARE product_id INT;
    DECLARE item_id INT;
    DECLARE amount INT;
    DECLARE employee_id INT;
    DECLARE fecha DATE;
    DECLARE work_schedule_log_id INT;
    DECLARE trans_date DATE;

    DECLARE cur1 CURSOR FOR
        SELECT sales.sale_id, products_x_sales.product_id, items_x_products.item_id, products_x_sales.amount, work_schedule_logs.employee_id, sales.transaction_date, sales.work_schedule_log_id
        FROM sales
        INNER JOIN products_x_sales ON sales.sale_id = products_x_sales.sale_id
        INNER JOIN items_x_products ON products_x_sales.product_id = items_x_products.product_id
        INNER JOIN products ON items_x_products.product_id = products.product_id
        INNER JOIN work_schedule_logs ON sales.work_schedule_log_id = work_schedule_logs.work_schedule_log_id
        WHERE sales.deleted = 0 AND products.deleted = 0 AND items_x_products.deleted = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur1;

    read_loop: LOOP
        FETCH cur1 INTO sale_id, product_id, item_id, amount, employee_id, fecha, work_schedule_log_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET trans_date = DATE(fecha);

        CALL insert_inventory_logs(item_id, employee_id, amount, 2, trans_date);
    END LOOP;

    CLOSE cur1;
END $$
DELIMITER ;

CALL sale_inventory_items();