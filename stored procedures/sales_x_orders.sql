DELIMITER $$
CREATE PROCEDURE insert_sale_from_order()
BEGIN
    INSERT INTO caso2.sales (transaction_date,
                             invoice_creation_date,
                             pay_type,
                             `change`,
                             total_price,
                             client_id,
                             work_schedule_log_id,
                             commission_id)
    SELECT transaction_date_value,
           TIMESTAMPADD(SECOND, FLOOR(RAND() * (20 - 10 + 1) + 10), transaction_date_value),
           1,
           0,
           0,
           client_id,
           work_schedule_log_id,
           commission_id
      FROM (SELECT DATE_FORMAT(TIMESTAMPADD(SECOND, -FLOOR(RAND() * TIMESTAMPDIFF(SECOND, work_schedule_logs.start_time, work_schedule_logs.end_time)), purchase_orders.order_creation_date), '%Y-%m-%d %H:%i:00') AS transaction_date_value,
                   purchase_orders.client_id AS client_id,
                   purchase_orders.work_schedule_log_id AS work_schedule_log_id,
                   commission_logs.commission_id AS commission_id
              FROM caso2.purchase_orders
              JOIN caso2.commission_logs
                ON commission_logs.commission_log_start_date < purchase_orders.order_creation_date AND commission_logs.commission_log_end_date >= purchase_orders.order_creation_date
              JOIN caso2.work_schedule_logs
                ON work_schedule_logs.work_schedule_log_id = purchase_orders.work_schedule_log_id
             WHERE purchase_orders.state = 1) AS subq;
END$$

DELIMITER ;