SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `lager`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE IF NOT EXISTS `artikel` (
  `ean` bigint(13) unsigned NOT NULL,
  `name` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `kategorie` int(11) DEFAULT NULL,
  `minBestand` smallint(5) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`ean`, `name`, `kategorie`, `minBestand`) VALUES
(20348458, 'Milchreis golden sun', 5, 0),
(20526276, 'Milbona – Süßrahmbutter', 5, 0),
(23253629, 'Expressi Kaffee Sirup', 5, 0),
(40298412, 'Fuchs Gyros Würzer', 5, 0),
(4001257218404, 'Meßmer Tee Feinster Earl Grey  25 Beutel à 1,75 g', 5, 0),
(4001726271008, 'DIAMANT Gelierzucker 3:1', 5, 0),
(4001743047037, 'Bensdorp - Kakaopulver', 5, 0),
(4004817000600, 'Barney''s Best Peanut Butter creamy 350 g', 5, 0),
(4006248121046, 'Windsor-Castle English Breakfast Tea, Tüte, 100 g', 5, 0),
(4006402090010, 'Frische Alpenmilch der Bergader Bauern', 5, 0),
(4008400404127, 'Ferrero - Nutella', 5, 0),
(4023900541547, 'Bamboo Garden Thai Fischsauce', 5, 0),
(4037300039153, 'Erasco Heisse Tasse Thai Curry Thailänd. Currysuppe, 57,6 g', 5, 0),
(4305615181905, 'Enerbio – Akazienhonig', 5, 0),
(4305615248202, 'Blütenbalance  King''s Crown', 5, 0),
(4388844021525, 'Cocktail Soße', 5, 0),
(4388844022140, 'REWE bio Müsli Hafer Crunchy', 5, 0),
(4388844031685, 'ja! Zarte Haferflocken', 5, 0),
(4388844061996, 'Senf mittelscharf', 5, 0),
(4388844141094, 'Rewe Beste Wahl Schoko Müsli', 5, 0),
(8715035110106, 'Kikkoman Soja-Sauce Tischspender', 5, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE IF NOT EXISTS `kategorie` (
`id` int(10) unsigned NOT NULL,
  `kategorie` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `ablaufwochen` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `kategorie`, `ablaufwochen`) VALUES
(1, 'Milch', 2),
(2, 'Müsli', 50),
(3, 'Softdrinks', 50),
(4, 'Knäckebrot', 25),
(5, 'Standard', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lagerbestand`
--

CREATE TABLE IF NOT EXISTS `lagerbestand` (
`id` int(10) unsigned NOT NULL,
  `ean` bigint(13) unsigned NOT NULL DEFAULT '0',
  `bestand` smallint(5) unsigned DEFAULT NULL,
  `aufnahmedatum` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `lagerbestand`
--

INSERT INTO `lagerbestand` (`id`, `ean`, `bestand`, `aufnahmedatum`) VALUES
(6, 4008400404127, 2, '2017-02-19'),
(7, 4305615181905, 3, '2017-02-19'),
(8, 4006248121046, 1, '2017-02-19'),
(9, 4388844022140, 1, '2017-02-19'),
(10, 4388844141094, 3, '2017-02-19'),
(11, 4006402090010, 2, '2017-02-19'),
(12, 4023900541547, 1, '2017-02-19'),
(13, 8715035110106, 1, '2017-02-19'),
(14, 4001257218404, 1, '2017-02-19'),
(15, 40298412, 1, '2017-02-19'),
(16, 23253629, 1, '2017-02-19'),
(17, 4388844031685, 1, '2017-02-19'),
(18, 4001743047037, 1, '2017-02-19'),
(19, 4305615248202, 1, '2017-02-19'),
(20, 4001726271008, 1, '2017-02-19'),
(21, 20348458, 1, '2017-02-19'),
(22, 4037300039153, 1, '2017-02-19'),
(23, 20526276, 1, '2017-02-19'),
(24, 4388844061996, 1, '2017-02-19'),
(25, 4388844021525, 1, '2017-02-19'),
(26, 4004817000600, 1, '2017-02-19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen`
--

CREATE TABLE IF NOT EXISTS `notizen` (
  `idartikel` int(10) unsigned NOT NULL,
  `notiz` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
 ADD PRIMARY KEY (`ean`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `lagerbestand`
--
ALTER TABLE `lagerbestand`
 ADD PRIMARY KEY (`id`,`ean`), ADD KEY `ean_idx` (`ean`);

--
-- Indizes für die Tabelle `notizen`
--
ALTER TABLE `notizen`
 ADD PRIMARY KEY (`idartikel`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `lagerbestand`
--
ALTER TABLE `lagerbestand`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `lagerbestand`
--
ALTER TABLE `lagerbestand`
ADD CONSTRAINT `ean` FOREIGN KEY (`ean`) REFERENCES `artikel` (`ean`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `notizen`
--
ALTER TABLE `notizen`
ADD CONSTRAINT `id` FOREIGN KEY (`idartikel`) REFERENCES `lagerbestand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
