DELIMITER $$
CREATE PROCEDURE calculate_commissions()
BEGIN
    DECLARE next_id INT DEFAULT 1;
    WHILE EXISTS (SELECT 1 FROM employee_salary_logs WHERE salary_log_id = next_id) DO
        SET next_id = next_id + 1;
    END WHILE;

    INSERT INTO employee_salary_logs (salary_log_id, start_date, finish_date, salary, employee_id)
    SELECT 
        @rownum := @rownum + 1 AS salary_log_id,
        DATE(s.transaction_date) AS start_date,
        DATE(s.transaction_date + INTERVAL 6 DAY) AS finish_date,
        SUM(s.total_price * cl.commission_percentaje) AS salary,
        w.employee_id
    FROM sales s
    JOIN work_schedule_logs w ON s.work_schedule_log_id = w.work_schedule_log_id
    JOIN commission_logs cl ON s.commission_id = cl.commission_id
    CROSS JOIN (SELECT @rownum := next_id - 1) r
    GROUP BY start_date, finish_date, employee_id;
END $$
DELIMITER ;

CALL calculate_commissions();