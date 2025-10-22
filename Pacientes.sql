CREATE TABLE Pacientes (
	
	id_paciente INT IDENTITY (1,1) PRIMARY KEY,
	nombre NVARCHAR (100),
	fecha_nacimiento DATE,
	telefono NVARCHAR (20)

);

INSERT INTO Pacientes (nombre,fecha_nacimiento, telefono) VALUES
('María López', '1990-05-12', '882345678'),
('Pedro Díaz', '1985-09-30', '854321987'),
('Lucía Torres', '2000-03-22', '833456789'),
('Carlos Ramírez', '1975-11-10', '822345678'),
('Sofía Medina', '1995-07-18', '888654321'),
('Diego Vargas', '2002-01-05', '855987654'),
('Valentina Ríos', '1988-08-08', '837123456'),
('Andrés Molina', '1992-12-12', '889876543'),
('Isabel Castillo', '1993-04-15', '885123456'),
('Javier Morales', '1980-09-09', '889234567');

-- Listar pacientes con su médico asignado (JOIN)

SELECT 
    P.nombre AS Paciente,
    M.nombre AS Medico,
    M.especialidad,
    T.fecha_turno,
    CONVERT(VARCHAR(5), T.hora, 108) AS Hora,
	T.motivo
FROM Turnos T
JOIN Pacientes P ON T.id_paciente = P.id_paciente
JOIN Medicos M ON T.id_medico = M.id_medico
ORDER BY M.nombre;

-- Pacientes sin citas registradas 

SELECT 
    nombre AS Paciente
FROM Pacientes
WHERE id_paciente NOT IN (
    SELECT id_paciente FROM Turnos
);