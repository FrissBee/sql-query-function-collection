-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Nov 2023 um 00:43
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `test_standardqueries`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `attributions`
--

CREATE TABLE `attributions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `attributions`
--

INSERT INTO `attributions` (`id`, `name`) VALUES
(1, 'Language'),
(2, 'Framework'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `content_page` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `projects`
--

INSERT INTO `projects` (`id`, `name`, `public`, `content_page`) VALUES
(1, 'Projekt Name 1', 1, 'Text 1'),
(2, 'Project Name 2', 1, 'Text 2'),
(3, 'Project Name 3', 0, 'Text 3'),
(4, 'Project Name 4', 1, 'Text 4'),
(5, 'Project Name 5', 1, 'Text 5'),
(6, 'Project Name 6', 0, 'Text 6'),
(7, 'Project Name 7', 1, 'Text 7'),
(8, 'Project Name 8', 1, 'Text 8'),
(9, 'Project Name 9', 0, 'Text 9');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projects_softwares`
--

CREATE TABLE `projects_softwares` (
  `id` int(11) NOT NULL,
  `projects_id` int(11) DEFAULT NULL,
  `softwares_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `projects_softwares`
--

INSERT INTO `projects_softwares` (`id`, `projects_id`, `softwares_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 5, 5),
(8, 5, 1),
(9, 5, 3),
(10, 6, 1),
(11, 6, 2),
(12, 7, 1),
(13, 7, 2),
(14, 8, 1),
(15, 8, 2),
(16, 9, 1),
(17, 9, 2),
(18, 1, 5),
(19, 1, 1),
(20, 1, 3),
(21, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projects_technologies`
--

CREATE TABLE `projects_technologies` (
  `id` int(11) NOT NULL,
  `projects_id` int(11) DEFAULT NULL,
  `technologies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `projects_technologies`
--

INSERT INTO `projects_technologies` (`id`, `projects_id`, `technologies_id`) VALUES
(1, 4, 18),
(2, 4, 2),
(3, 4, 19),
(4, 4, 1),
(5, 4, 4),
(6, 4, 16),
(7, 4, 5),
(8, 4, 17),
(9, 4, 3),
(10, 2, 6),
(11, 2, 2),
(12, 2, 1),
(13, 2, 4),
(14, 2, 16),
(15, 2, 5),
(16, 2, 3),
(17, 3, 6),
(18, 3, 2),
(19, 3, 1),
(20, 3, 4),
(21, 3, 3),
(22, 3, 14),
(23, 5, 28),
(24, 5, 6),
(25, 5, 2),
(26, 5, 19),
(27, 5, 4),
(28, 5, 16),
(29, 5, 3),
(30, 6, 6),
(31, 6, 18),
(32, 6, 2),
(33, 6, 19),
(34, 6, 1),
(35, 6, 4),
(36, 6, 16),
(37, 6, 5),
(38, 6, 17),
(39, 6, 3),
(40, 6, 14),
(41, 6, 7),
(42, 6, 22),
(43, 7, 18),
(44, 7, 2),
(45, 7, 19),
(46, 7, 1),
(47, 7, 4),
(48, 7, 16),
(49, 7, 5),
(50, 7, 17),
(51, 7, 3),
(52, 7, 15),
(53, 7, 7),
(54, 7, 21),
(55, 7, 22),
(56, 8, 6),
(57, 8, 2),
(58, 8, 19),
(59, 8, 1),
(60, 8, 4),
(61, 8, 16),
(62, 8, 5),
(63, 8, 17),
(64, 8, 3),
(65, 8, 7),
(66, 8, 21),
(67, 9, 6),
(68, 9, 2),
(69, 9, 19),
(70, 9, 1),
(71, 9, 16),
(72, 9, 17),
(73, 9, 3),
(74, 9, 15),
(75, 9, 7),
(76, 9, 21),
(77, 1, 20),
(78, 1, 6),
(79, 1, 2),
(80, 1, 19),
(81, 1, 1),
(82, 1, 4),
(83, 1, 16),
(84, 1, 5),
(85, 1, 17),
(86, 1, 3),
(87, 1, 11),
(88, 1, 14),
(89, 1, 21);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `softwares`
--

CREATE TABLE `softwares` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `softwares`
--

INSERT INTO `softwares` (`id`, `name`) VALUES
(4, 'Bootstrap Studio'),
(1, 'MS Visual Studio Code'),
(3, 'PhotoShop'),
(2, 'phpMyAdmin'),
(5, 'PhpStorm');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `technologies`
--

CREATE TABLE `technologies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `attributions_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `technologies`
--

INSERT INTO `technologies` (`id`, `name`, `attributions_id`) VALUES
(1, 'HTML', 1),
(2, 'CSS', 1),
(3, 'PHP', 1),
(4, 'JavaScript', 1),
(5, 'MySQL', 1),
(6, 'Bootstrap', 2),
(7, 'Vue.js', 2),
(8, 'Vuex.js', 2),
(9, 'Redux.js', 2),
(10, 'Nuxt.js', 2),
(11, 'React', 2),
(12, 'Next.js', 2),
(13, 'Laravel', 2),
(14, 'SASS', 3),
(15, 'SCSS', 3),
(16, 'jQuery', 3),
(17, 'npm', 3),
(18, 'Composer', 3),
(19, 'Gulp', 3),
(20, 'Axios', 3),
(21, 'Webpack', 3),
(22, 'WordPress', 3),
(23, 'Vite.js', 3),
(24, 'Parcel', 3),
(25, 'Node.js', 2),
(26, 'Fetch API', 3),
(27, 'TypeScript', 1),
(28, 'animate.css', 3),
(29, 'JSON', 3),
(30, 'Web Components', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$P2Xfnnuegotvd4l5eBZYh.f.HmddsiwD3RCuxpLlrmhxxLd9wZuBa'),
(2, 'John', '$2y$10$KLam1wxxMUVnF0JR0BOZSumo93AzyMQO0fCZ8V7YiF1lOZAwHTrSm');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `attributions`
--
ALTER TABLE `attributions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `projects_softwares`
--
ALTER TABLE `projects_softwares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_software_ibfk_1` (`projects_id`),
  ADD KEY `project_software_ibfk_2` (`softwares_id`);

--
-- Indizes für die Tabelle `projects_technologies`
--
ALTER TABLE `projects_technologies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_technology_ibfk_1` (`projects_id`),
  ADD KEY `project_technology_ibfk_2` (`technologies_id`);

--
-- Indizes für die Tabelle `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `attribution_id` (`attributions_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `attributions`
--
ALTER TABLE `attributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `projects_softwares`
--
ALTER TABLE `projects_softwares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `projects_technologies`
--
ALTER TABLE `projects_technologies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT für Tabelle `softwares`
--
ALTER TABLE `softwares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `projects_softwares`
--
ALTER TABLE `projects_softwares`
  ADD CONSTRAINT `projects_softwares_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `projects_softwares_ibfk_2` FOREIGN KEY (`softwares_id`) REFERENCES `softwares` (`id`);

--
-- Constraints der Tabelle `projects_technologies`
--
ALTER TABLE `projects_technologies`
  ADD CONSTRAINT `projects_technologies_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `projects_technologies_ibfk_2` FOREIGN KEY (`technologies_id`) REFERENCES `technologies` (`id`);

--
-- Constraints der Tabelle `technologies`
--
ALTER TABLE `technologies`
  ADD CONSTRAINT `technologies_ibfk_1` FOREIGN KEY (`attributions_id`) REFERENCES `attributions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
