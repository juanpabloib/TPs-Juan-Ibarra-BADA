-- Punto 01
SELECT DISTINCT descripcion
FROM Oficinas;

-- Punto 02
SELECT descripcion,
 precio AS precio_costo,
 precio * 1.21 AS precio_con_iva
FROM Productos;

-- Punto 03
SELECT apellido,
 nombre,
 fecha_nacimiento AS fecha_cumpleanos,
 TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM Empleados;

-- Punto 04
SELECT * FROM Empleados
WHERE cod_jefe IS NOT NULL;

-- Punto 05
SELECT * FROM Empleados
WHERE nombre = 'María'
ORDER BY apellido ASC;

-- Punto 06
SELECT * FROM Clientes
WHERE razón_social LIKE 'L%'
ORDER BY cod_cliente ASC;

-- Punto 07
SELECT * FROM Pedidos
WHERE MONTH(fecha_pedido) = 3
ORDER BY fecha_pedido ASC;

-- Punto 08
SELECT * FROM Oficinas
WHERE codigo_director IS NULL;

-- Punto 09
SELECT * FROM Productos
ORDER BY precio ASC
LIMIT 4;

-- Punto 10
SELECT cod_empleado
FROM Datos_contratos
ORDER BY cuota DESC
LIMIT 3;
