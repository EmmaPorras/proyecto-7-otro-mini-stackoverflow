-- Vista que muestra todos los usuarios junto con el total de preguntas y respuestas que han realizado.
CREATE VIEW Vista_UsuariosActivos AS
SELECT 
    u.id_usuario,
    u.nombre,
    COUNT(DISTINCT p.id_pregunta) AS TotalPreguntas,
    COUNT(DISTINCT r.id_respuesta) AS TotalRespuestas
FROM Usuarios u
LEFT JOIN Preguntas p ON u.id_usuario = p.id_usuario
LEFT JOIN Respuestas r ON u.id_usuario = r.id_usuario
GROUP BY u.id_usuario, u.nombre;

-- Para comprobar que la vista se ha creado correctamente
SELECT * 
FROM sys.views 
WHERE name = 'Vista_UsuariosActivos';
GO

-- Para ver los datos de la vista
SELECT * FROM Vista_UsuariosActivos;
GO
