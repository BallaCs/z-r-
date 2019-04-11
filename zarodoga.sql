-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Ápr 11. 13:48
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kep`
--

CREATE TABLE `kep` (
  `Kep_ID` int(6) NOT NULL,
  `utvonal` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Album_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

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
  `utvonal` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `post`
--

INSERT INTO `post` (`Post_ID`, `cim`, `szoveg`, `vers`, `video`, `utvonal`, `datum`) VALUES
(9, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare, orci et rhoncus viverra, est ipsum luctus mauris, maximus commodo odio erat ut ex. Mauris a scelerisque est. Suspendisse sapien odio, feugiat et sapien at, efficitur mollis massa. Curabitur a accumsan lacus. Cras sagittis sapien ac enim sollicitudin, sed venenatis sem sagittis. Nulla blandit, ante eget tristique cursus, lectus nibh placerat orci, id blandit leo est eu leo. Phasellus blandit nunc in massa semper, sit amet porta justo placerat. Duis posuere diam nec lectus suscipit molestie. Suspendisse efficitur quam sit amet ante sodales, a rhoncus enim mattis. Suspendisse mollis ullamcorper nulla at viverra. Vestibulum viverra, nisl quis aliquam efficitur, sem sapien porttitor mi, fringilla hendrerit diam est ut nunc.', 0, '', 'assets/kepek-poszt/5caf25b934dd05.57597390.jpg', '2019-04-11');

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
  ADD PRIMARY KEY (`Post_ID`);

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
  MODIFY `Post_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kep`
--
ALTER TABLE `kep`
  ADD CONSTRAINT `kep_ibfk_1` FOREIGN KEY (`Album_ID`) REFERENCES `album` (`Album_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
