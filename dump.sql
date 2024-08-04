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
    `sender` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
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

CREATE TABLE `Feedback` (
    `Id` INT NOT NULL AUTO_INCREMENT,
    `UserId` INT NOT NULL,
    `Suggestions` VARCHAR(1000) CHARACTER SET UTF8MB4 NOT NULL,
    `Remove` VARCHAR(1000) CHARACTER SET UTF8MB4 NOT NULL,
    `Questions` VARCHAR(1000) CHARACTER SET UTF8MB4 NOT NULL,
    PRIMARY KEY (`Id`),
    FOREIGN KEY (`UserId`) REFERENCES `users`(`user_id`)
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
('<div class="box">\n\tBotón!\n</div>', 
'.box {\n\tcolor: white;\n\tbackground-color: #0f79b9;\n\tpadding: 10px;\n\tfont-family: Roboto;\n}', 
'https://hcti.io/v1/image/0d6146cf-3fda-4422-95eb-ec9d6acf580d', 
'Botón color azul'
),

('<div class="gallery">\n\t<div class="image">Imagen 1</div>\n\t<div class="image">Imagen 2</div>\n\t<div class="image">Imagen 3</div>\n</div>', 
'.gallery {\n\tdisplay: grid;\n\tgrid-template-columns: repeat(auto-fit, minmax(200px, 1fr));\n\tgrid-gap: 10px;\n}\n.image {\n\tbackground-color: #f4f4f4;\n\tpadding: 20px;\n\ttext-align: center;\n}', 
'https://hcti.io/v1/image/c3b92025-e52a-45bb-975c-52392bea32a1', 
'Galería de imágenes'
),

('<div class="card">\n\t<div class="image">Imagen</div>\n\t<div class="info">\n\t\t<h2>Nombre</h2>\n\t\t<p>Descripción.</p>\n\t\t<button class="btn">Comprar</button>\n\t</div>\n</div>', 
'.card {\n\twidth: 300px;\n\tborder: 1px solid #ccc;\n\tborder-radius: 5px;\n\toverflow: hidden;\n\tbox-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n\ttext-align: center;\n}\n.image {\n\tbackground-color: #f4f4f4;\n\tpadding: 50px;\n}\n.info {\n\tpadding: 20px;\n}', 
'https://hcti.io/v1/image/7a160324-405f-4b35-9439-bedf4699a44f', 
'Tarjeta de producto'
),

('<div class="banner">\n\t<h1>Bienvenidos</h1>\n\t<p>Descubre nuestros productos.</p>\n</div>', 
'.banner {\n\tbackground-color: #ffcc00;\n\tcolor: #333;\n\tpadding: 50px;\n\ttext-align: center;\n}', 
'https://hcti.io/v1/image/e319d77a-3cf4-453f-8a80-8e2a3d8ccb9d', 
'Banner de bienvenida'
),

('<div class="footer">\n\t<p>Contacto: contacto@empresa.com</p>\n\t<p>Teléfono: +123456789</p>\n</div>', 
'.footer {\n\tbackground-color: #333;\n\tcolor: #fff;\n\tpadding: 20px;\n\ttext-align: center;\n\tfont-size: 14px;\n}', 
'https://hcti.io/v1/image/bca04009-4623-4566-a871-badffccc4280', 
'Pie de página de contacto'
),

('<div class="sidebar">\n\t<ul>\n\t\t<li>Inicio</li>\n\t\t<li>Sobre nosotros</li>\n\t\t<li>Servicios</li>\n\t\t<li>Contacto</li>\n\t</ul>\n</div>', 
'.sidebar {\n\tbackground-color: #e0e0e0;\n\tpadding: 15px;\n}\n.sidebar ul {\n\tlist-style-type: none;\n\tpadding: 0;\n}\n.sidebar li {\n\tmargin: 10px 0;\n}', 
'https://hcti.io/v1/image/4ac0077c-02aa-486b-b2b8-18bf0658d3e5', 
'Barra lateral con navegación'
),

('<div class="header">\n\t<h1>Logo</h1>\n\t<nav>\n\t\t<a href="#">Inicio</a>\n\t\t<a href="#">Servicios</a>\n\t\t<a href="#">Contacto</a>\n\t</nav>\n</div>', 
'.header {\n\tdisplay: flex;\n\tjustify-content: space-between;\n\talign-items: center;\n\tbackground-color: #333;\n\tcolor: #fff;\n\tpadding: 20px;\n}\n.header nav a {\n\tcolor: #fff;\n\ttext-decoration: none;\n\tmargin: 0 10px;\n}', 
'https://hcti.io/v1/image/4f45ec1a-8e72-4933-bcbb-8411d9b17e6c', 
'Encabezado con logo y navegación'
),

('<div class="profile">\n\t<h2>Juan Pérez</h2>\n\t<p>Desarrollador Web</p>\n</div>', 
'.profile {\n\ttext-align: center;\n}\n.profile h2 {\n\tmargin: 10px 0 5px;\n}\n.profile p {\n\tcolor: #777;\n}', 
'https://hcti.io/v1/image/ba57131d-657e-4d34-89ad-879aa7da8509', 
'Perfil de usuario'),

('<div class="notification">\n\t<p>¡Tienes una nueva notificación!</p>\n</div>', 
'.notification {\n\tbackground-color: #ffeb3b;\n\tcolor: #333;\n\tpadding: 15px;\n\tborder-left: 5px solid #ffc107;\n}', 
'https://hcti.io/v1/image/acfcf562-4636-4290-a7ae-7df7dd0c4840', 
'Notificación amarilla'),

('<div class="warning">\n\t<p>Advertencia: acción no permitida.</p>\n</div>', 
'.warning {\n\tbackground-color: #f44336;\n\tcolor: #fff;\n\tpadding: 15px;\n\tborder-left: 5px solid #d32f2f;\n}', 
'https://hcti.io/v1/image/4b4c0c19-7f89-48a4-8511-249dd6ff429b', 
'Advertencia roja'),

('<div class="success">\n\t<p>Operación completada con éxito.</p>\n</div>', 
'.success {\n\tbackground-color: #4caf50;\n\tcolor: #fff;\n\tpadding: 15px;\n\tborder-left: 5px solid #388e3c;\n}', 
'https://hcti.io/v1/image/48829229-e988-471b-bc0a-342e3c7f6a27', 
'Mensaje de éxito verde'),

('<div class="info">\n\t<p>Información importante.</p>\n</div>', 
'.info {\n\tbackground-color: #2196f3;\n\tcolor: #fff;\n\tpadding: 15px;\n\tborder-left: 5px solid #1976d2;\n}', 
'https://hcti.io/v1/image/1d42b2b8-c354-474c-a718-494b1786302a', 
'Mensaje informativo azul'),

('<div class="quote">\n\t<blockquote>"El éxito no es el final, el fracaso no es fatal: es el coraje de continuar lo que cuenta." - Winston S. Churchill</blockquote>\n</div>', 
'.quote {\n\tfont-style: italic;\n\tbackground-color: #f9f9f9;\n\tpadding: 20px;\n\tborder-left: 5px solid #ccc;\n}', 
'https://hcti.io/v1/image/1d9cd439-014c-4fd4-8cda-284480d4c617', 
'Cita inspiradora'),

('<div class="testimonial"> <p>"Producto increíble, cambió mi vida!" - Cliente satisfecho</p> </div>', 
'.testimonial {\n\tbackground-color: #e8f5e9;\n\tcolor: #388e3c;\n\tpadding: 20px;\n\tborder-left: 5px solid #2e7d32;\n}', 
'https://hcti.io/v1/image/bd24f26d-5fc5-4056-8e7e-19e96eafbaff', 
'Testimonio positivo');


INSERT INTO user_memorandum (user_id, memorandum_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1);

-- True / False (Ciberseguridad) 
INSERT INTO trueFalseQuestions (text, isCorrect, explanation, sender, subject, category_id) VALUES 
('Estimado usuario,\n\nHemos detectado actividad sospechosa en su cuenta. Por favor haga clic en el siguiente enlace para verificar su información y proteger su cuenta: http://verificacion-segura.com\n\nAtentamente,\nEquipo de Seguridad', 1, 'Este correo intenta engañar al usuario para que haga clic en un enlace malicioso y proporcione información confidencial.', 'seguridad@empresa.com', 'Actividad sospechosa detectada en su cuenta', 2),
('Estimado cliente,\n\nLe informamos que su pedido ha sido enviado y llegará en los próximos días. Puede rastrear su envío utilizando el siguiente enlace: http://empresa-envios.com/rastreo\n\nGracias por su compra.\n\nAtentamente,\nEquipo de Envíos', 0, 'Este es un correo legítimo informando sobre el envío de un pedido con un enlace para rastrear.', 'envios@empresa.com', 'Confirmación de envío de su pedido', 2),
('Hola,\n\nHemos notado intentos de inicio de sesión inusuales en tu cuenta. Para proteger tu información, debes cambiar tu contraseña inmediatamente accediendo al siguiente enlace: http://cambio-seguro.com\n\nSaludos,\nEquipo de Soporte', 1, 'Este es un correo de phishing que intenta engañar al usuario para que cambie su contraseña a través de un enlace falso.', 'soporte@empresa.com', 'Intentos de inicio de sesión inusuales', 2),
('Querido colega,\n\nNos complace anunciar que se ha lanzado una nueva actualización de software. Puedes descargar la última versión desde nuestro portal oficial. No olvides leer las notas de la versión para estar al tanto de todas las mejoras.\n\nSaludos,\nDepartamento de IT', 0, 'Este es un correo interno legítimo anunciando una actualización de software.', 'it@empresa.com', 'Nueva actualización de software disponible', 2),
('Estimado usuario,\n\nPara continuar utilizando nuestros servicios, por favor confirme sus datos personales en el siguiente enlace: http://confirmacion-datos.com\n\nGracias por su cooperación.\n\nAtentamente,\nEquipo de Servicios', 1, 'Este correo es un intento de phishing diseñado para robar información personal del usuario.', 'servicios@empresa.com', 'Confirmación de datos requerida', 2),
('Estimado usuario,\n\nHemos detectado actividad sospechosa en su cuenta. Por favor haga clic en el siguiente enlace para verificar su información y proteger su cuenta: http://verificacion-segura.com\n\nAtentamente,\nEquipo de Seguridad', 1, 'Este correo intenta engañar al usuario para que haga clic en un enlace malicioso y proporcione información confidencial.', 'seguridad@empresa.com', 'Actividad sospechosa detectada en su cuenta', 2),
('Estimado cliente,\n\nLe informamos que su pedido ha sido enviado y llegará en los próximos días. Puede rastrear su envío utilizando el siguiente enlace: https://www.dhl.com/mx-es/home.html n\nGracias por su compra.\n\nAtentamente,\n DHL', 0, 'Este es un correo legítimo informando sobre el envío de un pedido con un enlace para rastrear.', 'DHL@Mexico.com', 'Confirmación de envío de su pedido', 2),
('Hola,\n\nHemos notado intentos de inicio de sesión inusuales en tu cuenta. Para proteger tu información, debes cambiar tu contraseña inmediatamente accediendo al siguiente enlace: http://cambio-seguro.com\n\nSaludos,\nEquipo de Soporte', 1, 'Este es un correo de phishing que intenta engañar al usuario para que cambie su contraseña a través de un enlace falso.', 'soporte@empresa.com', 'Intentos de inicio de sesión inusuales', 2),
('Querido colega,\n\nNos complace anunciar que se ha lanzado una nueva actualización de software. Puedes descargar la última versión desde nuestro portal oficial. No olvides leer las notas de la versión para estar al tanto de todas las mejoras.\n\nSaludos,\nDepartamento de IT', 0, 'Este es un correo interno legítimo anunciando una actualización de software.', 'ManuelRamirez23@Google.com', 'Nueva actualización de software disponible', 2),
('Estimado usuario,\n\nPara continuar utilizando nuestros servicios, por favor confirme sus datos personales en el siguiente enlace: http://BBVA_MEX.com\n\nGracias por su cooperación.\n\nAtentamente,\nEquipo de Servicios BBVA', 1, 'Este correo es un intento de phishing diseñado para robar información personal del usuario.', 'BVVA@gmail.com', 'Confirmación de datos requerida', 2),
('Estimado cliente,\n\nSu factura está disponible para descargar. Haga clic en el siguiente enlace para acceder a su factura: http://facturas-empresa.com\n\nAtentamente,\nSAT', 1, 'Este correo puede ser un intento de phishing dirigido a que el usuario descargue un archivo malicioso o proporcione información personal.', 'SAT@gmail.com', 'Factura disponible para descargar', 2),
('Hola,\n\nTe informamos que tu cuenta ha sido bloqueada debido a actividades sospechosas. Para desbloquear tu cuenta, haz clic en el siguiente enlace: http://Gmail_desbloqueo_seguro.com\n\nGracias,\n Equipo de Gmail', 1, 'Este correo intenta engañar al usuario para que haga clic en un enlace malicioso y proporcione información confidencial.', 'Gmail2324242@gmail.com', 'Cuenta bloqueada por actividad sospechosa', 2),
('Estimado cliente,\n\nPara mejorar la seguridad de nuestras cuentas, hemos actualizado nuestras políticas de privacidad. Por favor, revisa y acepta los nuevos términos en el siguiente enlace: http://politicas-actualizadas_palaciodehierro.com\n\nSaludos,\nEquipo de Seguridad', 1, 'Este correo de phishing intenta engañar al usuario para que visite un sitio web malicioso.', 'Palaciodehierro23@gamil.com', 'Actualización de políticas de privacidad', 2),
('Querido usuario,\n\nNos complace informarte que has ganado un premio en nuestro último sorteo. Para reclamar tu premio, por favor completa el formulario en el siguiente enlace: http://reclama-premio.com\n\nFelicidades,\nEquipo de Promociones', 1, 'Este correo de phishing intenta engañar al usuario para que proporcione información personal bajo la premisa de haber ganado un premio.', 'premiosgratis2024@gmail.com', 'Has ganado un premio', 2),
('Estimado cliente,\n\nSu suscripción ha sido renovada exitosamente. No se requiere ninguna acción adicional de su parte. Si tiene alguna pregunta, por favor contacte a nuestro servicio de atención al cliente.\n\nAtentamente,\nEquipo de Suscripciones de Netflix', 0, 'Este es un correo legítimo confirmando la renovación de una suscripción.', 'Netflix@Latam.com', 'Renovación de suscripción exitosa', 2),
('Hola,\n\nQueremos recordarte que la fecha límite para presentar tus documentos fiscales se aproxima. Puedes subir tus documentos en nuestro portal seguro: http://portal-fiscal.com\n\nSaludos,\nDepartamento de la FIscalia', 1, 'Este correo de phishing busca que el usuario suba documentos confidenciales a un portal falso.', 'fiscalia89@gmail.com', 'Recordatorio de presentación de documentos fiscales', 2),
('Estimado usuario,\n\nHemos actualizado nuestra política de privacidad. Para continuar usando nuestros servicios, por favor revisa y acepta los nuevos términos en el siguiente enlace: http://actualizacion-politica.com\n\nGracias,\nEquipo de Soporte de Microsoft', 1, 'Este correo de phishing intenta engañar al usuario para que visite un sitio web malicioso.', 'microsoft56333@gmail.com', 'Actualización de política de privacidad', 2),
('Querido colega,\n\nEstamos implementando nuevas medidas de seguridad en nuestra red interna. Por favor, asegúrate de actualizar tu contraseña en el siguiente enlace: http://seguridad-empresa.com\n\nSaludos,\nDepartamento de IT', 1, 'Este correo intenta engañar al usuario para que cambie su contraseña a través de un enlace falso.', 'Felipe76@gmail.com', 'Actualización de medidas de seguridad', 2),
('Estimado cliente,\n\nGracias por su reciente compra. Si tiene alguna pregunta o necesita soporte, no dude en contactarnos en el siguiente enlace: http://soporte-cliente-palacio-de-hierro\n\nAtentamente,\nEquipo de Atención al Cliente Palacio de Hierro', 0, 'Este es un correo legítimo ofreciendo soporte post-compra a los clientes.', 'Palaciodehierro@mexico.com', 'Gracias por su compra', 2),
('Estimado usuario,\n\nHemos recibido una solicitud para restablecer su contraseña. Si no fue usted, por favor ignore este mensaje. De lo contrario, haga clic en el siguiente enlace para restablecer su contraseña: http://reset-contrasena-gmail.com\n\nGracias,\nSoporte Técnico', 1, 'Este es un correo de phishing diseñado para que el usuario haga clic en un enlace falso y proporcione su información confidencial.', 'soportegmail2222666@gmail.com', 'Solicitud de restablecimiento de contraseña', 2),
('Hola,\n\nTenemos una oferta exclusiva para ti. Obtén un descuento del 50% en tu próxima compra haciendo clic en el siguiente enlace: http://zara-oferta-exclusiva.com\n\nSaludos,\n Zara', 1, 'Este correo puede ser un intento de phishing para que el usuario haga clic en un enlace malicioso.', 'zara22389g@gmail.com', 'Oferta exclusiva para ti', 2),
('Estimado cliente,\n\nSu suscripción a nuestro boletín ha sido confirmada. Gracias por suscribirse. Si desea cancelar su suscripción, haga clic aquí: http://cancelar-suscripcion.com\n\nSaludos,\nEl diario', 1, 'Este correo puede ser un intento de phishing para que el usuario cancele su suscripción mediante un enlace malicioso.', 'eldiario123@gmail.com', 'Confirmación de suscripción al boletín', 2),
('Querido usuario,\n\nPor motivos de seguridad, hemos cambiado nuestras políticas de autenticación. Para seguir usando tu cuenta, por favor verifica tu identidad en el siguiente enlace: http://verificacion-identidad-instagram.com\n\nGracias,\nEquipo de Seguridad', 1, 'Este correo de phishing intenta engañar al usuario para que verifique su identidad a través de un enlace falso.', 'instagram@gmail.com', 'Verificación de identidad requerida', 2),
('Estimado cliente,\n\nLe informamos que su cuenta ha sido actualizada con éxito. No se requiere ninguna acción adicional de su parte. Si tiene alguna pregunta, no dude en contactarnos.\n\nAtentamente,\nServicio al Cliente Facebook', 0, 'Este es un correo legítimo informando sobre una actualización exitosa de la cuenta.', 'Facebook@mexico.com', 'Actualización de cuenta exitosa', 2),
('Hola,\n\nPara mejorar tu experiencia, estamos realizando una encuesta de satisfacción. Por favor, completa la encuesta en el siguiente enlace: http://encuesta-satisfaccion.com\n\nGracias por tu tiempo,\nEquipo de Atención al Cliente', 1, 'Este correo puede ser un intento de phishing para que el usuario proporcione información personal a través de una encuesta falsa.', 'encuestas777@gmail.com', 'Encuesta de satisfacción', 2),
('Estimado usuario,\n\nHemos detectado actividad inusual en su cuenta. Para proteger su información, por favor confirme su identidad en el siguiente enlace: http://confirmar-identidad.com\n\nGracias,\nEquipo de Seguridad de Uber', 1, 'Este correo de phishing intenta engañar al usuario para que confirme su identidad a través de un enlace falso.', 'uber112@gmail.com', 'Confirmación de actividad inusual', 2),
('Querido cliente,\n\nNos complace ofrecerte una prueba gratuita de nuestro nuevo servicio. Activa tu prueba gratuita haciendo clic en el siguiente enlace: http://prueba-gratuita.com\n\nSaludos,\nEquipo de Ventas', 1, 'Este correo puede ser un intento de phishing para que el usuario active una prueba gratuita mediante un enlace malicioso.', 'ventas245553@gmail.com', 'Oferta de prueba gratuita', 2),
('Estimado usuario,\n\nPara garantizar la seguridad de su cuenta, hemos implementado un nuevo sistema de autenticación. Por favor, actualice su información en el siguiente enlace: http://actualizar-info-google.com\n\nGracias,\nEquipo de Soporte de google', 1, 'Este correo de phishing intenta engañar al usuario para que actualice su información a través de un enlace falso.', 'google222334@gmail.com', 'Actualización de sistema de autenticación', 2),
('Hola,\n\nNos gustaría invitarte a nuestro próximo webinar sobre ciberseguridad. Regístrate en el siguiente enlace: http://registro-webinar.com\n\nSaludos,\nEquipo de webinar', 1, 'Este correo puede ser un intento de phishing para que el usuario se registre en un enlace malicioso.', 'webinasrgratis12@gmail.com', 'Invitación a webinar sobre ciberseguridad', 2);

INSERT INTO user_trueFalse (user_id, true_false_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1), (2, 5, 1);


-- Preguntas ( Comunicaciones )
INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES
('¿Qué tipo de correos recibes en la aplicación mencionada?', 'Tanto internos como externos', 'Solo internos', 'Solo externos', 'Ninguno', 'En la aplicación recibes todos los correos tanto internos como externos.', 3),
('¿Qué debes usar para registrarte en una compañía externa a Awaq?', 'El correo org facilitado', 'Cualquier correo personal', 'El correo de otro compañero', 'No necesitas registrarte', 'Debes hacerlo usando el correo org que se te facilitó.', 3),
('¿Está permitido registrarse en webs que fomenten actividades no relacionadas con Awaq?', 'No', 'Sí', 'A veces', 'Solo con permiso', 'No está permitido registrarse en webs que fomenten actividades no relacionadas con las actividades de Awaq.', 3),
('¿Qué contiene Outlook además del correo?', 'La agenda', 'Documentos importantes', 'Solo contactos', 'Notas personales', 'Outlook contiene la agenda que debes mantener organizada y siempre actualizada.', 3),
('¿Por qué es recomendable descargar la app de Outlook en el móvil?', 'Porque te notifica de la llegada de nuevos correos', 'Para tener acceso a internet', 'Para juegos', 'Para llamadas', 'Es muy recomendable que te descargues la app en el móvil ya que te notifica de la llegada de nuevos correos.', 3),
('¿Qué tipo de estructura es Awaq?', 'Projectizada', 'Jerarquizada', 'Horizontal', 'Vertical', 'Awaq es una estructura projectizada, no jerarquizada.', 3),
('¿Cómo deben ser las comunicaciones en Awaq?', 'Respetuosas y apropiadas', 'Breves y directas', 'Frecuentes y detalladas', 'Informales', 'Las comunicaciones siempre deben ser respetuosas y apropiadas al momento de la conversación.', 3),
('¿Qué representa todo lo que comunicas en Awaq?', 'Los valores de Awaq ONGD', 'Tus opiniones personales', 'Tu departamento', 'Tus proyectos', 'Todo lo que comunicas representa Awaq ONGD y sus valores.', 3),
('¿Cuál es la aplicación de mensajería instantánea mencionada?', 'Rainbow R', 'WhatsApp', 'Telegram', 'Skype', 'La aplicación de mensajería instantánea mencionada es Rainbow R.', 3),
('¿Para qué sirve Sharepoint?', 'Almacenamiento y repositorio', 'Comunicación instantánea', 'Gestión de tareas', 'Programación de reuniones', 'Sharepoint sirve como método de almacenamiento y repositorio.', 3),
('¿Es aconsejable tener Sharepoint en el móvil?', 'Sí', 'No', 'Solo en la computadora', 'Solo en la tablet', 'Es muy aconsejable tenerla en el móvil para poder recibir las notificaciones de aquellos proyectos en los que te veas implicado.', 3),
('¿Qué debes hacer si necesitas información para la colaboración con una compañía externa a Awaq?', 'Registrarte usando el correo org facilitado', 'Usar tu correo personal', 'Contactar al soporte técnico', 'Solicitar acceso al administrador', 'Si necesitas registrarte en una compañía externa a Awaq para obtener cualquier tipo de información necesaria para la colaboración, deberás hacerlo usando el correo org que se te facilitó.', 3),
('¿Qué puede constituir un delito relacionado con el uso de correos en Awaq?', 'Registrarse en webs que incurran en daño moral, material o financiero a la organización', 'No actualizar tu agenda', 'Enviar correos personales', 'No responder a los correos a tiempo', 'Puede constituir un delito el registro en webs que incurran en un daño moral, material o financiero a la organización.', 3),
('¿Qué aplicación contiene la agenda y debe mantenerse organizada y actualizada?', 'Outlook', 'Google Calendar', 'Trello', 'Slack', 'Outlook contiene la agenda que debes mantener organizada y siempre actualizada.', 3),
('¿Qué aspecto de las comunicaciones es fundamental en Awaq?', 'Ser respetuosas y apropiadas', 'Ser rápidas y directas', 'Ser formales y extensas', 'Ser privadas y confidenciales', 'Las comunicaciones siempre deben ser respetuosas y apropiadas al momento de la conversación.', 3),
('¿Por qué es importante descargar la app de Outlook en el móvil?', 'Porque notifica la llegada de nuevos correos', 'Para poder hacer llamadas', 'Para acceder a documentos offline', 'Para jugar en los descansos', 'Es muy recomendable que te descargues la app en el móvil ya que te notifica de la llegada de nuevos correos.', 3),
('¿Qué tipo de ambiente de trabajo se fomenta en Awaq?', 'Multicultural sin fronteras ni nacionalidades', 'Competitivo y exigente', 'Formal y jerarquizado', 'Independiente y solitario', 'Colaboramos en un ambiente multicultural que no conoce fronteras ni nacionalidades.', 3),
('¿Qué representa todo lo que comunicas en Awaq ONGD?', 'Los valores de la organización', 'Tu opinión personal', 'Las instrucciones del jefe', 'Las políticas de comunicación', 'Todo lo que comunicas representa Awaq ONGD y sus valores.', 3),
('¿Cuál es nuestra oficina virtual para mantener conversaciones y colaborar en proyectos?', 'Rainbow R', 'Zoom', 'Teams', 'Skype', 'Rainbow R es nuestra oficina virtual para mantener conversaciones y colaborar en los distintos proyectos.', 3),
('¿Qué aplicación es aconsejable tener en el móvil para recibir notificaciones de proyectos?', 'Sharepoint', 'Slack', 'Asana', 'Basecamp', 'Es muy aconsejable tener Sharepoint en el móvil para poder recibir las notificaciones de aquellos proyectos en los que te veas implicado.', 3),
('¿Para qué se utiliza Sharepoint en Awaq?', 'Almacenamiento y repositorio', 'Envío de correos', 'Gestión de tareas', 'Videoconferencias', 'Sharepoint sirve como método de almacenamiento y repositorio.', 3),
('¿Qué debes evitar en tus comunicaciones en Awaq?', 'Comentarios innecesarios o malintencionados', 'Expresiones de gratitud', 'Propuestas de mejora', 'Solicitudes de ayuda', 'Debes evitar siempre comentarios innecesarios o malintencionados.', 3),
('¿Qué representa nuestra comunicación en Awaq ONGD?', 'Nuestros valores', 'Nuestra eficiencia', 'Nuestro conocimiento', 'Nuestro liderazgo', 'Todo lo que comunicas representa Awaq ONGD y sus valores.', 3);

INSERT INTO user_question (user_id, question_id, solved) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1), (1, 6, 1),
(2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1), (2, 5, 1), (2, 6, 1);


-- Preguntas (Pautas de conducta)
INSERT INTO questions (question, correctAnswer, answer2, answer3, answer4, explanation, category_id) VALUES 
('Has descubierto que un compañero de trabajo ha estado manipulando los informes financieros para beneficiar sus resultados.', 
'Reportar la situación a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al compañero directamente', 
'Discutir el problema con otros colegas', 
'Manipular los informes financieros es una violación grave de la ética y debe ser reportada inmediatamente a un superior o al departamento de recursos humanos.', 
4),
('Notas que un empleado está constantemente llegando tarde al trabajo y afectando la productividad del equipo.', 
'Informar a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al empleado directamente', 
'Discutir el problema con otros colegas', 
'La puntualidad es importante para la productividad del equipo, y la situación debe ser reportada a un superior o al departamento de recursos humanos.', 
4),
('Un colega te ha confiado que está siendo presionado para alterar datos en un proyecto importante.', 
'Animar al colega a reportar la situación a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Decirle al colega que siga adelante con la alteración', 
'Discutir el problema con otros colegas', 
'Alterar datos es una violación ética grave. Es importante animar al colega a reportar la situación a un superior o al departamento de recursos humanos.', 
4),
('Has observado que un compañero de trabajo ha estado utilizando la tarjeta de crédito corporativa para gastos personales.', 
'Reportar el incidente a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al compañero directamente', 
'Discutir el problema con otros colegas', 
'El uso indebido de la tarjeta de crédito corporativa para gastos personales es una violación de la política de la empresa y debe ser reportada inmediatamente.', 
4),
('Un compañero de trabajo está difundiendo información confidencial de la empresa a la competencia.', 
'Reportar el incidente a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al compañero directamente', 
'Discutir el problema con otros colegas', 
'Divulgar información confidencial a la competencia es una violación grave de la ética y debe ser reportada de inmediato.', 
4),
('Has descubierto que un colega está recibiendo regalos costosos de un proveedor, lo cual está prohibido por la política de la empresa.', 
'Informar a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al colega directamente', 
'Discutir el problema con otros colegas', 
'Recibir regalos costosos de un proveedor puede influir en las decisiones de negocio y está prohibido por la política de la empresa. Debe ser reportado a un superior o al departamento de recursos humanos.', 
4),
('Un empleado te ha confesado que está usando software pirata en su equipo de trabajo.', 
'Reportar la situación a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al empleado directamente', 
'Discutir el problema con otros colegas', 
'El uso de software pirata es ilegal y puede tener serias consecuencias para la empresa. Debe ser reportado a un superior o al departamento de recursos humanos.', 
4),
('Has presenciado que un compañero ha hecho comentarios inapropiados y discriminatorios hacia otro empleado.', 
'Reportar los comentarios a un superior o al departamento de recursos humanos', 
'Ignorar la situación', 
'Confrontar al compañero directamente', 
'Discutir el problema con otros colegas', 
'Los comentarios inapropiados y discriminatorios son inaceptables y deben ser reportados a un superior o al departamento de recursos humanos.', 
4);

INSERT INTO user_question (user_id, question_id, solved) VALUES 
(1, 7, 1), (1, 8, 0), (1, 9, 1), (1, 10, 1),
(2, 7, 1), (2, 8, 1), (2, 9, 1), (2, 10, 1),


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



DELIMITER //
CREATE PROCEDURE getSecurityQuestion (IN user_id INT)
BEGIN
	SELECT tf.true_false_id, tf.text, tf.isCorrect, tf.explanation, tf.sender, tf.subject
	FROM trueFalseQuestions tf
	LEFT JOIN user_trueFalse utf ON tf.true_false_id = utf.true_false_id AND utf.user_id = user_id
	WHERE utf.user_id IS NULL OR utf.solved = 0
    ORDER BY RAND()
	LIMIT 1;
END //
DELIMITER ; 


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
