DROP DATABASE IF EXISTS Awaq;

CREATE DATABASE Awaq;

USE Awaq;

CREATE TABLE `roles`(
	`role_id` INT NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`role_id`)
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
    PRIMARY KEY(`user_id`),
    FOREIGN KEY(`role_id`) REFERENCES `roles`(`role_id`)
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
    `text` VARCHAR(1000) NOT NULL,
    `isCorrect` INT NOT NULL,
    `explanation` VARCHAR(1000) NOT NULL,
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

INSERT INTO roles (role) VALUES ('Super Administrador'), ('Administrador'), ('Miembro');

INSERT INTO categories (category) VALUES ('Ciberseguridad'), ('TEDI'), ('Comunicación'), ('Código de ética');

INSERT INTO users (name, email, password, phoneNumber, joinedAt, birthDate, role_id) VALUES 
('Administrador Awaq', 'admin@awaq.com', '123', 5567892345, '2024-04-01', '1990-06-15', 1),
('Miguel Mendoza Jaidar', 'a01234354@tec.mx', '123', 5567892345, '2024-04-02', '1990-06-15', 3),
('Miguel Mendoza Jaidar', 'miguelmendozaj20@gmail.com', '123', 5567892345, '2024-04-03', '1990-06-15', 3),
('Ana María Ruiz', 'ana.ruiz@example.com', 'SecurePassword1', 5567892345, '2024-04-04', '1990-06-15', 3),
('Carlos Jiménez López', 'carlos.jimenez@example.com', 'SecurePassword2', 5567982346, '2024-03-05', '1988-08-20', 3),
('Lucía Fernández Vidal', 'lucia.fernandez@example.com', 'SecurePassword3', 5567892347, '2024-03-10', '1992-03-25', 2),
('Jorge Martín Gómez', 'jorge.martin@example.com', 'SecurePassword4', 5567892348, '2024-03-16', '1985-12-30', 2),
('Elena Núñez Castillo', 'elena.nunez@example.com', 'SecurePassword5', 5567892349, '2024-03-20', '1995-07-10', 2),
('Raúl Molina Santos', 'raul.molina@example.com', 'SecurePassword6', 5567892350, '2024-03-25', '1991-01-18', 2),
('Sofía Guerrero Salazar', 'sofia.guerrero@example.com', 'SecurePassword7', '5567892360', '2024-04-29', '1993-05-05', 3),
('Miguel Ángel Torres', 'miguel.torres@example.com', 'SecurePassword8', '5567892361', '2024-03-03', '1989-09-15', 3),
('Isabel Medina Hernández', 'isabel.medina@example.com', 'SecurePassword9', '5567892362', '2024-03-04', '1994-02-20', 3),
('Diego Alonso Navarro', 'diego.navarro@example.com', 'SecurePassword10', '5567892363', '2024-03-15', '1990-11-30', 2),
('Carmen Reyes Martínez', 'carmen.reyes@example.com', 'SecurePassword11', '5567892364', '2024-03-21', '1992-07-08', 2),
('Felipe Gómez Castillo', 'felipe.gomez@example.com', 'SecurePassword12', '5567892365', '2024-03-22', '1988-03-14', 2),
('Laura Jiménez Morales', 'laura.jimenez@example.com', 'SecurePassword13', '5567892366', '2024-03-23', '1995-08-25', 2),
('Oscar Ruiz Díaz', 'oscar.ruiz@example.com', 'SecurePassword14', '5567892367', '2024-03-11', '1987-12-20', 3),
('Marta Sánchez López', 'marta.sanchez@example.com', 'SecurePassword15', '5567892368', '2024-03-09', '1991-01-20', 3);


-- Memoramas (TEDI) 
INSERT INTO memorandums (html, css, result, explanation) VALUES 
('<button></button>', 'button { background-color: blue; }', '<button style="background-color: blue;"></button>', 'Establece el color de fondo del botón a azul.'),
('<h1></h1>', 'h1 { font-weight: bold; }', '<h1 style="font-weight: bold;"></h1>', 'Aplica negrita al texto del encabezado H1.'),
('<img src="image.jpg" />', 'img { width: 100px; height: 100px; }', '<img src="image.jpg" style="width: 100px; height: 100px;" />', 'Define las dimensiones de la imagen a 100px por 100px.');

INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1),
(3, 1, 1), (3, 2, 1), (3, 3, 1),
(4, 1, 1), (4, 2, 1), (4, 3, 1),
(5, 1, 1), (5, 2, 1), (5, 3, 1),
(6, 1, 1), (6, 2, 0), (6, 3, 1),
(7, 1, 1), (7, 2, 1), (7, 3, 0),
(8, 1, 1), (8, 2, 0), (8, 3, 1),
(9, 1, 0), (9, 2, 1), (9, 3, 0),
(10, 1, 1), (10, 2, 0), (10, 3, 1),
(11, 1, 0), (11, 2, 1), (11, 3, 0),
(12, 1, 1), (12, 2, 0), (12, 3, 1),
(13, 1, 0), (13, 2, 1), (13, 3, 0),
(14, 1, 1), (14, 2, 0), (14, 3, 1),
(15, 1, 0), (15, 2, 1), (15, 3, 0);

-- True / False (Ciberseguridad) 
INSERT INTO trueFalseQuestions (text, isCorrect, explanation, category_id) VALUES 
('Un cortafuegos (firewall) es un dispositivo de seguridad que controla el tráfico entre redes, permitiendo o bloqueando ciertas comunicaciones según reglas predefinidas.', 1, 'Actúa como una barrera entre redes, monitoreando y controlando el tráfico de datos según reglas predefinidas. Puede permitir o bloquear el tráfico basado en diversas condiciones, como la dirección IP, el puerto y el tipo de protocolo, contribuyendo así a la protección de una red contra intrusiones no autorizadas y ataques cibernéticos.', 1),
('El concepto de "pharming" se refiere a una técnica en la que los atacantes redirigen el tráfico de un sitio web legítimo a un sitio web falso sin el conocimiento del usuario.', 1, 'Esta técnica maliciosa se logra mediante la manipulación de los servidores DNS o el envenenamiento de la caché DNS para redirigir a los usuarios a sitios web falsificados que pueden robar información confidencial o distribuir malware.', 1),
('Un ataque de "spoofing" de correo electrónico implica falsificar la dirección de correo electrónico de un remitente para que parezca que proviene de una fuente legítima.', 1, 'Los atacantes falsifican la dirección de correo electrónico de un remitente para hacerse pasar por una fuente legítima. Esto puede engañar a los destinatarios para que crean que el mensaje es legítimo y revelen información confidencial o realicen acciones no deseadas.', 1),
('La implementación de una política de seguridad de contraseñas que requiera cambios frecuentes y el uso de contraseñas complejas puede ayudar a prevenir ataques de fuerza bruta.', 1, 'El uso de contraseñas complejas y su cambio regular dificultan el descifrado por fuerza bruta, reduciendo así el tiempo disponible para que los atacantes comprometan una cuenta.', 1),
('El "phishing" es una forma de ataque que generalmente se lleva a cabo a través de correos electrónicos falsos que intentan engañar a los usuarios para que revelen información personal o confidencial.', 1, 'Los correos electrónicos falsos que parecen legítimos intentan engañar a los usuarios y obtener información confidencial, como contraseñas o datos financieros.', 1);

INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1), (2, 5, 1),
(3, 1, 1), (3, 2, 1), (3, 3, 1), (3, 4, 1), (3, 5, 1),
(4, 1, 1), (4, 2, 1), (4, 3, 1), (4, 4, 1), (4, 5, 1),
(5, 1, 1), (5, 2, 1), (5, 3, 1), (5, 4, 1), (5, 5, 1),
(6, 1, 0), (6, 2, 1), (6, 3, 0), (6, 4, 1), (6, 5, 0),
(7, 1, 0), (7, 2, 0), (7, 3, 1), (7, 4, 0), (7, 5, 1),
(8, 1, 1), (8, 2, 0), (8, 3, 1), (8, 4, 0), (8, 5, 1),
(9, 1, 0), (9, 2, 1), (9, 3, 0), (9, 4, 1), (9, 5, 1),
(10, 1, 0), (10, 2, 0), (10, 3, 1), (10, 4, 0), (10, 5, 1),
(11, 1, 1), (11, 2, 0), (11, 3, 1), (11, 4, 0), (11, 5, 1),
(12, 1, 1), (12, 2, 1), (12, 3, 1), (12, 4, 0), (12, 5, 1),
(13, 1, 0), (13, 2, 0), (13, 3, 0), (13, 4, 1), (13, 5, 0),
(14, 1, 1), (14, 2, 1), (14, 3, 0), (14, 4, 1), (14, 5, 0),
(15, 1, 1), (15, 2, 0), (15, 3, 0), (15, 4, 1), (15, 5, 1);

-- Preguntas ( Comunicaciones )
INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES 
('¿Qué metodología enfatiza la importancia de las entregas frecuentes de productos funcionales?', 'Scrum', 'Waterfall', 'Six Sigma', 'PRINCE2', 'Scrum enfatiza entregas frecuentes de productos funcionales para permitir una retroalimentación rápida.', 3),
('¿La metodología Lean se centra en qué aspecto de la producción?', 'Eliminación de desperdicios', 'Aumento de la mano de obra', 'Innovación tecnológica', 'Expansión del mercado', 'Lean se centra en la eliminación de desperdicios para mejorar la eficiencia general.', 3),
('¿Es Kanban adecuado para proyectos que requieren cambios frecuentes?', 'Sí', 'No', 'Solo en grandes empresas', 'Solo en el desarrollo de software', 'Kanban es adecuado para entornos que requieren flexibilidad y cambios frecuentes.', 3),
('¿Qué papel juega el Product Owner en la metodología Scrum?', 'Definir el backlog del producto', 'Gestionar el equipo Scrum', 'Realizar pruebas de software', 'Desarrollar el producto', 'El Product Owner es responsable de definir el backlog del producto y asegurar que el valor del trabajo del equipo de desarrollo sea maximizado.', 3),
('¿Cuál es una ventaja de implementar el método Agile sobre el método Waterfall?', 'Flexibilidad en el cambio de requisitos', 'Mayor control sobre el cronograma', 'Documentación detallada', 'Menor tiempo de desarrollo', 'Agile ofrece mayor flexibilidad para adaptarse a los cambios en los requisitos a lo largo del proyecto.', 3),
('¿Qué estrategia de desarrollo de equipo es efectiva en un ambiente de trabajo ágil?', 'Reuniones diarias de pie', 'Reportes mensuales detallados', 'Evaluaciones anuales extensas', 'Cubículos individuales para cada empleado', 'Las reuniones diarias de pie son efectivas para mantener al equipo ágil informado y comprometido.', 3);

INSERT INTO user_question (user_id, question_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1), (1, 6, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1), (2, 5, 1), (2, 6, 1),
(3, 1, 1), (3, 2, 1), (3, 3, 1), (3, 4, 1), (3, 5, 1), (3, 6, 1),
(4, 1, 1), (4, 2, 1), (4, 3, 1), (4, 4, 1), (4, 5, 1), (4, 6, 1),
(5, 1, 1), (5, 2, 1), (5, 3, 1), (5, 4, 1), (5, 5, 1), (5, 6, 1),
(6, 1, 0), (6, 2, 0), (6, 3, 1), (6, 4, 1), (6, 5, 1), (6, 6, 0),
(7, 1, 1), (7, 2, 0), (7, 3, 0), (7, 4, 1), (7, 5, 0), (7, 6, 1),
(8, 1, 0), (8, 2, 1), (8, 3, 0), (8, 4, 0), (8, 5, 1), (8, 6, 1),
(9, 1, 1), (9, 2, 1), (9, 3, 1), (9, 4, 0), (9, 5, 0), (9, 6, 0),
(10, 1, 1), (10, 2, 0), (10, 3, 1), (10, 4, 0), (10, 5, 1), (10, 6, 0),
(11, 1, 0), (11, 2, 1), (11, 3, 0), (11, 4, 1), (11, 5, 1), (11, 6, 1),
(12, 1, 1), (12, 2, 0), (12, 3, 1), (12, 4, 0), (12, 5, 1), (12, 6, 0),
(13, 1, 0), (13, 2, 1), (13, 3, 1), (13, 4, 0), (13, 5, 0), (13, 6, 0),
(14, 1, 1), (14, 2, 0), (14, 3, 1), (14, 4, 1), (14, 5, 0), (14, 6, 1),
(15, 1, 1), (15, 2, 0), (15, 3, 0), (15, 4, 1), (15, 5, 1), (15, 6, 0);


-- Preguntas (Pautas de conducta)
INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES 
('¿Es obligatorio para una empresa implementar pautas de conducta?', 'Sí', 'No', 'Solo en ciertos estados', 'Depende de la industria', 'Es recomendable que todas las empresas tengan pautas de conducta claras para asegurar un ambiente de trabajo sano.', 4),
('¿Un empleado puede ser despedido por no seguir las pautas de conducta de la empresa?', 'Sí', 'No', 'Solo con advertencia', 'Depende del sindicato', 'No seguir las pautas de conducta puede llevar a despidos si se violan normas importantes.', 4),
('¿Cómo debería actuar un empleado ante un dilema ético en el lugar de trabajo?', 'Consultar las políticas de la empresa', 'Ignorarlo hasta que se convierta en un problema mayor', 'Resolverlo basado en opiniones personales', 'Consultar únicamente con un colega', 'Ante un dilema ético, lo adecuado es consultar las políticas de la empresa para seguir las directrices establecidas.', 4),
('¿Qué acción es considerada un incumplimiento de la ética profesional?', 'Compartir información confidencial', 'Colaborar con colegas', 'Solicitar retroalimentación constructiva', 'Cumplir con los plazos de entrega', 'Compartir información confidencial sin autorización es un incumplimiento de la ética profesional.', 4);

INSERT INTO user_question (user_id, question_id, solved) VALUES 
(1, 7, 1), (1, 8, 0), (1, 9, 1), (1, 10, 1),
(2, 7, 1), (2, 8, 1), (2, 9, 1), (2, 10, 1),
(3, 7, 1), (3, 8, 1), (3, 9, 1), (3, 10, 1),
(4, 7, 1), (4, 8, 1), (4, 9, 1), (4, 10, 1),
(5, 7, 1), (5, 8, 1), (5, 9, 1), (5, 10, 1),
(6, 7, 1), (6, 8, 1), (6, 9, 0), (6, 10, 1),
(7, 7, 0), (7, 8, 0), (7, 9, 1), (7, 10, 0),
(8, 7, 1), (8, 8, 1), (8, 9, 1), (8, 10, 0),
(9, 7, 0), (9, 8, 1), (9, 9, 0), (9, 10, 1),
(10, 7, 0), (10, 8, 0), (10, 9, 1), (10, 10, 1),
(11, 7, 1), (11, 8, 0), (11, 9, 1), (11, 10, 0),
(12, 7, 1), (12, 8, 1), (12, 9, 1), (12, 10, 0),
(13, 7, 0), (13, 8, 0), (13, 9, 0), (13, 10, 1),
(14, 7, 1), (14, 8, 1), (14, 9, 0), (14, 10, 1),
(15, 7, 1), (15, 8, 0), (15, 9, 0), (15, 10, 1);

DELIMITER //
CREATE PROCEDURE signIn(email_in VARCHAR(255))
BEGIN
    SELECT
		u.user_id AS id,
        r.role AS role,
        u.email AS email,
        u.password AS password
    FROM users u
    JOIN roles r ON u.role_id = r.role_id
    WHERE u.email = email_in;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getTotalNumberOfCapacitedUsers()
BEGIN
	SELECT 
		(SELECT COUNT(*) 
		 FROM users u
		 WHERE NOT EXISTS (
			 SELECT 1
			 FROM memorandums m
			 LEFT JOIN user_memorandum um ON m.memorandum_id = um.memorandum_id AND um.user_id = u.user_id AND um.solved = 1
			 WHERE um.memorandum_id IS NULL
		 )
		 AND NOT EXISTS (
			 SELECT 1
			 FROM trueFalseQuestions tf
			 LEFT JOIN user_trueFalse utf ON tf.true_false_id = utf.true_false_id AND utf.user_id = u.user_id AND utf.solved = 1
			 WHERE utf.true_false_id IS NULL
		 )
		 AND NOT EXISTS (
			 SELECT 1
			 FROM questions q
			 LEFT JOIN user_question uq ON q.question_id = uq.question_id AND uq.user_id = u.user_id AND uq.solved = 1
			 WHERE uq.question_id IS NULL
		 )
		) AS capacitedUsers,
		(SELECT COUNT(*) FROM users) AS totalUsers;
END//
DELIMITER ;

CALL getTotalNumberOfCapacitedUsers();

DELIMITER //
CREATE PROCEDURE getUserProgress(userId INT)
BEGIN
    DECLARE totalMemorandums INT;
    DECLARE solvedMemorandums INT;
    DECLARE totalTrueFalse INT;
    DECLARE solvedTrueFalse INT;
    DECLARE totalCategory3 INT;
    DECLARE solvedCategory3 INT;
    DECLARE totalCategory4 INT;
    DECLARE solvedCategory4 INT;

    SELECT COUNT(*) INTO totalMemorandums FROM memorandums;
    SELECT COUNT(*) INTO solvedMemorandums FROM user_memorandum WHERE user_id = userId AND solved = 1;

    SELECT COUNT(*) INTO totalTrueFalse FROM trueFalseQuestions;
    SELECT COUNT(*) INTO solvedTrueFalse FROM user_trueFalse WHERE user_id = userId AND solved = 1;

    SELECT COUNT(*) INTO totalCategory3 FROM questions WHERE category_id = 3;
    SELECT COUNT(*) INTO solvedCategory3 FROM user_question WHERE user_id = userId AND solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 3);

    SELECT COUNT(*) INTO totalCategory4 FROM questions WHERE category_id = 4;
    SELECT COUNT(*) INTO solvedCategory4 FROM user_question WHERE user_id = userId AND solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 4);

    SELECT 
        IF(totalMemorandums = 0, 0, (solvedMemorandums / totalMemorandums) * 100) AS TEDI,
        IF(totalTrueFalse = 0, 0, (solvedTrueFalse / totalTrueFalse) * 100) AS Ciberseguridad,
        IF(totalCategory3 = 0, 0, (solvedCategory3 / totalCategory3) * 100) AS Comunicaciones,
        IF(totalCategory4 = 0, 0, (solvedCategory4 / totalCategory4) * 100) AS PautasDeConducta;
END//
DELIMITER ;

CALL getUserProgress(1);

DELIMITER //
CREATE PROCEDURE getAllUsersProgress()
BEGIN
    SELECT 
        u.user_id,
        u.name,
        u.email,
        u.phoneNumber,
        u.joinedAt,
        COALESCE(IF(totalMemorandums = 0, 0, (solvedMemorandums / totalMemorandums) * 100), 0) AS TEDI,
        COALESCE(IF(totalTrueFalse = 0, 0, (solvedTrueFalse / totalTrueFalse) * 100), 0) AS Ciberseguridad,
        COALESCE(IF(totalCategory3 = 0, 0, (solvedCategory3 / totalCategory3) * 100), 0) AS Comunicaciones,
        COALESCE(IF(totalCategory4 = 0, 0, (solvedCategory4 / totalCategory4) * 100), 0) AS PautasDeConducta
    FROM 
        users u
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedMemorandums
        FROM user_memorandum 
        WHERE solved = 1
        GROUP BY user_id
    ) um ON u.user_id = um.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalMemorandums
        FROM memorandums
    ) tm ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedTrueFalse
        FROM user_trueFalse
        WHERE solved = 1
        GROUP BY user_id
    ) utf ON u.user_id = utf.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalTrueFalse
        FROM trueFalseQuestions
    ) ttf ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedCategory3
        FROM user_question
        WHERE solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 3)
        GROUP BY user_id
    ) uc3 ON u.user_id = uc3.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalCategory3
        FROM questions
        WHERE category_id = 3
    ) tc3 ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedCategory4
        FROM user_question
        WHERE solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 4)
        GROUP BY user_id
    ) uc4 ON u.user_id = uc4.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalCategory4
        FROM questions
        WHERE category_id = 4
    ) tc4 ON 1=1
    GROUP BY u.user_id, u.name, u.phoneNumber, u.joinedAt, totalMemorandums, solvedMemorandums, totalTrueFalse, solvedTrueFalse, totalCategory3, solvedCategory3, totalCategory4, solvedCategory4
    ORDER BY u.name;
END//
DELIMITER ;

CALL getAllUsersProgress();

DELIMITER //
CREATE PROCEDURE topNUsers(N INT)
BEGIN
    SELECT 
        u.user_id,
        u.name,
        COALESCE(IF(totalMemorandums = 0, 0, (solvedMemorandums / totalMemorandums) * 100), 0) AS TEDI,
        COALESCE(IF(totalTrueFalse = 0, 0, (solvedTrueFalse / totalTrueFalse) * 100), 0) AS Ciberseguridad,
        COALESCE(IF(totalCategory3 = 0, 0, (solvedCategory3 / totalCategory3) * 100), 0) AS Comunicaciones,
        COALESCE(IF(totalCategory4 = 0, 0, (solvedCategory4 / totalCategory4) * 100), 0) AS PautasDeConducta,
        (COALESCE(IF(totalMemorandums = 0, 0, (solvedMemorandums / totalMemorandums) * 100), 0) +
         COALESCE(IF(totalTrueFalse = 0, 0, (solvedTrueFalse / totalTrueFalse) * 100), 0) +
         COALESCE(IF(totalCategory3 = 0, 0, (solvedCategory3 / totalCategory3) * 100), 0) +
         COALESCE(IF(totalCategory4 = 0, 0, (solvedCategory4 / totalCategory4) * 100), 0)) / 4 AS overallPercentage
    FROM 
        users u
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedMemorandums
        FROM user_memorandum 
        WHERE solved = 1
        GROUP BY user_id
    ) um ON u.user_id = um.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalMemorandums
        FROM memorandums
    ) tm ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedTrueFalse
        FROM user_trueFalse
        WHERE solved = 1
        GROUP BY user_id
    ) utf ON u.user_id = utf.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalTrueFalse
        FROM trueFalseQuestions
    ) ttf ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedCategory3
        FROM user_question
        WHERE solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 3)
        GROUP BY user_id
    ) uc3 ON u.user_id = uc3.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalCategory3
        FROM questions
        WHERE category_id = 3
    ) tc3 ON 1=1
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS solvedCategory4
        FROM user_question
        WHERE solved = 1 AND question_id IN (SELECT question_id FROM questions WHERE category_id = 4)
        GROUP BY user_id
    ) uc4 ON u.user_id = uc4.user_id
    LEFT JOIN (
        SELECT COUNT(*) AS totalCategory4
        FROM questions
        WHERE category_id = 4
    ) tc4 ON 1=1
    GROUP BY u.user_id, u.name, totalMemorandums, solvedMemorandums, totalTrueFalse, solvedTrueFalse, totalCategory3, solvedCategory3, totalCategory4, solvedCategory4
    ORDER BY overallPercentage DESC
    LIMIT N;
END //
DELIMITER ;

CALL topNUsers(3);

DELIMITER //
CREATE PROCEDURE getOverallProblemSolvingPercentage()
BEGIN
    DECLARE totalUsers INT DEFAULT 0;
    DECLARE totalMemorandums INT DEFAULT 0;
    DECLARE solvedMemorandums INT DEFAULT 0;
    DECLARE totalTrueFalse INT DEFAULT 0;
    DECLARE solvedTrueFalse INT DEFAULT 0;
    DECLARE totalCategory3 INT DEFAULT 0;
    DECLARE solvedCategory3 INT DEFAULT 0;
    DECLARE totalCategory4 INT DEFAULT 0;
    DECLARE solvedCategory4 INT DEFAULT 0;

    SELECT COUNT(*) INTO totalUsers FROM users;

    SELECT COUNT(*) * totalUsers INTO totalMemorandums FROM memorandums;
    SELECT COUNT(*) * totalUsers INTO totalTrueFalse FROM trueFalseQuestions;
    SELECT COUNT(*) * totalUsers INTO totalCategory3 FROM questions WHERE category_id = 3;
    SELECT COUNT(*) * totalUsers INTO totalCategory4 FROM questions WHERE category_id = 4;

    SELECT COUNT(*) INTO solvedMemorandums FROM user_memorandum WHERE solved = 1;
    SELECT COUNT(*) INTO solvedTrueFalse FROM user_trueFalse WHERE solved = 1;
    SELECT COUNT(*) INTO solvedCategory3 FROM user_question uq
    JOIN questions q ON uq.question_id = q.question_id
    WHERE uq.solved = 1 AND q.category_id = 3;
    SELECT COUNT(*) INTO solvedCategory4 FROM user_question uq
    JOIN questions q ON uq.question_id = q.question_id
    WHERE uq.solved = 1 AND q.category_id = 4;

    SELECT 
        IF(totalMemorandums = 0, 0, (solvedMemorandums / totalMemorandums) * 100) AS TEDI,
        IF(totalTrueFalse = 0, 0, (solvedTrueFalse / totalTrueFalse) * 100) AS Ciberseguridad,
        IF(totalCategory3 = 0, 0, (solvedCategory3 / totalCategory3) * 100) AS Comunicaciones,
        IF(totalCategory4 = 0, 0, (solvedCategory4 / totalCategory4) * 100) AS PautasDeConducta;
END //

DELIMITER ;

call getOverallProblemSolvingPercentage();



SELECT m.memorandum_id, m.html, m.css, m.result, m.explanation
FROM memorandums m
LEFT JOIN user_memorandum um ON m.memorandum_id = um.memorandum_id AND um.user_id = 8
WHERE um.user_id IS NULL OR um.solved = 0;


DELIMITER //
CREATE PROCEDURE getTediQuestion (IN user_id INT)
BEGIN
  DECLARE result2 VARCHAR(255);

  SELECT m.*,
    @result2 := (SELECT m2.result
                  FROM memorandums m2
                  WHERE m2.memorandum_id <> m.memorandum_id
                  ORDER BY RAND()
                  LIMIT 1) AS result2,
    (SELECT m3.result
     FROM memorandums m3
     WHERE m3.memorandum_id <> m.memorandum_id
       AND m3.result <> @result2
     ORDER BY RAND()
     LIMIT 1) AS result3
  FROM memorandums m
  LEFT JOIN user_memorandum um ON um.memorandum_id = m.memorandum_id AND um.user_id = user_id
  WHERE um.user_id IS NULL OR um.solved = 0
  LIMIT 1;
END //
DELIMITER ;


call getTediQuestion(6);


DELIMITER //
CREATE PROCEDURE getSecurityQuestion (IN user_id INT)
BEGIN
	SELECT tf.true_false_id, tf.text, tf.isCorrect, tf.explanation
	FROM trueFalseQuestions tf
	LEFT JOIN user_trueFalse utf ON tf.true_false_id = utf.true_false_id AND utf.user_id = user_id
	WHERE utf.user_id IS NULL OR utf.solved = 0
    ORDER BY RAND()
	LIMIT 1;
END //
DELIMITER ; 

CALL getSecurityQuestion(8);


DELIMITER //
CREATE PROCEDURE getCommunicationQuestion (IN user_id INT)
BEGIN
	SELECT q.question_id, q.question, q.correctAnswer, q.answer2, q.answer3, q.answer4, q.explanation
	FROM questions q
	LEFT JOIN user_question uq ON q.question_id = uq.question_id AND uq.user_id = user_id
	WHERE q.category_id = 3 AND (uq.user_id IS NULL OR uq.solved = 0)
    ORDER BY RAND()
	LIMIT 1;
END //
DELIMITER ; 

CALL getCommunicationQuestion(6);

DELIMITER //
CREATE PROCEDURE getEthicQuestion (IN user_id INT)
BEGIN
	SELECT q.question_id, q.question, q.correctAnswer, q.answer2, q.answer3, q.answer4, q.explanation
	FROM questions q
	LEFT JOIN user_question uq ON q.question_id = uq.question_id AND uq.user_id = user_id
	WHERE q.category_id = 4 AND (uq.user_id IS NULL OR uq.solved = 0)
    ORDER BY RAND()
	LIMIT 1;
END //
DELIMITER ; 


DELIMITER //
CREATE PROCEDURE answerSecurityQuestion (
    IN p_user_id INT,
    IN p_true_false_id INT,
    IN p_solved INT
)
BEGIN
    INSERT INTO user_trueFalse (user_id, true_false_id, solved)
    VALUES (p_user_id, p_true_false_id, p_solved)
    ON DUPLICATE KEY UPDATE solved = p_solved;
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE answerQuestion (
    IN p_user_id INT,
    IN p_question_id INT,
    IN p_solved INT
)
BEGIN
    INSERT INTO user_question (user_id, question_id, solved)
    VALUES (p_user_id, p_question_id, p_solved)
    ON DUPLICATE KEY UPDATE solved = p_solved;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE answerTediQuestion (
    IN p_user_id INT,
    IN p_memorandum_id INT,
    IN p_solved INT
)
BEGIN
    INSERT INTO user_memorandum (user_id, memorandum_id, solved)
    VALUES (p_user_id, p_memorandum_id, p_solved)
    ON DUPLICATE KEY UPDATE solved = p_solved;
END //
DELIMITER ;

SELECT * from users join user_trueFalse On users.user_id = user_trueFalse.user_id WHERE users.user_id = 16;


