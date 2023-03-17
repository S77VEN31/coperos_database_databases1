DELIMITER $$
CREATE PROCEDURE generate_commission_logs()
BEGIN
    DECLARE start_date DATE DEFAULT NOW();
    DECLARE end_date DATE DEFAULT DATE_ADD(NOW(), INTERVAL 6 MONTH);
    DECLARE commission_id INT DEFAULT 1;
    DECLARE commission_percentage DECIMAL(5, 2) DEFAULT 0.08;
    DECLARE period_start_date DATE;
    DECLARE period_end_date DATE;
    DECLARE prev_end_date DATE DEFAULT NULL; -- variable to store previous commission end date
    
    WHILE start_date <= end_date DO
        -- set period start and end dates based on day of week
        IF DAYOFWEEK(start_date) IN (2, 3, 4) THEN -- Monday to Wednesday
            SET commission_percentage = ROUND(RAND() * 0.02 + 0.08, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 2 DAY);
        ELSEIF DAYOFWEEK(start_date) IN (5, 6) THEN -- Thursday to Friday
            SET commission_percentage = ROUND(RAND() * 0.03 + 0.1, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 1 DAY);
        ELSEIF DAYOFWEEK(start_date) IN (1, 7) THEN -- Saturday to Sunday
            SET commission_percentage = ROUND(RAND() * 0.03 + 0.13, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 1 DAY);
        END IF;
        
        -- insert commission log
        INSERT INTO commisions_logs (commision_id, commision_log_start_date, commision_log_end_date, commision_percentaje)
        VALUES (commission_id, period_start_date, period_end_date, commission_percentage);
        
        -- update variables for next iteration
        SET start_date = DATE_ADD(period_end_date, INTERVAL 1 DAY);
        SET commission_id = commission_id + 1;
        SET prev_end_date = period_end_date;
    END WHILE;
END $$
DELIMITER ;
