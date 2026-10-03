-- Crear las siguientes reglas de integridad:
-- La columna cod_emp debe ser clave primaria.
ALTER TABLE Empleados ADD CONSTRAINT emp_pk_cod_emp PRIMARY KEY (cod_emp);

-- La columna cod_emp debe tener valores entre 100 y 1000.
ALTER TABLE Empleados ADD CONSTRAINT emp_ck_cod_emp CHECK (cod_emp
BETWEEN 100 AND 1000);

-- Las columnas tipo_doc y num_doc deben contener valores no repetidos (únicos).
ALTER TABLE Empleados ADD CONSTRAINT emp_uk_doc UNIQUE (tipo_doc, num_doc);

-- La columna Categoria debe contener algunos de los siguientes valores: Senior, Semi
Senior, Junior.
ALTER TABLE Empleados ADD CONSTRAINT emp_ck_categoria CHECK (categoria IN
('Senior', 'Semi Senior', 'Junior'));

-- La columna cod_ofic debe tener valores que existan en Oficinas
ALTER TABLE Empleados ADD CONSTRAINT emp_fk_cod_ofic FOREIGN KEY (cod_ofic)
REFERENCES Oficinas (cod_ofic);
