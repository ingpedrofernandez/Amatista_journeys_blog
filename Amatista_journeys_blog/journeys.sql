-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-04-2022 a las 22:32:47
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `journeys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(30) NOT NULL,
  `post_id` int(30) NOT NULL,
  `username` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `username`, `comment`, `created_at`) VALUES
(29, 21, 'mariav', 'Good post!!!', '2021-10-16 13:04:07'),
(30, 21, 'pedro', 'Good post2!!!', '2021-10-16 13:05:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `comments` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `username`, `topic_id`, `title`, `image`, `body`, `comments`, `published`, `created_at`) VALUES
(21, 23, 'ingpedro', 6, 'Cosas que hacer en Bruselas', '1634379504_bruselas.jpg', '&lt;p&gt;1. Grand Place, el lugar m&aacute;s ic&oacute;nico que ver en Bruselas&lt;/p&gt;&lt;p&gt;Marav&iacute;llate como un ni&ntilde;o en la Grand Place, considerada como una de las plazas m&aacute;s bonitas del mundo. Aqu&iacute; se encuentran algunos de los edificios m&aacute;s emblem&aacute;ticos de Bruselas, como el Ayuntamiento, la Casa del Rey, o las casas de gremios (nos encanta su arquitectura!). Ac&eacute;rcate tanto de d&iacute;a como de noche.&lt;/p&gt;&lt;p&gt;2. Catedral de San Miguel y Santa G&uacute;dula&lt;/p&gt;&lt;p&gt;Entra a la Catedral de Bruselas, un ejemplo perfecto de arquitectura g&oacute;tica que no solo te gustar&aacute; por su belleza, sino tambi&eacute;n porque es gratis. Se comenz&oacute; a edificar en 1226 pero solo se termin&oacute; alrededor de 1500.&lt;/p&gt;&lt;p&gt;3. Tour de cerveza&lt;/p&gt;&lt;p&gt;Bruselas es la capital de la cerveza artesanal as&iacute; que si eres un buen cervecero, est&aacute;s de enhorabuena. Uno de los mejores lugares para probar cervezas es &ldquo;Delirium Tremens&rdquo;: tiene unos 2.400 tipos diferentes, desde la m&aacute;s cl&aacute;sica hasta propuestas algo rarunas (vas a ver incluso cervezas con sabor a coco, chocolate o galleta).&lt;/p&gt;&lt;p&gt;4. Ruta de Street Art&lt;/p&gt;&lt;p&gt;Si los comics son tu pasi&oacute;n, en Bruselas encontrar&aacute;s tu peque&ntilde;o para&iacute;so: la ciudad est&aacute; llena de street art de Tint&iacute;n (ya sabes que es de origen belga), Ast&eacute;rix y Obelix, Blake &amp;amp; Mortimer, Lucky Luke y Marsupilami, entre otros.&lt;/p&gt;&lt;p&gt;5. Manneken Pis&lt;/p&gt;&lt;p&gt;Conoce al &laquo;ni&ntilde;o&raquo; s&iacute;mbolo de la ciudad: por supuesto hablamos del Manneken Pis, una estatua de unos 65 cm que&hellip; hace pip&iacute;.&lt;/p&gt;', 2, 1, '2021-10-16 12:18:24'),
(22, 23, 'ingpedro', 6, 'Cosas que hacer en Brujas', '1634380448_Grote-Markt-Brujas.jpg', '&lt;p&gt;1. Paseo en barco por Brujas&lt;/p&gt;&lt;p&gt;A Brujas se le conoce como &ldquo;una&rdquo; de las Venecias del norte, y es que esta ciudad belga cuenta con unos 16 km de canales: y eso, amigos, son muuuuchos canales. No dejes pasar la oportunidad de navegar por sus aguas! All&iacute;, rodeado de casitas con esa caracter&iacute;stica arquitectura, te sentir&aacute;s como dentro de un cuento. Y lo mejor de todo es que los paseos en barco son baratos: el de 30 minutos cuesta menos de 10&euro;.&lt;/p&gt;&lt;p&gt;2. Grote Markt (Plaza Mayor)&lt;/p&gt;&lt;p&gt;Emp&aacute;pate del ambiente de la Grote Markt (Plaza Mayor). Es el centro y coraz&oacute;n de Brujas, una plaza rodeada de edificios preciosos que la hacen s&uacute;per fotog&eacute;nica. Adem&aacute;s siempre est&aacute; animada, todav&iacute;a m&aacute;s los mi&eacute;rcoles: es el d&iacute;a del mercado.&lt;/p&gt;&lt;p&gt;3. Campanario Belfort&lt;/p&gt;&lt;p&gt;All&iacute; se encuentra el campanario Belfort donde, los m&aacute;s aventurillas podr&aacute;n subir los 366 escalones y disfrutar de la ciudad a vista de p&aacute;jaro.&lt;/p&gt;&lt;p&gt;4. Plaza Burg, otro sitio top que ver en Brujas&lt;/p&gt;&lt;p&gt;No es la &uacute;nica plaza con encanto en Brujas, muy cerca de all&iacute; est&aacute; la Plaza Burg, con la Bas&iacute;lica de la Santa Sangre (Heilig-Bloedbasiliek). Seg&uacute;n cuentan, una de sus reliquias contiene nada m&aacute;s y nada menos que unas gotas de la sangre de Cristo. Otro edificio que no se te puede escapar es el Stadhuis, el Ayuntamiento de Brujas, uno de los m&aacute;s antiguos de Europa.&lt;/p&gt;&lt;p&gt;5. Plaza de Jan Van Eyck&lt;/p&gt;&lt;p&gt;Y ya que nos ponemos con plazas, date una vuelta por la plaza de Jan Van Eyck. Es peque&ntilde;a pero muy coqueta y es el lugar donde se levanta la antigua aduana de la ciudad. Como bien puedes imaginar, la estatua protagonista de la plaza representa al artista Jan Van Eyck.&lt;/p&gt;', NULL, 1, '2021-10-16 12:34:08'),
(23, 23, 'ingpedro', 6, 'Cosas que hacer en Gante', '1634380796_Ghent.jpg', '&lt;p&gt;1. Muelles Graslei y Korenlei, uno de los lugares que ver en Gante&lt;/p&gt;&lt;p&gt;Graslei y Korenlei, fueron los muelles m&aacute;s importantes del puerto de la antigua ciudad de Gante. En esta zona a orillas del r&iacute;o Lys, de gran actividad comercial, se construyeron durante esta &eacute;poca casas de estilo tradicional dedicadas a varios gremios que se han ido manteniendo intactos hasta nuestros tiempos, convirtiendo las calles de Graslei y Korenlei en las m&aacute;s famosas y las m&aacute;s imprescindibles que visitar en Gante. Las casas de Graslei o muelle de las hierbas, est&aacute; mejor conservada que Korenlei o muelle de los granos, aunque es recomendable dar un paseo por las dos orillas en diferentes momentos del d&iacute;a y por la noche.&lt;/p&gt;&lt;p&gt;2. Iglesia de San Nicol&aacute;s&lt;/p&gt;&lt;p&gt;La iglesia de San Nicol&aacute;s del siglo XIII, es otro de los lugares m&aacute;s antiguos e importantes que visitar en Gante. La construcci&oacute;n de la iglesia fue financiada por el poderoso gremio de comerciantes, al ser San Nicol&aacute;s el patr&oacute;n del comercio y su exterior, construido en piedra de color azul-gris, destaca por su campanario y varias torres c&oacute;nicas m&aacute;s peque&ntilde;as situadas en las esquinas de la iglesia. Merece la pena entrar en su interior para ver sus grandes vidrieras que permiten iluminar todos sus detalles arquitect&oacute;nicos con luz natural y para ver el &oacute;rgano. Las mejores vistas de la Iglesia de San Nicol&aacute;s se obtienen subiendo al cercano campanario de Gante, la Torre Belfort. Horario de visita: de martes a domingo de 10h a 17h, los lunes no abren hasta las 14h.&lt;/p&gt;&lt;p&gt;3. Puente de San Miguel&lt;/p&gt;&lt;p&gt;El Puente de San Miguel situado sobre el r&iacute;o Leie, entre las calles Graslei y Korenlei, es uno de los lugares favoritos de Gante para los amantes de la fotograf&iacute;a. Desde lo alto del puente podr&aacute;s ver, adem&aacute;s de las preciosas fachadas de ambas orillas, las torres de varias iglesias cercanas y los barcos navegando por el canal, una imagen que estamos seguros, no olvidar&aacute;s f&aacute;cilmente. Recomendamos cruzar el puente al atardecer mientras se iluminan los edificios de la ciudad, sin duda, es una de las las mejores cosas que ver en Gante.&lt;/p&gt;&lt;p&gt;4. Castillo de los Condes de Flandes&lt;/p&gt;&lt;p&gt;El Castillo de los Condes de Flandes o Gravensteen, es una de las fortalezas defensivas mejor conservadas de Europa y otro de los lugares que visitar en Gante imprescindibles. Fue construido en el siglo XII por Felipe de Alsacia, conde de Flandes, sobre el r&iacute;o Lys, con un foso a su alrededor para ayudar a su defensa.&lt;/p&gt;&lt;p&gt;Adem&aacute;s de su espectacular exterior, puedes entrar en el castillo para ver la antigua Sala de Torturas y tambi&eacute;n puedes subir a la Torre del Homenaje, desde las que adem&aacute;s tendr&aacute;s buenas vistas de Gante. Horario de visita: de lunes a domingo de 10h a 18h. En invierno abren una hora antes y cierran una hora antes.&lt;/p&gt;&lt;p&gt;5. Paseo por los canales&lt;/p&gt;&lt;p&gt;Un paseo en barco por los canales de d&iacute;a o de noche, es una de las mejores cosas que hacer en Gante. Las peque&ntilde;as embarcaciones salen desde la zona m&aacute;s c&eacute;ntrica de los muelles Graslei y Korenlei y durante el recorrido de unos 40 minutos te ir&aacute;n explicando la historia de los edificios m&aacute;s importantes por los que vas pasando.&lt;/p&gt;&lt;p&gt;El crucero tiene un precio aproximado de 8 euros y es una actividad que merece mucho la pena, ya que adem&aacute;s de descubrir rincones escondidos, podr&aacute;s ver las preciosas fachadas de los edificios medievales desde otra perspectiva.&lt;/p&gt;', NULL, 1, '2021-10-16 12:39:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(2, 'España', ''),
(3, 'Francia', ''),
(4, 'Suiza', ''),
(5, 'Mónaco', ''),
(6, ' Bélgica', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created_at`) VALUES
(23, 1, 'ingpedro', 'ingpedro1007@gmail.com', '$2y$10$JPuoiSHqvHv3SC1YC4ftTOdOuE62mgU3tR8eOO7/jR5LUfNpmZeyK', '2021-08-22 06:44:35'),
(24, 1, 'janetsyb', 'janetsyb27@gmail.com', '$2y$10$Hl.NvvUk6SmR395CbndTMOpgFGUS2o0p.0p.ywH88mCu4dsDHQlL2', '2021-08-29 14:05:35'),
(25, 0, 'mariav', 'mariavfb1998@gmail.com', '$2y$10$q1j/wJHYUi88jYzu.0AF9O3OlyeWNXiyOs/ZNgjeUvPpk/t8iPTka', '2021-09-19 17:11:05'),
(26, 0, 'pedro', 'pedro@gmail.com', '$2y$10$fNxcmCXXE8cyQVWe5RmBQuBf/Gv7rAngwj.Ij4pK5a4VV4xpZwcOO', '2021-09-19 20:14:59'),
(27, 0, 'kira', 'kira@gmail.com', '$2y$10$ohM3J2zc0rIBQcOo.ubVGuLYPkOqE8ZZ.Q2gh2rHzmVTCrY4KI2La', '2021-09-19 20:16:24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indices de la tabla `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
