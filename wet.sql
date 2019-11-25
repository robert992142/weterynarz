-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Lis 2019, 22:07
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `animal_wet`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `Imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Telefon` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `PESEL` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `id_weterynarza` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`Imie`, `Nazwisko`, `Telefon`, `PESEL`, `id_weterynarza`, `id_klienta`) VALUES
('Kamil', 'Adamski', '123123123', '64011342342', 1, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `Nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Dawkowanie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `id_leki` int(11) NOT NULL,
  `id_notatki` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notatka`
--

CREATE TABLE `notatka` (
  `Treść` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `Kategoria` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `id_notatki` int(11) NOT NULL,
  `id_zwierzaka` int(11) NOT NULL,
  `id_leki` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usluga`
--

CREATE TABLE `usluga` (
  `Cena` decimal(10,0) NOT NULL,
  `Data_wykonania` date NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `id_uslugi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weterynarz`
--

CREATE TABLE `weterynarz` (
  `Imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `id_weterynarza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `weterynarz`
--

INSERT INTO `weterynarz` (`Imie`, `Nazwisko`, `id_weterynarza`) VALUES
('Kamil', 'Kowalski', 1),
('Marian', 'Bridge', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwierzak`
--

CREATE TABLE `zwierzak` (
  `Imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Waga` decimal(10,0) NOT NULL,
  `Rasa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Gatunek` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `id_zwierzaka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`),
  ADD KEY `id_weterynarza` (`id_weterynarza`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`id_leki`),
  ADD KEY `id_notatki` (`id_notatki`);

--
-- Indeksy dla tabeli `notatka`
--
ALTER TABLE `notatka`
  ADD PRIMARY KEY (`id_notatki`),
  ADD KEY `id_zwierzaka` (`id_zwierzaka`),
  ADD KEY `id_leki` (`id_leki`);

--
-- Indeksy dla tabeli `usluga`
--
ALTER TABLE `usluga`
  ADD PRIMARY KEY (`id_uslugi`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- Indeksy dla tabeli `weterynarz`
--
ALTER TABLE `weterynarz`
  ADD PRIMARY KEY (`id_weterynarza`);

--
-- Indeksy dla tabeli `zwierzak`
--
ALTER TABLE `zwierzak`
  ADD PRIMARY KEY (`id_zwierzaka`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `id_leki` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `notatka`
--
ALTER TABLE `notatka`
  MODIFY `id_notatki` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `usluga`
--
ALTER TABLE `usluga`
  MODIFY `id_uslugi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `weterynarz`
--
ALTER TABLE `weterynarz`
  MODIFY `id_weterynarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zwierzak`
--
ALTER TABLE `zwierzak`
  MODIFY `id_zwierzaka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
