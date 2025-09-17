-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Sze 17. 12:08
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `hazahozlak`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adoptions`
--

CREATE TABLE `adoptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `adopted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `adoptions`
--

INSERT INTO `adoptions` (`id`, `user_id`, `animal_id`, `adopted_at`) VALUES
(1, 1, 1, '2025-09-12 06:54:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adoption_requests`
--

CREATE TABLE `adoption_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `status` enum('approved','rejected','pending') DEFAULT 'pending',
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `adoption_requests`
--

INSERT INTO `adoption_requests` (`id`, `user_id`, `animal_id`, `status`, `message`, `created_at`) VALUES
(1, 1, 1, 'pending', 'Szeretn??m ??r??kbe fogadni Buksit, r??g??ta keresek kuty??t.', '2025-09-12 06:54:19'),
(2, 3, 2, 'pending', 'Z??ldi nagyon tetszik, szeretn??k h??ll??t tartani.', '2025-09-12 06:54:19'),
(3, 1, 5, 'pending', 'Mogyor??t a gyerekemnek szeretn??m.', '2025-09-12 06:54:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL,
  `breed_id` int(11) NOT NULL,
  `age` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` enum('Hím','Nőstény') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Available','Pending','Adopted') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `animals`
--

INSERT INTO `animals` (`id`, `shelter_id`, `species_id`, `breed_id`, `age`, `name`, `picture`, `gender`, `description`, `status`) VALUES
(1, 1, 3, 5, '2 év', 'Buksi', 'buksi.jpg', 'Hím', 'Barátságos francia bulldog', 'Available'),
(2, 1, 2, 3, '1 év', 'Zöldi', 'zoldi.jpg', 'Nőstény', 'Fiatal agáma, kézhez szokott', 'Available'),
(3, 2, 4, 8, '3 év', 'Cirmi', 'cirmi.jpg', 'Nőstény', 'Maine Coon, nyugodt természetű', 'Available'),
(4, 2, 1, 1, '5 év', 'Fekete', 'fekete.jpg', 'Hím', 'Lipicai ló, jó kondícióban', 'Available'),
(5, 1, 5, 10, '6 hónap', 'Mogyoró', 'mogyoro.jpg', 'Nőstény', 'Tengerimalac gyerekek mellé', 'Available'),
(6, 2, 2, 13, '2 év', 'Teki', 'teki.jpg', 'Hím', 'Közepes méretű teknős, nyugodt', 'Available'),
(7, 3, 2, 4, '5', 'Loki', 'loki.jpg', 'Nőstény', 'Félénk Falánk, Barátságtalan gekkóka', 'Available');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` enum('scheduled','completed','canceled') DEFAULT 'scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `animal_id`, `date`, `time`, `status`, `created_at`) VALUES
(1, 1, 1, '2025-09-15', '10:00:00', 'scheduled', '2025-09-12 06:54:19'),
(2, 3, 2, '2025-09-16', '14:00:00', 'scheduled', '2025-09-12 06:54:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `breeds`
--

CREATE TABLE `breeds` (
  `id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `breeds`
--

INSERT INTO `breeds` (`id`, `species_id`, `name`) VALUES
(1, 1, 'Lipicai'),
(2, 1, 'Fr??z'),
(3, 2, 'Agáma'),
(4, 2, 'Leop??rd gekk??'),
(5, 3, 'Francia bulldog'),
(6, 3, 'Labrador'),
(7, 3, 'Border collie'),
(8, 4, 'Maine Coon'),
(9, 4, 'Szi??mi'),
(10, 5, 'Tengerimalac'),
(11, 5, 'H??rcs??g'),
(12, 6, 'Papag??j'),
(13, 2, 'Teknős');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` enum('Pending','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `donations`
--

INSERT INTO `donations` (`id`, `user_id`, `shelter_id`, `amount`, `status`, `created_at`) VALUES
(1, 2, 1, 5000, 'Completed', '2025-09-12 06:54:19'),
(2, 3, 2, 3000, 'Pending', '2025-09-12 06:54:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `animal_id`, `created_at`) VALUES
(1, 5, 1, '2025-09-17 09:17:00'),
(2, 5, 2, '2025-09-17 09:19:23'),
(3, 5, 3, '2025-09-17 09:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `shelters`
--

CREATE TABLE `shelters` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `shelters`
--

INSERT INTO `shelters` (`id`, `name`, `location`, `contact_email`, `email`, `password`, `description`, `created_at`, `remember_token`) VALUES
(1, 'Kaposvári Állatvédők', 'Kaposvár, Somogy', 'info@kaposvariallatvedok.hu', NULL, NULL, 'Kaposvßr k÷rnyÚki ßllatok mentÚse Ús ÷r÷kbeadßsa', '2025-09-12 06:54:19', ''),
(2, 'Budapesti Menhely', 'Budapest, Pest', 'hello@budapestimenhely.hu', NULL, NULL, 'F§vßrosi ßllatment§ k÷zpont', '2025-09-12 06:54:19', ''),
(3, 'Berzei Ferret Lak', '7454 Somodor József Attila utca 8', 'cinkikukac@gmail.com', 'cinkikukac@gmail.com', '$2y$10$wclvVZQG.S7oa1ZUvsYeG.FeOFSpPdV944FnL.ZVMvlok1Xt71I4C', 'Egy Varázslatos Állatmenhely büdi kis kedvenceinknek', '2025-09-16 10:32:59', '9FkHQesWJaaqgPHprQkjXLbIwDxugiZ6sTqN3rJIHvkSbWiXENoTWD2ods7D');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species`
--

CREATE TABLE `species` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `species`
--

INSERT INTO `species` (`id`, `name`) VALUES
(1, 'Lovak'),
(2, 'Hüllők és kétéltűek'),
(3, 'Kutyák'),
(4, 'Macskák'),
(5, 'Kisemlősök'),
(6, 'Madarak'),
(7, 'Egyéb');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `role`, `email`, `password`, `created_at`, `remember_token`) VALUES
(1, 'Anna', 'Kov??cs', 'user', 'anna@example.com', 'hashedpassword1', '2025-09-12 06:54:19', ''),
(2, 'Bence', 'Nagy', 'admin', 'bence@example.com', 'hashedpassword2', '2025-09-12 06:54:19', ''),
(3, 'D??ra', 'T??th', 'user', 'dora@example.com', 'hashedpassword3', '2025-09-12 06:54:19', ''),
(4, 'Nem', 'Dóra', 'user', 'nemdoratoth@gmail.com', '$2y$10$8UOyGFSfreHIQ1S5N.s45ehgQhSQTKfH6Bx8nb2uxGzkFr8LPVwRi', '2025-09-16 08:35:48', '6BMPPGvMti3lut8LadSdjLY4xjoJvhdsacgpcnLQslT0RvArJO7V2PZHTY1u'),
(5, 'Berze', 'Nem', 'user', 'Nem@gmail.com', '$2y$10$9wQgNX9W7VlzrqJejJffwu2n2QfcKYqCi8QZ53Kikn9bT4C8jTwa2', '2025-09-17 06:54:53', 'UEKGb30SqiQPW4y6UKDNd2HktdnCh4LxKcXiAJHfxqKybZ5UmH34RoyGz8Bp');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `animal_id` (`animal_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `adoption_requests`
--
ALTER TABLE `adoption_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- A tábla indexei `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shelter_id` (`shelter_id`),
  ADD KEY `species_id` (`species_id`),
  ADD KEY `breed_id` (`breed_id`);

--
-- A tábla indexei `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- A tábla indexei `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `species_id` (`species_id`);

--
-- A tábla indexei `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shelter_id` (`shelter_id`);

--
-- A tábla indexei `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_animal_unique` (`user_id`,`animal_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `shelters`
--
ALTER TABLE `shelters`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `adoption_requests`
--
ALTER TABLE `adoption_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `shelters`
--
ALTER TABLE `shelters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `species`
--
ALTER TABLE `species`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `adoptions_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);

--
-- Megkötések a táblához `adoption_requests`
--
ALTER TABLE `adoption_requests`
  ADD CONSTRAINT `adoption_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `adoption_requests_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);

--
-- Megkötések a táblához `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`),
  ADD CONSTRAINT `animals_ibfk_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`),
  ADD CONSTRAINT `animals_ibfk_3` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`);

--
-- Megkötések a táblához `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);

--
-- Megkötések a táblához `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `breeds_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`);

--
-- Megkötések a táblához `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`);

--
-- Megkötések a táblához `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_animal_id_foreign` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
