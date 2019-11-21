-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 18 nov. 2019 à 16:22
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `number`, `street`, `postal_code`, `city`, `complement`, `latitude`, `longitude`) VALUES
(1, 4, 'impasse varignon', 14000, 'caen', 'bis', '49.18522500', '0.35157400'),
(2, 12, 'rue du milieu', 14000, 'caen', NULL, '49.17349300', '0.35745000'),
(3, 7, 'boulevard maréchal juin', 14000, 'caen', 'société générale', '49.21008800', '0.36734800'),
(4, 102, 'boulevard du grand parc', 14200, 'hérouville saint clair', NULL, '49.19686900', '0.33512400'),
(5, 5, 'rue de fontaine henry', 14000, 'caen', 'interphone b2', '49.19931600', '0.36878700');

-- --------------------------------------------------------

--
-- Structure de la table `address_line`
--

DROP TABLE IF EXISTS `address_line`;
CREATE TABLE IF NOT EXISTS `address_line` (
  `customer_id` int(11) NOT NULL,
  `adress_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`adress_id`),
  KEY `adress_id_idx` (`adress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `address_line`
--

INSERT INTO `address_line` (`customer_id`, `adress_id`) VALUES
(1, 1),
(1, 2),
(3, 2),
(3, 3),
(2, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` char(10) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `name`, `first_name`, `email`, `phone`, `identifier`, `password`) VALUES
(1, 'jeanne', 'xavier', 'xavier.jeanne@gmail.com', '0609356653', 'xavier.jeanne', '22B6E8F3608FA911864D74D35037F017'),
(2, 'xufre', 'pablo', 'xufre.pablo@hotmail.com', '0665235693', 'pablo563', '7E4B64EB65E34FDFAD79E623C44ABD94'),
(3, 'langlade', 'mathieu', 'mathieu753@free.fr', '0635269523', 'matlanglade', '34FAE16EB073DC4C90D9A21828B6B231'),
(4, 'letrosne', 'cedric', 'ced_letrosne@gmail.com', '0745258965', 'cedric.letrosne', 'C4DE7DF1BAFD6D9B8F5D35D4328C93B0');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
CREATE TABLE IF NOT EXISTS `delivery_boy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('avaliable','in_delivery','incident','refueling') NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `stock_dish_one` int(11) NOT NULL,
  `stock_dish_two` int(11) NOT NULL,
  `stock_dessert_one` int(11) NOT NULL,
  `stock_dessert_two` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id_idx` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `status`, `latitude`, `longitude`, `employee_id`, `stock_dish_one`, `stock_dish_two`, `stock_dessert_one`, `stock_dessert_two`) VALUES
(1, 'avaliable', '49.18700600', '0.36251200', 3, 6, 4, 4, 5),
(2, 'refueling', '49.18814900', '0.35883200', 4, 0, 0, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `type` enum('dish','dessert') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`id`, `name`, `description`, `picture`, `type`, `price`) VALUES
(1, 'pizza 4 fromages', 'Délicieuse pizza avec du cheddar, du gruyère, du fromage de chèvre et du gorgonzola ', 'assets/picture/pizza_fromage.png', 'dish', '8.50'),
(2, 'lasagne à la sauce bolognaise', 'composée de plaque de pâtes et accompagnée de champignons et d\'une sauce béchamel', 'assets/picture/lasagne_bolognaise.png', 'dish', '7.90'),
(3, 'salade caesar', 'salade composée  de laitue romaine, de parmesan, d\'œufs durs et de croûtons, arrosée de sa « sauce César »', 'assets/picture/salade_caesar.png', 'dish', '8.60'),
(4, 'burger campagnard', 'burger délicieux accompagné de frite et de  la sauce campagnarde inédite', 'assets/picture/burger_campagnard.png', 'dish', '9.20'),
(5, 'éclair au chocolat', 'pâte à choux légére et garnie de chocolat noir', 'assets/picture/eclair_chocolat.png', 'dessert', '3.50'),
(6, 'fondant au chocolat', 'un dessert composé d\'un petit gâteau au chocolat à croûte croquante et à la garniture moelleuse ', 'assets/picture/fondant_chocolat.png', 'dessert', '2.50'),
(7, 'flan patissier', 'flan à la vanille sur sa pâte moelleuse', 'asstes/picture/flan_patissier.png', 'dessert', '2.40'),
(8, 'tarte aux pommes', 'tarte sucrée garnie de pommes caramélisées', 'assets/picture/tarte_pomme.png', 'dessert', '2.20');

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` enum('delivery_boy','chef','administrator') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`id`, `name`, `first_name`, `identifier`, `password`, `email`, `type`) VALUES
(1, 'jean', 'etienne', 'jean_etienne', 'c379d6143781b15316af594a42e5915c', 'jean_etienne@expressfood.fr', 'chef'),
(2, 'dupont', 'géraldine', 'dupont_geraldine', '848cbf8e5d50795a8cf4ca0754e56d05', 'dupont_geraldine@expressfood.fr', 'administrator'),
(3, 'bourouissi', 'malik', 'bourouissi_malik', '2ffc75c1cc37ef43429059b96d6bf411', 'bourouissi_malik@expressfood.fr', 'delivery_boy'),
(4, 'guitet', 'marie', 'guitet_marie', '312bcbded738cba56f076f5fbe94b3f6', 'guitet_marie@expressfood.fr', 'delivery_boy');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `date`, `employee_id`) VALUES
(1, '2019-11-18', 1),
(2, '2019-11-19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `menu_line`
--

DROP TABLE IF EXISTS `menu_line`;
CREATE TABLE IF NOT EXISTS `menu_line` (
  `menu_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`dish_id`),
  KEY `dish_id_idx` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu_line`
--

INSERT INTO `menu_line` (`menu_id`, `dish_id`, `quantity`) VALUES
(1, 1, 20),
(1, 2, 20),
(1, 5, 20),
(1, 6, 20),
(2, 3, 20),
(2, 4, 20),
(2, 7, 20),
(2, 8, 20);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_address` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` enum('validated','in_delivery','canceled','delivered') NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `address_line_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `delivery_boy_id_idx` (`delivery_boy_id`),
  KEY `address_line_id_idx` (`address_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `billing_address`, `date`, `state`, `total_price`, `address_line_id`, `customer_id`, `delivery_boy_id`) VALUES
(1, 1, '2019-11-18 00:00:00', 'delivered', '12.00', 1, 1, 2),
(2, 3, '2019-11-18 00:00:00', 'delivered', '18.30', 3, 3, 1),
(3, 4, '2019-11-19 00:00:00', 'validated', '22.60', 4, 4, 2),
(4, 5, '2019-11-19 00:00:00', 'in_delivery', '9.20', 5, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
CREATE TABLE IF NOT EXISTS `order_line` (
  `order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`dish_id`),
  KEY `dish_id_idx` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_line`
--

INSERT INTO `order_line` (`order_id`, `dish_id`, `quantity`) VALUES
(1, 1, 1),
(1, 5, 1),
(2, 2, 2),
(2, 6, 1),
(3, 3, 1),
(3, 4, 1),
(3, 7, 2),
(4, 4, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address_line`
--
ALTER TABLE `address_line`
  ADD CONSTRAINT `addres_line_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `adress_line_adress_id` FOREIGN KEY (`adress_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD CONSTRAINT `delivery_boy_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menu_line`
--
ALTER TABLE `menu_line`
  ADD CONSTRAINT `menu_line_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `menu_line_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_address_line_id` FOREIGN KEY (`address_line_id`) REFERENCES `address_line` (`adress_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_delivery_boy_id` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_line_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
