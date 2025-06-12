-- Vista que muestra las preguntas archivadas junto con el motivo y la fecha de archivo.
-- Solo incluye preguntas que han sido marcadas como archivadas.
CREATE VIEW Vista_PreguntasArchivadas AS
SELECT 
    p.PreguntaID,
    p.Titulo,
    a.Motivo,
    a.FechaArchivo
FROM Preguntas p
JOIN Archivos a ON p.PreguntaID = a.PreguntaID
WHERE p.Archivada = 1;
