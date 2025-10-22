CREATE TABLE Medicos (
    
	id_medico INT IDENTITY (1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    especialidad NVARCHAR(100),
    telefono NVARCHAR(20)
);

INSERT INTO Medicos (nombre, especialidad, telefono) VALUES 
('Dr. Juan Pérez', 'Cardiología', '8523-4422'),
('Dr. Ana Gómez', 'Pediatría', '7698-2610'),
('Dr. Carlos Ruiz', 'Dermatología', '8129-1072'),
('Dra. Laura Méndez', 'Ginecología', '8233-9899'),
('Dr. Eduardo Salinas', 'Neurología', '7422-5521'),
('Dra. Patricia Flores', 'Oftalmología', '7243-5806');


-- Médico con más citas del día 

SELECT TOP 1
    M.nombre AS Medico,
    COUNT(*) AS Cantidad_Citas
FROM Turnos T
JOIN Medicos M ON T.id_medico = M.id_medico
WHERE T.fecha_turno = CAST(GETDATE() AS DATE)
GROUP BY M.nombre
ORDER BY COUNT(*) DESC;

--  Promedio de citas por médico

SELECT 
    AVG(cantidad*1.0) AS Promedio_Citas
FROM (
    SELECT COUNT(*) AS cantidad
    FROM Turnos
    GROUP BY id_medico
) AS sub;