-- 1)  Consulta para votar una pregunta.
MERGE Votos AS target
USING (SELECT 3 AS id_usuario, 'Pregunta' AS tipo_objeto, 2 AS id_pregunta, NULL AS id_respuesta, 1 AS tipo_voto) AS source
ON target.id_usuario = source.id_usuario AND target.tipo_objeto = source.tipo_objeto AND target.id_pregunta = source.id_pregunta
WHEN MATCHED THEN
    UPDATE SET tipo_voto = source.tipo_voto, fecha_voto = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (id_usuario, tipo_objeto, id_pregunta, id_respuesta, tipo_voto) 
    VALUES (source.id_usuario, source.tipo_objeto, source.id_pregunta, source.id_respuesta, source.tipo_voto);
GO

-- 2) Consulta que permita obtener las preguntas sin responder.
SELECT p.*
FROM Preguntas p
LEFT JOIN Respuestas r ON p.id_pregunta = r.id_pregunta
WHERE r.id_pregunta IS NULL;
GO

-- 3) Consulta que obtenga las respuestas de las preguntas. 
SELECT r.*
FROM Respuestas r
WHERE r.id_pregunta = 2; --respuesta con el id_pregunta 2
GO

-- 4) consulta que obtenga la lista de usuarios que más han aportado preguntas
SELECT u.nombre, COUNT(p.id_pregunta) AS TotalPreguntas
FROM Usuarios u
JOIN Preguntas p ON u.id_usuario = p.id_usuario
GROUP BY u.nombre
ORDER BY TotalPreguntas DESC;  --ordena res de mayor a menor
GO

-- 5)  Consulta que permita crear o actualizar una pregunta. 
-- Crear nueva
INSERT INTO Preguntas (id_usuario, titulo, contenido) VALUES (1, 'PC no enciende', 'Mi PC no enciende?');
GO

-- Actualizar  pregunta existente
UPDATE Preguntas
SET titulo = 'CommitGit', contenido = 'Como subo mi repo a GitHub?'
WHERE id_pregunta = 8;
GO

-- 6) Consulta que permita agregar una respuesta a una pregunta. 
INSERT INTO Respuestas (id_pregunta, id_usuario, contenido) 
VALUES (8, 2, 'Es con el comando tal'); 
GO

-- 7)  Consulta que permita archivar una pregunta indicando las razones.
UPDATE Preguntas SET archivada = 1 WHERE id_pregunta = 8;
INSERT INTO Archivos (id_pregunta, motivo)
VALUES (2, 'La pregunta ya no sirve.');
GO