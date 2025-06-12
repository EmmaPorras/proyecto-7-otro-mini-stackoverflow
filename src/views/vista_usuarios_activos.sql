-- Vista que muestra todos los usuarios junto con el total de preguntas y respuestas que han realizado.

CREATE VIEW Vista_UsuariosActivos AS
SELECT 
    u.UsuarioID,
    u.Nombre,
    COUNT(DISTINCT p.PreguntaID) AS TotalPreguntas,
    COUNT(DISTINCT r.RespuestaID) AS TotalRespuestas
FROM Usuarios u
LEFT JOIN Preguntas p ON u.UsuarioID = p.UsuarioID
LEFT JOIN Respuestas r ON u.UsuarioID = r.UsuarioID
GROUP BY u.UsuarioID, u.Nombre;
