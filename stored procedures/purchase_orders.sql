DELIMITER $$
CREATE PROCEDURE insert_purchase_orders()
BEGIN
    DECLARE start_date DATE DEFAULT CURRENT_DATE;
    DECLARE end_date DATE DEFAULT DATE_ADD(start_date, INTERVAL 6 MONTH);
    DECLARE num_inserts INT;
    DECLARE max_order_id INT;
    SELECT COALESCE(MAX(order_id), 0) INTO max_order_id FROM purchase_orders;
    WHILE start_date <= end_date DO
        SET num_inserts = FLOOR(1 + RAND() * (20-1+1));
        WHILE num_inserts > 0 DO
            SET max_order_id = max_order_id + 1;
            INSERT INTO purchase_orders (order_id, state, order_creation_date, employee_id, client_id)
            VALUES (max_order_id,
                    IF(RAND() < .9, 1,
                       IF(RAND() < .5,2 ,3)), start_date,
                    FLOOR(1 + RAND() * (15-1+1)), FLOOR(1 + RAND() * (7000-1+1)));
            SET num_inserts = num_inserts - 1;
        END WHILE;
        SET start_date = DATE_ADD(start_date, INTERVAL 1 DAY);
    END WHILE;
END;
 $$
DELIMITER ;

CALL insert_purchase_orders();