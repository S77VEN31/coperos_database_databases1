DROP PROCEDURE IF EXISTS insert_sale_from_order;

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
    SELECT purchase_orders.order_creation_date,
           purchase_orders.order_creation_date,
           1,
           0,
           0,
           purchase_orders.client_id,
           purchase_orders.work_schedule_log_id,
           commission_logs.commission_id
      FROM caso2.purchase_orders
      JOIN caso2.commission_logs
        ON commission_logs.commission_log_start_date < purchase_orders.order_creation_date AND commission_logs.commission_log_end_date >= purchase_orders.order_creation_date
     WHERE purchase_orders.state = 1;
END$$
DELIMITER ;