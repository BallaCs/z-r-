-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Ápr 10. 21:33
-- Kiszolgáló verziója: 10.1.37-MariaDB
-- PHP verzió: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zarodoga`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `album`
--

CREATE TABLE `album` (
  `Album_ID` int(6) NOT NULL,
  `albumNev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `album`
--

INSERT INTO `album` (`Album_ID`, `albumNev`) VALUES
(1, 'Csani'),
(2, 'EgyÃ©b'),
(3, 'SzÃ¡ntÃ³');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kep`
--

CREATE TABLE `kep` (
  `Kep_ID` int(6) NOT NULL,
  `utvonal` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Album_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kep`
--

INSERT INTO `kep` (`Kep_ID`, `utvonal`, `Album_ID`) VALUES
(4, 'assets/kepek/5cadbd44cc6675.83910324.jpg', 1),
(5, 'assets/kepek/5cadbd44efa8d2.94863710.png', 1),
(7, 'assets/kepek/5cadc1e9070599.23815502.jpg', 1),
(8, 'assets/kepek/5cadc213b95bd8.18086998.jpg', 1),
(10, 'assets/kepek/5cadf890462030.10198409.jpg', 1),
(11, 'assets/kepek/5cae02a4b2a9a9.56060225.jpg', 1),
(12, 'assets/kepek/5cae02b8b87684.82260556.jpg', 1),
(13, 'assets/kepek/5cae2d20bcf667.09815177.jpg', 1),
(14, 'assets/kepek/5cae40fd22a5f8.54722684.jpg', 2),
(15, 'assets/kepek/5cae40fd44a766.81307304.jpg', 2),
(16, 'assets/kepek/5cae40fd5dc946.76014997.jpg', 2),
(17, 'assets/kepek/5cae41bbe54415.65979546.jpg', 3),
(18, 'assets/kepek/5cae41bc094a56.68798884.jpg', 3),
(19, 'assets/kepek/5cae41bc141181.81667424.jpg', 3),
(20, 'assets/kepek/5cae42408dc8d1.64897792.jpg', 1),
(21, 'assets/kepek/5cae4240a45e51.51831570.jpg', 1),
(22, 'assets/kepek/5cae42aec21d02.27727579.jpg', 3),
(23, 'assets/kepek/5cae4305e5b261.83840093.jpg', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `linkmegoszt`
--

CREATE TABLE `linkmegoszt` (
  `Link_ID` int(6) NOT NULL,
  `link` varchar(250) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` int(1) DEFAULT NULL,
  `link_kep` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `link_cim` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `link_text` varchar(200) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `linkmegoszt`
--

INSERT INTO `linkmegoszt` (`Link_ID`, `link`, `tipus`, `link_kep`, `link_cim`, `link_text`) VALUES
(1, 'https://ujforras.hu/la-belle-indifference/', 1, 'https://ujforras.hu/wp-content/uploads/2018/10/kepi_lelegeztetes.jpg', 'La belle indifference', 'KÃ©pi lÃ©legeztetÃ©s (17) (Domokos JohannÃ¡nak) spuren sind verlÃ¤ssiger als zeugen a szalagcÃ­m mÃ¡r megint csak neki olvasÃ³barÃ¡t igaz a keresÅ‘programok'),
(2, 'https://www.webslake.com/p/generating-link-preview-using-php/', 2, 'https://www.webslake.com/w_img/t_i/lpw.png', 'Generating link preview using php - Webslake', 'To generate preview for a link we need to parse the link/url &amp; get content of file located at the url and then using pattern matching we can get title, description and image associated with the li'),
(4, 'https://ujforras.hu/ufo-felszaz-hegedus-gyongyi-fotonaploja/', 3, 'https://ujforras.hu/wp-content/uploads/2019/04/10-DSC_0121.jpg', 'ÃšFo FÃ©lszÃ¡z &#8211; HegedÅ±s GyÃ¶ngyi fotÃ³naplÃ³ja', ''),
(5, 'https://ujforras.hu/megszunt-penznem/', 3, 'https://ujforras.hu/wp-content/uploads/2018/10/kepi_lelegeztetes.jpg', 'MegszÅ±nt pÃ©nznem', 'KÃ©pi lÃ©legeztetÃ©s (10) T. D. 80 az elsÅ‘ hÃ³ban minden nyom felÃ© jÃ¶n gondolhatnÃ¡ rossz irÃ¡nyban halad de nem tÃ©vedhet'),
(6, 'https://ujforras.hu/komparasztika/', 4, 'https://ujforras.hu/wp-content/uploads/2018/10/kepi_lelegeztetes.jpg', 'Komparasztika', 'KÃ©pi lÃ©legeztetÃ©s (12) ez is csak isten sara ha neki salingerrÅ‘l legelÅ‘szÃ¶r az jut eszÃ©be hogy milyen jÃ³l Ã¡llt neki'),
(7, 'https://ujforras.hu/a-nap-amikor-nem-faj-semmi/', 1, 'https://ujforras.hu/wp-content/uploads/2018/08/kepi_lelegeztetes.jpg', 'A nap amikor nem fÃ¡j semmi', 'KÃ©pi lÃ©legeztetÃ©s (11) van mikor csak annyit tud magÃ¡rÃ³l hogy nagyon elfÃ¡radt de a fÃ©lkegyelmÅ±t mÃ©g Ã©pp annyi ideig hallgatja');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post`
--

CREATE TABLE `post` (
  `Post_ID` int(6) NOT NULL,
  `cim` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `szoveg` text COLLATE utf8_hungarian_ci,
  `vers` tinyint(1) DEFAULT NULL,
  `video` varchar(40) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `Kep_ID` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `post`
--

INSERT INTO `post` (`Post_ID`, `cim`, `szoveg`, `vers`, `video`, `datum`, `Kep_ID`) VALUES
(3, 'CsanÃ¡d', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit velit, vehicula sit amet lacinia eget, sodales id velit. Mauris a commodo metus, ac porttitor lacus. Nulla neque odio, viverra ac arcu facilisis, tincidunt viverra velit. Etiam semper consequat nisl sed elementum. In id sem laoreet, semper nisl vitae, posuere diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in finibus erat. Proin suscipit gravida nisi, sed egestas felis lobortis vitae. Sed malesuada felis odio, ac consectetur felis pretium eget. Nunc at commodo diam, id molestie tortor.\r\n\r\nMorbi et porttitor justo. Integer turpis sapien, pulvinar quis erat eu, fringilla porttitor elit. Vestibulum metus metus, tempor vitae erat eu, ullamcorper accumsan ligula. Vestibulum sagittis mauris sed risus accumsan tempus. Donec sed mauris nec metus vehicula egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet neque tempus, malesuada erat vel, dignissim nibh. Nulla et accumsan nunc, id aliquet libero. Aliquam erat volutpat.\r\n\r\nSed aliquet lacinia posuere. Fusce eget orci ligula. Quisque molestie nunc et felis suscipit, a bibendum odio tincidunt. Donec gravida libero at porttitor consectetur. Duis justo elit, posuere sed nisl in, pellentesque vestibulum augue. Sed sapien augue, porta in tincidunt in, tempus dictum sem. Sed id sollicitudin felis, eu maximus magna. Aenean nec odio lorem. Nunc egestas augue elit, at bibendum tortor tincidunt sed. Mauris sollicitudin sem in augue varius, nec interdum dui interdum. Nulla ac ex at est maximus feugiat eget eu lectus. Donec fermentum lectus in dictum iaculis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 0, '', '2019-04-10', 11),
(4, 'Valami', 'AkÃ¡rmi', 0, '', '2019-04-10', 12),
(6, 'A fekete zongora', 'Bolond hangszer: sÃ­r, nyerit Ã©s bÃºg.\r\nFusson, akinek nincs bora,\r\nEz a fekete zongora.\r\nVak mestere tÃ©pi, cibÃ¡lja,\r\nEz az Ã‰let melÃ³diÃ¡ja.\r\nEz a fekete zongora.\r\n\r\nFejem zÃºgÃ¡sa, szemem kÃ¶nnye,\r\nTornÃ¡zÃ³ vÃ¡gyaim tora,\r\nEz mind, mind: ez a zongora.\r\nBoros, bolond szivemnek vÃ©re\r\nKiÃ¶mlik az Å‘ Ã¼temÃ©re.\r\nEz a fekete zongora.', 1, 'IUADrfxaAWc', '2019-04-10', 13),
(7, 'sfdds', 'Morbi et porttitor justo. Integer turpis sapien, pulvinar quis erat eu, fringilla porttitor elit. Vestibulum metus metus, tempor vitae erat eu, ullamcorper accumsan ligula. Vestibulum sagittis mauris sed risus accumsan tempus. Donec sed mauris nec metus vehicula egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet neque tempus, malesuada erat vel, dignissim nibh. Nulla et accumsan nunc, id aliquet libero. Aliquam erat volutpat.', 0, '', '2019-04-10', 22),
(8, 'Jonah Hill', 'Things can\'t get worse as Jeffrey (Jonah Hill) embarrasses himself at dinner... that is until he learns his boss (Beck Bennett), coworker (Kenan Thompson), and their wives (Kate McKinnon, Aidy Bryant) can hear him berating himself in the bathroom. [Season 39, 2014]', 1, 'SzaIlHybawg', '2019-04-10', 23);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szerkeszto`
--

CREATE TABLE `szerkeszto` (
  `FelhasznaloNev` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `Jelszo` varchar(80) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szerkeszto`
--

INSERT INTO `szerkeszto` (`FelhasznaloNev`, `Jelszo`) VALUES
('bora', '2f712f2b4c17b108f5961465d36a19c98301c173');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`Album_ID`);

--
-- A tábla indexei `kep`
--
ALTER TABLE `kep`
  ADD PRIMARY KEY (`Kep_ID`),
  ADD KEY `Album_ID` (`Album_ID`);

--
-- A tábla indexei `linkmegoszt`
--
ALTER TABLE `linkmegoszt`
  ADD PRIMARY KEY (`Link_ID`);

--
-- A tábla indexei `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Post_ID`),
  ADD KEY `Kep_ID` (`Kep_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `album`
--
ALTER TABLE `album`
  MODIFY `Album_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kep`
--
ALTER TABLE `kep`
  MODIFY `Kep_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `linkmegoszt`
--
ALTER TABLE `linkmegoszt`
  MODIFY `Link_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `post`
--
ALTER TABLE `post`
  MODIFY `Post_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kep`
--
ALTER TABLE `kep`
  ADD CONSTRAINT `kep_ibfk_1` FOREIGN KEY (`Album_ID`) REFERENCES `album` (`Album_ID`);

--
-- Megkötések a táblához `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Kep_ID`) REFERENCES `kep` (`Kep_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
