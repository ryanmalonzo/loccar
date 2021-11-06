-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 06, 2021 at 08:24 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `location_voitures`
--

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `idEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `adresseEntreprise` varchar(50) NOT NULL,
  `nomEntreprise` varchar(50) NOT NULL,
  PRIMARY KEY (`idEntreprise`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`idEntreprise`, `adresseEntreprise`, `nomEntreprise`) VALUES
(1, '44 rue de Versailles, Paris 75014', 'Loccar'),
(2, '23 rue de la paix, Rouen 76000', 'FNAC'),
(3, '56 boulevard Jean Jaurès, Nantes 44010', 'Nestle'),
(4, '178 avenue des champs, Lyon 69000', 'Crédit Agricole'),
(5, '8 rue Molière, Marseille 13177', 'Auchan');

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `idFacture` int(11) NOT NULL AUTO_INCREMENT,
  `idUtilisateur` int(11) NOT NULL,
  `idVehicule` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `montant` int(11) NOT NULL,
  `etatReglement` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFacture`,`idUtilisateur`,`idVehicule`),
  KEY `idUtilisateur` (`idUtilisateur`),
  KEY `idVehicule` (`idVehicule`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
CREATE TABLE IF NOT EXISTS `modele` (
  `idModele` int(11) NOT NULL AUTO_INCREMENT,
  `nomModele` varchar(25) NOT NULL,
  `caracteristiques` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `tarifJournalier` int(11) NOT NULL,
  PRIMARY KEY (`idModele`),
  UNIQUE KEY `nomModele` (`nomModele`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modele`
--

INSERT INTO `modele` (`idModele`, `nomModele`, `caracteristiques`, `photo`, `tarifJournalier`) VALUES
(1, 'Peugeot 107', 'P107.json', 'P107.jpg', 113),
(2, 'Peugeot 208', 'P208.json', 'P208.jpg', 109),
(3, 'Renault Clio IV', 'ClioIV.json', 'ClioIV.jpg', 124),
(4, 'Dacia Duster', 'Duster.json', 'Duster.jpg', 137),
(5, 'Volkswagen Polo', 'Polo.json', 'Polo.jpg', 146),
(6, 'Audi A8', 'AA8.json', 'AA8.jpg', 176),
(7, 'Honda Civic', 'Civic.json', 'Civic.jpg', 148),
(8, 'Toyota Yaris', 'Yaris.json', 'Yaris.jpg', 130),
(9, 'Lexus NX', 'LNX.json', 'LNX.jpg', 163),
(10, 'Skoda Fabia', 'Fabia.json', 'Fabia.jpg', 134),
(11, 'Subaru Outback', 'Outback.json', 'Outback.jpg', 133),
(12, 'Citroen C3', 'CC3.json', 'CC3.jpg', 129);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `idEntreprise` int(11) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `mail` (`mail`),
  KEY `idEntreprise` (`idEntreprise`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nom`, `mail`, `motDePasse`, `idEntreprise`, `role`) VALUES
(1, 'Croilon', 'georgesCroilon@loccar.com', '4da51a44c35d322dea8f10814e5d7982da042e4c', 1, 'admin'),
(2, 'Bonnevès', 'marieBonneves@loccar.com', '7aa3b386286afe44d911c423f656032e7b12c73d', 1, 'admin'),
(3, 'Gailart', 'julesGailart@loccar.com', '5c67392b820cadfb4455341af38e4b2a86a36fae', 1, 'admin'),
(4, 'Lomalot', 'aurelienLomalot@loccar.com', 'f1fb385e41bce5eacdedc26d6ccd6a355c1d0304', 1, 'admin'),
(5, 'Dupont', 'pierreDupont@fnac.com', '874c61a868d340abcb122d1af95d03a86aa9e0f2', 2, 'client'),
(6, 'Veret', 'camilleVeret@fnac.com', '8ff895888755d95f1d0cfb7f64fbfbb463b619ee', 2, 'client'),
(7, 'Bizeseul', 'marcBizeseul@fnac.com', '80773d1823dd81137b3c2fe1de30dfd6b1737581', 2, 'client'),
(8, 'Lamanac', 'amelieLamanac@fnac.com', '3598ee95f2a5c305d41c5e1afba1a54b732e39bd', 2, 'client'),
(9, 'Sauvilliers', 'andreSauvilliers@nestle.com', '9d58fa906195df97bb06058a57feea8f9cdd2f1d', 3, 'client'),
(10, 'Rages', 'nathalieRages@nestle.com', '36392d4b06c6aa89e527447a4c438d62f0203a63', 3, 'client'),
(11, 'Belenteau', 'rogerBelenteau@nestle.com', '5739f57391e13644f87d85bbcd2fbe9b82915a45', 3, 'client'),
(12, 'Abanteau', 'jeanAbanteau@nestle.com', '1461b927f06c5fe8d45d9d0b30ec2aa8247f2146', 3, 'client'),
(13, 'Ranac', 'sofiaRanac@creditagricole.com', '1767c7e247bfd57d48c1fbabbd584f47263c31e2', 4, 'client'),
(14, 'Polastel', 'arthurPolastel@creditagricole.com', '3d53590294f5846b3b171df31a72737c079725a1', 4, 'client'),
(15, 'Jouvechade', 'margotJouvechade@creditagricole.com', '26e8986c68d621898ee1a9936978f24b8af416c1', 4, 'client'),
(16, 'Pellerdieu', 'vincentPellerdieu@creditagricole.com', 'd58eb8c9ce69be11afb9ac8001edca8e8128c028', 4, 'client'),
(17, 'Aguelle', 'simonAguelle@auchan.com', '0e7e0ac1801f3be57d4fe7f28eadb10389ca56b7', 5, 'client'),
(18, 'Maiffet', 'clarisseMaiffet@auchan.com', 'bf0dbda06a47bee21f123f4e41cd933eb0693927', 5, 'client'),
(19, 'Castemoux', 'emmaCastemoux@auchan.com', '371f900c78b47c8f7e7f849cf29b143c5c3ff175', 5, 'client'),
(20, 'Dumeur', 'mathisDumeur@auchan.com', 'e2509805892ecf78e3870368286e48cc30a68d96', 5, 'client'),
(21, 'Malonzo', 'ryan@ryanmalonzo.fr', '1f1d381923c82fc4e3df69c498053618eadf7a47', 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `idVehicule` int(11) NOT NULL AUTO_INCREMENT,
  `idModele` int(11) NOT NULL,
  `etatLocation` varchar(50) NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVehicule`),
  KEY `idUtilisateur` (`idUtilisateur`),
  KEY `idModele` (`idModele`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`idVehicule`, `idModele`, `etatLocation`, `idUtilisateur`) VALUES
(1, 1, 'disponible', NULL),
(2, 1, 'disponible', NULL),
(3, 1, 'disponible', NULL),
(4, 2, 'disponible', NULL),
(5, 2, 'disponible', NULL),
(6, 3, 'disponible', NULL),
(7, 3, 'disponible', NULL),
(8, 3, 'disponible', NULL),
(9, 3, 'disponible', NULL),
(10, 3, 'disponible', NULL),
(11, 4, 'disponible', NULL),
(12, 4, 'disponible', NULL),
(13, 4, 'disponible', NULL),
(14, 4, 'disponible', NULL),
(15, 5, 'disponible', NULL),
(16, 5, 'disponible', NULL),
(17, 5, 'disponible', NULL),
(18, 6, 'disponible', NULL),
(19, 6, 'disponible', NULL),
(20, 6, 'disponible', NULL),
(21, 6, 'disponible', NULL),
(22, 7, 'disponible', NULL),
(23, 8, 'disponible', NULL),
(24, 8, 'disponible', NULL),
(25, 8, 'disponible', NULL),
(26, 9, 'disponible', NULL),
(27, 9, 'disponible', NULL),
(28, 9, 'disponible', NULL),
(29, 10, 'disponible', NULL),
(30, 11, 'disponible', NULL),
(31, 11, 'disponible', NULL),
(32, 11, 'disponible', NULL),
(33, 12, 'disponible', NULL),
(34, 12, 'disponible', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
