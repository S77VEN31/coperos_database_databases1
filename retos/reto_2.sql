-- demostrar que su diseño responde correctamente llenandolo de datos ficticios de 6 meses de ventas hechas
-- de más de 10 productos , donde ocurrieron de 10 a 60 ventas diarias por carrito, que existan al menos 3 playas
-- y 15 carritos, 30 coperos; y que definitivamente las ventas sean mucho mayor durante sábados y domingos
-- comparado con los días entre semana. registrar una venta deberá hacerse por medio de un stored procedure.

-- hay datos de 6 meses
SELECT * FROM caso2.sales ORDER BY sale_id DESC;
SELECT * FROM caso2.sales;
SELECT * FROM caso2.products;
SELECT * FROM caso2.carts;
SELECT * FROM caso2.locations;
SELECT * FROM caso2.employees;
-- las ventas intentar ser mayores durante sabados y domingos pero como hay productos con mayor precio aveces
-- se disparan las ventas en dias random de la semana.

-- todas las ventas estan registradas con stored procedures.