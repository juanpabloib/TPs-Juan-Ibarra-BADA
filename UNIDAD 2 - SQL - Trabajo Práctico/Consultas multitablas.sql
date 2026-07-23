-- Punto 01
SELECT p.descripcion,
 f.razón_social,
 p.cantidad_stock
FROM Productos p
INNER JOIN Fabricantes f ON p.cod_fabricante = f.cod_fabricante
ORDER BY f.razón_social ASC, p.descripcion ASC;

-- Punto 02
SELECT p.cod_pedido,
 p.fecha_pedido,
 e.apellido,
 c.razón_social
FROM Pedidos p
INNER JOIN Empleados e ON p.cod_empleado = e.cod_empleado
INNER JOIN Clientes c ON p.cod_cliente = c.cod_cliente;

-- Punto 03
SELECT e.apellido,
 dc.cuota,
 o.descripcion AS oficina
FROM Empleados e
INNER JOIN Datos_contratos dc ON e.cod_empleado = dc.cod_empleado
LEFT JOIN Oficinas o ON e.cod_oficina = o.cod_oficina
ORDER BY dc.cuota DESC;

-- Punto 04
SELECT DISTINCT c.razón_social
FROM Clientes c
INNER JOIN Pedidos p ON c.cod_cliente = p.cod_cliente
WHERE MONTH(p.fecha_pedido) = 4;

-- Punto 05
SELECT DISTINCT pr.cod_producto,
 pr.descripcion
FROM Productos pr
INNER JOIN Detalle_pedidos dp ON pr.cod_producto = dp.cod_producto
INNER JOIN Pedidos p ON dp.cod_pedido = p.cod_pedido
WHERE MONTH(p.fecha_pedido) = 3;

-- Punto 06
SELECT e.cod_empleado,
 e.apellido,
 e.nombre,
 TIMESTAMPDIFF(YEAR, dc.fecha_contrato, CURDATE()) AS cantidad_anios
FROM Empleados e
INNER JOIN Datos_contratos dc ON e.cod_empleado = dc.cod_empleado
WHERE TIMESTAMPDIFF(YEAR, dc.fecha_contrato, CURDATE()) > 10
ORDER BY cantidad_anios DESC;

-- Punto 07
SELECT c.cod_cliente,
 c.razón_social
FROM Clientes c
INNER JOIN Listas l ON c.cod_lista = l.cod_lista
WHERE l.descripción LIKE '%Mayorista%'
ORDER BY c.razón_social ASC;

-- Punto 08
CT DISTINCT c.razón_social,
 pr.descripcion AS descripcion_producto
FROM Clientes c
INNER JOIN Pedidos p ON c.cod_cliente = p.cod_cliente
INNER JOIN Detalle_pedidos dp ON p.cod_pedido = dp.cod_pedido
INNER JOIN Productos pr ON dp.cod_producto = pr.cod_producto
ORDER BY c.razón_social ASC, pr.descripcion ASC;

-- Punto 09
SELECT p.descripcion,
 (p.punto_reposición - p.cantidad_stock) AS cantidad_a_comprar,
 f.razón_social
FROM Productos p
INNER JOIN Fabricantes f ON p.cod_fabricante = f.cod_fabricante
WHERE p.cantidad_stock < p.punto_reposición
ORDER BY f.razón_social ASC, p.descripcion ASC;

-- Punto 10
CT e.cod_empleado,
 e.apellido,
 dc.cuota
FROM Empleados e
INNER JOIN Datos_contratos dc ON e.cod_empleado = dc.cod_empleado
WHERE dc.cuota < 50000 OR dc.cuota > 100000;
