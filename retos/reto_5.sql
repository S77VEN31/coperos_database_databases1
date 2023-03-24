-- debido a que pueden existir errores de conexión en las playas,
-- se recomienda que modifique el stored procedure de registrar ventas para que sea transaccional.
-- demuestre que se comporta correctamente la transacción cuando es exitosa o cuando falla.

-- En este caso lo que se hizo es que en las ordenes que realizan los clientes se tienen 3 estados
-- 1 = exito  2 = cromado por el cliente  3 = cromado por el empleado
-- entonces, usando la logica solo las ordenes que se procesen transaccionalmente bien serán ventas.
-- y en el sotored procedure que las crea el filtra solo las que sean 1 se crean como ventas.