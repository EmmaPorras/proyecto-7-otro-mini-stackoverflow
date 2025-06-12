-- Insertar usuarios
INSERT INTO Usuarios (Nombre, Correo) VALUES
('Ana López', 'ana@ejemplo.com'),
('Carlos Ruiz', 'carlos@ejemplo.com'),
('María Torres', 'maria@ejemplo.com');

-- Insertar preguntas
INSERT INTO Preguntas (UsuarioID, Titulo, Contenido) VALUES
(1, '¿Cuál es la URL del servicio para solicitar vacaciones?', 'No encuentro la dirección en la intranet.'),
(2, '¿Qué debo hacer si mis datos no aparecen en la aplicación X?', 'Ya validé mi sesión.');

-- Insertar respuestas
INSERT INTO Respuestas (PreguntaID, UsuarioID, Contenido) VALUES
(1, 2, 'Puedes solicitarlo en http://intranet/rrhh/vacaciones.'),
(2, 3, 'Debes comunicarte con soporte técnico.');

-- Insertar votos
INSERT INTO Votos (UsuarioID, TipoObjeto, ObjetoID, Valor) VALUES
(3, 'Pregunta', 1, 1),
(1, 'Respuesta', 1, 1);