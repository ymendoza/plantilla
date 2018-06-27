-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2018 a las 05:48:54
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pksistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_blog_comment`
--

CREATE TABLE `pk_blog_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_blog_post`
--

CREATE TABLE `pk_blog_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_blog_post`
--

INSERT INTO `pk_blog_post` (`id`, `user_id`, `slug`, `title`, `status`, `date`, `modified`, `content`, `excerpt`, `comment_status`, `comment_count`, `data`, `roles`) VALUES
(1, 1, 'hello-pagekit', 'Ing Felix Arroyo', 2, '2018-06-24 00:43:29', '2018-06-24 02:35:44', 'Auditorias Electorales<br>\nEntrevistas', '', 1, 0, '{\"title\":null,\"markdown\":true,\"image\":{\"src\":\"\",\"alt\":\"\"}}', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_auth`
--

CREATE TABLE `pk_system_auth` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_auth`
--

INSERT INTO `pk_system_auth` (`id`, `user_id`, `access`, `status`, `data`) VALUES
('bb103d65fb2723ef48a0b85d2713c6964c9b60e7', 1, '2018-06-24 03:23:21', 1, '{\"ip\":\"::1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/67.0.3396.87 Safari\\/537.36\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_config`
--

CREATE TABLE `pk_system_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_config`
--

INSERT INTO `pk_system_config` (`id`, `name`, `value`) VALUES
(1, 'system/dashboard', '{\"55dda578e93b5\":{\"type\":\"location\",\"column\":1,\"idx\":0,\"units\":\"metric\",\"id\":\"55dda578e93b5\",\"uid\":2911298,\"city\":\"Hamburg\",\"country\":\"DE\",\"coords\":{\"lon\":10,\"lat\":53.549999}},\"55dda581d5781\":{\"type\":\"feed\",\"column\":2,\"idx\":0,\"count\":5,\"content\":\"1\",\"id\":\"55dda581d5781\",\"title\":\"Pagekit News\",\"url\":\"http:\\/\\/pagekit.com\\/blog\\/feed\"},\"55dda6e3dd661\":{\"type\":\"user\",\"column\":0,\"idx\":100,\"show\":\"registered\",\"display\":\"thumbnail\",\"total\":\"1\",\"count\":12,\"id\":\"55dda6e3dd661\"}}'),
(2, 'system/site', '{\"menus\":{\"main\":{\"id\":\"main\",\"label\":\"Main\"}},\"title\":\"Ing. Felix Arroyo G., Msc\",\"frontpage\":1,\"view\":{\"logo\":\"storage\\/LogoFelix4.jpg\"},\"description\":\"\",\"maintenance\":{\"enabled\":false,\"logo\":\"\",\"msg\":\"\"},\"icons\":{\"favicon\":false,\"appicon\":false},\"code\":{\"header\":\"\",\"footer\":\"\"}}'),
(3, 'system', '{\"admin\":{\"locale\":\"es_ES\"},\"site\":{\"locale\":\"es_ES\",\"theme\":\"theme-one\"},\"version\":\"1.0.13\",\"packages\":{\"blog\":\"1.0.5\",\"theme-one\":\"1.0.0\"},\"extensions\":[\"blog\"]}'),
(6, 'theme-one', '{\"logo_contrast\":\"storage\\/pagekit-logo-contrast.svg\",\"_menus\":{\"main\":\"main\"},\"_positions\":{\"hero\":[1],\"footer\":[2],\"navbar\":[4,5,7],\"sidebar\":[3]},\"_widgets\":{\"1\":{\"title_hide\":true,\"title_size\":\"uk-h1 uk-margin-top-remove\",\"alignment\":true,\"html_class\":\"\",\"panel\":\"\"},\"2\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":\"true\",\"html_class\":\"\",\"panel\":\"\"},\"3\":{\"title_hide\":false,\"title_size\":\"uk-panel-title\",\"alignment\":\"\",\"html_class\":\"\",\"panel\":\"uk-panel-header\"},\"4\":{\"title_hide\":false,\"title_size\":\"uk-panel-title\",\"alignment\":\"\",\"html_class\":\"\",\"panel\":\"uk-panel-box uk-panel-box-primary\"},\"5\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":true,\"html_class\":\"\",\"panel\":\"uk-panel-header\"},\"7\":{\"title_hide\":false,\"title_size\":\"uk-panel-title\",\"alignment\":\"\",\"html_class\":\"\",\"panel\":\"\"}},\"_nodes\":{\"1\":{\"title_hide\":true,\"title_large\":false,\"alignment\":true,\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"storage\\/HombreGraficoOJD-1160x650.jpg\",\"hero_viewport\":true,\"hero_contrast\":true,\"hero_parallax\":\"\",\"navbar_transparent\":true,\"top_style\":\"uk-block-muted\",\"main_style\":\"uk-block-default\",\"bottom_style\":\"uk-block-muted\"},\"3\":{\"title_hide\":false,\"title_large\":false,\"alignment\":\"\",\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"\",\"hero_viewport\":\"\",\"hero_contrast\":\"\",\"hero_parallax\":\"\",\"navbar_transparent\":\"\",\"top_style\":\"uk-block-muted\",\"main_style\":\"uk-block-default\",\"bottom_style\":\"uk-block-muted\"},\"4\":{\"title_hide\":true,\"title_large\":false,\"alignment\":\"\",\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"\",\"hero_viewport\":\"\",\"hero_contrast\":\"\",\"hero_parallax\":\"\",\"navbar_transparent\":\"\",\"top_style\":\"uk-block-muted\",\"main_style\":\"uk-block-default\",\"bottom_style\":\"uk-block-muted\"},\"5\":{\"title_hide\":true,\"title_large\":false,\"alignment\":\"\",\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"\",\"hero_viewport\":\"\",\"hero_contrast\":\"\",\"hero_parallax\":\"\",\"navbar_transparent\":\"\",\"top_style\":\"uk-block-muted\",\"main_style\":\"uk-block-default\",\"bottom_style\":\"uk-block-muted\"},\"6\":{\"title_hide\":false,\"title_large\":false,\"alignment\":\"\",\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"\",\"hero_viewport\":\"\",\"hero_contrast\":\"\",\"hero_parallax\":\"\",\"navbar_transparent\":\"\",\"top_style\":\"uk-block-muted\",\"main_style\":\"uk-block-default\",\"bottom_style\":\"uk-block-muted\"}},\"logo_offcanvas\":\"\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_node`
--

CREATE TABLE `pk_system_node` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_node`
--

INSERT INTO `pk_system_node` (`id`, `parent_id`, `priority`, `status`, `title`, `slug`, `path`, `link`, `type`, `menu`, `roles`, `data`) VALUES
(1, 0, 1, 1, 'Home', 'home', '/home', '@page/1', 'page', 'main', NULL, '{\"defaults\":{\"id\":1},\"meta\":{\"og:title\":\"\",\"og:image\":\"storage\\/LogoFelix4.jpg\"}}'),
(2, 0, 2, 1, 'Blog', 'blog', '/blog', '@blog', 'blog', 'main', NULL, NULL),
(3, 0, 3, 1, 'Sobre Mi', 'sobre-mi', '/sobre-mi', '@page/2', 'page', 'main', NULL, '{\"meta\":{\"og:title\":\"\"},\"defaults\":{\"id\":2},\"menu_hide\":true}'),
(4, 0, 4, 1, 'Auditorías', 'auditorías', '/auditorías', '@page/3', 'page', 'main', NULL, '{\"meta\":{\"og:title\":\"\"},\"defaults\":{\"id\":3}}'),
(5, 0, 5, 0, 'Auditorías', 'auditorías-2', '/auditorías-2', '@page/4', 'page', 'trash', NULL, '{\"meta\":{\"og:title\":\"\"},\"defaults\":{\"id\":4}}'),
(6, 0, 6, 0, 'Blog', 'blog-2', '/blog-2', '@blog', 'link', 'trash', NULL, '{\"meta\":{\"og:title\":\"\"},\"alias\":true,\"redirect\":false}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_page`
--

CREATE TABLE `pk_system_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_page`
--

INSERT INTO `pk_system_page` (`id`, `title`, `content`, `data`) VALUES
(1, 'Home', '<div class=\"uk-width-medium-3-4 uk-container-center\">\n    \n<h3 class=\"uk-article-title uk-text-bold uk-text-center\">Auditorías y Garantías Electorales en Sistemas de Votación Automatizados<br class=\"uk-hidden-small\"></h3>\n<article class=\"uk-article\">\n<p class=\"uk-text-lead uk-text-justify\">En comicios automatizados es importante que se establezcan las auditorías y garantías electorales, ya que solo por el hecho de ser automatizadas implican procesos complejos difícil de entender por la mayoría, lo que ocasiona una cantidad de mitos no convenientes para la confianza del electorado.<br>\nEn este trabajo vamos a referirnos a los Procesos Electorales Automatizados usados en Venezuela desde el año 2004 hasta el presente.<br>\nEl Consejo Nacional Electoral de Venezuela adquirió el actual sistema de procesamiento electoral en el año 2003. Se incluyó como condición, la entrega del software para poder ser revisado y realizar auditorias por los distintos actores que concurran a los comicios. También solicito de que el sistema dejara las trazas necesarias para poder conocer después de una contienda electoral lo ocurrido.<br>\nLa transferencia de tecnología fue parte del acuerdo previo a la primera contratación en el año 2003.\nEstas acciones contribuyeron a lograr unas eficientes auditorias y garantías electorales que son siempre necesarias para tratar de acabar con los mitos de fraude ocasionado por el sistema automatizado y así estimular el voto en la población.\n</p>\n <div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Listado de Auditorías previstas en los Procesos Electorales<br class=\"uk-hidden-small\"></h3>  \n1. Software de Sorteo de Miembros de Mesa y Juntas Electorales y Presencia de Testigos en el Sorteo.<br class=\"uk-hidden-small\">\n2. Registro Electoral<br class=\"uk-hidden-small\">\n3. Software de Máquinas de Votación<br class=\"uk-hidden-small\">\n4. Configuración de Maquinas de Votación<br class=\"uk-hidden-small\">\n5. Datos de Maquinas de Votación (Biográficos y Biométricos)<br class=\"uk-hidden-small\">\n6. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n7. Producción de Máquinas de Votación y Sorteo de Maquinas a usar en Auditoría de Predespacho<br class=\"uk-hidden-small\">\n8. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n9. Tinta Indeleble (Eliminada en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n10.Cuadernos de Votación<br class=\"uk-hidden-small\">\n11.Software del Sistema de Totalización-<br class=\"uk-hidden-small\">\n12.Infraestructura del Consejo Nacional Electoral para los Procesos Electorales Automatizados<br class=\"uk-hidden-small\">\n13.Puesta a cero de todos los sistemas necesarios para efectuar las Elecciones<br class=\"uk-hidden-small\">\n14.Transmisión de datos electorales Fase I (Un día antes de las Elecciones)<br class=\"uk-hidden-small\">\n15.Sorteo de Centros y Mesas de Votación el día de las Elecciones a las 6:00 pm. Revisión previa del software a utilizar para el Sorteo. (serán utilizados para la Auditoría Ciudadana Fase II)<br class=\"uk-hidden-small\">\n16.Transmisión de datos electorales Fase II (Un día después de las Elecciones)<br class=\"uk-hidden-small\">\n17.Auditoría Ciudadana Fase II, posterior a las Elecciones con las Máquinas sorteadas el día del Proceso Electoral<br class=\"uk-hidden-small\">\n18.Marcas transmitidas de incidencias de huellas.<br class=\"uk-hidden-small\">\n19.Auditoría de Huellas posterior a las Elecciones, revisando posibles usurpaciones de identidad    </div>\n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Código de Autenticación de Contenido</h3><br class=\"uk-hidden-small\">\nCuando se realiza la Auditoria de Software de Maquinas de Votación, después, de que los programas se revisan, se van marcando con un Código de Autenticación de Contenido para poder conocer si se cambian estos programas después de haber sido revisados. Si al programa se le agrega un simple espacio, el código de autenticación cambia.<br class=\"uk-hidden-small\">\nEl Código de Autenticación de Contenido se denomina técnicamente como HASH. Existen diferentes algoritmos confiables para producir dichos códigos (MD5, SHA256, SHA512, etc.)\n </div>\n    \n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n<h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Cadena de Confianza en las auditorías y garantías electorales</h3>\nHasta el año 2015, cuando se realizaron las Elecciones de la Asamblea Nacional se efectuaron diecinueve diferentes auditorias, la mayoría de ellas son realizadas siguiendo un orden necesario para ir generando la cadena de confianza.\n<br class=\"uk-hidden-small\">\nEjemplos de lo indicado: </div>    \n</article>   \n</div>', '{\"title\":true,\"markdown\":false}'),
(2, 'Sobre Mi', '<div class=\"uk-card uk-card-default uk-width-1-2@m\">\n    <div class=\"uk-card-header\">\n        <div class=\"uk-grid-small uk-flex-middle\" uk-grid>\n            <div class=\"uk-width-auto\">\n                <img class=\"uk-border-circle\" width=\"100\" height=\"100\" src=\"storage/ing.png\">\n            </div>\n            <div class=\"uk-width-expand\">\n                <h3 class=\"uk-card-title uk-margin-remove-bottom\">Ingeniero Electricista</h3>\n              </div>\n        </div>\n    </div>\n    <div class=\"uk-card-body\">\n        <p> MSc. Investigación de Operaciones, Post. Ciencias de la Comp., Doctorante Estadística, Consultor de Procesos Electorales.</p>\n        <p>\n            Especialista en Auditorias Electorales, Marketing Digital\n        </p>\n    </div>\n    \n</div>\n\n\n', '{\"title\":true}'),
(3, 'Auditorías', '<div class=\"uk-width-medium-3-4 uk-container-center\">\n    \n<h3 class=\"uk-article-title uk-text-bold uk-text-center\">Auditorías y Garantías Electorales en Sistemas de Votación Automatizados<br class=\"uk-hidden-small\"></h3>\n<article class=\"uk-article\">\n<p class=\"uk-text-lead uk-text-justify\">En comicios automatizados es importante que se establezcan las auditorías y garantías electorales, ya que solo por el hecho de ser automatizadas implican procesos complejos difícil de entender por la mayoría, lo que ocasiona una cantidad de mitos no convenientes para la confianza del electorado.<br>\nEn este trabajo vamos a referirnos a los Procesos Electorales Automatizados usados en Venezuela desde el año 2004 hasta el presente.<br>\nEl Consejo Nacional Electoral de Venezuela adquirió el actual sistema de procesamiento electoral en el año 2003. Se incluyó como condición, la entrega del software para poder ser revisado y realizar auditorias por los distintos actores que concurran a los comicios. También solicito de que el sistema dejara las trazas necesarias para poder conocer después de una contienda electoral lo ocurrido.<br>\nLa transferencia de tecnología fue parte del acuerdo previo a la primera contratación en el año 2003.\nEstas acciones contribuyeron a lograr unas eficientes auditorias y garantías electorales que son siempre necesarias para tratar de acabar con los mitos de fraude ocasionado por el sistema automatizado y así estimular el voto en la población.\n</p>\n <div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Listado de Auditorías previstas en los Procesos Electorales<br class=\"uk-hidden-small\"></h3>  \n1. Software de Sorteo de Miembros de Mesa y Juntas Electorales y Presencia de Testigos en el Sorteo.<br class=\"uk-hidden-small\">\n2. Registro Electoral<br class=\"uk-hidden-small\">\n3. Software de Máquinas de Votación<br class=\"uk-hidden-small\">\n4. Configuración de Maquinas de Votación<br class=\"uk-hidden-small\">\n5. Datos de Maquinas de Votación (Biográficos y Biométricos)<br class=\"uk-hidden-small\">\n6. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n7. Producción de Máquinas de Votación y Sorteo de Maquinas a usar en Auditoría de Predespacho<br class=\"uk-hidden-small\">\n8. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n9. Tinta Indeleble (Eliminada en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n10.Cuadernos de Votación<br class=\"uk-hidden-small\">\n11.Software del Sistema de Totalización-<br class=\"uk-hidden-small\">\n12.Infraestructura del Consejo Nacional Electoral para los Procesos Electorales Automatizados<br class=\"uk-hidden-small\">\n13.Puesta a cero de todos los sistemas necesarios para efectuar las Elecciones<br class=\"uk-hidden-small\">\n14.Transmisión de datos electorales Fase I (Un día antes de las Elecciones)<br class=\"uk-hidden-small\">\n15.Sorteo de Centros y Mesas de Votación el día de las Elecciones a las 6:00 pm. Revisión previa del software a utilizar para el Sorteo. (serán utilizados para la Auditoría Ciudadana Fase II)<br class=\"uk-hidden-small\">\n16.Transmisión de datos electorales Fase II (Un día después de las Elecciones)<br class=\"uk-hidden-small\">\n17.Auditoría Ciudadana Fase II, posterior a las Elecciones con las Máquinas sorteadas el día del Proceso Electoral<br class=\"uk-hidden-small\">\n18.Marcas transmitidas de incidencias de huellas.<br class=\"uk-hidden-small\">\n19.Auditoría de Huellas posterior a las Elecciones, revisando posibles usurpaciones de identidad    </div>\n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Código de Autenticación de Contenido</h3><br class=\"uk-hidden-small\">\nCuando se realiza la Auditoria de Software de Maquinas de Votación, después, de que los programas se revisan, se van marcando con un Código de Autenticación de Contenido para poder conocer si se cambian estos programas después de haber sido revisados. Si al programa se le agrega un simple espacio, el código de autenticación cambia.<br class=\"uk-hidden-small\">\nEl Código de Autenticación de Contenido se denomina técnicamente como HASH. Existen diferentes algoritmos confiables para producir dichos códigos (MD5, SHA256, SHA512, etc.)\n </div>\n    \n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n<h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Cadena de Confianza en las auditorías y garantías electorales</h3>\nHasta el año 2015, cuando se realizaron las Elecciones de la Asamblea Nacional se efectuaron diecinueve diferentes auditorias, la mayoría de ellas son realizadas siguiendo un orden necesario para ir generando la cadena de confianza.\n<br class=\"uk-hidden-small\">\nEjemplos de lo indicado: </div>    \n</article>   \n</div>', '{\"title\":true}'),
(4, 'Auditorías', '<div class=\"uk-width-medium-3-4 uk-container-center\">\n    \n<h3 class=\"uk-article-title uk-text-bold uk-text-center\">Auditorías y Garantías Electorales en Sistemas de Votación Automatizados<br class=\"uk-hidden-small\"></h3>\n<article class=\"uk-article\">\n<p class=\"uk-text-lead uk-text-justify\">En comicios automatizados es importante que se establezcan las auditorías y garantías electorales, ya que solo por el hecho de ser automatizadas implican procesos complejos difícil de entender por la mayoría, lo que ocasiona una cantidad de mitos no convenientes para la confianza del electorado.<br>\nEn este trabajo vamos a referirnos a los Procesos Electorales Automatizados usados en Venezuela desde el año 2004 hasta el presente.<br>\nEl Consejo Nacional Electoral de Venezuela adquirió el actual sistema de procesamiento electoral en el año 2003. Se incluyó como condición, la entrega del software para poder ser revisado y realizar auditorias por los distintos actores que concurran a los comicios. También solicito de que el sistema dejara las trazas necesarias para poder conocer después de una contienda electoral lo ocurrido.<br>\nLa transferencia de tecnología fue parte del acuerdo previo a la primera contratación en el año 2003.\nEstas acciones contribuyeron a lograr unas eficientes auditorias y garantías electorales que son siempre necesarias para tratar de acabar con los mitos de fraude ocasionado por el sistema automatizado y así estimular el voto en la población.\n</p>\n <div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Listado de Auditorías previstas en los Procesos Electorales<br class=\"uk-hidden-small\"></h3>  \n1. Software de Sorteo de Miembros de Mesa y Juntas Electorales y Presencia de Testigos en el Sorteo.<br class=\"uk-hidden-small\">\n2. Registro Electoral<br class=\"uk-hidden-small\">\n3. Software de Máquinas de Votación<br class=\"uk-hidden-small\">\n4. Configuración de Maquinas de Votación<br class=\"uk-hidden-small\">\n5. Datos de Maquinas de Votación (Biográficos y Biométricos)<br class=\"uk-hidden-small\">\n6. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n7. Producción de Máquinas de Votación y Sorteo de Maquinas a usar en Auditoría de Predespacho<br class=\"uk-hidden-small\">\n8. Software de Máquinas del Sistema de Información al Elector (Eliminado en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n9. Tinta Indeleble (Eliminada en las Elecciones del 15 de Octubre)<br class=\"uk-hidden-small\">\n10.Cuadernos de Votación<br class=\"uk-hidden-small\">\n11.Software del Sistema de Totalización-<br class=\"uk-hidden-small\">\n12.Infraestructura del Consejo Nacional Electoral para los Procesos Electorales Automatizados<br class=\"uk-hidden-small\">\n13.Puesta a cero de todos los sistemas necesarios para efectuar las Elecciones<br class=\"uk-hidden-small\">\n14.Transmisión de datos electorales Fase I (Un día antes de las Elecciones)<br class=\"uk-hidden-small\">\n15.Sorteo de Centros y Mesas de Votación el día de las Elecciones a las 6:00 pm. Revisión previa del software a utilizar para el Sorteo. (serán utilizados para la Auditoría Ciudadana Fase II)<br class=\"uk-hidden-small\">\n16.Transmisión de datos electorales Fase II (Un día después de las Elecciones)<br class=\"uk-hidden-small\">\n17.Auditoría Ciudadana Fase II, posterior a las Elecciones con las Máquinas sorteadas el día del Proceso Electoral<br class=\"uk-hidden-small\">\n18.Marcas transmitidas de incidencias de huellas.<br class=\"uk-hidden-small\">\n19.Auditoría de Huellas posterior a las Elecciones, revisando posibles usurpaciones de identidad    </div>\n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n    <h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Código de Autenticación de Contenido</h3><br class=\"uk-hidden-small\">\nCuando se realiza la Auditoria de Software de Maquinas de Votación, después, de que los programas se revisan, se van marcando con un Código de Autenticación de Contenido para poder conocer si se cambian estos programas después de haber sido revisados. Si al programa se le agrega un simple espacio, el código de autenticación cambia.<br class=\"uk-hidden-small\">\nEl Código de Autenticación de Contenido se denomina técnicamente como HASH. Existen diferentes algoritmos confiables para producir dichos códigos (MD5, SHA256, SHA512, etc.)\n </div>\n    \n<br class=\"uk-hidden-small\">    \n<div class=\"uk-panel uk-text-break uk-text-justify\">\n<h3 class=\"uk-h1 uk-margin-large-bottom uk-text-bold uk-text-center\">Cadena de Confianza en las auditorías y garantías electorales</h3>\nHasta el año 2015, cuando se realizaron las Elecciones de la Asamblea Nacional se efectuaron diecinueve diferentes auditorias, la mayoría de ellas son realizadas siguiendo un orden necesario para ir generando la cadena de confianza.\n<br class=\"uk-hidden-small\">\nEjemplos de lo indicado: </div>    \n</article>   \n</div>', '{\"title\":true}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_role`
--

CREATE TABLE `pk_system_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_role`
--

INSERT INTO `pk_system_role` (`id`, `name`, `priority`, `permissions`) VALUES
(1, 'Anonymous', 0, NULL),
(2, 'Authenticated', 1, 'blog: post comments'),
(3, 'Administrator', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_session`
--

CREATE TABLE `pk_system_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_session`
--

INSERT INTO `pk_system_session` (`id`, `time`, `data`) VALUES
('6phk0cckvg3j9s6ah2e7maj843', '2018-06-24 03:23:22', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNDUxODU1NDhjN2ExMjhiM2MzZjE5YTAyOTJhNDhiMzgwODI2ZmU4MSI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE1Mjk4MTA2MDE7czoxOiJjIjtpOjE1Mjk4MDEwMTc7czoxOiJsIjtzOjE6IjAiO30=');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_user`
--

CREATE TABLE `pk_system_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `registered` datetime NOT NULL,
  `login` datetime DEFAULT NULL,
  `activation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_user`
--

INSERT INTO `pk_system_user` (`id`, `name`, `username`, `email`, `password`, `url`, `status`, `registered`, `login`, `activation`, `roles`, `data`) VALUES
(1, 'administrador', 'administrador', 'yoe318@gmail.com', '$2y$10$fitu6M9lTaLclpsTiM5e4eggXYbNavmjohr4g3cpwQBHbRMwogxvy', '', 1, '2018-06-24 00:43:27', '2018-06-24 02:33:55', NULL, '2,3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pk_system_widget`
--

CREATE TABLE `pk_system_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pk_system_widget`
--

INSERT INTO `pk_system_widget` (`id`, `title`, `type`, `status`, `nodes`, `roles`, `data`) VALUES
(1, 'Inicio', 'system/text', 1, '1', NULL, '{\"content\":\"\\n\\n\"}'),
(2, 'Powered by Pagekit', 'system/text', 1, NULL, NULL, '{\"content\":\"<ul class=\\\"uk-grid uk-grid-medium uk-flex uk-flex-center\\\">\\n \\u00a0 \\u00a0<li><a href=\\\"https:\\/\\/github.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-github\\\"><\\/a><\\/li>\\n \\u00a0 \\u00a0<li><a href=\\\"https:\\/\\/twitter.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-twitter\\\"><\\/a><\\/li>\\n \\u00a0 \\u00a0<li><a href=\\\"https:\\/\\/gitter.im\\/pagekit\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-comment-o\\\"><\\/a><\\/li>\\n \\u00a0 \\u00a0<li><a href=\\\"https:\\/\\/plus.google.com\\/communities\\/104125443335488004107\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-google-plus\\\"><\\/a><\\/li>\\n<\\/ul>\\n\\n\"}'),
(3, 'Sobre Mí', 'system/text', 1, NULL, NULL, '{\"content\":\"<div class=\\\"uk-card uk-card-default uk-width-1-2@m\\\">\\n    <div class=\\\"uk-card-header\\\">\\n        <div class=\\\"uk-grid-small uk-flex-middle\\\" uk-grid>\\n            <div class=\\\"uk-width-auto\\\">\\n                <img class=\\\"uk-border-circle\\\" width=\\\"100\\\" height=\\\"100\\\" src=\\\"storage\\/ing.png\\\">\\n            <\\/div>\\n            <div class=\\\"uk-width-expand\\\">\\n                <h3 class=\\\"uk-card-title uk-margin-remove-bottom\\\"><\\/h3>\\n              <\\/div>\\n        <\\/div>\\n    <\\/div>\\n    <div class=\\\"uk-card-body\\\">\\n        <p> Ingeniero Electricista, MSc. Investigaci\\u00f3n de Operaciones, Post. Ciencias de la Comp., Doctorante Estad\\u00edstica, Consultor de Procesos Electorales.<\\/p>\\n    <\\/div>\\n    <div class=\\\"uk-card-footer\\\">\\n        <a href=\\\"#\\\" class=\\\"uk-button uk-button-text\\\">Read more<\\/a>\\n    <\\/div>\\n<\\/div>\\n\"}'),
(6, 'Acceso', 'system/login', 1, NULL, NULL, '[]');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_BLOG_COMMENT_AUTHOR` (`author`),
  ADD KEY `pk_BLOG_COMMENT_CREATED` (`created`),
  ADD KEY `pk_BLOG_COMMENT_STATUS` (`status`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID` (`post_id`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID_STATUS` (`post_id`,`status`);

--
-- Indices de la tabla `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_BLOG_POST_SLUG` (`slug`),
  ADD KEY `pk_BLOG_POST_TITLE` (`title`),
  ADD KEY `pk_BLOG_POST_USER_ID` (`user_id`),
  ADD KEY `pk_BLOG_POST_DATE` (`date`);

--
-- Indices de la tabla `pk_system_auth`
--
ALTER TABLE `pk_system_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pk_system_config`
--
ALTER TABLE `pk_system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_CONFIG_NAME` (`name`);

--
-- Indices de la tabla `pk_system_node`
--
ALTER TABLE `pk_system_node`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pk_system_page`
--
ALTER TABLE `pk_system_page`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pk_system_role`
--
ALTER TABLE `pk_system_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_ROLE_NAME` (`name`),
  ADD KEY `pk_SYSTEM_ROLE_NAME_PRIORITY` (`name`,`priority`);

--
-- Indices de la tabla `pk_system_session`
--
ALTER TABLE `pk_system_session`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pk_system_user`
--
ALTER TABLE `pk_system_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_USERNAME` (`username`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_EMAIL` (`email`);

--
-- Indices de la tabla `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pk_system_config`
--
ALTER TABLE `pk_system_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pk_system_node`
--
ALTER TABLE `pk_system_node`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pk_system_page`
--
ALTER TABLE `pk_system_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pk_system_role`
--
ALTER TABLE `pk_system_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pk_system_user`
--
ALTER TABLE `pk_system_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
