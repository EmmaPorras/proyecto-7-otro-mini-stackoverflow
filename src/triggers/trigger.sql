--trigger para registar operciones en la tabla de auditoría
CREATE TRIGGER trg_InsertPregunta
ON Preguntas
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria (UsuarioID, TablaAfectada, Operacion, Detalle)
    SELECT i.UsuarioID, 'Preguntas', 'INSERT', CONCAT('PreguntaID: ', i.PreguntaID, ', Titulo: ', i.Titulo)
    FROM inserted i;
END;

-- Trigger que registra en la tabla de auditoría cada vez que se actualiza una respuesta
CREATE TRIGGER trg_UpdateRespuesta
ON Respuestas
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria (UsuarioID, TablaAfectada, Operacion, Detalle)
    SELECT i.UsuarioID, 'Respuestas', 'UPDATE', CONCAT('RespuestaID: ', i.RespuestaID, ', Contenido modificado')
    FROM inserted i;
END;