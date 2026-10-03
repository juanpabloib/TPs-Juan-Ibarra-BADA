-- 01 Crear una vista para un usuario al cual se permite tener acceso a todos los registros de
proveedores, pero sin las situaciones. Luego asignarle permisos a un usuario sobre esa vista
CREATE VIEW V_PROVEEDORES_SIN_SITUACION AS
SELECT NUMERO, NOMBRE, DOMICILIO, LOCALIDAD
FROM proveedores;
GRANT SELECT ON V_PROVEEDORES_SIN_SITUACION TO Jose;

-- 02 Crear una vista para un usuario al cual se permite tener acceso sólo a los registros de los
proveedores situados en Avellaneda, sin las situaciones. Luego asignarle permisos a un usuario
sobre esa vista.
CREATE VIEW V_PROVEEDORES_AVELLANEDA AS
SELECT NUMERO, NOMBRE, DOMICILIO, LOCALIDAD
FROM proveedores
WHERE LOCALIDAD = 'Avellaneda';
GRANT SELECT ON V_PROVEEDORES_AVELLANEDA TO Maria;

-- 03 A Al usuario Gómez, autorización de selección sobre toda la tabla.
GRANT SELECT ON DATPERS TO Gomez;

-- 03 B Al usuario López, autorización de inserción y eliminación sobre toda la tabla.
GRANT INSERT, DELETE ON DATPERS TO Lopez;

--03 C Al usuario Sánchez, autorización de selección sobre toda la tabla y autoridad de actualización
sobre los campos SALARIO e IMPUESTO (solamente).
GRANT SELECT, UPDATE (SALARIO, IMPUESTO) ON DATPERS TO Sanchez;

--03 D Al usuario Torres, autorización de selección sobre los campos IDENTUSUARIO, SALARIO e
IMPUESTO (únicamente).
GRANT SELECT (IDENTUSUARIO, SALARIO, IMPUESTO) ON DATPERS TO Torres;

--03 E Al usuario Pérez, autorización de selección igual a la de Torres y autorización de actualización
sobre los campos Salario e Impuesto (solamente).
GRANT SELECT (IDENTUSUARIO, SALARIO, IMPUESTO), UPDATE (SALARIO, IMPUESTO)
ON DATPERS TO Perez;

--03 F Al usuario Villalba, autorización de selección sobre los registros de predicadores
(únicamente). (Predicadores es un tipo de ocupación)
CREATE VIEW V_PREDICADORES AS
SELECT *
FROM DATPERS WHERE OCUPACION = 'Predicadores';
GRANT SELECT ON V_PREDICADORES TO Villalba;

-- 03 G Al usuario Gómez, autorización de selección igual a la de Torres y autoridad de actualización
sobre los campos IMPUESTO y AUDITORIA (únicamente).
GRANT SELECT (IDENTUSUARIO, SALARIO, IMPUESTO), UPDATE (IMPUESTO,
AUDITORIAS) ON DATPERS TO Gomez;

-- 03 H Al usuario Aguero, autorización de selección sobre los salarios máximos y mínimos por clase
de ocupación, pero ninguna otra autorización.
CREATE VIEW V_SALARIOS_POR_OCUPACION AS
SELECT OCUPACION, MAX(SALARIO) AS SALARIO_MAX, MIN(SALARIO) AS SALARIO_MIN
FROM DATPERS
GROUP BY OCUPACION;
GRANT SELECT ON V_SALARIOS_POR_OCUPACION TO Aguero;

-- 04 Para cada una de las partes (a) -(h) del ejercicio anterior escribir proposiciones en SQL para
retirar la autorización indicada al usuario en cuestión.
-- A
REVOKE SELECT ON DATPERS FROM Gomez;

-- B
REVOKE INSERT, DELETE ON DATPERS FROM Lopez;

-- C
REVOKE SELECT, UPDATE (SALARIO, IMPUESTO) ON DATPERS FROM Sanchez;

-- D
REVOKE SELECT (IDENTUSUARIO, SALARIO, IMPUESTO) ON DATPERS FROM Torres;

-- E
REVOKE SELECT (IDENTUSUARIO, SALARIO, IMPUESTO), UPDATE (SALARIO, IMPUESTO) ON
DATPERS FROM Perez;

-- F
REVOKE SELECT ON V_PREDICADORES FROM Villalba;

-- G
REVOKE SELECT (IDENTUSUARIO, SALARIO, IMPUESTO), UPDATE (IMPUESTO, AUDITORIAS) ON
DATPERS FROM Gomez;

-- H
REVOKE SELECT ON V_SALARIOS_POR_OCUPACION FROM Aguero;
