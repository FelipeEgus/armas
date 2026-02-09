-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2025 a las 17:06:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `armas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armaeditadas`
--

CREATE TABLE `armaeditadas` (
  `id` int(11) NOT NULL,
  `arma` text NOT NULL,
  `fk_tipo` int(11) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `id_original` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `armaeditadas`
--

INSERT INTO `armaeditadas` (`id`, `arma`, `fk_tipo`, `fk_pais`, `imagen`, `id_original`) VALUES
(52, 'luristann ', 2, 48, 'imgArmas/luristan.jpg', 688);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
  `id` int(11) NOT NULL,
  `arma` varchar(250) NOT NULL,
  `fk_pais` int(11) DEFAULT NULL,
  `fk_tipo` int(11) DEFAULT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `armas`
--

INSERT INTO `armas` (`id`, `arma`, `fk_pais`, `fk_tipo`, `imagen`) VALUES
(4, 'karambit', 3, 27, 'imgArmas/karambit.jpg'),
(5, 'Selepe', 4, 2, 'imgArmas/zulu.jpg'),
(10, 'urumi', 7, 1, 'imgArmas/urumi.jpg'),
(12, 'kama', 3, 7, 'imgArmas/Kama.jpg'),
(13, 'pattah', 20, 22, 'imgArmas/pattah.jpg'),
(17, 'Sheng biao', 1, 29, 'imgArmas/rope and dart.jpg'),
(18, 'ahlspiess', 29, 19, 'imgArmas/ahlspiess.jpg'),
(20, 'chuzo', 5, 12, 'imgArmas/chuzo.png'),
(21, 'poleaxe', 21, 2, 'imgArmas/polaxe.jpg'),
(22, 'lajatang', 1, 19, 'imgArmas/lajatang.png'),
(23, 'arbalesta', 21, 31, 'imgArmas/arbalesta.jpg'),
(24, 'ifugao ', 14, 16, 'imgArmas/ifugao.jpg'),
(25, 'gada', 20, 5, 'imgArmas/gada.jpg'),
(26, 'kaginawa', 2, 33, 'imgArmas/kaginawa.jpg'),
(27, 'Ōdachi', 2, 22, 'imgArmas/ōdachi.jpg'),
(28, 'gun chai', 1, 1, 'imgArmas/gun chai.jpg'),
(29, 'Kuwa ', 2, 35, 'imgArmas/kuwa.jpg'),
(30, 'katakana yari', 2, 12, 'imgArmas/katakana yari.jpg'),
(31, 'garrote', 15, 5, 'imgArmas/garrote.png'),
(32, 'estoque', 21, 1, 'imgArmas/estoque.jpg'),
(33, 'xiphos ', 8, 1, 'imgArmas/xiphos.jpg'),
(34, 'facon', 12, 27, 'imgArmas/facon.jpg'),
(35, 'Kodachi', 2, 22, 'imgArmas/Kodachi.jpg'),
(36, 'estaca', 16, 23, 'imgArmas/estaca.jpg'),
(37, 'roncona', 21, 12, 'imgArmas/roncona.png'),
(38, 'guandao', 1, 19, 'imgArmas/guandao.jpg'),
(39, 'spetum', 21, 12, 'imgArmas/spetum.png'),
(40, 'voulge', 25, 19, 'imgArmas/voulge.jpg'),
(41, 'quauhololli', 26, 5, 'imgArmas/quauhololli.jpg'),
(42, 'adya katti ', 3, 24, 'imgArmas/adya katti.jpg'),
(43, 'Hacha de talón', 17, 2, 'imgArmas/Hacha de talón.jpg'),
(44, 'chimalli', 26, 18, 'imgArmas/chimalli.jpg'),
(46, 'falcata', 8, 24, 'imgArmas/falcata.jpg'),
(47, 'eku ', 3, 9, 'imgArmas/eku.png'),
(48, 'palanca ', 14, 9, 'imgArmas/palanca.png'),
(49, 'guante de box', 14, 17, 'imgArmas/guante de box.jpg'),
(50, 'Gē', 3, 19, 'imgArmas/Gē.jpg'),
(51, 'gladius', 9, 1, 'imgArmas/gladius.jpg'),
(52, 'bagh nakh', 7, 14, 'imgArmas/bagh nakh.jpg'),
(53, 'rochin ', 2, 12, 'imgArmas/rochin.jpg'),
(55, 'mazo', 14, 6, 'imgArmas/mazo.jpg'),
(56, 'machete', 14, 24, 'imgArmas/machete.jpg'),
(57, 'sang kauw', 3, 1, 'imgArmas/sang kauw.jpg'),
(58, 'ivory pickaxe', 20, 28, 'imgArmas/ivory pickaxe.jpg'),
(59, 'dadao', 1, 22, 'imgArmas/Dadao.jpg'),
(60, 'seax', 23, 27, 'imgArmas/seax.jpg'),
(61, 'hacha de guerra', 14, 2, 'imgArmas/hacha de guerra.jpg'),
(62, 'espuelas', 12, 14, 'imgArmas/espuelas.png'),
(63, 'tanto', 2, 27, 'imgArmas/tanto.jpg'),
(64, 'byuh', 27, 17, 'imgArmas/byuh.jpg'),
(66, 'boleadora', 12, 33, 'imgArmas/boleadora.png'),
(67, 'macana', 31, 5, 'imgArmas/macana.jpg'),
(68, 'zweihander', 21, 1, 'imgArmas/zweihander.png'),
(73, 'panabas', 34, 24, 'imgArmas/panabas.jpg'),
(74, 'cuma sickle', 2, 7, 'imgArmas/cuma sickle.jpg'),
(75, 'tapanga', 4, 24, 'imgArmas/tapanga.jpg'),
(76, 'alabarda', 21, 19, 'imgArmas/alabarda.png'),
(77, 'glaive', 21, 19, 'imgArmas/glaive.jpg'),
(78, 'tachi', 2, 22, 'imgArmas/tachi.jpg'),
(79, 'naginata', 2, 19, 'imgArmas/naginata.jpg'),
(80, 'koa sledge', 27, 2, 'imgArmas/koa sledge.jpg'),
(81, 'horseman\'s pick', 21, 6, 'imgArmas/horseman\'s pick.jpg'),
(82, 'musele', 4, 33, 'imgArmas/musele.jpg'),
(83, 'czekan', 14, 6, 'imgArmas/czekan.jpg'),
(84, 'bate', 14, 5, 'imgArmas/bate.jpg'),
(90, 'boar spear', 21, 12, 'imgArmas/boar spear.jpg'),
(91, 'lucerne hammer', 21, 6, 'imgArmas/lucerne hammer.jpg'),
(92, 'zika', 8, 1, 'imgArmas/zika.jpg'),
(93, 'cerbatana', 16, 32, 'imgArmas/cerbatana.jpg'),
(94, 'talwar', 7, 22, 'imgArmas/talwar.jpg'),
(95, 'shotel ', 32, 1, 'imgArmas/Shotel.jpg'),
(96, 'red', 14, 32, 'imgArmas/red.jpg'),
(98, 'natar', 14, 24, 'imgArmas/natar.jpg'),
(99, 'monk`s spade', 1, 19, 'imgArmas/monk\'s spade.jpg'),
(100, 'tonfa', 1, 9, 'imgArmas/tonfa.jpg'),
(101, 'golok', 22, 24, 'imgArmas/golok.jpg'),
(102, 'guja', 21, 19, 'imgArmas/guja.png'),
(103, 'tekkan ', 2, 22, 'imgArmas/tekkan.jpg'),
(104, 'pudao', 1, 19, 'imgArmas/pudao.jpg'),
(105, 'alfajor', 12, 27, 'imgArmas/alfajor.jpg'),
(106, 'porra', 15, 9, 'imgArmas/porra.jpg'),
(107, 'guisarme', 21, 19, 'imgArmas/guisarme.png'),
(108, 'clava ', 16, 5, 'imgArmas/clava.png'),
(109, 'twin dao', 1, 1, 'imgArmas/twin dao.jpg'),
(110, 'kora', 3, 1, 'imgArmas/kora.jpg'),
(111, 'spit ', 14, 1, 'imgArmas/spit.png'),
(112, 'dardo', 14, 33, 'imgArmas/dardo.jpg'),
(113, 'nunti bo', 2, 12, 'imgArmas/nunti bo.jpg'),
(114, 'Wakizashi ', 2, 22, 'imgArmas/Wakizashi.jpg'),
(115, 'Suburitō', 2, 9, 'imgArmas/Suburitō.png'),
(116, 'Qiang Spear', 1, 12, 'imgArmas/Qiang Spear.jpg'),
(117, 'pakal ', 34, 27, 'imgArmas/pakal.jpg'),
(118, 'fikes ', 14, 1, 'imgArmas/fikes.jpg'),
(119, 'Shikomizue ', 2, 1, 'imgArmas/Shikomizue.jpg'),
(120, 'Siangham', 1, 16, 'imgArmas/Siangham.jpg'),
(121, 'starknife', 14, 14, 'imgArmas/starknife.jpg'),
(122, 'hu die dao', 1, 27, 'imgArmas/hu die dao.jpg'),
(123, 'kakute', 2, 23, 'imgArmas/kakute.jpg'),
(124, 'ulu', 35, 14, 'imgArmas/ulu.jpg'),
(125, 'zombie cleaver', 14, 24, 'imgArmas/zombie cleaver.jpg'),
(126, 'fauchard', 21, 19, 'imgArmas/fauchard.jpg'),
(127, 'ono ', 2, 2, 'imgArmas/Ono.png'),
(128, 'kubotan', 2, 17, 'imgArmas/kubotan.jpg'),
(131, 'sable', 20, 22, 'imgArmas/sable.jpg'),
(132, 'nagamaki', 2, 22, 'imgArmas/nagamaki.jpg'),
(133, 'corseque', 21, 12, 'imgArmas/corseque.jpg'),
(134, 'Partesana', 21, 12, 'imgArmas/Partesana.jpg'),
(135, 'falx', 21, 24, 'imgArmas/falx.jpg'),
(136, 'cestus ', 8, 17, 'imgArmas/cestus.jpg'),
(137, 'tekkokagi', 2, 14, 'imgArmas/tekkokagi.jpg'),
(138, 'Gumía', 7, 27, 'imgArmas/Gumía.JPG'),
(139, 'kyoketsu shoge', 2, 16, 'imgArmas/kyoketsu shoge.jpg'),
(140, 'Maza', 16, 5, 'imgArmas/Maza.jpg'),
(141, 'aspis ', 8, 18, 'imgArmas/aspis.jpg'),
(142, 'escudo normando', 46, 18, 'imgArmas/escudo normando.jpg'),
(143, 'shuang yue ', 1, 14, 'imgArmas/shuang yue.jpg'),
(144, 'kusarigama', 2, 7, 'imgArmas/kusarigama.jpg'),
(146, 'chu-ko-nu', 1, 31, 'imgArmas/chu-ko-nu.jpg'),
(147, 'ballesta', 21, 31, 'imgArmas/ballesta.jpg'),
(148, 'kusari fundo', 2, 5, 'imgArmas/kusari fundo.jpg'),
(149, 'wahaika', 19, 5, 'imgArmas/wahaika.jpg'),
(150, 'broquel ', 21, 18, 'imgArmas/broquel.jpg'),
(151, 'navaja mariposa', 4, 16, 'imgArmas/navaja mariposa.jpg'),
(152, 'garfio', 14, 23, 'imgArmas/garfio.jpg'),
(153, 'tijera', 15, 14, 'imgArmas/tijera.jpg'),
(154, 'kpinga', 4, 33, 'imgArmas/kpinga.jpg'),
(155, 'lanza', 16, 12, 'imgArmas/lanza.jpg'),
(156, 'tekagi ', 20, 14, 'imgArmas/tekagi.jpg'),
(157, 'military fork', 21, 12, 'imgArmas/military fork.png'),
(158, 'tomahawk', 37, 2, 'imgArmas/tomahawk.jpg'),
(159, 'hacha danesa', 23, 2, 'imgArmas/hacha danesa.jpg'),
(160, 'hacha', 16, 2, 'imgArmas/hacha.jpg'),
(161, 'gunstock club', 31, 5, 'imgArmas/gunstock club.jpg'),
(162, 'khopesh ', 17, 24, 'imgArmas/khopesh.jpg'),
(163, 'nyepel ', 4, 17, 'imgArmas/nyepel.jpg'),
(164, 'tewhatewha', 19, 5, 'imgArmas/tewhatewha.jpg'),
(165, 'dao', 1, 22, 'imgArmas/dao.jpg'),
(166, 'temple shredder', 19, 5, 'imgArmas/temple shredder.jpg'),
(167, 'ji', 1, 12, 'imgArmas/ji.jpg'),
(168, 'trumbash ', 4, 7, 'imgArmas/trumbash.jpg'),
(169, 'Goedendag', 21, 12, 'imgArmas/Goedendag.jpg'),
(170, 'kunai', 2, 16, 'imgArmas/kunai.jpg'),
(171, 'honda', 16, 32, 'imgArmas/honda.jpeg'),
(172, 'Cuchillo de trinchera', 21, 16, 'imgArmas/Cuchillo de trinchera.jpg'),
(173, 'monkey fist', 14, 17, 'imgArmas/monkey fist.jpeg'),
(174, 'war sickle', 7, 7, 'imgArmas/war sickle.png'),
(175, 'trickbars', 14, 14, 'imgArmas/trickbars.jpg'),
(176, 'navaja', 15, 27, 'imgArmas/navaja.jpg'),
(177, 'koa spear', 27, 12, 'imgArmas/koa spear.jpg'),
(178, 'Tsurugi', 2, 1, 'imgArmas/Tsurugi.jpg'),
(179, 'martillo de guerra', 14, 6, 'imgArmas/martillo de guerra.jpg'),
(180, 'cierra', 15, 14, 'imgArmas/cierra.jpg'),
(181, 'mambele', 4, 33, 'imgArmas/mambele.jpg'),
(182, 'bardiche', 21, 2, 'imgArmas/bardiche.jpg'),
(183, 'otsuchi', 3, 6, 'imgArmas/otsuchi.jpg'),
(184, 'Sali ', 27, 5, 'imgArmas/Sali.jpg'),
(185, 'flecha', 16, 32, 'imgArmas/flecha.jpg'),
(186, 'lanza de justa/roquete', 8, 12, 'imgArmas/lanza de justa.jpg'),
(187, 'tlaximaltepoztli', 26, 2, 'imgArmas/tlaximaltepoztli.png'),
(188, 'Totokoa war club', 27, 5, 'imgArmas/Totokoa war club.jpg'),
(189, 'chakram', 7, 33, 'imgArmas/chakram.jpg'),
(190, 'kukri ', 36, 24, 'imgArmas/kukri.jpeg'),
(192, 'Liu xing chui', 1, 5, 'imgArmas/Liu xing chui.jpg'),
(193, 'mayal ', 3, 9, 'imgArmas/mayal.jpg'),
(194, 'pilum', 8, 12, 'imgArmas/pilum.jpg'),
(195, 'punzon', 14, 23, 'imgArmas/punzon.jpg'),
(196, 'tepoztopilli', 26, 12, 'imgArmas/tepoztopilli.jpg'),
(197, 'zaghnal', 20, 7, 'imgArmas/zaghnal.jpg'),
(198, 'man catcher', 3, 12, 'imgArmas/man catcher.jpg'),
(199, 'lei o mano', 27, 16, 'imgArmas/lei o mano.jpg'),
(200, 'hasta', 21, 12, 'imgArmas/hasta.png'),
(201, 'tekkō ', 2, 17, 'imgArmas/tekkō.jpg'),
(202, 'tessen', 2, 17, 'imgArmas/tessen.jpg'),
(203, 'Pugio', 8, 16, 'imgArmas/Pugio.jpg'),
(204, 'cuchillo', 15, 27, 'imgArmas/cuchillo.jpg'),
(205, 'guadaña', 15, 7, 'imgArmas/guadaña.jpg'),
(206, 'caronero', 12, 16, 'imgArmas/caronero.jpg'),
(207, 'brandistock', 21, 12, 'imgArmas/brandistock.png'),
(208, 'nifo oti', 19, 2, 'imgArmas/nifo oti.jpg'),
(209, 'bat\'leth', 14, 14, 'imgArmas/bat\'leth.jpg'),
(210, 'katana', 2, 22, 'imgArmas/katana.jpg'),
(211, 'kris ', 22, 16, 'imgArmas/kris.jpg'),
(212, 'mere pounamu', 19, 5, 'imgArmas/mere pounamu.jpg'),
(213, 'Suntetsu', 2, 17, 'imgArmas/Suntetsu.jpg'),
(214, 'bill hook', 21, 19, 'imgArmas/bill hook.jpg'),
(215, 'sansetsukon ', 1, 9, 'imgArmas/sansetsukon.png'),
(216, 'dolch', 14, 16, 'imgArmas/dolch.jpg'),
(217, 'shinai ', 2, 9, 'imgArmas/shinai.jpg'),
(218, 'mangual', 21, 5, 'imgArmas/mangual.jpg'),
(219, 'bo shuriken', 2, 33, 'imgArmas/bo shuriken.jpg'),
(220, 'Targe ', 38, 18, 'imgArmas/Targe.jpg'),
(222, 'earspoon', 21, 12, 'imgArmas/earspoon.png'),
(223, 'rhomphaia', 33, 24, 'imgArmas/rhomphaia.jpg'),
(224, 'bracamante', 5, 24, 'imgArmas/bracamante.jpg'),
(225, 'patta', 7, 1, 'imgArmas/patta.jpg'),
(226, 'arpon', 15, 12, 'imgArmas/arpon.png'),
(227, 'espada ropera', 5, 1, 'imgArmas/ropera.jpg'),
(228, 'chan zi dao', 1, 1, 'imgArmas/chan zi dao.jpg'),
(229, 'labrys', 17, 2, 'imgArmas/labrys.jpg'),
(231, 'Yari', 2, 12, 'imgArmas/Yari.jpg'),
(232, 'krull glaive', 14, 27, 'imgArmas/krull glaive.jpg'),
(233, 'jambia', 7, 16, 'imgArmas/jambia.jpg'),
(234, 'tridente', 9, 12, 'imgArmas/tridente.jpg'),
(235, 'macuahuitl ', 26, 1, 'imgArmas/macuahuitl.jpg'),
(236, 'puño americano', 14, 17, 'imgArmas/puño americano.jpg'),
(237, 'alfanje', 7, 24, 'imgArmas/Alfanje.png'),
(238, 'bhuj', 7, 2, 'imgArmas/bhuj.jpg'),
(239, 'feng huo lun', 1, 14, 'imgArmas/feng huo lun.jpg'),
(240, 'javalina', 8, 12, 'imgArmas/javalina.jpg'),
(241, 'Koa Knuckle Duster', 27, 17, 'imgArmas/Koa Knuckle Duster.jpg'),
(242, 'resortera', 14, 32, 'imgArmas/resortera.jpg'),
(243, 'cimitarra', 20, 22, 'imgArmas/cimitarra.jpg'),
(244, 'trishul', 20, 12, 'imgArmas/trishul.jpg'),
(245, 'boomerang', 15, 33, 'imgArmas/boomerang.jpg'),
(246, 'baton ', 14, 17, 'imgArmas/baton.jpg'),
(247, 'kanabo', 3, 5, 'imgArmas/kanabo.jpg'),
(248, 'cuchillo balistico', 14, 16, 'imgArmas/cuchillo balistico.jpg'),
(250, 'Ngulu', 4, 24, 'imgArmas/Ngulu.jpg'),
(251, 'florete ', 5, 1, 'imgArmas/florete.jpg'),
(252, 'puñal', 17, 16, 'imgArmas/puñal.jpg'),
(253, 'espoton', 21, 12, 'imgArmas/espoton.jpg'),
(254, 'Sai ', 2, 17, 'imgArmas/Sai.jpg'),
(255, 'jən\'nyi', 4, 7, 'imgArmas/jən\'nyi.jpg'),
(256, 'virote ', 14, 32, 'imgArmas/virote.jpg'),
(257, 'arco', 16, 30, 'imgArmas/arco.jpg'),
(258, 'Jumonji yari', 2, 12, 'imgArmas/Jumonji yari.jpeg'),
(259, 'tetsubishi', 2, 23, 'imgArmas/tetsubishi.png'),
(260, 'cula cula', 27, 5, 'imgArmas/cula cula.jpg'),
(261, 'Almarada', 20, 16, 'imgArmas/Almarada.jpg'),
(262, 'hu-cha', 1, 12, 'imgArmas/hu-cha.jpg'),
(263, 'sankaku yari', 2, 12, 'imgArmas/sankaku yari.jpg'),
(264, 'bō ', 2, 9, 'imgArmas/bō.jpg'),
(265, 'dealer axe', 14, 2, 'imgArmas/dealer axe.jpg'),
(266, 'pavés ', 14, 18, 'imgArmas/pavés.png'),
(267, 'swordstaff', 21, 19, 'imgArmas/swordstaff.png'),
(268, 'Adarga', 20, 18, 'imgArmas/Adarga.jpg'),
(269, 'sibat', 34, 12, 'imgArmas/sibat.jpg'),
(270, 'hoz', 15, 7, 'imgArmas/hoz.jpg'),
(271, 'sovnya', 18, 19, 'imgArmas/sovnya.jpg'),
(273, 'Yumi', 2, 30, 'imgArmas/Yumi.jpg'),
(274, 'antler mattock', 16, 28, 'imgArmas/antler mattock.jpg'),
(275, 'atlatl', 26, 32, 'imgArmas/atlatl.jpg'),
(276, 'ankusha ', 20, 12, 'imgArmas/ankusha.jpg'),
(277, 'chigiriki', 2, 5, 'imgArmas/chigiriki.jpg'),
(278, 'Kudayari', 2, 12, 'imgArmas/kudayari.jpg'),
(279, 'daga', 15, 16, 'imgArmas/daga.jpg'),
(280, 'shuriken', 2, 33, 'imgArmas/shuriken.jpg'),
(281, 'bokken', 2, 9, 'imgArmas/bokken.jpg'),
(282, 'rodela ', 21, 18, 'imgArmas/rodela.jpg'),
(283, 'cane knife', 15, 24, 'imgArmas/cane knife.jpg'),
(284, 'ashiko ninja', 2, 23, 'imgArmas/ashiko ninja.jpg'),
(285, 'haladie', 7, 16, 'imgArmas/haladie.jpg'),
(286, 'ranseur', 21, 12, 'imgArmas/ranseur.png'),
(287, 'ram dao', 7, 24, 'imgArmas/ram dao.jpg'),
(294, 'kampilan', 34, 24, 'imgArmas/kampilan.jpg'),
(295, 'kachin dao', 2, 24, 'imgArmas/kachin dao.jpg'),
(296, 'flechas de fuego chinas', 1, 32, 'imgArmas/flechas de fuego chinas.jpg'),
(297, 'huo long chu shui', 1, 34, 'imgArmas/huo long chu shui.jpg'),
(298, 'Hwacha', 1, 34, 'imgArmas/Hwacha.jpg'),
(299, 'chong zhen huo hu lu', 1, 34, 'imgArmas/chong zhen huo hu lu.jpg'),
(300, 'se-chongtong', 39, 34, 'imgArmas/se-chongtong.jpg'),
(301, 'cañon de mano', 21, 34, 'imgArmas/cañon de mano.jpg'),
(302, 'Seung-ja Chongtong', 39, 34, 'imgArmas/Seung-ja Chongtong.jpg'),
(303, 'huo jian', 1, 32, 'imgArmas/huo jian.png'),
(304, 'huo qiang', 1, 12, 'imgArmas/huo qiang.jpg'),
(305, 'Tie Zui Shen Wei Chong', 1, 34, 'imgArmas/Tie Zui Shen Wei Chong.jpg'),
(306, 'li hua qiang', 1, 12, 'imgArmas/li hua qiang.png'),
(307, 'ba gua zhang ', 1, 14, 'imgArmas/ba gua zhang.jpg'),
(308, 'Bagua Broadsword', 1, 1, 'imgArmas/Bagua Broadsword.jpg'),
(309, 'Lin Jiao Dao', 1, 27, 'imgArmas/Lin Jiao Dao.jpg'),
(310, 'Qi Bing Pang Pai', 1, 18, 'imgArmas/Qi Bing Pang Pai.jpg'),
(311, 'Yan Wei Pai', 1, 18, 'imgArmas/Yan Wei Pai.jpg'),
(312, 'bu Bing Pang Pai', 1, 18, 'imgArmas/bu Bing Pang Pai.jpg'),
(313, 'Gou Rang', 1, 18, 'imgArmas/Gou Rang.jpg'),
(314, 'Shou Pai', 1, 18, 'imgArmas/Shou Pai.jpg'),
(315, 'rattan ', 1, 18, 'imgArmas/rattan.jpg'),
(316, 'madu', 7, 18, 'imgArmas/madu.jpg'),
(317, 'shen xing po zhen meng huo dao pai ', 1, 18, 'imgArmas/shen xing po zhen meng huo dao pai.jpg'),
(318, 'Double arc shield', 1, 18, 'imgArmas/Double arc shield.jpg'),
(319, 'miao dao', 1, 22, 'imgArmas/miao dao.jpg'),
(320, 'bian', 1, 9, 'imgArmas/bian.jpg'),
(321, 'Damo Guai', 1, 6, 'imgArmas/Damo Guai.jpg'),
(322, 'Jiu Jie Bian', 1, 29, 'imgArmas/Jiu Jie Bian.jpg'),
(323, 'Razor Chain Whip', 14, 29, 'imgArmas/Razor Chain Whip.jpg'),
(324, 'Nandao ', 1, 24, 'imgArmas/Nandao.jpg'),
(325, 'Lang Ya Bang', 1, 5, 'imgArmas/Lang Ya Bang.jpg'),
(326, 'Melon Hammers', 1, 5, 'imgArmas/Melon Hammers.jpg'),
(327, 'Fei Cha', 1, 12, 'imgArmas/Fei Cha.jpeg'),
(328, 'Fei Tou', 1, 29, 'imgArmas/Fei Tou.jpg'),
(329, 'fu chen', 1, 29, 'imgArmas/fu chen.jpg'),
(330, 'Monk Staff', 3, 5, 'imgArmas/Monk Staff.jpg'),
(331, 'Fangtian Ji', 1, 12, 'imgArmas/Fangtian Ji.jpg'),
(332, 'khakkhara', 1, 9, 'imgArmas/khakkhara.jpg'),
(333, 'qinglong ji ', 1, 12, 'imgArmas/qinglong ji.jpg'),
(334, 'Shuang Bi Shou', 1, 16, 'imgArmas/Shuang Bi Shou.jpg'),
(335, 'Li Pai', 1, 18, 'imgArmas/Li Pai.jpg'),
(336, 'zhua', 1, 29, 'imgArmas/zhua.jpg'),
(337, 'saihai', 2, 29, 'imgArmas/saihai.jpg'),
(338, 'cat whip', 21, 29, 'imgArmas/cat whip.jpg'),
(339, 'latigo', 14, 29, 'imgArmas/latigo.jpg'),
(340, 'rebenque', 12, 29, 'imgArmas/revenque.jpg'),
(341, 'Manriki-gusari', 2, 5, 'imgArmas/Manriki-gusari.jpg'),
(342, 'surujin', 2, 5, 'imgArmas/surujin.jpg'),
(343, 'zanjir', 20, 29, 'imgArmas/zanjir.jpg'),
(344, 'Flagrum', 9, 29, 'imgArmas/Flagrum.jpg'),
(345, 'Martinete ', 25, 29, 'imgArmas/Martinete.jpg'),
(347, 'claymore ', 38, 1, 'imgArmas/claymore.jpg'),
(348, 'Beidhänder-Schwert', 29, 1, 'imgArmas/Beidhänder-Schwert.jpg'),
(349, 'Jian', 1, 1, 'imgArmas/Jian.jpg'),
(350, 'montante ', 5, 1, 'imgArmas/montante.jpg'),
(351, 'mandoble', 21, 1, 'imgArmas/mandoble.jpg'),
(352, 'flamberge', 21, 1, 'imgArmas/flamberge.jpg'),
(353, 'Espadón', 5, 1, 'imgArmas/Espadón.jpg'),
(354, 'Broadsword', 21, 1, 'imgArmas/Broadsword.jpg'),
(355, 'longsword', 21, 1, 'imgArmas/longsword.jpg'),
(356, 'Feder ', 21, 1, 'imgArmas/Feder.jpg'),
(357, 'Ingessana Murder', 20, 33, 'imgArmas/Ingessana Murder.jpg'),
(358, 'spatha', 9, 1, 'imgArmas/spatha.jpg'),
(360, 'Bumali ', 4, 1, 'imgArmas/Bumali.jpg'),
(361, 'Kusu ', 4, 16, 'imgArmas/Kusu.jpg'),
(362, 'mfinu ', 4, 2, 'imgArmas/mfinu.jpg'),
(363, 'Baswa', 4, 16, 'imgArmas/Baswa.jpg'),
(364, 'Chahār Kham', 20, 30, 'imgArmas/Chahār Kham.jpg'),
(365, 'Tegha', 7, 1, 'imgArmas/Tegha.jpg'),
(366, 'kirpan', 7, 27, 'imgArmas/kirpan.jpg'),
(367, 'Patissa', 7, 1, 'imgArmas/Patissa.jpg'),
(368, 'katzbalger', 21, 1, 'imgArmas/katzbalger.jpg'),
(369, 'Bauernwehr', 21, 27, 'imgArmas/Bauernwehr.jpg'),
(370, 'Kriegsmesser', 29, 1, 'imgArmas/Kriegsmesser.png'),
(371, 'Messer', 29, 22, 'imgArmas/Messer.jpg'),
(372, 'Kirdi shield', 4, 18, 'imgArmas/Kirdi shield.jpg'),
(373, 'ishilunga', 4, 18, 'imgArmas/ishilunga.jpg'),
(374, 'Flügeltartsche', 40, 18, 'imgArmas/Flügeltartsche.jpg'),
(375, 'Hussar shield', 40, 18, 'imgArmas/Hussar shield.jpg'),
(376, 'Tournament shield', 40, 18, 'imgArmas/Tournament shield.jpg'),
(377, 'Sengese', 4, 33, 'imgArmas/Sengese.jpg'),
(378, 'Naga ', 20, 24, 'imgArmas/Naga.jpg'),
(379, 'Cumberjung', 7, 29, 'imgArmas/Cumberjung.jpg'),
(380, 'kaskara', 4, 1, 'imgArmas/kaskara.jpg'),
(381, 'Iklwa', 4, 12, 'imgArmas/Iklwa.jpg'),
(382, 'makrigga ', 4, 12, 'imgArmas/makrigga.jpg'),
(383, 'Rungu', 4, 5, 'imgArmas/Rungu.jpg'),
(384, 'Knobkerry', 4, 5, 'imgArmas/Knobkerry.jpg'),
(385, 'Flyssa', 4, 1, 'imgArmas/Flyssa.jpg'),
(386, 'Ikakalaka', 4, 1, 'imgArmas/Ikakalaka.jpg'),
(387, 'Boa Zande', 4, 1, 'imgArmas/Boa Zande.jpg'),
(388, 'Ida', 4, 1, 'imgArmas/Ida.jpg'),
(389, 'Lobala', 4, 1, 'imgArmas/Lobala.jpg'),
(390, 'Nzappa zap', 4, 2, 'imgArmas/Nzappa zap.jpg'),
(391, 'Shoka', 4, 2, 'imgArmas/Shoka.jpg'),
(392, 'sjambok', 4, 29, 'imgArmas/sjambok.jpg'),
(393, 'Elongo shield', 4, 18, 'imgArmas/Elongo shield.jpg'),
(394, 'Yoruba shield', 4, 18, 'imgArmas/Yoruba shield.jpg'),
(395, 'Zande shield', 4, 18, 'imgArmas/Zande shield.jpg'),
(396, 'Makraka', 4, 1, 'imgArmas/Makraka.jpg'),
(397, 'tizona', 5, 1, 'imgArmas/tizona.jpg'),
(398, 'lowlander ', 38, 1, 'imgArmas/lowlander.png'),
(399, 'mak ', 41, 2, 'imgArmas/mak.jpg'),
(400, 'Hmong hook', 41, 7, 'imgArmas/Hmong hook.jpg'),
(401, 'Pololu', 27, 12, 'imgArmas/polulu.jpg'),
(402, 'Kudi Tranchang', 4, 33, 'imgArmas/Kudi Tranchang.jpg'),
(403, 'Pole Club', 27, 5, 'imgArmas/Pole Club.jpg'),
(404, 'puntilla ', 5, 16, 'imgArmas/puntilla.jpg'),
(405, 'Wurfkreuz', 29, 23, 'imgArmas/Wurfkreuz.jpg'),
(406, 'Niabor', 42, 22, 'imgArmas/Niabor.jpg'),
(407, 'Sangi', 34, 27, 'imgArmas/Sangi.jpg'),
(408, 'Pirah', 34, 24, 'imgArmas/Pirah.jpg'),
(409, 'Zhanmadao', 1, 22, 'imgArmas/Zhanmadao.jpg'),
(410, 'Executioner\'s Sword', 29, 1, 'imgArmas/Executioner\'s Sword.jpg'),
(411, 'Tuareg Takoba', 7, 1, 'imgArmas/Tuareg Takoba.jpg'),
(412, 'ssangsudo', 39, 22, 'imgArmas/ssangsudo.jpg'),
(413, 'Chiljido', 39, 1, 'imgArmas/Chiljido.jpg'),
(414, 'dang pa', 39, 12, 'imgArmas/Dang pa.webp'),
(415, 'lang xian', 39, 12, 'imgArmas/lang xian.jpg'),
(416, 'Jang Do', 39, 27, 'imgArmas/Jang Do.jpg'),
(417, 'dan geom ', 39, 27, 'imgArmas/dan geom.jpg'),
(418, 'Yedo ', 39, 22, 'imgArmas/Yedo.jpg'),
(419, 'Saingeom ', 39, 1, 'imgArmas/Saingeom.jpg'),
(420, 'Hwando', 39, 22, 'imgArmas/Hwando.jpg'),
(421, 'Vajra-Mushti', 7, 17, 'imgArmas/Vajra-Mushti.jpg'),
(422, 'Jingum', 39, 22, 'imgArmas/Jingum.jpg'),
(423, 'Jikdo', 39, 22, 'imgArmas/Jikdo.jpg'),
(424, 'Changpogeom', 39, 1, 'imgArmas/Changpogeom.jpg'),
(425, 'Walloon', 21, 1, 'imgArmas/Walloon.jpg'),
(426, 'woldo', 39, 19, 'imgArmas/woldo.png'),
(427, 'Akrafena', 4, 24, 'imgArmas/Akrafena.jpg'),
(428, 'daga sword breaker', 29, 16, 'imgArmas/daga sword breaker.jpg'),
(429, 'pesh-kabz', 7, 27, 'imgArmas/pesh-kabz.jpg'),
(430, 'Charay Sword', 7, 27, 'imgArmas/Charay Sword.jpg'),
(431, 'Elephant Tusk Sword', 7, 16, 'imgArmas/Elephant Tusk Sword.jpg'),
(432, 'espada pionera', 43, 1, 'imgArmas/espada pionera.jpg'),
(433, 'Ninjatō', 14, 22, 'imgArmas/Ninjatō.jpg'),
(434, 'Hunga Munga', 4, 33, 'imgArmas/Hunga Munga.jpg'),
(435, 'Kabyle Flyssa', 4, 1, 'imgArmas/Kabyle Flyssa.jpg'),
(436, 'Parrying dagger', 21, 16, 'imgArmas/Parrying dagger.jpeg'),
(437, 'Main-gauche', 25, 16, 'imgArmas/Main-gauche.jpg'),
(438, 'Trident dagger', 21, 16, 'imgArmas/Trident dagger.jpg'),
(439, 'karud', 7, 27, 'imgArmas/karud.jpg'),
(440, 'khyber sword', 20, 27, 'imgArmas/khyber sword.jpg'),
(441, 'nimcha', 7, 22, 'imgArmas/nimcha.jpg'),
(442, 'kozuka', 2, 27, 'imgArmas/kozuka.jpg'),
(446, 'ada', 7, 24, 'imgArmas/ada.jpg'),
(447, 'oudh bhuj', 7, 2, 'imgArmas/oudh bhuj.jpg'),
(448, 'yatagan', 44, 22, 'imgArmas/yatagan.jpg'),
(449, 'panga', 4, 24, 'imgArmas/panga.jpg'),
(450, 'bali', 7, 1, 'imgArmas/bali.jpeg'),
(451, 't\'boli', 22, 24, 'imgArmas/t\'boli.jpg'),
(453, 'parang', 7, 22, 'imgArmas/parang.jpg'),
(454, 'french nail', 25, 27, 'imgArmas/french nail.jpg'),
(455, 'rere', 27, 16, 'imgArmas/rere.jpg'),
(456, 'pinahig ', 34, 27, 'imgArmas/pinahig.jpg'),
(457, 'tecpatl', 26, 27, 'imgArmas/tecpatl.png'),
(458, 'chokuto', 2, 22, 'imgArmas/chokuto.jpg'),
(459, 'shamshir', 7, 22, 'imgArmas/shamshir.jpg'),
(460, 'hachiwari', 2, 1, 'imgArmas/hachiwari.jpg'),
(461, 'puñal de chispa', 14, 16, 'imgArmas/puñal de chispa.jpg'),
(462, 'kotengu', 2, 27, 'imgArmas/kotengu.jpg'),
(463, 'Mandau', 22, 24, 'imgArmas/mandau.jpg'),
(464, 'kujang ', 7, 16, 'imgArmas/kujang.jpg'),
(465, 'takouba', 4, 1, 'imgArmas/takouba.jpg'),
(466, 'khanjar', 7, 16, 'imgArmas/khanjar.jpg'),
(467, 'koummya', 7, 27, 'imgArmas/koummya.jpg'),
(468, 'pahoa ', 27, 27, 'imgArmas/pahoa.jpg'),
(469, 'taupou ', 27, 24, 'imgArmas/taupou.jpg'),
(470, 'sawfish sword', 7, 1, 'imgArmas/sawfish sword.jpg'),
(471, 'ngbaka', 4, 33, 'imgArmas/ngbaka.jpg'),
(472, 'te butu', 27, 27, 'imgArmas/te butu.jpg'),
(473, 'tailbong ', 7, 22, 'imgArmas/tailbong.jpg'),
(474, 'ngbandi yakoma', 4, 1, 'imgArmas/ngbandi yakoma.jpg'),
(475, 'khanda', 7, 1, 'imgArmas/khanda sword.jpg'),
(476, 'gupti', 14, 1, 'imgArmas/gupti.jpg'),
(477, 'rondel', 21, 16, 'imgArmas/rondel.jpg'),
(478, 'anelace ', 21, 16, 'imgArmas/anelace.jpg'),
(479, 'novacula', 5, 27, 'imgArmas/novacula.jpg'),
(480, 'otta ', 7, 16, 'imgArmas/otta.jpg'),
(481, 'terbutje', 27, 12, 'imgArmas/terbutje.jpg'),
(482, 'belawa ', 4, 16, 'imgArmas/belawa.jpg'),
(483, 'arakh ', 7, 7, 'imgArmas/arakh.jpg'),
(484, 'ballock', 21, 16, 'imgArmas/ballock.jpg'),
(485, 'kinzhal ', 18, 16, 'imgArmas/kinzhal.jpg'),
(486, 'espada bastarda', 21, 1, 'imgArmas/espada bastarda.png'),
(487, 'ndjeny ', 4, 24, 'imgArmas/ndjeny.jpg'),
(488, 'ayda katti', 7, 27, 'imgArmas/adya katti.jpg'),
(489, 'gunong', 34, 16, 'imgArmas/gunong.jpg'),
(490, 'byongi ', 4, 1, 'imgArmas/byongi.jpg'),
(491, 'rampuri', 7, 27, 'imgArmas/rampuri.jpg'),
(492, 'jile ', 32, 16, 'imgArmas/jile.jpg'),
(493, 'patag', 1, 27, 'imgArmas/patag.jpg'),
(494, 'luwuk', 27, 1, 'imgArmas/luwuk.jpg'),
(495, 'kalis', 34, 16, 'imgArmas/kalis.jpg'),
(496, 'dussack', 29, 1, 'imgArmas/dussack.jpg'),
(497, 'pandat', 22, 24, 'imgArmas/pandat.jpg'),
(498, 'pichangatti ', 7, 16, 'imgArmas/pichangatti.jpg'),
(500, 'cinquedea', 4, 16, 'imgArmas/cinquedea.jpg'),
(501, 'dahong palay', 1, 24, 'imgArmas/dahong palay.jpg'),
(502, 'kaiken ', 3, 27, 'imgArmas/kaiken.jpg'),
(503, 'hwandudaedo', 3, 1, 'imgArmas/hwandudaedo.jpg'),
(504, 'Skeggöx', 23, 2, 'imgArmas/Skeggöx.jpg'),
(505, 'adze', 27, 35, 'imgArmas/adze.jpg'),
(506, 'palstave', 21, 2, 'imgArmas/palstave.jpg'),
(508, 'ankus', 7, 12, 'imgArmas/ankus.jpg'),
(509, 'francesca ', 21, 2, 'imgArmas/francesca.jpg'),
(510, 'silepe', 4, 2, 'imgArmas/silepe.jpg'),
(511, 'dolabra', 9, 2, 'imgArmas/dolabra.jpg'),
(512, 'tlokoa', 4, 2, 'imgArmas/tlokoa.jpg'),
(513, 'tungi ', 7, 2, 'imgArmas/tungi.jpg'),
(514, 'hafted', 1, 2, 'imgArmas/hafted.jpg'),
(517, 'sagaris ', 8, 2, 'imgArmas/sagaris.jpg'),
(518, 'tabar', 7, 2, 'imgArmas/tabar.jpg'),
(519, 'shispar ', 7, 2, 'imgArmas/shispar.jpg'),
(520, 'pharasa ', 7, 2, 'imgArmas/pharasa.jpg'),
(521, 'balta ', 21, 2, 'imgArmas/balta.jpg'),
(522, 'otzi ', 21, 2, 'imgArmas/otzi.jpg'),
(523, 'mordaxt', 29, 19, 'imgArmas/mordaxt.jpg'),
(524, 'epsilon', 8, 2, 'imgArmas/epsilon.jpg'),
(525, 'Gurj ', 7, 5, 'imgArmas/Gurj.jpg'),
(526, 'sgian dubh', 23, 16, 'imgArmas/sgian dubh.JPG'),
(527, 'Knobkerrie', 4, 5, 'imgArmas/Knobkerrie.jpg'),
(528, 'lochaber ', 38, 19, 'imgArmas/lochaber.jpg'),
(529, 'naga dao', 7, 24, 'imgArmas/naga axes.jpg'),
(530, 'fokos ', 3, 2, 'imgArmas/fokos.jpg'),
(531, 'kalinga ', 4, 2, 'imgArmas/kalinga.jpg'),
(533, 'sparths', 23, 2, 'imgArmas/sparths.jpg'),
(534, 'hurlbat', 21, 2, 'imgArmas/hurlbat.jpg'),
(535, 'bulova ', 7, 2, 'imgArmas/bulova.jpg'),
(536, 'Kiliç', 7, 22, 'imgArmas/Kiliç.jpg'),
(537, 'clurit', 22, 7, 'imgArmas/clurit.jpg'),
(538, 'lohar ', 20, 7, 'imgArmas/lohar.jpg'),
(539, 'ko\'i', 27, 35, 'imgArmas/ko\'i.jpg'),
(540, 'toki uli', 27, 35, 'imgArmas/toki uli.jpg'),
(541, 'shinobi kumade', 3, 23, 'imgArmas/shinobi kumade.jpg'),
(542, 'boline', 23, 16, 'imgArmas/boline.jpg'),
(543, 'aruval', 7, 24, 'imgArmas/aruval.jpg'),
(544, 'salawaku', 4, 18, 'imgArmas/salawaku.jpg'),
(545, 'parrying shield', 14, 18, 'imgArmas/parrying shield.jpg'),
(546, 'double whip chinese', 1, 9, 'imgArmas/double whip chinese.jpg'),
(547, 'pouwhenua', 27, 9, 'imgArmas/pouwhenua.jpg'),
(548, 'quarterstaff', 21, 9, 'imgArmas/quarterstaff.jpg'),
(549, 'espantoon ', 31, 9, 'imgArmas/espantoon.jpg'),
(550, 'kirikobo', 3, 9, 'imgArmas/kirikobo.jpg'),
(551, 'kanemuchi ', 1, 9, 'imgArmas/kanemuchi.jpg'),
(553, 'nagaika ', 7, 29, 'imgArmas/nagaika.jpg'),
(554, 'supi ', 27, 5, 'imgArmas/supi.jpg'),
(555, 'Kukukuku Pineapple', 27, 5, 'imgArmas/Kukukuku Pineapple.jpg'),
(556, 'roromaraugi', 27, 5, 'imgArmas/roromaraugi.jpg'),
(557, 'patu', 27, 5, 'imgArmas/patu.jpg'),
(558, 'u\'u', 4, 5, 'imgArmas/u\'u.jpg'),
(559, 'patuki', 27, 5, 'imgArmas/patuki.jpg'),
(560, 'kotiake', 27, 5, 'imgArmas/kotiake.jpeg'),
(561, 'cudgel', 1, 5, 'imgArmas/cudgel.jpg'),
(562, 'nulla-nulla', 27, 5, 'imgArmas/nulla-nulla.jpeg'),
(563, 'angon', 21, 12, 'imgArmas/angon.jpg'),
(564, 'sasumata', 1, 19, 'imgArmas/sasumata.jpg'),
(565, 'she mao', 1, 12, 'imgArmas/she mao.png'),
(566, 'gou lian qiang', 3, 19, 'imgArmas/Gou Lian Qiang.png'),
(567, 'mdung', 3, 12, 'imgArmas/mdung.jpg'),
(568, 'tataumanaria', 27, 12, 'imgArmas/tataumanaria.jpeg'),
(569, 'tewinnarei', 27, 12, 'imgArmas/tewinnarei.jpg'),
(570, 'akatara club', 27, 5, 'imgArmas/akatara.jpg'),
(571, 'taiaha', 19, 12, 'imgArmas/taiaha.jpg'),
(572, 'jukjangchang ', 39, 12, 'imgArmas/jukjangchang.jpg'),
(573, 'koa ihe', 27, 12, 'imgArmas/koa ihe.jpg'),
(575, 'bear spear', 21, 12, 'imgArmas/bear spear.jpg'),
(576, 'leister', 16, 12, 'imgArmas/leister.jpg'),
(577, 'ox tongue', 21, 12, 'imgArmas/ox tongue.jpg'),
(578, 'hǔchā', 1, 12, 'imgArmas/Hǔchā.jpg'),
(579, 'saintie', 20, 12, 'imgArmas/saintie.jpg'),
(580, 'fire lance', 39, 34, 'imgArmas/fire lance.jpg'),
(581, 'barong', 34, 24, 'imgArmas/barong.jpg'),
(600, 'fustibalus', 21, 32, 'imgArmas/fustibalus.png'),
(664, 'verijero', 12, 27, 'imgArmas/verijero.jpg'),
(665, 'koa sword', 27, 1, 'imgArmas/Koa-Sword.jpg'),
(666, 'shuanggou', 3, 1, 'imgArmas/shuanggou.jpg'),
(672, 'bayoneta', 21, 1, 'imgArmas/Bayoneta-M1.jpg'),
(682, 'doloire', 25, 19, 'imgArmas/doloire.png'),
(688, 'luristan', 48, 2, 'imgArmas/luristan.jpg');

--
-- Disparadores `armas`
--
DELIMITER $$
CREATE TRIGGER `armaEditada` BEFORE UPDATE ON `armas` FOR EACH ROW BEGIN
    IF @restaurando IS NULL OR @restaurando = FALSE THEN
        INSERT INTO armaeditadas (arma, fk_tipo, fk_pais, imagen, id_original)
        VALUES (OLD.arma, OLD.fk_tipo, OLD.fk_pais, OLD.imagen, OLD.id);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `armaEliminadas` AFTER DELETE ON `armas` FOR EACH ROW INSERT INTO armasborradas (arma, fk_pais , fk_tipo, imagen) VALUES (OLD.arma, OLD.fk_pais, OLD.fk_tipo, OLD.imagen)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `devolverArma` AFTER INSERT ON `armas` FOR EACH ROW DELETE FROM armasBorradas 
WHERE arma = NEW.arma AND fk_tipo = NEW.fk_tipo AND fk_pais = NEW.fk_pais
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armasborradas`
--

CREATE TABLE `armasborradas` (
  `id` int(11) NOT NULL,
  `arma` varchar(100) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_tipo` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continentes`
--

CREATE TABLE `continentes` (
  `id` int(11) NOT NULL,
  `continente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `continentes`
--

INSERT INTO `continentes` (`id`, `continente`) VALUES
(1, 'África'),
(2, 'Asia'),
(5, 'América'),
(6, 'Europa'),
(8, 'Oceanía'),
(10, 'Desconocido'),
(11, 'Medio Oriente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `pais` varchar(250) NOT NULL,
  `fk_continente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `pais`, `fk_continente`) VALUES
(1, 'China', 2),
(2, 'Japón', 2),
(3, 'Asia', 2),
(4, 'África', 1),
(5, 'España', 6),
(7, 'India', 11),
(8, 'Grecia', 6),
(9, 'Italia', 6),
(12, 'Argentina', 5),
(14, 'Desconocido', 10),
(15, 'Ambiguo', 10),
(16, 'Prehistoria', 10),
(17, 'Egipto', 11),
(18, 'Rusia', 2),
(19, 'Nueva Zelanda', 8),
(20, 'Medio Oriente', 11),
(21, 'Europa', 6),
(22, 'Indonesia', 8),
(23, 'Nordico', 6),
(24, 'Escandinavia', 6),
(25, 'Francia', 6),
(26, 'México', 5),
(27, 'Polinesia', 10),
(28, 'Irlanda', 6),
(29, 'Alemania', 6),
(30, 'Polonia', 6),
(31, 'America', 5),
(32, 'Etiopia', 1),
(33, 'Tracio', 6),
(34, 'Filipino', 2),
(35, 'Groenlandia', 5),
(36, 'Nepal', 2),
(37, 'Norte America', 5),
(38, 'Escocia', 6),
(39, 'Corea', 2),
(40, 'Hungria', 6),
(41, 'Vietnam', 11),
(42, 'Borneo', 1),
(43, 'Ingles', 6),
(44, 'Turquía', 11),
(46, 'normandia', 6),
(48, 'Iran', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'usuario'),
(4, 'creador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_arma`
--

CREATE TABLE `tipo_arma` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fk_golpe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_arma`
--

INSERT INTO `tipo_arma` (`id`, `tipo`, `fk_golpe`) VALUES
(1, 'espada', 1),
(2, 'hacha', 1),
(5, 'maza', 2),
(6, 'martillo', 2),
(7, 'hoz/guadaña', 1),
(9, 'bastón', 2),
(12, 'lanza', 3),
(14, 'cuchilla', 1),
(16, 'daga', 1),
(17, 'arma de mano', 2),
(18, 'escudo', 2),
(19, 'arma de asta', 1),
(22, 'sable', 1),
(23, 'pinchos', 3),
(24, 'machete', 1),
(27, 'cuchillo', 1),
(28, 'picos', 3),
(29, 'látigo', 5),
(30, 'arco', 5),
(31, 'ballesta', 5),
(32, 'extra', 7),
(33, 'arrojadiza', 5),
(34, 'de pólvora', 5),
(35, 'azada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_golpe`
--

CREATE TABLE `tipo_golpe` (
  `id` int(11) NOT NULL,
  `golpe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_golpe`
--

INSERT INTO `tipo_golpe` (`id`, `golpe`) VALUES
(1, 'cortantes'),
(2, 'contundentes'),
(3, 'perforantes'),
(5, 'a distancia'),
(7, 'extras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `mail` varchar(250) NOT NULL,
  `password` varchar(300) NOT NULL,
  `rol` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `mail`, `password`, `rol`) VALUES
(5, 'admin@gmail.com', '$2y$10$gZY3JKaRlKRIIMa0wrT6OewgV63S6UGpRtDHNAsVz4Sa/XXMMoWJm', 4),
(7, 'usuario@gmail.com', '$2y$10$flWc6ch6RtvqM8m2oGIFu.qDoSzYiv.9jmEi0ptNNBVTMXrOgJEDy', 2),

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armaeditadas`
--
ALTER TABLE `armaeditadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `armas`
--
ALTER TABLE `armas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_arma_pais` (`fk_pais`),
  ADD KEY `fk_arma_tipo` (`fk_tipo`);

--
-- Indices de la tabla `armasborradas`
--
ALTER TABLE `armasborradas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `continentes`
--
ALTER TABLE `continentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pais_continente` (`fk_continente`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_arma_golpe` (`fk_golpe`);

--
-- Indices de la tabla `tipo_golpe`
--
ALTER TABLE `tipo_golpe`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armaeditadas`
--
ALTER TABLE `armaeditadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=690;

--
-- AUTO_INCREMENT de la tabla `armasborradas`
--
ALTER TABLE `armasborradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `continentes`
--
ALTER TABLE `continentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tipo_golpe`
--
ALTER TABLE `tipo_golpe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armas`
--
ALTER TABLE `armas`
  ADD CONSTRAINT `fk_arma_pais` FOREIGN KEY (`fk_pais`) REFERENCES `pais` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_arma_tipo` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo_arma` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fk_pais_continente` FOREIGN KEY (`fk_continente`) REFERENCES `continentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  ADD CONSTRAINT `fk_arma_golpe` FOREIGN KEY (`fk_golpe`) REFERENCES `tipo_golpe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
