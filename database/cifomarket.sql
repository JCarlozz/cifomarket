-- Base de datos limpia para el framework FastLight.
-- Servirá como punto de partida de los proyectos FastLight.

-- se incluye:
--  la tabla para usuarios, con algunos usuarios para pruebas.
--  la tabla errores, permite registrar los errores de la aplicación en BDD.
--  la tabla stats, para contar las visitas de cada URL de la aplicación.

-- Última modificación: 19/12/2024


DROP DATABASE IF EXISTS cifomarket;

CREATE DATABASE cifomarket DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE cifomarket;

-- tabla users
-- se pueden crear campos adicionales o relaciones con otras entidadessi es necesario
CREATE TABLE users(
	id INT PRIMARY KEY auto_increment,
	nombreyapellidos VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE KEY,
	phone VARCHAR(32) NOT NULL UNIQUE KEY,
	password VARCHAR(255) NOT NULL,
	roles VARCHAR(1024) NOT NULL DEFAULT '["ROLE_USER"]',
	foto VARCHAR(256) DEFAULT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	poblacion VARCHAR(64) NOT NULL,
	provincia VARCHAR(64) NOT NULL,
	direccion VARCHAR(128) NULL
	
);

CREATE TABLE productos(
	id INT PRIMARY KEY auto_increment,
	idusers INT NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	descripcion TEXT NULL,
	precio FLOAT NOT NULL,
	foto VARCHAR(256) DEFAULT NULL,
	estado VARCHAR(32) NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (idusers) REFERENCES users(id)	
);


-- usuarios para las pruebas, podéis crear tantos como necesitéis
-- Insertar 50 usuarios
INSERT INTO users (nombreyapellidos, email, phone, password, roles, foto, poblacion, provincia, direccion) VALUES
('Juan Pérez', 'pepe@hotmail.com', '600123456', '', '["ROLE_USER, ROLE_ADMIN"]', 'foto1.jpg', 'Madrid', 'Madrid', 'Calle Mayor 1'),
('Ana García', 'ana.garcia@example.com', '600123457', 'password123', '["ROLE_USER"]', 'foto2.jpg', 'Barcelona', 'Barcelona', 'Calle Gran Vía 2'),
('Luis Martínez', 'luis.martinez@example.com', '600123458', 'password123', '["ROLE_USER"]', 'foto3.jpg', 'Valencia', 'Valencia', 'Calle Colón 3'),
('María López', 'maria.lopez@example.com', '600123459', 'password123', '["ROLE_USER"]', 'foto4.jpg', 'Sevilla', 'Sevilla', 'Calle Sierpes 4'),
('Carlos Sánchez', 'carlos.sanchez@example.com', '600123460', 'password123', '["ROLE_USER"]', 'foto5.jpg', 'Zaragoza', 'Zaragoza', 'Calle Alfonso 5'),
('Laura Fernández', 'laura.fernandez@example.com', '600123461', 'password123', '["ROLE_USER"]', 'foto6.jpg', 'Málaga', 'Málaga', 'Calle Larios 6'),
('Javier Gómez', 'javier.gomez@example.com', '600123462', 'password123', '["ROLE_USER"]', 'foto7.jpg', 'Murcia', 'Murcia', 'Calle Trapería 7'),
('Sofía Ruiz', 'sofia.ruiz@example.com', '600123463', 'password123', '["ROLE_USER"]', 'foto8.jpg', 'Palma', 'Baleares', 'Calle Jaime III 8'),
('Miguel Díaz', 'miguel.diaz@example.com', '600123464', 'password123', '["ROLE_USER"]', 'foto9.jpg', 'Las Palmas', 'Canarias', 'Calle Triana 9'),
('Elena Morales', 'elena.morales@example.com', '600123465', 'password123', '["ROLE_USER"]', 'foto10.jpg', 'Bilbao', 'Vizcaya', 'Calle Gran Vía 10'),
('Daniel González', 'daniel.gonzalez@example.com', '600123466', 'password123', '["ROLE_USER"]', 'foto11.jpg', 'Alicante', 'Alicante', 'Calle Explanada 11'),
('Carmen Jiménez', 'carmen.jimenez@example.com', '600123467', 'password123', '["ROLE_USER"]', 'foto12.jpg', 'Córdoba', 'Córdoba', 'Calle Cruz Conde 12'),
('Pablo Hernández', 'pablo.hernandez@example.com', '600123468', 'password123', '["ROLE_USER"]', 'foto13.jpg', 'Valladolid', 'Valladolid', 'Calle Santiago 13'),
('Isabel Torres', 'isabel.torres@example.com', '600123469', 'password123', '["ROLE_USER"]', 'foto14.jpg', 'Vigo', 'Pontevedra', 'Calle Príncipe 14'),
('Alejandro Vázquez', 'alejandro.vazquez@example.com', '600123470', 'password123', '["ROLE_USER"]', 'foto15.jpg', 'Gijón', 'Asturias', 'Calle Corrida 15'),
('Raquel Romero', 'raquel.romero@example.com', '600123471', 'password123', '["ROLE_USER"]', 'foto16.jpg', 'Hospitalet', 'Barcelona', 'Calle Ample 16'),
('Adrián Moreno', 'adrian.moreno@example.com', '600123472', 'password123', '["ROLE_USER"]', 'foto17.jpg', 'A Coruña', 'A Coruña', 'Calle Real 17'),
('Natalia Álvarez', 'natalia.alvarez@example.com', '600123473', 'password123', '["ROLE_USER"]', 'foto18.jpg', 'Santander', 'Cantabria', 'Calle Castelar 18'),
('Rubén Gutiérrez', 'ruben.gutierrez@example.com', '600123474', 'password123', '["ROLE_USER"]', 'foto19.jpg', 'Pamplona', 'Navarra', 'Calle Estafeta 19'),
('Patricia Blanco', 'patricia.blanco@example.com', '600123475', 'password123', '["ROLE_USER"]', 'foto20.jpg', 'Logroño', 'La Rioja', 'Calle Portales 20'),
('Sergio Suárez', 'sergio.suarez@example.com', '600123476', 'password123', '["ROLE_USER"]', 'foto21.jpg', 'Badajoz', 'Badajoz', 'Calle San Juan 21'),
('Lucía Castro', 'lucia.castro@example.com', '600123477', 'password123', '["ROLE_USER"]', 'foto22.jpg', 'Albacete', 'Albacete', 'Calle Mayor 22'),
('Hugo Ortega', 'hugo.ortega@example.com', '600123478', 'password123', '["ROLE_USER"]', 'foto23.jpg', 'Toledo', 'Toledo', 'Calle Comercio 23'),
('Marina Méndez', 'marina.mendez@example.com', '600123479', 'password123', '["ROLE_USER"]', 'foto24.jpg', 'Salamanca', 'Salamanca', 'Calle Toro 24'),
('Alberto Iglesias', 'alberto.iglesias@example.com', '600123480', 'password123', '["ROLE_USER"]', 'foto25.jpg', 'Huelva', 'Huelva', 'Calle Concepción 25'),
('Beatriz Núñez', 'beatriz.nunez@example.com', '600123481', 'password123', '["ROLE_USER"]', 'foto26.jpg', 'Tarragona', 'Tarragona', 'Calle Rambla Nova 26'),
('Jorge Medina', 'jorge.medina@example.com', '600123482', 'password123', '["ROLE_USER"]', 'foto27.jpg', 'Lleida', 'Lleida', 'Calle Mayor 27'),
('Clara Cortés', 'clara.cortes@example.com', '600123483', 'password123', '["ROLE_USER"]', 'foto28.jpg', 'León', 'León', 'Calle Ancha 28'),
('Francisco Vargas', 'francisco.vargas@example.com', '600123484', 'password123', '["ROLE_USER"]', 'foto29.jpg', 'Cádiz', 'Cádiz', 'Calle Ancha 29'),
('Eva Flores', 'eva.flores@example.com', '600123485', 'password123', '["ROLE_USER"]', 'foto30.jpg', 'Jaén', 'Jaén', 'Calle Bernabé Soriano 30'),
('Roberto Ramírez', 'roberto.ramirez@example.com', '600123486', 'password123', '["ROLE_USER"]', 'foto31.jpg', 'Ourense', 'Ourense', 'Calle del Paseo 31'),
('Silvia Reyes', 'silvia.reyes@example.com', '600123487', 'password123', '["ROLE_USER"]', 'foto32.jpg', 'Almería', 'Almería', 'Calle Real 32'),
('Ángel Cruz', 'angel.cruz@example.com', '600123488', 'password123', '["ROLE_USER"]', 'foto33.jpg', 'Castellón', 'Castellón', 'Calle Mayor 33'),
('Nerea Molina', 'nerea.molina@example.com', '600123489', 'password123', '["ROLE_USER"]', 'foto34.jpg', 'Burgos', 'Burgos', 'Calle Lain Calvo 34'),
('Gabriel Herrera', 'gabriel.herrera@example.com', '600123490', 'password123', '["ROLE_USER"]', 'foto35.jpg', 'Soria', 'Soria', 'Calle Collado 35'),
('Lorena Peña', 'lorena.pena@example.com', '600123491', 'password123', '["ROLE_USER"]', 'foto36.jpg', 'Guadalajara', 'Guadalajara', 'Calle Mayor 36'),
('Iván Rojas', 'ivan.rojas@example.com', '600123492', 'password123', '["ROLE_USER"]', 'foto37.jpg', 'Segovia', 'Segovia', 'Calle Real 37'),
('Marta Campos', 'marta.campos@example.com', '600123493', 'password123', '["ROLE_USER"]', 'foto38.jpg', 'Ávila', 'Ávila', 'Calle San Segundo 38'),
('Óscar Vega', 'oscar.vega@example.com', '600123494', 'password123', '["ROLE_USER"]', 'foto39.jpg', 'Cuenca', 'Cuenca', 'Calle San Pedro 39'),
('Cristina Fuentes', 'cristina.fuentes@example.com', '600123495', 'password123', '["ROLE_USER"]', 'foto40.jpg', 'Pontevedra', 'Pontevedra', 'Calle Michelena 40'),
('Andrés León', 'andres.leon@example.com', '600123496', 'password123', '["ROLE_USER"]', 'foto41.jpg', 'Lugo', 'Lugo', 'Calle Rúa Nova 41'),
('Nora Marín', 'nora.marin@example.com', '600123497', 'password123', '["ROLE_USER"]', 'foto42.jpg', 'Huesca', 'Huesca', 'Calle Coso 42'),
('Víctor Cabrera', 'victor.cabrera@example.com', '600123498', 'password123', '["ROLE_USER"]', 'foto43.jpg', 'Teruel', 'Teruel', 'Calle San Miguel 43'),
('Alicia Pardo', 'alicia.pardo@example.com', '600123499', 'password123', '["ROLE_USER"]', 'foto44.jpg', 'Zamora', 'Zamora', 'Calle Balborraz 44'),
('Héctor Calvo', 'hector.calvo@example.com', '600123500', 'password123', '["ROLE_USER"]', 'foto45.jpg', 'Palencia', 'Palencia', 'Calle Mayor 45'),
('Rosa Soler', 'rosa.soler@example.com', '600123501', 'password123', '["ROLE_USER"]', 'foto46.jpg', 'Ciudad Real', 'Ciudad Real', 'Calle Toledo 46'),
('Guillermo Moya', 'guillermo.moya@example.com', '600123502', 'password123', '["ROLE_USER"]', 'foto47.jpg', 'Cáceres', 'Cáceres', 'Calle Moret 47'),
('Lidia Sáez', 'lidia.saez@example.com', '600123503', 'password123', '["ROLE_USER"]', 'foto48.jpg', 'Melilla', 'Melilla', 'Calle Reyes Católicos 48'),
('Marcos Bravo', 'marcos.bravo@example.com', '600123504', 'password123', '["ROLE_USER"]', 'foto49.jpg', 'Ceuta', 'Ceuta', 'Calle Real 49'),
('Nuria Gallardo', 'nuria.gallardo@example.com', '600123505', 'password123', '["ROLE_USER"]', 'foto50.jpg', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'Calle Castillo 50');

UPDATE users SET foto = NULL;
UPDATE users SET password = 1234;

-- Insertar productos en tabla productos
-- Insertar 200 productos con idusuario asignado aleatoriamente entre 1 y 50
INSERT INTO productos (idusers, titulo, descripcion, precio, foto, estado) VALUES
(4, 'iPhone 12', 'iPhone 12 en perfecto estado, con cargador y funda.', 600.00, 'iphone12.jpg', 'Como nuevo'),
(12, 'Sofá de piel', 'Sofá de piel color negro, tres plazas, muy cómodo.', 450.00, 'sofa.jpg', 'Usado'),
(7, 'Bicicleta de montaña', 'Bicicleta de montaña con cambios Shimano, ideal para rutas.', 250.00, 'bicicleta.jpg', 'Usado'),
(23, 'Libro: Cien años de soledad', 'Edición especial de Cien años de soledad, como nuevo.', 15.00, 'libro.jpg', 'Como nuevo'),
(4, 'MacBook Air', 'MacBook Air 2020, 8GB RAM, 256GB SSD.', 800.00, 'macbook.jpg', 'Como nuevo'),
(18, 'Mesa de comedor', 'Mesa de comedor de madera, 6 plazas, en perfecto estado.', 200.00, 'mesa.jpg', 'Usado'),
(9, 'Portátil HP', 'Portátil HP con 8GB de RAM y 256GB SSD, ideal para trabajo.', 400.00, 'portatil.jpg', 'Como nuevo'),
(4, 'AirPods Pro', 'AirPods Pro con cancelación de ruido, como nuevos.', 150.00, 'airpods.jpg', 'Como nuevo'),
(30, 'Guitarra acústica', 'Guitarra acústica Yamaha, perfecta para principiantes.', 120.00, 'guitarra.jpg', 'Usado'),
(15, 'Televisor Samsung 55"', 'Televisor Samsung 55" 4K, con mando y soporte.', 500.00, 'tv.jpg', 'Como nuevo'),
(4, 'iPad Pro', 'iPad Pro 11", 128GB, con Apple Pencil.', 700.00, 'ipad.jpg', 'Como nuevo'),
(22, 'Cámara Canon EOS', 'Cámara réflex Canon EOS con objetivo 18-55mm, como nueva.', 350.00, 'camara.jpg', 'Como nuevo'),
(4, 'Cargador MagSafe', 'Cargador MagSafe original para iPhone.', 40.00, 'magsafe.jpg', 'Nuevo'),
(7, 'Mochila North Face', 'Mochila North Face, ideal para senderismo, en buen estado.', 50.00, 'mochila.jpg', 'Usado'),
(4, 'Fundas iPhone', 'Lote de 3 fundas para iPhone 12.', 20.00, 'fundas.jpg', 'Nuevo'),
(33, 'Impresora HP', 'Impresora HP multifunción, escáner y copiadora.', 80.00, 'impresora.jpg', 'Usado'),
(4, 'Teclado Apple Magic', 'Teclado inalámbrico Apple Magic Keyboard.', 80.00, 'teclado_apple.jpg', 'Como nuevo'),
(12, 'Silla de oficina', 'Silla ergonómica para oficina, en excelente estado.', 70.00, 'silla.jpg', 'Como nuevo'),
(4, 'Ratón Apple Magic', 'Ratón inalámbrico Apple Magic Mouse.', 60.00, 'raton_apple.jpg', 'Como nuevo'),
(27, 'Altavoz Bluetooth', 'Altavoz JBL Bluetooth, sonido de alta calidad.', 60.00, 'altavoz.jpg', 'Como nuevo'),
(4, 'Monitor LG UltraFine', 'Monitor LG UltraFine 4K para Mac.', 400.00, 'monitor_lg.jpg', 'Como nuevo'),
(8, 'Cafetera Nespresso', 'Cafetera Nespresso con 10 cápsulas de regalo.', 90.00, 'cafetera.jpg', 'Como nuevo'),
(4, 'Apple Watch', 'Apple Watch Series 5, pantalla siempre activa.', 250.00, 'applewatch.jpg', 'Como nuevo'),
(19, 'Mesa de centro', 'Mesa de centro de cristal y metal, moderna.', 120.00, 'mesa_centro.jpg', 'Usado'),
(4, 'Bicicleta estática', 'Bicicleta estática plegable, perfecta para casa.', 150.00, 'bici_estatica.jpg', 'Usado'),
(14, 'Robot aspirador', 'Robot aspirador Xiaomi, con mapeo inteligente.', 200.00, 'robot.jpg', 'Como nuevo'),
(4, 'Mochila infantil', 'Mochila infantil con diseño de superhéroe.', 20.00, 'mochila_niño.jpg', 'Usado'),
(21, 'Cámara instantánea', 'Cámara instantánea Fujifilm, con 10 fotos de regalo.', 70.00, 'camara_instantanea.jpg', 'Como nuevo'),
(4, 'Tablet Samsung', 'Tablet Samsung de 10 pulgadas, 64GB de almacenamiento.', 180.00, 'tablet.jpg', 'Como nuevo'),
(10, 'Caja de herramientas', 'Caja de herramientas completa, ideal para bricolaje.', 50.00, 'herramientas.jpg', 'Usado'),
(4, 'Auriculares Sony', 'Auriculares Sony con cancelación de ruido.', 90.00, 'auriculares.jpg', 'Como nuevo'),
(25, 'Batidora de mano', 'Batidora de mano Braun, perfecta para cocina.', 40.00, 'batidora.jpg', 'Usado'),
(4, 'Libro: El Principito', 'Edición ilustrada de El Principito, como nuevo.', 10.00, 'principito.jpg', 'Como nuevo'),
(16, 'Mesa plegable', 'Mesa plegable para exteriores, fácil de transportar.', 30.00, 'mesa_plegable.jpg', 'Usado'),
(4, 'Silla plegable', 'Silla plegable para camping o playa.', 15.00, 'silla_plegable.jpg', 'Usado'),
(29, 'Cámara GoPro', 'Cámara GoPro Hero 7, ideal para deportes.', 150.00, 'gopro.jpg', 'Como nuevo'),
(4, 'Reloj inteligente', 'Reloj inteligente Xiaomi, monitor de actividad.', 80.00, 'reloj_inteligente.jpg', 'Como nuevo'),
(13, 'Teclado mecánico', 'Teclado mecánico RGB, ideal para gaming.', 70.00, 'teclado.jpg', 'Como nuevo'),
(4, 'Ratón inalámbrico', 'Ratón inalámbrico Logitech, ergonómico.', 25.00, 'raton.jpg', 'Como nuevo'),
(20, 'Manta térmica', 'Manta térmica para invierno, suave y cálida.', 35.00, 'manta.jpg', 'Usado'),
(4, 'Juego de sartenes', 'Juego de sartenes antiadherentes, 3 piezas.', 40.00, 'sartenes.jpg', 'Como nuevo'),
(17, 'Lámpara de escritorio', 'Lámpara LED ajustable, perfecta para estudiar.', 20.00, 'lampara.jpg', 'Usado'),
(4, 'Cortina blackout', 'Cortina blackout para dormitorio, color gris.', 30.00, 'cortina.jpg', 'Como nuevo'),
(24, 'Estantería de madera', 'Estantería de madera de pino, 5 baldas.', 50.00, 'estanteria.jpg', 'Usado'),
(4, 'Caja de vino', 'Caja de vino tinto, 6 botellas de regalo.', 60.00, 'vino.jpg', 'Nuevo'),
(11, 'Juego de té', 'Juego de té de porcelana, 12 piezas.', 25.00, 'te.jpg', 'Usado'),
(4, 'Cepillo para mascotas', 'Cepillo para perros y gatos, elimina pelo suelto.', 10.00, 'cepillo.jpg', 'Como nuevo'),
(26, 'Pelota de fútbol', 'Pelota de fútbol oficial, tamaño 5.', 15.00, 'pelota.jpg', 'Usado'),
(4, 'Raqueta de tenis', 'Raqueta de tenis Wilson, ligera y resistente.', 50.00, 'raqueta.jpg', 'Usado'),
(28, 'Patines en línea', 'Patines en línea para adultos, talla 42.', 60.00, 'patines.jpg', 'Usado'),
(4, 'Mochila de viaje', 'Mochila de viaje con ruedas, 50L de capacidad.', 70.00, 'mochila_viaje.jpg', 'Usado'),
(31, 'Cámara de vigilancia', 'Cámara de vigilancia con visión nocturna.', 90.00, 'camara_vigilancia.jpg', 'Como nuevo'),
(4, 'Cargador solar', 'Cargador solar portátil para dispositivos móviles.', 40.00, 'cargador_solar.jpg', 'Como nuevo'),
(32, 'Libro: Harry Potter', 'Colección de Harry Potter, 7 libros en caja.', 80.00, 'harry_potter.jpg', 'Usado'),
(4, 'Mesa de ping pong', 'Mesa de ping pong plegable, incluye redes y palas.', 120.00, 'ping_pong.jpg', 'Usado'),
(34, 'Piano eléctrico', 'Piano eléctrico Yamaha, 88 teclas sensibles.', 300.00, 'piano.jpg', 'Como nuevo'),
(4, 'Batería infantil', 'Batería de juguete para niños, con platillos.', 50.00, 'bateria.jpg', 'Usado'),
(35, 'Coche teledirigido', 'Coche teledirigido, control remoto incluido.', 35.00, 'coche.jpg', 'Usado'),
(4, 'Reloj de pared', 'Reloj de pared vintage, perfecto para decoración.', 25.00, 'reloj_pared.jpg', 'Usado'),
(36, 'Mochila de senderismo', 'Mochila de senderismo 40L, resistente al agua.', 60.00, 'mochila_senderismo.jpg', 'Como nuevo'),
(4, 'Cámara réflex Nikon', 'Cámara réflex Nikon D3500 con objetivo 18-55mm.', 400.00, 'camara_nikon.jpg', 'Como nuevo'),
(37, 'Silla de jardín', 'Silla de jardín plegable, resistente a la intemperie.', 30.00, 'silla_jardin.jpg', 'Usado'),
(4, 'Lavadora', 'Lavadora Samsung, 8kg, carga frontal.', 250.00, 'lavadora.jpg', 'Usado'),
(38, 'Secadora', 'Secadora eléctrica, 7kg, eficiencia energética A++.', 200.00, 'secadora.jpg', 'Usado'),
(4, 'Horno microondas', 'Horno microondas LG, 20L, 800W.', 80.00, 'microondas.jpg', 'Como nuevo'),
(39, 'Batidora de pie', 'Batidora de pie KitchenAid, color rojo.', 120.00, 'batidora_pie.jpg', 'Como nuevo'),
(4, 'Licuadora', 'Licuadora Oster, 600W, 2 velocidades.', 50.00, 'licuadora.jpg', 'Usado'),
(40, 'Cafetera italiana', 'Cafetera italiana Bialetti, 6 tazas.', 25.00, 'cafetera_italiana.jpg', 'Usado'),
(4, 'Juego de cuchillos', 'Juego de 6 cuchillos profesionales de acero inoxidable.', 70.00, 'cuchillos.jpg', 'Como nuevo'),
(41, 'Tabla de cortar', 'Tabla de cortar de bambú, tamaño grande.', 20.00, 'tabla_cortar.jpg', 'Usado'),
(4, 'Olla a presión', 'Olla a presión T-fal, 6 litros.', 60.00, 'olla_presion.jpg', 'Como nuevo'),
(42, 'Sartén de hierro', 'Sartén de hierro fundido, ideal para cocina lenta.', 40.00, 'sarten_hierro.jpg', 'Usado'),
(4, 'Jarra de agua', 'Jarra de agua con filtro, capacidad 2 litros.', 15.00, 'jarra_agua.jpg', 'Nuevo'),
(43, 'Vaso térmico', 'Vaso térmico de acero inoxidable, 500ml.', 10.00, 'vaso_termico.jpg', 'Como nuevo'),
(4, 'Tostadora', 'Tostadora de 2 ranuras, función descongelación.', 25.00, 'tostadora.jpg', 'Usado'),
(44, 'Freidora de aire', 'Freidora de aire Philips, 1.2kg, sin aceite.', 90.00, 'freidora_aire.jpg', 'Como nuevo'),
(4, 'Plancha de vapor', 'Plancha de vapor Rowenta, 2400W.', 50.00, 'plancha_vapor.jpg', 'Usado'),
(45, 'Aspiradora', 'Aspiradora sin bolsa, potencia 800W.', 70.00, 'aspiradora.jpg', 'Usado'),
(4, 'Purificador de aire', 'Purificador de aire con filtro HEPA.', 120.00, 'purificador_aire.jpg', 'Como nuevo'),
(46, 'Ventilador de torre', 'Ventilador de torre, 3 velocidades, oscilante.', 40.00, 'ventilador_torre.jpg', 'Usado'),
(4, 'Calefactor', 'Calefactor eléctrico, 2000W, termostato ajustable.', 60.00, 'calefactor.jpg', 'Usado'),
(47, 'Humidificador', 'Humidificador ultrasónico, 2.5L, luz nocturna.', 35.00, 'humidificador.jpg', 'Como nuevo'),
(4, 'Deshumidificador', 'Deshumidificador para espacios pequeños.', 80.00, 'deshumidificador.jpg', 'Usado'),
(48, 'Robot de cocina', 'Robot de cocina multifunción, 10 programas.', 150.00, 'robot_cocina.jpg', 'Como nuevo'),
(4, 'Exprimidor', 'Exprimidor de cítricos, manual, fácil de usar.', 20.00, 'exprimidor.jpg', 'Usado'),
(49, 'Máquina de pan', 'Máquina de pan automática, 12 programas.', 100.00, 'maquina_pan.jpg', 'Usado'),
(4, 'Hervidor eléctrico', 'Hervidor eléctrico, 1.7L, apagado automático.', 30.00, 'hervidor.jpg', 'Como nuevo'),
(50, 'Cafetera express', 'Cafetera express DeLonghi, 15 bares de presión.', 200.00, 'cafetera_express.jpg', 'Como nuevo');

UPDATE productos SET foto = NULL;

-- tabla errors
-- por si queremos registrar los errores en base de datos.
CREATE TABLE errors(
	id INT PRIMARY KEY auto_increment,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    level VARCHAR(32) NOT NULL DEFAULT 'ERROR',
    url VARCHAR(256) NOT NULL,
	message VARCHAR(2048) NOT NULL,
	user VARCHAR(128) DEFAULT NULL,
	ip CHAR(15) NOT NULL
);


-- tabla stats
-- por si queremos registrar las estadísticas de visitas a las disintas URLs de nuestra aplicación.
CREATE TABLE stats(
	id INT PRIMARY KEY auto_increment,
    url VARCHAR(250) NOT NULL UNIQUE KEY,
	count INT NOT NULL DEFAULT 1,
	user VARCHAR(128) DEFAULT NULL,
	ip CHAR(15) NOT NULL, 
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

