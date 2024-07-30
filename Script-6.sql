-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS agencia_coches;
USE agencia_coches;

-- Tabla COCHES
CREATE TABLE COCHES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Matricula VARCHAR(20),
    Modelo VARCHAR(100),
    Propietario VARCHAR(200)
);

ALTER TABLE Coches
ADD Marca varchar(50);
ALTER TABLE Coches
ADD Anio Int;


-- Tabla PERSONAS
CREATE TABLE IF NOT EXISTS Personas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    RFC VARCHAR(20),
    Apellidos VARCHAR(100),
    Nombre VARCHAR(100),
    Fecha_nacimiento DATE,
    Sexo CHAR(1),
    Telefono VARCHAR(20),
    Calle_y_Numero VARCHAR(200),
    CP VARCHAR(10),
    Municipio VARCHAR(100)
);

-- Tabla SERVICIOS
CREATE TABLE IF NOT EXISTS Servicios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Actividad VARCHAR(100),
    Coche INT,
    Fecha_planificada DATE,
    Fecha_servicio DATE,
    Duracion INT,
    Mecanico VARCHAR(100),
    Tipo_servicio VARCHAR(100),
    costo DECIMAL(10, 2),
    calificacion INT,
    FOREIGN KEY (Coche) REFERENCES Coches(ID)
);

ALTER TABLE servicios 
ADD calificacion Int;

-- Tabla VENTAS
CREATE TABLE IF NOT EXISTS Ventas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_venta DATE,
    Coche INT,
    Comercial VARCHAR(100),
    FOREIGN KEY (Coche) REFERENCES Coches(ID)
);

CREATE TABLE EMPLEADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Puesto VARCHAR(50)
);

CREATE TABLE SERVICIOSREALIZADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CocheID INT,
    ServicioID INT,
    EmpleadoID INT,
    Fecha DATE,
    Costos DECIMAL(10, 2),
    Calificacion INT,
    FOREIGN KEY (CocheID) REFERENCES COCHES(ID),
    FOREIGN KEY (ServicioID) REFERENCES SERVICIOS(ID),
    FOREIGN KEY (EmpleadoID) REFERENCES EMPLEADOS(ID)
);


INSERT INTO EMPLEADOS (Nombre, Apellido, Puesto) VALUES
('Carlos', 'López', 'Mecánico'),
('Maria', 'Torrez', 'Mecánica'),
('Luis', 'Davila', 'Mecánico'),
('Jaime', 'Cocom', 'Mecánico'),
('Julio', 'Zapata', 'Mecánico'),
('Leonardo', 'Estrella', 'Mecánico');

INSERT INTO SERVICIOSREALIZADOS (CocheID,ServicioID, EmpleadoID, Fecha) VALUES
(1, 1, 1, '2024-07-01'),
(2, 2, 2, '2024-07-02'),
(3, 3, 3, '2024-07-03'),
(4, 4, 4, '2024-07-04'),
(5, 5, 5, '2024-07-05'),
(6, 6, 6, '2024-07-06');


-- AGREGA 5 PERSONAS (CLIENTES)
INSERT INTO Personas (RFC, Apellidos, Nombre, Fecha_nacimiento, Sexo, Telefono, Calle_y_Numero, CP, Municipio)
VALUES ('12345678A', 'García Pérez', 'Juan', '1990-05-15', 'M', '987654321', 'Calle Principal 123', '28001', 'Madrid'),
('09653764B', 'Cuxim Pech', 'Jorge', '1999-09-22', 'M', '9994563245', 'Calle Pedregal 903', '23903', 'Yucatan'),
('87998423C', 'Tzap Uc', 'Yara', '2000-04-19', 'F', '9993657834', 'Calle Miraflores 209', '22908', 'Chiapas'),
('78456234D', 'Cristel Tepal', 'Sara', '2002-11-13','F', '9934672312', 'Calle El manguito 110', '23894', 'Jalisco'),
('98542345E', 'Cocom Uicap', 'Pedro', '1977-10-21','M', '9995643412', 'Calle Sancamilo 210', '28905', 'Espita');      
       
       -- AGREGA 8 COCHES
INSERT INTO Coches (Matricula , Modelo, Propietario)
VALUES
    ('1234ABC', 'Seat Ibiza', 1),
    ('9087XYE', 'Alfa Romeo', 2),
    ('7654ADC', 'Aston Martin', 3),
    ('5643ASD', 'Ford', 4),
    ('2341FRD', 'Hyundai', 5),
    ('2345RPT', 'Bmw', 6),
    ('5673PYU', 'Audi', 7),
    ('6734GYR', 'Jaguar', 8);


-- AGREGA 8 SERVICIOS
INSERT INTO Servicios (Tipo_Actividad, Coche, Fecha_planificada, Fecha_servicio, Duracion, Mecanico, Tipo_servicio, costo, calificacion)
VALUES ('Mantenimiento', 1, '2024-07-20', '2024-07-20', 2, 'Carlos López', 'Revision', '1000', '7'),
('Cambio de llanta', 2, '2024-09-22 ', '2024-09-22', 3, 'Maria Torrez', 'Revision', '680', '8'),
('Cambio de bujías', 3, '2024-06-14' , '2024-06-14', 1, 'Luis Davila' , 'Revision', '350','6'),
('Cambio de aceite y filtro', 4,'2024-03-10' , '2024-03-10', 2, 'Jaime Cocom' , 'Revision', '400', '9'),
('Cambio del filtro de gasolina y aire', 5, '2024-05-21' , '2024-05-21' , 2, 'Julio Zapata', 'Revision', '330', '7'),
('Cambio del refrigerante',  6, '2024-04-17', '2024-04-17' , 3, 'Samuel Torrez', 'Revision', '440', '10'),
('Cambio de la faja del alternador' , 7, '2024-11-23' , '2024-11-23', 4, 'Miguel colli', 'Revision', '670', '9'),
('Ajuste del tiempo de encendido',  8, '2024-12-14' , '2024-12-14' , 2, 'Leonardo Estrella', 'Revision', '2300', '6');

-- AGREGA 8 ventas 
INSERT INTO Ventas (Fecha_venta, Coche, Comercial)
VALUES ('2024-07-20', 1, 'Ana Martínez'),
('2024-08-20' , 2, 'Juan Pablo'),
('2024-06-27' , 3, 'Denis Cocom'),
('2024-04-22' , 4, 'Jose Alberto'),
('2024-02-16' , 5, 'Rangel Medina'),
('2024-05-29' , 6, 'Alfonso Lastras'),
('2024-10-30' , 7, 'Karen Estrada'),
('2024-12-01' , 8, 'Flor Camal');

-- 1. Muestra la lista de todos los coches y sus dueños

SELECT C.Modelo, C.Matricula, P.Nombre, P.Apellidos
FROM COCHES AS C
JOIN PERSONAS AS P ON C.Propietario = P.ID;

-- 2. Obtener el nombre completo del propietario de un coche dado su número de matrícula

SELECT P.Nombre, P.Apellidos
FROM PERSONAS AS P
JOIN COCHES AS C ON P.ID = C.Propietario
WHERE Matricula = '1234ABC'; -- Reemplaza con la matrícula del coche que deseas consultar

-- 3. Listar todos los coches junto con la última fecha de servicio registrado para cada uno

SELECT C.Modelo, C.Matricula, MAX(S.Fecha_servicio) AS Ultima_fecha_servicio
FROM COCHES AS C
LEFT JOIN SERVICIOS AS S ON C.ID = S.Coche
GROUP BY C.Modelo, C.Matricula;

-- 4. Calcular el número total de servicios realizados por cada coche

SELECT C.Modelo, C.Matricula, COUNT(S.ID) AS Total_Servicios
FROM COCHES AS C
LEFT JOIN SERVICIOS AS S ON C.ID = S.Coche
GROUP BY C.Modelo, C.Matricula;

-- 5. Muestra el promedio de servicios prestados a cada cliente

SELECT P.Nombre, P.Apellidos, AVG(ServiciosPorCliente.NumServicios) AS Promedio_Servicios
FROM PERSONAS AS P
JOIN (
    SELECT C.Propietario, COUNT(S.ID) AS NumServicios
    FROM COCHES AS C
    LEFT JOIN SERVICIOS AS S ON C.ID = S.Coche
    GROUP BY C.Propietario
) AS ServiciosPorCliente ON P.ID = ServiciosPorCliente.Propietario
GROUP BY P.Nombre, P.Apellidos;

-- 6. Muestra total de servicios prestados a cada cliente por año

SELECT P.Nombre, P.Apellidos, YEAR(S.Fecha_servicio) AS Año, COUNT(S.ID) AS Total_Servicios
FROM PERSONAS AS P
JOIN COCHES AS C ON P.ID = C.Propietario
JOIN SERVICIOS AS S ON C.ID = S.Coche
GROUP BY P.Nombre, P.Apellidos, YEAR(S.Fecha_servicio)
ORDER BY P.Nombre, P.Apellidos, Año;

1. Obtener el historial completo de servicios realizados a todos los carros, incluyendo detalles del propietario, carro, servicio y empleado responsable.

SELECT 
    COCHES.Matricula,
    COCHES.Propietario,
    COCHES.Modelo,
    SERVICIOS.Tipo_Actividad AS Servicio,
    EMPLEADOS.Nombre AS EmpleadoNombre,
    EMPLEADOS.Apellido AS EmpleadoApellido,
    EMPLEADOS.Puesto AS EmpleadoPuesto,
    SERVICIOSREALIZADOS.Fecha
FROM 
    SERVICIOSREALIZADOS
JOIN 
    COCHES ON SERVICIOSREALIZADOS.CocheID = COCHES.ID
JOIN 
    SERVICIOS ON SERVICIOSREALIZADOS.ServicioID = SERVICIOS.ID
JOIN 
    EMPLEADOS ON SERVICIOSREALIZADOS.EmpleadoID = EMPLEADOS.ID;


2. Obtener el total de ingresos generados por cada tipo de servicio.
   
SELECT 
    SERVICIOS.Tipo_Actividad AS TipoServicio,
    SUM(SERVICIOS.costo) AS TotalIngresos
FROM 
    SERVICIOS
GROUP BY 
    SERVICIOS.Tipo_Actividad;


3. Obtener la cantidad de servicios realizados por cada empleado en un período específico.

SELECT 
    EMPLEADOS.Nombre,
    EMPLEADOS.Apellido,
    COUNT(SERVICIOSREALIZADOS.ID) AS CantidadServicios
FROM 
    SERVICIOSREALIZADOS
JOIN 
    EMPLEADOS ON SERVICIOSREALIZADOS.EmpleadoID = EMPLEADOS.ID
WHERE 
    SERVICIOSREALIZADOS.Fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    EMPLEADOS.Nombre, EMPLEADOS.Apellido;

4. Obtener la lista de carros que han recibido más de un servicio, junto con el número de servicios recibidos.

SELECT 
    COCHES.Matricula,
    COCHES.Propietario,
    COCHES.Modelo,
    COUNT(SERVICIOS.Tipo_Actividad) AS NumeroServicios
FROM 
    SERVICIOS
JOIN 
    COCHES ON SERVICIOS.Coche = COCHES.ID
GROUP BY 
    COCHES.Matricula, COCHES.Modelo, COCHES.Propietario
HAVING 
    COUNT(SERVICIOS.Tipo_Actividad) > 1;


5. Obtener el promedio de calificaciones de los servicios realizados por cada empleado.

SELECT 
    Servicios.Mecanico,
    AVG(Servicios.Calificacion) AS PromedioCalificacion
FROM 
    Servicios
GROUP BY 
    Servicios.Mecanico;


6. Obtener los detalles del último servicio realizado para cada carro.

SELECT 
    COCHES.Matricula,
    COCHES.Propietario,
    COCHES.MODELO,
    SERVICIOS. Tipo_Actividad AS Servicio,
    EMPLEADOS.Nombre AS EmpleadoNombre,
    EMPLEADOS.Apellido AS EmpleadoApellido,
    EMPLEADOS.Puesto AS EmpleadoPuesto,
    SR.Fecha
FROM 
    SERVICIOSREALIZADOS SR
JOIN 
    COCHES ON SR.CocheID = COCHES.ID
JOIN 
    SERVICIOS ON SR.ServicioID = SERVICIOS.ID
JOIN 
    EMPLEADOS ON SR.EmpleadoID = EMPLEADOS.ID
WHERE 
    SR.Fecha = (
        SELECT MAX(SR2.Fecha)
        FROM SERVICIOSREALIZADOS SR2
        WHERE SR2.CocheID = SR.CocheID
    );

7. Obtener la lista de propietarios que han gastado más de una cantidad específica en servicios.

SELECT 
    COCHES.Propietario,
    SUM(SRV.costo) AS TotalGastado
FROM 
    SERVICIOS SRV
JOIN 
    COCHES ON SRV.Coche = COCHES.ID
GROUP BY 
    COCHES.Propietario
HAVING 
    SUM(SRV.costo) > 1000; -- Reemplaza 1000 con la cantidad específica



8. Obtener el número de servicios realizados por cada tipo de carro (marca y modelo).

SELECT 
    COCHES.MODELO,
    COCHES.Matricula,
    COUNT(SERVICIOSREALIZADOS.ID) AS NumeroServicios
FROM 
    SERVICIOSREALIZADOS
JOIN 
    COCHES ON SERVICIOSREALIZADOS.CocheID = COCHES.ID
GROUP BY 
    COCHES.MODELO, COCHES.Matricula;

9. Obtener el mes con mayor número de servicios realizados en el último año.

SELECT 
    DATE_FORMAT(Fecha, '%Y-%m') AS Mes,
    COUNT(ID) AS NumeroServicios
FROM 
    SERVICIOSREALIZADOS
WHERE 
    Fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY 
    DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY 
    NumeroServicios DESC
LIMIT 1;

10. Obtener la lista de carros y sus propietarios que no han recibido ningún servicio en el último año.

SELECT 
    COCHES.Matricula,
    COCHES.Propietario,
    COCHES.Modelo
FROM 
    COCHES
LEFT JOIN 
    SERVICIOSREALIZADOS ON COCHES.ID = SERVICIOSREALIZADOS.CocheID
    AND SERVICIOSREALIZADOS.Fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
WHERE 
    SERVICIOSREALIZADOS.ID IS NULL;
