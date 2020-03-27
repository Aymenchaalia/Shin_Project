-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 25 Mars 2020 à 14:52
-- Version du serveur :  5.7.29-0ubuntu0.18.04.1
-- Version de PHP :  7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `shiny`
--

-- --------------------------------------------------------

--
-- Structure de la table `Paper`
--

CREATE TABLE `Paper` (
  `idPaper` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `authors` varchar(45) NOT NULL,
  `abstract` varchar(70) NOT NULL,
  `BMC` varchar(45) NOT NULL,
  `Impact_factor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Paper`
--
ALTER TABLE `Paper`
  ADD PRIMARY KEY (`idPaper`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Paper`
--
ALTER TABLE `Paper`
  MODIFY `idPaper` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
