-- Vista que muestra las preguntas archivadas junto con el motivo y la fecha de archivo.
-- Solo incluye preguntas que han sido marcadas como archivadas.
CREATE VIEW Vista_PreguntasArchivadas AS
SELECT 
    p.id_pregunta,
    p.titulo,
    a.motivo,
    a.fecha_archivo
FROM Preguntas p
JOIN Archivos a ON p.id_pregunta = a.id_pregunta
WHERE p.archivada = 1;
GO

-- Para comprobar que la vista se ha creado correctamente
SELECT * 
FROM sys.views 
WHERE name = 'Vista_PreguntasArchivadas';
GO

-- Para ver los datos de la vista
SELECT * FROM Vista_PreguntasArchivadas;
GO