sqlcmd -S .\MSSQLSERVER_UNA0

CREATE DATABASE MiniStackOverflow;
GO
USE MiniStackOverflow;
GO

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

-- Tabla de Preguntas
CREATE TABLE Preguntas (
    PreguntaID INT PRIMARY KEY IDENTITY,
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID),
    Titulo NVARCHAR(255),
    Contenido NVARCHAR(MAX),
    FechaPublicacion DATETIME DEFAULT GETDATE(),
    Respondida BIT DEFAULT 0,
    Archivada BIT DEFAULT 0
);

-- Tabla de Respuestas
CREATE TABLE Respuestas (
    RespuestaID INT PRIMARY KEY IDENTITY,
    PreguntaID INT FOREIGN KEY REFERENCES Preguntas(PreguntaID),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID),
    Contenido NVARCHAR(MAX),
    FechaRespuesta DATETIME DEFAULT GETDATE()
);

-- Tabla de Votos
CREATE TABLE Votos (
    VotoID INT PRIMARY KEY IDENTITY,
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID),
    TipoObjeto VARCHAR(10) CHECK (TipoObjeto IN ('Pregunta', 'Respuesta')),
    ObjetoID INT,
    Valor INT CHECK (Valor IN (-1, 1)),
    FechaVoto DATETIME DEFAULT GETDATE(),
    UNIQUE (UsuarioID, TipoObjeto, ObjetoID)
);

-- Tabla de Archivos
CREATE TABLE Archivos (
    ArchivoID INT PRIMARY KEY IDENTITY,
    PreguntaID INT FOREIGN KEY REFERENCES Preguntas(PreguntaID),
    Motivo NVARCHAR(255),
    FechaArchivo DATETIME DEFAULT GETDATE()
);

-- Tabla de Auditoría
CREATE TABLE Auditoria (
    AuditoriaID INT PRIMARY KEY IDENTITY,
    UsuarioID INT,
    TablaAfectada NVARCHAR(50),
    Operacion NVARCHAR(10),
    FechaOperacion DATETIME DEFAULT GETDATE(),
    Detalle NVARCHAR(MAX)
);