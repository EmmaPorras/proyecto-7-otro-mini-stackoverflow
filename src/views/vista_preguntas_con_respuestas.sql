-- Vista que muestra todas las preguntas junto con la cantidad total de respuestas que ha recibido cada una.
CREATE VIEW Vista_PreguntasConRespuestas AS
SELECT 
    p.id_pregunta,
    p.titulo,
    p.contenido,
    p.fecha_creacion,
    COUNT(r.id_respuesta) AS TotalRespuestas
FROM Preguntas p
LEFT JOIN Respuestas r ON p.id_pregunta = r.id_pregunta
GROUP BY p.id_pregunta, p.titulo, p.contenido, p.fecha_creacion;
GO

-- Para comprobar que la vista se ha creado correctamente
SELECT * 
FROM sys.views 
WHERE name = 'Vista_PreguntasConRespuestas';
GO

-- Para ver los datos de la vista
SELECT * FROM Vista_PreguntasConRespuestas;
GO