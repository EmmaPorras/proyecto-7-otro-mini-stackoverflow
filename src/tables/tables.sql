--Inicio en cmd
sqlcmd -S .\MSSQLSERVER_UNA0

--Crea la base de datos
CREATE DATABASE MiniStackOverflow;
GO
USE MiniStackOverflow;
GO

-- Tabla de Usuarios
CREATE TABLE Usuarios (
id_usuario INT IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
primer_apellido VARCHAR(50) NOT NULL,
segundo_apellido VARCHAR(50) NOT NULL,
correo VARCHAR(50) UNIQUE NOT NULL,
fecha_registro DATETIME DEFAULT GETDATE(),
CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario)
);

-- Tabla de Preguntas
CREATE TABLE Preguntas (
    id_pregunta INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    contenido VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    respondida BIT DEFAULT 0,
    archivada BIT DEFAULT 0,
    CONSTRAINT fk_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla de Respuestas
CREATE TABLE Respuestas (
    id_respuesta INT PRIMARY KEY IDENTITY(1,1),
    id_pregunta INT NOT NULL,
    id_usuario INT NOT NULL,
    id_respuesta_padre INT NULL,
    contenido VARCHAR(50),
    fecha_respuesta DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_preguntas FOREIGN KEY (id_pregunta) REFERENCES Preguntas(id_pregunta),
    CONSTRAINT fk_respuestas FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla de Votos
CREATE TABLE Votos (
    id_voto INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL,
    id_pregunta INT NULL,
    id_respuesta INT NULL,
    tipo_objeto VARCHAR(10) CHECK (tipo_objeto IN ('Pregunta', 'Respuesta')),
    tipo_voto INT CHECK (tipo_voto IN (-1, 1)),
    fecha_voto DATETIME DEFAULT GETDATE(),
    UNIQUE (id_usuario, tipo_objeto, id_pregunta, id_respuesta),
    CONSTRAINT fk_usuario_voto FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    CONSTRAINT fk_pregunta_voto FOREIGN KEY (id_pregunta) REFERENCES Preguntas(id_pregunta),
    CONSTRAINT fk_respuesta_voto FOREIGN KEY (id_respuesta) REFERENCES Respuestas(id_respuesta)
);

--Tabla de Archivos
CREATE TABLE Archivos (
    id_archivo INT PRIMARY KEY IDENTITY(1,1),
    id_pregunta INT NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    fecha_archivo DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_preguntas_archivo FOREIGN KEY (id_pregunta) REFERENCES Preguntas(id_pregunta)
);

-- Tabla de Auditoría
CREATE TABLE Auditoria (
    id_auditoria INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    operacion VARCHAR(10) NOT NULL,
    fecha_operacion DATETIME DEFAULT GETDATE(),
    descripcion NVARCHAR(MAX),
    CONSTRAINT fk_usuarios_auditoria FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
GO

--se altero el valor, porque el espacio no era suficiente
ALTER TABLE Preguntas
ALTER COLUMN titulo VARCHAR(255) NOT NULL;
GO

--se altero el valor, porque el espacio no era suficiente
ALTER TABLE Respuestas
ALTER COLUMN contenido VARCHAR(255) NOT NULL;
GO

-- Como el espacio aun no era suficiente para la prueba, se cambio a NVARCHAR(MAX)
ALTER TABLE Respuestas
ALTER COLUMN contenido NVARCHAR(MAX) NOT NULL;
GO