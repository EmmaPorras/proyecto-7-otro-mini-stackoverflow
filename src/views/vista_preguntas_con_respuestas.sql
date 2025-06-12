-- Vista que muestra todas las preguntas junto con la cantidad total de respuestas que ha recibido cada una.
CREATE VIEW Vista_PreguntasConRespuestas AS
SELECT 
    p.PreguntaID,
    p.Titulo,
    p.Contenido,
    p.FechaPublicacion,
    COUNT(r.RespuestaID) AS TotalRespuestas
FROM Preguntas p
LEFT JOIN Respuestas r ON p.PreguntaID = r.PreguntaID
GROUP BY p.PreguntaID, p.Titulo, p.Contenido, p.FechaPublicacion;
