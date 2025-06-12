-- 1) Para registrar operaciones en la tabla de auditoría al insertar una pregunta
CREATE TRIGGER trg_InsertPregunta
ON Preguntas
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria (id_usuario, tabla_afectada, operacion, descripcion)
    SELECT i.id_usuario, 'Preguntas', 'INSERT', CONCAT('id_pregunta: ', i.id_pregunta, ', titulo: ', i.titulo)
    FROM inserted i;
END;
GO

-- 2) Registra en la tabla de auditoría cada vez que se actualiza una respuesta
CREATE TRIGGER trg_UpdateRespuesta
ON Respuestas
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria (id_usuario, tabla_afectada, operacion, descripcion)
    SELECT i.id_usuario, 'Respuestas', 'UPDATE', CONCAT('id_respuesta: ', i.id_respuesta, ', contenido modificado')
    FROM inserted i;
END;
GO

 -- Para comprobar que existen
SELECT name, parent_id AS table_object_id, OBJECT_NAME(parent_id) AS table_name
FROM sys.triggers
WHERE name IN ('trg_InsertPregunta', 'trg_UpdateRespuesta');
GO