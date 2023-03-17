DELIMITER $$
CREATE PROCEDURE insert_work_schedule_logs()
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE cur_date DATE;
    DECLARE start_time TIME;
    DECLARE end_time TIME;
    DECLARE employee_id INT;
    DECLARE cart_id INT;
    DECLARE location_id INT;
    
    SET start_date = CURDATE();
    SET end_date = DATE_ADD(start_date, INTERVAL 6 MONTH);
    SET cur_date = start_date;
    
    WHILE cur_date <= end_date DO
        SET start_time = TIME('08:00:00');
        SET end_time = TIME('16:00:00');
        WHILE start_time <= end_time DO
            SET employee_id = FLOOR(RAND() * 15) + 1;
            SET cart_id = FLOOR(RAND() * 30) + 1;
            SET location_id = FLOOR(RAND() * 9) + 1;
            INSERT INTO work_schedule_logs (start_time, end_time, log_date, cart_id, employee_id, location_id)
            SELECT start_time, ADDTIME(start_time, '08:00:00'), cur_date, cart_id, employee_id, location_id
            FROM DUAL
            WHERE NOT EXISTS (
                SELECT *
                FROM work_schedule_logs
                WHERE log_date = cur_date
                AND cart_id = cart_id
                AND start_time <= ADDTIME(end_time, '01:00:00') -- permitir una hora de solapamiento
                AND end_time >= ADDTIME(start_time, '01:00:00') -- permitir una hora de solapamiento
            )
            AND NOT EXISTS (
                SELECT *
                FROM work_schedule_logs
                WHERE log_date = cur_date
                AND employee_id = employee_id
                AND start_time <= ADDTIME(end_time, '01:00:00') -- permitir una hora de solapamiento
                AND end_time >= ADDTIME(start_time, '01:00:00') -- permitir una hora de solapamiento
            )
            LIMIT 1;
            SET start_time = ADDTIME(start_time, '08:00:00');
        END WHILE;
        SET cur_date = ADDDATE(cur_date, 1);
    END WHILE;
END $$
DELIMITER ;

CALL insert_work_schedule_logs();
