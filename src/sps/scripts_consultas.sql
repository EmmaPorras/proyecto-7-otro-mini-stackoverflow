--a) Votar una pregunta (insertar o actualizar voto)
MERGE Votos AS target
USING (SELECT 3 AS UsuarioID, 'Pregunta' AS TipoObjeto, 1 AS ObjetoID, 1 AS Valor) AS source
ON target.UsuarioID = source.UsuarioID AND target.TipoObjeto = source.TipoObjeto AND target.ObjetoID = source.ObjetoID
WHEN MATCHED THEN
    UPDATE SET Valor = source.Valor, FechaVoto = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (UsuarioID, TipoObjeto, ObjetoID, Valor) VALUES (source.UsuarioID, source.TipoObjeto, source.ObjetoID, source.Valor);

 --b) Preguntas sin responder
    SELECT p.*
FROM Preguntas p
LEFT JOIN Respuestas r ON p.PreguntaID = r.PreguntaID
WHERE r.PreguntaID IS NULL;

--c) Respuestas de una pregunta
SELECT r.*
FROM Respuestas r
WHERE r.PreguntaID = 1; -- Cambiar ID según pregunta

--d) Usuarios que más han aportado preguntas
SELECT u.Nombre, COUNT(p.PreguntaID) AS TotalPreguntas
FROM Usuarios u
JOIN Preguntas p ON u.UsuarioID = p.UsuarioID
GROUP BY u.Nombre
ORDER BY TotalPreguntas DESC;

--e) Crear o actualizar una pregunta
-- Crear nueva
INSERT INTO Preguntas (UsuarioID, Titulo, Contenido) VALUES (1, 'Título nuevo', 'Contenido de la pregunta');

-- Actualizar existente
UPDATE Preguntas
SET Titulo = 'Nuevo título', Contenido = 'Nuevo contenido'
WHERE PreguntaID = 1;

--f) Agregar una respuesta
INSERT INTO Respuestas (PreguntaID, UsuarioID, Contenido) 
VALUES (1, 2, 'Esta es una nueva respuesta.');

--g) Archivar una pregunta
UPDATE Preguntas SET Archivada = 1 WHERE PreguntaID = 1;

INSERT INTO Archivos (PreguntaID, Motivo)
VALUES (1, 'La pregunta ya no es relevante.');

