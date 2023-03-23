DELIMITER //
CREATE PROCEDURE insert_sale_from_order()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE o_id, o_client_id, o_work_schedule_log_id INT;
    DECLARE o_creation_date DATE;
    DECLARE cur CURSOR FOR SELECT order_id, order_creation_date, client_id, work_schedule_log_id FROM caso2.purchase_orders WHERE state = 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO o_id, o_creation_date, o_client_id, o_work_schedule_log_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO caso2.sales (transaction_date,
                                 invoice_creation_date,
                                 pay_type,
                                 `change`,
                                 total_price,
                                 client_id,
                                 work_schedule_log_id,
                                 commission_id)
        VALUES (o_creation_date,
                o_creation_date,
                1,
                0,
                0,
                o_client_id,
                o_work_schedule_log_id,
                1);
    END LOOP;

    CLOSE cur;
END//
DELIMITER ;