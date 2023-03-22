-- Procedimiento que genera los inserts en la tabla inventory_logs 
DROP PROCEDURE IF EXISTS insert_inventory_logs;
DELIMITER $$
CREATE PROCEDURE insert_inventory_logs (
    IN p_item_id INT,
    IN p_employee_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_movement_type INT,
    IN p_date_log DATE
)
BEGIN
    DECLARE v_work_schedule_id INT;
    DECLARE v_product_amount DECIMAL(10,2) DEFAULT 0;
    

	SELECT IFNULL(work_schedule_log_id,		    -- Buscar un work_schedule_id acorde a la fecha de inserción
		(SELECT work_schedule_log_id
		FROM work_schedule_logs
		WHERE employee_id = p_employee_id
		ORDER BY RAND()
		LIMIT 1)
		)
	INTO v_work_schedule_id
	FROM (
		SELECT work_schedule_log_id, ABS(DATEDIFF(log_date, p_date_log)) AS diff
		FROM work_schedule_logs
		WHERE employee_id = p_employee_id AND log_date <= p_date_log
		ORDER BY diff ASC
		LIMIT 1
	) AS ws;

    SELECT product_amount		    -- Obtener la cantidad actual de producto
    INTO v_product_amount
    FROM inventory_logs
    WHERE item_id = p_item_id
    ORDER BY log_time DESC
    LIMIT 1;

    INSERT INTO inventory_logs (	-- Insertar registro en inventory_logs
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
        v_product_amount + CASE p_movement_type
                                WHEN 0 THEN -p_amount
                                WHEN 2 THEN -p_amount
                                ELSE p_amount
                            END,
        p_item_id, 
        v_work_schedule_id
    );
END$$
DELIMITER ;

-- LLAMAR	(item,employee,cantidad,operacion,fecha)
		-- Para generar gastos		
		CALL insert_inventory_logs(4,5,6,2,'2023-07-02');
        -- Para generar ajustes por perdida o robo
        CALL insert_inventory_logs(4,5,6,0,'2023-07-02');
		-- Para generar refills
		CALL insert_inventory_logs(4,5,4,1,CURDATE());



-- Procedure para ejecutar una instrucción por parejo cada item
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
        
        CALL insert_inventory_logs(v_item_id, p_employee_id, p_amount, p_movement_type, CURDATE());
    END LOOP;
    
    -- cerrar el cursor
    CLOSE cur_items;
END$$
DELIMITER ;

-- Llamado del procedure
CALL insert_inventory_logs_all_items(2, 5, 100);




-- #############################################################################
-- IMPLEMENTACION SIN FECHA         NO USAR   SOLO REGISTRO DE QUE EXISTIÓ
-- #############################################################################
DROP PROCEDURE IF EXISTS insert_inventory_logs;
DELIMITER $$
CREATE PROCEDURE insert_inventory_logs (
    IN p_item_id INT,
    IN p_employee_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_movement_type INT
)
BEGIN
    DECLARE v_work_schedule_id INT;
    DECLARE v_product_amount DECIMAL(10,2) DEFAULT 0;
    
    -- obtener el work_schedule_id aleatorio
    SELECT work_schedule_log_id 
    INTO v_work_schedule_id 
    FROM work_schedule_logs
    ORDER BY RAND() 
    LIMIT 1;

    -- obtener la cantidad actual de producto
    SELECT product_amount
    INTO v_product_amount
    FROM inventory_logs
    WHERE item_id = p_item_id
    ORDER BY log_time DESC
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
        v_product_amount + CASE p_movement_type
                                WHEN 0 THEN -p_amount
                                WHEN 2 THEN -p_amount
                                ELSE p_amount
                            END,
        p_item_id, 
        v_work_schedule_id
    );
END$$
DELIMITER ;

CALL insert_inventory_logs(4,5,10,1);




