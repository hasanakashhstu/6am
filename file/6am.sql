-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2022 at 04:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, 'hasan akash', 'hasanakash0215@gmail.com', '01521469280', '$2y$10$KCdUn3memQhTyIHaAuOctOVi7W1PZg1CDzYL0q1lEd1r/Pg2vKJNy', '2022-02-11 07:52:50', '2022-02-11 07:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admins_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `admins_id`, `name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md. Tariqul Islam', 'hasanakash0215@gmail.com', '01521469280', '$2y$10$CXohcgk3i0JndNPyTnydX.Yu5fa.TnrS9B7LAR5kJdQ21YyznthEq', '2022-02-11 07:53:14', '2022-02-11 07:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_12_31_051631_create_admins_table', 1),
(10, '2022_02_11_030948_create_employees_table', 1),
(11, '2014_10_12_000000_create_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'yhcOMnjDB7Pkd4MLNwDymubs8AIOw6atmhCkFPT3', NULL, 'http://localhost', 1, 0, 0, '2022-02-11 07:44:14', '2022-02-11 07:44:14'),
(2, NULL, 'Laravel Password Grant Client', 'wkl2WlS4SFmTqKdLOLSI7v7R8spz7k8B5fLMiRNb', 'users', 'http://localhost', 0, 1, 0, '2022-02-11 07:44:14', '2022-02-11 07:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-02-11 07:44:14', '2022-02-11 07:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `password`, `token`, `verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md. Tariqul Islam', 'hasanakash0215@gmail.com', NULL, '01521469280', '$2y$10$Wf9Ona0mq89eToZJ/tgZ8uoMtLcL2yhXqa2HJYLx3JyieZbEtcRUm', '04d1da5008722c4ebc78c78065bf045b', '0', NULL, '2022-02-11 08:28:54', '2022-02-11 08:28:54'),
(2, 'a', 'a@gmail.com', NULL, '5177777434', '$2y$10$iGuJgJ1axzum6QU6BSjpBuVm3p9SZutev9i7gfcI/XvbvRdziNvZ6', '5b42c04fe9ade5f0120ad5c1511a1f54', '0', NULL, NULL, NULL),
(3, 'b', 'b@gmail.com', NULL, '4177777434', '$2y$10$zkRn36.zlrF0q/6J3fW9R.0MWY4gTGj/3ZfgQGZ6GK4vdwTnERBOu', '312c1c65f92b16e719bb20682123c6b2', '0', NULL, NULL, NULL),
(4, 'c', 'c@gmail.com', NULL, '3177777434', '$2y$10$4SsBvYeJmjOtRqDWu4Mq7OenMfnKU2k7oLogXwa1BZmiVh7gbWham', '16bd07023034f3e137e4deb45215d0d1', '0', NULL, NULL, NULL),
(5, 'd', 'd@gmail.com', NULL, '2177777434', '$2y$10$7ekDWyJSnvgg.rROh1K3COa.day5T2EHAJiSWEKKvZh2FwdxvdRf6', '27569d4c07e0930d7252a98f4cebd1fa', '0', NULL, NULL, NULL),
(6, 'e', 'e@gmail.com', NULL, '1177777434', '$2y$10$Mhz6jOtwwJ1Gfa4njuqKb.GnSrpNbigBJcjMLU6ImYH.HQVLj3P1O', '2545b9a9b1835cc3a07ba016a78ebdf3', '0', NULL, NULL, NULL),
(7, 'f', 'f@gmail.com', NULL, '1777774341', '$2y$10$7Np5Pwk6AYWS5XSGKR2LyekSVKqwa.fRei9tPDxk24M3R/8h3uMCa', '2bd97efb0c9621e6a161b5562a87e334', '0', NULL, NULL, NULL),
(8, 'g', 'g@gmail.com', NULL, '17777734167', '$2y$10$sopgUj6QTBjkYsL8UrqA5etPxoouRaZJyTHggUfb32TelMzUYr77y', 'c1c09649d1b3d9e640bb3da8925a1307', '0', NULL, NULL, NULL),
(9, 'h', 'h@gmail.com', NULL, '17777174341', '$2y$10$jWMccYiocVjaHVU/ITLAveBOkdZFqhOPfdEN09sOANM7F815itS8a', '35f2068df47ca9c1535baa135bf0de2b', '0', NULL, NULL, NULL),
(10, 'i', 'i@gmail.com', NULL, '17677674341', '$2y$10$SWXykeI3BQT.Wvr.tHcACOAUdSo5zZRBKa6Q28yGDQBODWmDbhhuS', '78c797bb8fbc8e7ca8b9b4366d81aa1e', '0', NULL, NULL, NULL),
(11, 'j', 'j@gmail.com', NULL, '17777673341', '$2y$10$.8UvZK0ZATwMUoHzbmhF5OKU/fWDHvrXbD/ygb8fjGGBcky3ghoFG', '4fffff9e487ba4b120d6166b9c51f98e', '0', NULL, NULL, NULL),
(12, 'rahim', 'rahim@gmail.com', NULL, '1720000000', '$2y$10$d6r09f74oiVpon3pZsNa1uCqKBJ3NfMggSLKyipAZzTzKy2QMLka6', '5cef0ead6f91fd252d484baa77136caf', '0', NULL, NULL, NULL),
(13, 'karim', 'karim@gmail.com', NULL, '1721111111', '$2y$10$AlsWZIFW2bF.7Pc7b7Pqn.QSMvtJdPF9Aci6JGqukplD.V1u2MRJO', '0bae820c5957a6a78f1553a00ea925b5', '0', NULL, NULL, NULL),
(14, 'kamal', 'kamal@gmail.com', NULL, '1722222222', '$2y$10$82Qge0/kk3Q8xCfcbYTxWeRmxrqUuCncqmKkdTCYnJs0CIcJ48euC', '973fbe048584832dc4a774ba6c124ff8', '0', NULL, NULL, NULL),
(15, 'jamal', 'jamal@gmail.com', NULL, '1723333333', '$2y$10$eNdcdW6encgku64TzDNpzeLeqYJ/0HejYJ9RSB8AaD/bQh1maM0m.', '194b7351de90ea8cec422abfcdf2e3b0', '0', NULL, NULL, NULL),
(16, 'alal', 'alal@gmail.com', NULL, '1724444444', '$2y$10$scLeYPWufwrEYHAEcmn6DuwzIroRN8rQcSNHW/S0DnZaHyFi6l4SW', '29edd2fc5c34feae88fd4dfc383014a2', '0', NULL, NULL, NULL),
(17, 'dulal', 'dulal@gmail.com', NULL, '1725555555', '$2y$10$hDxkpX/pQLaFuRc9w3a/veptQUPX6N306eQv1i3EmLchc7BnNrm9m', '46504a263c4a2f24bc253b7439f919f0', '0', NULL, NULL, NULL),
(18, 'rafiq', 'rafiq@gmail.com', NULL, '1726666666', '$2y$10$8Zb2l4a7NcpsarwTtrFKoesfbtRSdO.B6LX3z5f..J7gK4Q8S1vXe', 'a7f26b60b87f7bc00f692efede9c5239', '0', NULL, NULL, NULL),
(19, 'safiq', 'safiq@gmail.com', NULL, '1727777777', '$2y$10$C8cIlt9nPauGYwMXyGwPDu5IIiNSc2PZPToiyLws5sSa2DOzCqtai', 'f4679dc994dfaa1eec01329e0fd8117f', '0', NULL, NULL, NULL),
(20, 'sohel', 'sohel@gmail.com', NULL, '1728888888', '$2y$10$GtYQcFzMmLzAc71AKk5d3OfKUxZt6O4Jvl5JGonxDCawUcfcXA2iy', '5088b74e86540ff3ee63d0fd6c4600ff', '0', NULL, NULL, NULL),
(21, 'rubel', 'rubel@gmail.com', NULL, '1729999999', '$2y$10$6OU/FqaqvIvE/j3/IuFo/eRoeZt.TCNz2bTSj5qpGKRXh/JN9wsZ6', 'da884e94dc26f466eefd0e7f51c6d200', '0', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_admins_id_foreign` (`admins_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_admins_id_foreign` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
