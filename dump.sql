
CREATE DATABASE Awaq;

USE Awaq;

CREATE TABLE `roles`(
	`role_id` INT NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`role_id`)
);

CREATE TABLE `languages`(
	`language_id` INT NOT NULL AUTO_INCREMENT,
    `language` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`language_id`)
);

CREATE TABLE `categories`(
	`category_id` INT NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`category_id`)
);

CREATE TABLE `users`(
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(255),
    `joinedAt` DATE,
    `birthDate` DATE,
	`profile_picture` VARCHAR(255),
    `role_id` INT NOT NULL,
    `language_id` INT,
    PRIMARY KEY(`user_id`),
    FOREIGN KEY(`role_id`) REFERENCES `roles`(`role_id`),
    FOREIGN KEY(`language_id`) REFERENCES `languages`(`language_id`)
);

CREATE TABLE `memorandums`(
	`memorandum_id` INT NOT NULL AUTO_INCREMENT,
    `html` VARCHAR(255) NOT NULL,
    `css` VARCHAR(255) NOT NULL,
    `result` VARCHAR(255) NOT NULL,
    `explanation` VARCHAR(255),
    PRIMARY KEY(`memorandum_id`)
);

CREATE TABLE `questions`(
	`question_id` INT NOT NULL AUTO_INCREMENT,
    `question` VARCHAR(255) NOT NULL,
    `correctAnswer` VARCHAR(255) NOT NULL,
    `answer2` VARCHAR(255) NOT NULL,
    `answer3` VARCHAR(255) NOT NULL,
    `answer4` VARCHAR(255) NOT NULL,
    `explanation` VARCHAR(255),
    `category_id` INT NOT NULL,
    PRIMARY KEY(`question_id`),
    FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
);

CREATE TABLE `trueFalseQuestions`(
	`true_false_id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(255) NOT NULL,
    `isCorrect` INT NOT NULL,
    `explanation` VARCHAR(255) NOT NULL,
    `category_id` INT NOT NULL,
    PRIMARY KEY(`true_false_id`),
    FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
);


CREATE TABLE `user_memorandum`(
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `memorandum_id` INT NOT NULL,
    `solved` INT NOT NULL,
    PRIMARY KEY(`user_id`, `memorandum_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY(`memorandum_id`) REFERENCES `memorandums`(`memorandum_id`)
);

CREATE TABLE `user_trueFalse`(
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `true_false_id` INT NOT NULL,
    `solved` INT NOT NULL,
    PRIMARY KEY(`user_id`, `true_false_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY(`true_false_id`) REFERENCES `trueFalseQuestions`(`true_false_id`)
);

CREATE TABLE `user_question`(
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `question_id` INT NOT NULL,
    `solved` INT NOT NULL,
    PRIMARY KEY(`user_id`, `question_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY(`question_id`) REFERENCES `questions`(`question_id`)
);

INSERT INTO roles (role) VALUES ('Super Admin');
INSERT INTO roles (role) VALUES ('Admin');
INSERT INTO roles (role) VALUES ('Member');

INSERT INTO languages (language) VALUES ('Inglés');
INSERT INTO languages (language) VALUES ('Español');

INSERT INTO categories (category) VALUES ('Ciberseguridad');
INSERT INTO categories (category) VALUES ('Desarrollo web');
INSERT INTO categories (category) VALUES ('Metodologias de trabajo');
INSERT INTO categories (category) VALUES ('Pautas de conducta');

INSERT INTO users (name, email, password, phoneNumber, joinedAt, birthDate, profile_picture, role_id, language_id) VALUES 
('Miguel Mendoza Jaidar', 'a01234354@tec.mx', '123', 5567892345, '2024-04-01', '1990-06-15', 'https://badgerautomation.com/wp-content/uploads/2019/01/person2.jpg', 1, 2),
('Miguel Mendoza Jaidar', 'miguelmendozaj20@gmail.com', '123', 5567892345, '2024-04-01', '1990-06-15', 'https://badgerautomation.com/wp-content/uploads/2019/01/person2.jpg', 1, 2),
('Ana María Ruiz', 'ana.ruiz@example.com', 'SecurePassword1', 5567892345, '2024-04-01', '1990-06-15', 'https://badgerautomation.com/wp-content/uploads/2019/01/person2.jpg', 2, 2),
('Carlos Jiménez López', 'carlos.jimenez@example.com', 'SecurePassword2', 5567982346, '2024-04-05', '1988-08-20', 'https://badgerautomation.com/wp-content/uploads/2019/01/person4.jpg', 2, 2),
('Lucía Fernández Vidal', 'lucia.fernandez@example.com', 'SecurePassword3', 5567892347, '2024-04-10', '1992-03-25', 'https://www.fiqma.org/wp-content/uploads/2019/01/person5.jpg', 2, 1),
('Jorge Martín Gómez', 'jorge.martin@example.com', 'SecurePassword4', 5567892348, '2024-04-15', '1985-12-30', 'https://badgerautomation.com/wp-content/uploads/2019/01/person3.jpg', 2, 1),
('Elena Núñez Castillo', 'elena.nunez@example.com', 'SecurePassword5', 5567892349, '2024-04-20', '1995-07-10','https://static.cegos.es/content/uploads/2023/03/01165224/GettyImages-1300321639.jpg', 2, 2),
('Raúl Molina Santos', 'raul.molina@example.com', 'SecurePassword6', 5567892350, '2024-04-25', '1991-01-18','https://www.fiqma.org/wp-content/uploads/2019/01/person6.jpg', 2, 1);

INSERT INTO users (name, email, password, phoneNumber, joinedAt, birthDate, role_id, language_id) VALUES 
('Sofía Guerrero Salazar', 'sofia.guerrero@example.com', 'SecurePassword7', '5567892360', '2024-04-30', '1993-05-05', 3, 2),
('Miguel Ángel Torres', 'miguel.torres@example.com', 'SecurePassword8', '5567892361', '2024-05-05', '1989-09-15', 3, 1),
('Isabel Medina Hernández', 'isabel.medina@example.com', 'SecurePassword9', '5567892362', '2024-05-10', '1994-02-20', 3, 1),
('Diego Alonso Navarro', 'diego.navarro@example.com', 'SecurePassword10', '5567892363', '2024-05-15', '1990-11-30', 2, 2),
('Carmen Reyes Martínez', 'carmen.reyes@example.com', 'SecurePassword11', '5567892364', '2024-05-20', '1992-07-08', 2, 1),
('Felipe Gómez Castillo', 'felipe.gomez@example.com', 'SecurePassword12', '5567892365', '2024-05-25', '1988-03-14', 1, 2),
('Laura Jiménez Morales', 'laura.jimenez@example.com', 'SecurePassword13', '5567892366', '2024-05-30', '1995-08-25', 2, 1),
('Oscar Ruiz Díaz', 'oscar.ruiz@example.com', 'SecurePassword14', '5567892367', '2024-06-04', '1987-12-05', 1, 2),
('Marta Sánchez López', 'marta.sanchez@example.com', 'SecurePassword15', '5567892368', '2024-06-09', '1991-01-20', 3, 1);

--  Memorandum
INSERT INTO memorandums (html, css, result, explanation) VALUES 
('<button></button>', 'button { background-color: blue; }', '<button style="background-color: blue;"></button>', 'Establece el color de fondo del botón a azul.'),
('<h1></h1>', 'h1 { font-weight: bold; }', '<h1 style="font-weight: bold;"></h1>', 'Aplica negrita al texto del encabezado H1.'),
('<img src="image.jpg" />', 'img { width: 100px; height: 100px; }', '<img src="image.jpg" style="width: 100px; height: 100px;" />', 'Define las dimensiones de la imagen a 100px por 100px.'),
('<a href="#">Enlace</a>', 'a { color: red; }', '<a href="#" style="color: red;">Enlace</a>', 'Cambia el color del enlace a rojo.');

INSERT INTO memorandums (html, css, result, explanation) VALUES 
('<p></p>', 'p { color: green; }', '<p style="color: green;"></p>', 'Establece el color del texto del párrafo a verde.'),
('<div></div>', 'div { border: 1px solid black; }', '<div style="border: 1px solid black;"></div>', 'Añade un borde sólido negro alrededor del div.'),
('<span></span>', 'span { font-size: 20px; }', '<span style="font-size: 20px;"></span>', 'Establece el tamaño de fuente del texto dentro del span a 20px.'),
('<ul><li>Item</li></ul>', 'li { list-style-type: none; }', '<ul><li style="list-style-type: none;">Item</li></ul>', 'Elimina el marcador de lista del elemento li.'),
('<textarea></textarea>', 'textarea { resize: none; }', '<textarea style="resize: none;"></textarea>', 'Impide que el área de texto sea redimensionable.');

INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (1, 5, 1);  -- Usuario 1 ha resuelto el memorándum 5.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (2, 6, 0);  -- Usuario 2 no ha resuelto el memorándum 6.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (3, 7, 1);  -- Usuario 3 ha resuelto el memorándum 7.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (4, 8, 0);  -- Usuario 4 no ha resuelto el memorándum 8.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (5, 9, 1);  -- Usuario 5 ha resuelto el memorándum 9.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (6, 5, 0);  -- Usuario 6 no ha resuelto el memorándum 5.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (7, 6, 1);  -- Usuario 7 ha resuelto el memorándum 6.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (8, 7, 0);  -- Usuario 8 no ha resuelto el memorándum 7.
INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES (9, 8, 1);  -- Usuario 9 ha resuelto el memorándum 8.


-- TrueFalse
INSERT INTO trueFalseQuestions (text, isCorrect, explanation, category_id) VALUES 
('Python es un lenguaje de programación interpretado.', 1, 'Python es un lenguaje interpretado que no necesita ser compilado antes de su ejecución.', 1),
('HTML es un lenguaje de programación.', 0, 'HTML no es un lenguaje de programación, es un lenguaje de marcado utilizado para estructurar páginas web.', 2),
('En ciberseguridad, un ataque de fuerza bruta se utiliza para romper cifrados.', 1, 'Un ataque de fuerza bruta intenta descifrar datos (como contraseñas o claves cifradas) probando todas las combinaciones posibles.', 1),
('JavaScript se ejecuta únicamente en el lado del servidor.', 0, 'JavaScript se puede ejecutar tanto en el lado del cliente como en el servidor (Node.js).', 2),
('SSL y TLS son lo mismo.', 1, 'TLS es el sucesor de SSL, pero ambos son protocolos usados para asegurar comunicaciones en la web.', 2);

INSERT INTO trueFalseQuestions (text, isCorrect, explanation, category_id) VALUES 
('Un ataque XSS es un tipo de vulnerabilidad de seguridad en aplicaciones web.', 1, 'XSS (Cross-Site Scripting) permite a los atacantes inyectar scripts maliciosos en sitios web que parecen de confianza.', 1),
('Flask es un framework de desarrollo para aplicaciones de escritorio en Python.', 0, 'Flask es un micro framework para el desarrollo de aplicaciones web en Python, no para aplicaciones de escritorio.', 2),
('SQL Injection es un ataque que puede ser usado para comprometer bases de datos de aplicaciones web.', 1, 'SQL Injection es una técnica de inyección que puede permitir a los atacantes ejecutar consultas maliciosas en una base de datos.', 1),
('Django es menos flexible que Flask porque no permite el uso de múltiples bases de datos.', 0, 'Django es altamente flexible y de hecho soporta el uso de múltiples bases de datos simultáneamente.', 2),
('Los firewalls pueden prevenir todos los tipos de ataques cibernéticos.', 0, 'Mientras que los firewalls son una parte crucial de la seguridad cibernética, no pueden prevenir todos los tipos de ataques.', 1);

INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (1, 1, 1);  -- Usuario 1 ha resuelto la pregunta 1 correctamente.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (1, 2, 1);  -- Usuario 1 ha resuelto la pregunta 2 correctamente.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (2, 3, 0);  -- Usuario 2 ha respondido incorrectamente a la pregunta 3.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (3, 4, 0);  -- Usuario 3 ha respondido incorrectamente a la pregunta 4.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (4, 5, 1);  -- Usuario 4 ha resuelto la pregunta 5 correctamente.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (5, 6, 1);  -- Usuario 5 ha resuelto la pregunta 6 correctamente.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (6, 7, 0);  -- Usuario 6 ha respondido incorrectamente a la pregunta 7.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (7, 8, 1);  -- Usuario 7 ha resuelto la pregunta 8 correctamente.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (8, 9, 0);  -- Usuario 8 ha respondido incorrectamente a la pregunta 9.
INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES (9, 10, 1);  -- Usuario 9 ha resuelto la pregunta 10 correctamente.

-- Questions
INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES 
('¿Qué metodología enfatiza la importancia de las entregas frecuentes de productos funcionales?', 'Scrum', 'Waterfall', 'Six Sigma', 'PRINCE2', 'Scrum enfatiza entregas frecuentes de productos funcionales para permitir una retroalimentación rápida.', 3),
('¿Es obligatorio para una empresa implementar pautas de conducta?', 'Sí', 'No', 'Solo en ciertos estados', 'Depende de la industria', 'Es recomendable que todas las empresas tengan pautas de conducta claras para asegurar un ambiente de trabajo sano.', 4),
('¿La metodología Lean se centra en qué aspecto de la producción?', 'Eliminación de desperdicios', 'Aumento de la mano de obra', 'Innovación tecnológica', 'Expansión del mercado', 'Lean se centra en la eliminación de desperdicios para mejorar la eficiencia general.', 3),
('¿Un empleado puede ser despedido por no seguir las pautas de conducta de la empresa?', 'Sí', 'No', 'Solo con advertencia', 'Depende del sindicato', 'No seguir las pautas de conducta puede llevar a despidos si se violan normas importantes.', 4),
('¿Es Kanban adecuado para proyectos que requieren cambios frecuentes?', 'Sí', 'No', 'Solo en grandes empresas', 'Solo en el desarrollo de software', 'Kanban es adecuado para entornos que requieren flexibilidad y cambios frecuentes.', 3);

INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES 
('¿Qué papel juega el Product Owner en la metodología Scrum?', 'Definir el backlog del producto', 'Gestionar el equipo Scrum', 'Realizar pruebas de software', 'Desarrollar el producto', 'El Product Owner es responsable de definir el backlog del producto y asegurar que el valor del trabajo del equipo de desarrollo sea maximizado.', 3),
('¿Cuál es una ventaja de implementar el método Agile sobre el método Waterfall?', 'Flexibilidad en el cambio de requisitos', 'Mayor control sobre el cronograma', 'Documentación detallada', 'Menor tiempo de desarrollo', 'Agile ofrece mayor flexibilidad para adaptarse a los cambios en los requisitos a lo largo del proyecto.', 3),
('¿Cómo debería actuar un empleado ante un dilema ético en el lugar de trabajo?', 'Consultar las políticas de la empresa', 'Ignorarlo hasta que se convierta en un problema mayor', 'Resolverlo basado en opiniones personales', 'Consultar únicamente con un colega', 'Ante un dilema ético, lo adecuado es consultar las políticas de la empresa para seguir las directrices establecidas.', 4),
('¿Qué estrategia de desarrollo de equipo es efectiva en un ambiente de trabajo ágil?', 'Reuniones diarias de pie', 'Reportes mensuales detallados', 'Evaluaciones anuales extensas', 'Cubículos individuales para cada empleado', 'Las reuniones diarias de pie son efectivas para mantener al equipo ágil informado y comprometido.', 3),
('¿Qué acción es considerada un incumplimiento de la ética profesional?', 'Compartir información confidencial', 'Colaborar con colegas', 'Solicitar retroalimentación constructiva', 'Cumplir con los plazos de entrega', 'Compartir información confidencial sin autorización es un incumplimiento de la ética profesional.', 4);

INSERT INTO user_question (user_id, question_id, solved) VALUES (1, 6, 1);  -- Usuario 1 ha resuelto correctamente la pregunta 6.
INSERT INTO user_question (user_id, question_id, solved) VALUES (2, 7, 1);  -- Usuario 2 ha resuelto correctamente la pregunta 7.
INSERT INTO user_question (user_id, question_id, solved) VALUES (3, 8, 0);  -- Usuario 3 ha respondido incorrectamente a la pregunta 8.
INSERT INTO user_question (user_id, question_id, solved) VALUES (4, 9, 1);  -- Usuario 4 ha resuelto correctamente la pregunta 9.
INSERT INTO user_question (user_id, question_id, solved) VALUES (5, 10, 0);  -- Usuario 5 ha respondido incorrectamente a la pregunta 10.

DELIMITER //
CREATE PROCEDURE signIn(email_in VARCHAR(255))
BEGIN
    SELECT
        r.role AS role,
        u.email AS email,
        u.password AS password
    FROM users u
    JOIN roles r ON u.role_id = r.role_id
    WHERE u.email = email_in;
END//
DELIMITER ;

Select user_id, email, name, password, r.role AS role, joinedAt from users u JOIN roles r ON u.role_id = r.role_id;

CALL signIn('miguelmendozaj20@gmail.com')
