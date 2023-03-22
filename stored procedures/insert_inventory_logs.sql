-- Procedure para ingresar, gastar, ajustar inventario
DELIMITER $$
CREATE PROCEDURE insert_inventory_logs (
    IN p_item_id INT,
    IN p_employee_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_movement_type INT
)
BEGIN
    DECLARE v_work_schedule_log_id INT;
    
    -- obtener el work_schedule_log_id aleatorio
    SELECT work_schedule_log_id 
    INTO v_work_schedule_log_id 
    FROM work_schedule_logs 
    ORDER BY RAND() 
    LIMIT 1;

    -- insertar registro en inventory_logs
    INSERT INTO inventory_logs (
        log_time, 
        movement_type, 
        movement_amount, 
        product_amount, 
        item_id, 
        work_schedule_log_id
    )
    VALUES (
        NOW(), 
        p_movement_type, 
        CASE p_movement_type
            WHEN 0 THEN -p_amount
            ELSE p_amount
        END, 
        (SELECT unit FROM items WHERE item_id = p_item_id) * p_amount, 
        p_item_id, 
        v_work_schedule_log_id
    );
END$$
DELIMITER ;

-- Llamado del procedure
CALL insert_inventory_logs(2, 5, 5.0, 1);


-- #################################################
-- Procedure para llenar por parejo cada item
DELIMITER $$
CREATE PROCEDURE insert_inventory_logs_all_items (
    IN p_employee_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_movement_type INT
)
BEGIN
    DECLARE v_item_id INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_items CURSOR FOR SELECT item_id FROM items;
    
    -- declarar el cursor y abrirlo
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur_items;
    
    -- recorrer cada fila del cursor y llamar al stored procedure
    read_loop: LOOP
        FETCH cur_items INTO v_item_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        CALL insert_inventory_logs(v_item_id, p_employee_id, p_amount, p_movement_type);
    END LOOP;
    
    -- cerrar el cursor
    CLOSE cur_items;
END$$
DELIMITER ;

-- Llamado del procedure
CALL insert_inventory_logs_all_items(2, 5, 100);


