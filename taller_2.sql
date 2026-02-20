create database universidad;
use universidad;
CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) not null,
    materia VARCHAR(100)
);
INSERT INTO profesores (nombre, materia) VALUES
('Carlos Lopez', 'Matematicas'),
('Ana Torres', 'Ingles'),
('Luis Perez', 'Programacion'),
('Maria Gomez', 'Fisica'),
('Pedro Ruiz', 'Historia');

CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);
INSERT INTO materias (nombre, id_profesor) VALUES
('Algebra', 1),
('Calculo', 1),
('JavaScript', 3),
('Fisica I', 4),
('Historia Universal', 5);
SELECT materias.nombre AS materia,
       profesores.nombre AS profesor
FROM materias
JOIN profesores 
ON materias.id_profesor = profesores.id_profesor;
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) not null
);
INSERT INTO estudiantes (nombre) VALUES
('Juan'),
('Sara'),
('Mateo'),
('Laura'),
('Camila');
CREATE TABLE estudiantes_materias (
    id_estudiante INT,
    id_materia INT,
    PRIMARY KEY (id_estudiante, id_materia),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);
INSERT INTO estudiantes_materias VALUES
(1,1),
(1,3),
(2,2),
(3,3),
(4,5);

SELECT estudiantes.nombre AS estudiante,
       materias.nombre AS materia
FROM estudiantes_materias
JOIN estudiantes ON estudiantes_materias.id_estudiante = estudiantes.id_estudiante
JOIN materias ON estudiantes_materias.id_materia = materias.id_materia;