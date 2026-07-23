-- Punto 01
SELECT MAX(cantidad) AS cantidad_maxima
FROM ITEM_VENTAS;

-- Punto 02
SELECT SUM(iv.cantidad) AS total_vendido
FROM ITEM_VENTAS iv
INNER JOIN PRODUCTOS p ON iv.coódigo_producto = p.código_producto
WHERE p.nombre_producto = 'c' OR p.código_producto = 'c';

-- Punto 03
SELECT p.nombre_producto AS descripcion_producto,
 SUM(iv.cantidad) AS cantidad_total
FROM PRODUCTOS p
INNER JOIN ITEM_VENTAS iv ON p.código_producto = iv.coódigo_producto
GROUP BY p.código_producto, p.nombre_producto
ORDER BY cantidad_total DESC;

-- Punto 04
SELECT p.nombre_producto AS descripcion_producto,
 SUM(iv.cantidad) AS cantidad_total
FROM PRODUCTOS p
INNER JOIN ITEM_VENTAS iv ON p.código_producto = iv.coódigo_producto
GROUP BY p.código_producto, p.nombre_producto
HAVING SUM(iv.cantidad) > 30
ORDER BY p.nombre_producto ASC;

-- Punto 05
SELECT c.código_cliente,
 c.nombre,
 COUNT(v.número_factura) AS total_compras
FROM CLIENTES c
INNER JOIN VENTAS v ON c.código_cliente = v.código_cliente
GROUP BY c.código_cliente, c.nombre
ORDER BY total_compras DESC;

-- Punto 06
SELECT iv.coódigo_producto,
 AVG(iv.cantidad) AS promedio_unidades
FROM ITEM_VENTAS iv
INNER JOIN VENTAS v ON iv.número_factura = v.número_factura
WHERE v.código_cliente = 1
GROUP BY iv.coódigo_producto;
