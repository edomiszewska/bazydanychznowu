-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Lut 2024, 13:02
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ciucholand2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `klienci_id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `miasto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurierzy`
--

CREATE TABLE `kurierzy` (
  `kurier_id` int(11) NOT NULL,
  `firma_kurierska` enum('DHL','INPOST','ORLEN') NOT NULL,
  `data` date NOT NULL,
  `klienci_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `personel_id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `pozycja` enum('menadzer','sprzedawca','kasjer','magazynier') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `placówki`
--

CREATE TABLE `placówki` (
  `placowki_id` int(11) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `wojewodztwo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ubrania`
--

CREATE TABLE `ubrania` (
  `ubranie_id` int(11) NOT NULL,
  `typ ubrania` varchar(50) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `płeć` enum('kobieta','mezczyzna') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `zamowienie_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `klienci_id` int(11) NOT NULL,
  `kurier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klienci_id`);

--
-- Indeksy dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  ADD PRIMARY KEY (`kurier_id`),
  ADD KEY `klienci_id` (`klienci_id`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`personel_id`);

--
-- Indeksy dla tabeli `placówki`
--
ALTER TABLE `placówki`
  ADD PRIMARY KEY (`placowki_id`);

--
-- Indeksy dla tabeli `ubrania`
--
ALTER TABLE `ubrania`
  ADD PRIMARY KEY (`ubranie_id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `klienci_id` (`klienci_id`),
  ADD KEY `kurier_id` (`kurier_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klienci_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  MODIFY `kurier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `personel`
--
ALTER TABLE `personel`
  MODIFY `personel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `placówki`
--
ALTER TABLE `placówki`
  MODIFY `placowki_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `ubrania`
--
ALTER TABLE `ubrania`
  MODIFY `ubranie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  ADD CONSTRAINT `kurierzy_ibfk_1` FOREIGN KEY (`klienci_id`) REFERENCES `klienci` (`klienci_id`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klienci_id`) REFERENCES `klienci` (`klienci_id`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`kurier_id`) REFERENCES `kurierzy` (`kurier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
