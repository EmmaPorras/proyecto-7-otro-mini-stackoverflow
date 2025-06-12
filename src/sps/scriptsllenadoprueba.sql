-- Insertar usuarios
INSERT INTO Usuarios (nombre, primer_apellido, segundo_apellido, correo) VALUES
('Ana', 'López', 'García', 'ana@ejemplo.com'),
('Carlos', 'Ruiz', 'Mora', 'carlos@ejemplo.com'),
('María', 'Torres', 'Jiménez', 'maria@ejemplo.com');
GO

-- Insertar preguntas
INSERT INTO Preguntas (id_usuario, titulo, contenido) VALUES
(1, '¿Cuál es la URL del servicio para solicitar vacaciones?', 'No encuentro la dirección en la intranet.'),
(2, '¿Qué debo hacer si mis datos no aparecen en la aplicación X?', 'Ya validé mi sesión.');
GO

-- Insertar respuestas
INSERT INTO Respuestas (id_pregunta, id_usuario, contenido) VALUES
(2, 2, 'Puedes solicitarlo en http://intranet/rrhh/vacaciones.'),
(3, 3, 'Debes comunicarte con soporte técnico.');
GO

-- Insertar votos
INSERT INTO Votos (id_usuario, id_pregunta, id_respuesta, tipo_objeto, tipo_voto) VALUES
(3, 2, NULL, 'Pregunta', 1),  
(1, NULL, 4, 'Respuesta', 1);
GO