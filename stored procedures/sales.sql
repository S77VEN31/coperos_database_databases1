DROP PROCEDURE IF EXISTS generate_sales;
DELIMITER $$
CREATE PROCEDURE generate_sales()
BEGIN
    DECLARE num_sales INT;
    DECLARE i INT DEFAULT 0;

    DROP TEMPORARY TABLE IF EXISTS temp_work_schedule_logs;
    CREATE TEMPORARY TABLE temp_work_schedule_logs AS SELECT log_date, start_time, end_time, work_schedule_log_id FROM work_schedule_logs;

    WHILE EXISTS (SELECT 1 FROM temp_work_schedule_logs) DO
        SELECT log_date, start_time, end_time, work_schedule_log_id INTO @log_date, @start_time, @end_time,@work_schedule_log_id FROM temp_work_schedule_logs LIMIT 1;
        DELETE FROM temp_work_schedule_logs WHERE work_schedule_log_id = @work_schedule_log_id;

        SET num_sales = FLOOR(10 + RAND() * (60 - 10));
        SET i = 0;

        WHILE i < num_sales DO
            INSERT INTO sales(transaction_date,
                              invoice_creation_date,
                              pay_type,
                              total_price,
                              deleted,
                              client_id,
                              work_schedule_log_id)
            VALUES(
            
                                (SELECT CONCAT(@log_date, ' ', SEC_TO_TIME(FLOOR(RAND() * (TIME_TO_SEC(@end_time) - TIME_TO_SEC(@start_time) + 1)) + TIME_TO_SEC(@start_time)))),

                @log_date,
                CASE 
                    WHEN RAND() < 0.6 THEN 0
                    WHEN RAND() >= 0.6 AND RAND() < 0.9 THEN 2
                    ELSE 1
                END,
                0,
                CASE 
                    WHEN pay_type =2 AND RAND()<0.2 THEN 1 
                    ELSE 0 
                END ,
                FLOOR(1 + RAND()*7000),
                @work_schedule_log_id);
            SET i = i +1 ;
        END WHILE;
    END WHILE;
END $$
DELIMITER ;

CALL generate_sales();