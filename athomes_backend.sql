-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 04:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `athomes_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('2b2f18bb79bcb74744e7c8bcdfac0d57', 'i:1;', 1747460587),
('2b2f18bb79bcb74744e7c8bcdfac0d57:timer', 'i:1747460587;', 1747460587),
('3OGm74ckwyzueSgp', 's:7:\"forever\";', 2062381408),
('5106d9e900fea72d67ac6144b1e9087b', 'i:3;', 1747790530),
('5106d9e900fea72d67ac6144b1e9087b:timer', 'i:1747790530;', 1747790530),
('6be3b7554e87809766d1fb5c5526fc46', 'i:1;', 1747447045),
('6be3b7554e87809766d1fb5c5526fc46:timer', 'i:1747447045;', 1747447045),
('7c2150d7106073168321f39ec452420d', 'i:2;', 1747897948),
('7c2150d7106073168321f39ec452420d:timer', 'i:1747897948;', 1747897948),
('85b37bf281c1bd108007d9bfa273144f', 'i:2;', 1747895590),
('85b37bf281c1bd108007d9bfa273144f:timer', 'i:1747895590;', 1747895590),
('88d742c0f23af84aad10b04cc67c3aa9', 'i:1;', 1747961854),
('88d742c0f23af84aad10b04cc67c3aa9:timer', 'i:1747961854;', 1747961854),
('939abff055cdfde6a8672e5e935b00a9', 'i:2;', 1747816252),
('939abff055cdfde6a8672e5e935b00a9:timer', 'i:1747816252;', 1747816252),
('9opZlLnY56B9Lw1D', 's:7:\"forever\";', 2062381383),
('aJLvTmCbFlEP8bhK', 's:7:\"forever\";', 2062388046),
('b37e2b0b86a8368405df02e0b66d0b39', 'i:2;', 1747983998),
('b37e2b0b86a8368405df02e0b66d0b39:timer', 'i:1747983998;', 1747983998),
('c2cdce04d4e11e11f0c054d165dd51a8', 'i:1;', 1747493170),
('c2cdce04d4e11e11f0c054d165dd51a8:timer', 'i:1747493170;', 1747493170),
('DarMvcWKilS90GnC', 's:7:\"forever\";', 2062381111),
('db7f84b2743acf6dfb00d829b77a7cfc', 'i:1;', 1747629794),
('db7f84b2743acf6dfb00d829b77a7cfc:timer', 'i:1747629794;', 1747629794),
('dxlUe8mpVwrNcKvz', 's:7:\"forever\";', 2062380187),
('e7cf66797159dc3cd3e85f72e15bb551', 'i:8;', 1747990397),
('e7cf66797159dc3cd3e85f72e15bb551:timer', 'i:1747990397;', 1747990397),
('e9b6cc1432541b9ceebf113eee05eeba', 'i:5;', 1747456680),
('e9b6cc1432541b9ceebf113eee05eeba:timer', 'i:1747456680;', 1747456680),
('mrSvWbo3lYyV4KIr', 's:7:\"forever\";', 2062377618),
('N0e24z1fmLAIfRqt', 's:7:\"forever\";', 2062387990),
('oXtuGXP7oTpc9tTm', 's:7:\"forever\";', 2062377320),
('Pfs6RwNYItL6WB3B', 's:7:\"forever\";', 2062377867),
('SUVVA8JwgDsmIxZT', 's:7:\"forever\";', 2062387511),
('vFxvIm6di466Syeg', 's:7:\"forever\";', 2062381142),
('yX5gWvdSswYKtSmt', 's:7:\"forever\";', 2062380866);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dev_name` varchar(255) NOT NULL,
  `dev_email` varchar(255) NOT NULL,
  `dev_phone` varchar(255) NOT NULL,
  `dev_location` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = active 1 = Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`id`, `dev_name`, `dev_email`, `dev_phone`, `dev_location`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Johndorf', 'johndord@gmail.com', '09358554308', 'CDO', 'developer_images/1747444983_303024585_534311655163745_6742593555067438817_n.jpg', 0, '2025-05-08 05:44:17', '2025-05-16 17:23:03'),
(2, 'Avida land corporation', 'avidaland@gmail.com', '09263351414', 'Cagayan de Oro', 'developer_images/1747448944_fae38dc4-c8dc-4c8e-ae62-d659d5d19ec5.jpg', 0, '2025-05-11 19:02:41', '2025-05-16 18:29:04'),
(3, 'Camella homes', 'camella@gmail.com', '09358554398', 'Cagayan de Oro', 'developer_images/1747449467_IMG_5329.jpeg', 0, '2025-05-16 18:33:06', '2025-05-16 18:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identity_details`
--

CREATE TABLE `identity_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `prc_liscence_number` varchar(255) NOT NULL,
  `dhsud_registration_number` varchar(255) NOT NULL,
  `validation_date` varchar(255) DEFAULT NULL,
  `last_school_att` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `identity_details`
--

INSERT INTO `identity_details` (`id`, `user_id`, `prc_liscence_number`, `dhsud_registration_number`, `validation_date`, `last_school_att`, `created_at`, `updated_at`) VALUES
(2, 6, 'Trfjjgc-12345', 'Ndjfj-8373636', '2025-05-31', 'Southern Philippines College', '2025-03-19 23:32:10', '2025-05-09 09:09:52'),
(3, 7, 'djcfbhsjh4754567', '353535trefv5465', '2025-05-31', 'Southern Philippines College', '2025-03-19 23:56:36', '2025-05-11 18:46:10'),
(4, 8, 'efee4t4grg5ysdcsc', 'scsw-575675757fbrfscscsc', '2025-03-29', 'Southern Philippines College', '2025-03-20 00:09:49', '2025-05-16 18:24:59'),
(5, 9, 'efee4t-sdfs21324', 'grgr4t5464-scsf43646', '2025-03-21', 'Southern Philippines College', '2025-03-20 00:15:25', '2025-05-09 08:52:24'),
(7, 11, 'wfe-3435-eff', '2422e', '09-06-1998', 'XYZ University', '2025-03-20 00:18:45', '2025-03-20 00:18:45'),
(9, 13, 'efee4t4grg5y', 'grgr4t54645654trg', '28-03-2025', 'Southern Philippines College', '2025-03-20 00:24:15', '2025-03-20 00:24:15'),
(11, 15, 'efee4t4grg5y', 'grgr4t54645654trg', '27-03-2025', 'Southern Philippines College', '2025-03-20 00:51:28', '2025-03-20 00:51:28'),
(12, 16, 'efee4t-5757', 'grgr4t546-dg46467', '2025-05-31', 'Southern Philippines College', '2025-03-20 07:02:45', '2025-05-09 08:48:06'),
(13, 17, 'efee4t4grg5y', 'grgr4t54645654trg', '28-03-2025', 'Southern Philippines College', '2025-03-20 07:05:14', '2025-03-20 07:05:14'),
(14, 18, 'dbvfb-546573f', 'grgr4t54-dgr5575675', '2025-05-24', 'Southern Philippines College', '2025-03-20 07:08:32', '2025-05-09 08:39:48'),
(15, 19, 'efft4t4-grg5y', 'scsw-575675757fbrf', '2025-05-23', 'Southern Philippines College', '2025-03-20 07:17:12', '2025-05-09 08:39:16'),
(16, 20, '', '', NULL, 'Southern Philippines College', '2025-03-23 05:08:21', '2025-03-23 05:08:21'),
(17, 21, 'efee4t4grg5y', 'grgr4t54645654trg', '25-03-2025', 'Southern Philippines College', '2025-03-23 20:33:22', '2025-03-23 20:33:22'),
(18, 22, 'efee4-dgve4646', 'grgr4t5464-545vd46', '2025-05-31', 'Southern Philippines College', '2025-03-31 19:21:50', '2025-05-09 08:40:36'),
(19, 23, 'rgrgrgrgr-547657', 'adadawdfe-13354', '21-03-2025', 'Xavier Universitry', '2025-05-08 06:34:59', '2025-05-09 08:20:27'),
(20, 24, 'efee4-dgve4789', 'grgr4t546-dg46789', '31-05-2025', 'Southern Philippines College', '2025-05-10 04:21:49', '2025-05-10 04:21:49'),
(21, 25, '1234', '1234', '12-05-2028', 'Tagoloan Comminity College', '2025-05-11 18:39:06', '2025-05-11 18:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(23, '0001_01_01_000000_create_users_table', 1),
(24, '0001_01_01_000001_create_cache_table', 1),
(25, '0001_01_01_000002_create_jobs_table', 1),
(26, '2025_01_31_050928_create_personal_access_tokens_table', 1),
(27, '2025_03_20_050947_create_p_info_table', 2),
(28, '2025_03_20_054920_create_identity_details_table', 3),
(29, '2025_01_31_063854_create_personal_access_tokens_table', 4),
(30, '2025_01_31_131021_create_developer_housing_table', 4),
(31, '2025_02_08_043459_create_personal_access_tokens_table', 5),
(34, '2025_04_01_022743_create_developer_images_table', 7),
(45, '2025_04_17_043139_create_sales_encodings_table', 18),
(48, '2025_03_26_164320_create_project_details_table', 21),
(49, '2025_03_26_163357_create_developer_table', 22),
(52, '2025_05_14_044614_create_personal_access_tokens_table', 25),
(54, '2025_04_18_135213_create_property_listings_table', 27),
(55, '2025_04_18_135912_create_property_images_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('aldin@gmail.com', '$2y$12$1tFoqPax32XQN2gH7ksf4e1WxNVe6mRgDxLcIb3mELvjh1bRBoAIy', '2025-05-13 07:19:36'),
('ryan.reyes@dict.gov.ph', '$2y$12$H0EqE/IXG/E.UJt468vSp.qzEVsce0eUOFWd8vmG3mZIBnrfeNbs6', '2025-05-13 07:17:27'),
('ryanjaytagolimotreyes@gmail.com', '$2y$12$o.LWNqbpQEgTrAzI/s4En.zgpobg5Hpxywl8tFNEJblNvgzX2n.iS', '2025-05-16 17:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(6, 'App\\Models\\User', 2, 'auth_token', '409ae12365449a27eac163a820ef8bd9e06c41d2081e2050a364aa0c812f5990', '[\"*\"]', '2025-05-16 19:16:45', NULL, '2025-05-16 17:40:02', '2025-05-16 19:16:45'),
(13, 'App\\Models\\User', 7, 'auth_token', 'e9db26e205e019d0e27a26b24bdbde5158df1df4440a7e21ade38108c22aeca8', '[\"*\"]', '2025-05-16 22:08:34', NULL, '2025-05-16 20:21:55', '2025-05-16 22:08:34'),
(18, 'App\\Models\\User', 6, 'auth_token', 'c58e004ca34583f350adc203f68b2bf767f22e099cda59f9170d7181e661bee6', '[\"*\"]', '2025-05-16 21:17:37', NULL, '2025-05-16 21:14:06', '2025-05-16 21:17:37'),
(19, 'App\\Models\\User', 6, 'auth_token', 'a8dba76e38f4e953a190a80e0a7a04088389f8ca9cc80d81d4b5dd9a6302a098', '[\"*\"]', NULL, NULL, '2025-05-16 21:14:15', '2025-05-16 21:14:15'),
(20, 'App\\Models\\User', 6, 'auth_token', '8894b368927d3dbc7bef6a345fecd9ca6bebc0c1bff6faf349199566a9412dea', '[\"*\"]', NULL, NULL, '2025-05-16 21:15:18', '2025-05-16 21:15:18'),
(22, 'App\\Models\\User', 6, 'auth_token', '70b44801644e69ca4d59152a3891c7a03240dcd32e1b39c8b70417106f9d412c', '[\"*\"]', '2025-05-16 21:22:30', NULL, '2025-05-16 21:22:22', '2025-05-16 21:22:30'),
(23, 'App\\Models\\User', 6, 'auth_token', '54fcdbfac86348f44fad30dc24a6201dbdcb8cb86aafbb7d2f9b0fc23192465a', '[\"*\"]', '2025-05-16 21:22:52', NULL, '2025-05-16 21:22:30', '2025-05-16 21:22:52'),
(24, 'App\\Models\\User', 6, 'auth_token', 'a584b6c3e7bff96648ae1abf3e23eb4729b976b9f5c20c5d91a90d739fbf6e6a', '[\"*\"]', '2025-05-16 21:22:54', NULL, '2025-05-16 21:22:52', '2025-05-16 21:22:54'),
(25, 'App\\Models\\User', 6, 'auth_token', '74672bd956e76e38869d511a0987b0dc1db43aabc7be1073fe992d009f50dae0', '[\"*\"]', '2025-05-16 21:23:08', NULL, '2025-05-16 21:22:54', '2025-05-16 21:23:08'),
(26, 'App\\Models\\User', 6, 'auth_token', '2f34374bb28b44f927b3ae30d58410da1f5cee65fe016662663e6792296b1045', '[\"*\"]', '2025-05-16 21:24:15', NULL, '2025-05-16 21:23:08', '2025-05-16 21:24:15'),
(27, 'App\\Models\\User', 6, 'auth_token', '96deda72d4635dedf4a5f92d0dc1a50480cd4c4f5c41255cd4646f1679a01294', '[\"*\"]', '2025-05-16 21:24:27', NULL, '2025-05-16 21:24:15', '2025-05-16 21:24:27'),
(30, 'App\\Models\\User', 6, 'auth_token', '5c428de90261c3792a62f69e3d058c8fe759f96baa78abeeafe89dfb36f91f3c', '[\"*\"]', '2025-05-16 21:29:36', NULL, '2025-05-16 21:29:25', '2025-05-16 21:29:36'),
(38, 'App\\Models\\User', 6, 'auth_token', '39df9ffa31f1deffbb221bf77fd110ed2e1210725f8793729a2ca0130ce3c263', '[\"*\"]', '2025-05-16 22:01:07', NULL, '2025-05-16 21:39:50', '2025-05-16 22:01:07'),
(39, 'App\\Models\\User', 6, 'auth_token', '8f750b3ebbbc43294ca1838b36325366fb7fd5e270f1ac89228d78cff9d69b84', '[\"*\"]', '2025-05-16 21:48:05', NULL, '2025-05-16 21:42:07', '2025-05-16 21:48:05'),
(40, 'App\\Models\\User', 6, 'auth_token', '63987b95540515831b4c02d58c7e1e90eb75ca8bd69634f5225bc0669b392ce1', '[\"*\"]', '2025-05-16 22:01:31', NULL, '2025-05-16 22:01:23', '2025-05-16 22:01:31'),
(41, 'App\\Models\\User', 7, 'auth_token', '00eaebbaa121386b9563ec5fdb27697e17cbfbd0fca933b4cff80f247cb7e73c', '[\"*\"]', '2025-05-16 22:01:43', NULL, '2025-05-16 22:01:39', '2025-05-16 22:01:43'),
(42, 'App\\Models\\User', 8, 'auth_token', 'a0f6bfc7d7fbeb9f229e2805d8aeeb0cb258d2a01fb3404d54738f29d3320348', '[\"*\"]', '2025-05-16 22:04:32', NULL, '2025-05-16 22:02:03', '2025-05-16 22:04:32'),
(43, 'App\\Models\\User', 8, 'auth_token', 'adf440a7a06d4f5626730f051e5a59d71e0090d40c89b74572ab2c8c2b795b89', '[\"*\"]', '2025-05-16 22:06:02', NULL, '2025-05-16 22:04:52', '2025-05-16 22:06:02'),
(44, 'App\\Models\\User', 6, 'auth_token', '23065f68d38f6f5fa489f886ff085e08b8311cf504d2070ef7419f04d3833eeb', '[\"*\"]', '2025-05-16 22:06:18', NULL, '2025-05-16 22:06:14', '2025-05-16 22:06:18'),
(45, 'App\\Models\\User', 6, 'auth_token', '2852b006ee387b372202afd703c322a066fc34e6fc6e3e6ad81f1ae515c9c90e', '[\"*\"]', '2025-05-16 22:06:46', NULL, '2025-05-16 22:06:31', '2025-05-16 22:06:46'),
(47, 'App\\Models\\User', 7, 'auth_token', '6629c895769bb59e0ce82d3fee85ccbcd32c96c28ace35d9cb433e20d5c47c30', '[\"*\"]', '2025-05-16 22:10:39', NULL, '2025-05-16 22:08:43', '2025-05-16 22:10:39'),
(48, 'App\\Models\\User', 8, 'auth_token', 'bba625981a6293c137d25efe24a4ff160219f8b08023a1909277d74711b0e80f', '[\"*\"]', '2025-05-16 22:12:36', NULL, '2025-05-16 22:10:54', '2025-05-16 22:12:36'),
(49, 'App\\Models\\User', 6, 'auth_token', '0ceb2689fd3934c085a1d0470dfc7576bbb568019efa181b7109548ea03b8e09', '[\"*\"]', '2025-05-16 22:15:49', NULL, '2025-05-16 22:12:49', '2025-05-16 22:15:49'),
(50, 'App\\Models\\User', 7, 'auth_token', '87442662a4762258fd53cb1c49604a755a1d5487344d8190f4c229fdc8ea1100', '[\"*\"]', '2025-05-16 22:17:37', NULL, '2025-05-16 22:16:02', '2025-05-16 22:17:37'),
(51, 'App\\Models\\User', 8, 'auth_token', '684fcf7c797b7f40995405e2fb1a8208cfd7e78c879423bf926885e27dc87b9a', '[\"*\"]', '2025-05-16 22:18:08', NULL, '2025-05-16 22:17:48', '2025-05-16 22:18:08'),
(66, 'App\\Models\\User', 7, 'auth_token', '1d4914eeb615183a6a4841367b7865d8d462ef5ffcc3e3a430b8d109aea6c3d0', '[\"*\"]', '2025-05-17 06:31:32', NULL, '2025-05-17 06:28:03', '2025-05-17 06:31:32'),
(67, 'App\\Models\\User', 6, 'auth_token', '2992f2c33e5d070adc563b86bc2cfc2b92c6c596c4fd0c2426c4f11d96234d8d', '[\"*\"]', '2025-05-17 06:42:52', NULL, '2025-05-17 06:29:25', '2025-05-17 06:42:52'),
(68, 'App\\Models\\User', 8, 'auth_token', '71a8b820778390afb4c1b43c18472b07bf7cbcce8df463c9834c6861a31502d1', '[\"*\"]', '2025-05-17 06:35:22', NULL, '2025-05-17 06:29:52', '2025-05-17 06:35:22'),
(69, 'App\\Models\\User', 6, 'auth_token', 'b73962a62380d63f8b17d215a56af46e0d79d73bb6efe4531f8a6708ac95a410', '[\"*\"]', '2025-05-17 06:30:44', NULL, '2025-05-17 06:30:40', '2025-05-17 06:30:44'),
(70, 'App\\Models\\User', 7, 'auth_token', '182000e7fef488b2879484bf36b7a0e5715bba5c5ff5b776a66ff240d4f45378', '[\"*\"]', '2025-05-17 06:31:43', NULL, '2025-05-17 06:31:42', '2025-05-17 06:31:43'),
(71, 'App\\Models\\User', 7, 'auth_token', '9195c97d614dbddc36ef9fe8fa20cb3874da1793b13c76c633d16c72b19622a2', '[\"*\"]', '2025-05-17 06:38:52', NULL, '2025-05-17 06:37:27', '2025-05-17 06:38:52'),
(72, 'App\\Models\\User', 8, 'auth_token', 'fdf63d0a86ac8a4da9d11ceef738681bf9028880844d57723badf38d26c45d51', '[\"*\"]', '2025-05-17 06:39:14', NULL, '2025-05-17 06:39:03', '2025-05-17 06:39:14'),
(73, 'App\\Models\\User', 7, 'auth_token', '38c1338fec69be514132ab2ececb20ff315556874d3bdad0e1c0157a7aeaaf8b', '[\"*\"]', '2025-05-17 06:41:47', NULL, '2025-05-17 06:40:00', '2025-05-17 06:41:47'),
(74, 'App\\Models\\User', 6, 'auth_token', '5e6bca47c9aeed897466cc032632666259041e715e5d6418755e3d14bbe15fdc', '[\"*\"]', '2025-05-17 06:42:26', NULL, '2025-05-17 06:41:17', '2025-05-17 06:42:26'),
(75, 'App\\Models\\User', 7, 'auth_token', '3e740ed657f50cf0e4ea08d5bb1e223885608608c9f8b71ea6e05c1813045522', '[\"*\"]', '2025-05-17 06:45:38', NULL, '2025-05-17 06:45:10', '2025-05-17 06:45:38'),
(76, 'App\\Models\\User', 6, 'auth_token', 'fa6c158490ffa38e2a091f61d8505dc92f735df4749506dece22dc577e5146f7', '[\"*\"]', '2025-05-21 00:56:36', NULL, '2025-05-18 20:42:17', '2025-05-21 00:56:36'),
(77, 'App\\Models\\User', 8, 'auth_token', 'e9064bf41e4d31d140955d235694ea69c74a1ebff533b3d4a480def7dddd86bd', '[\"*\"]', '2025-05-21 00:56:51', NULL, '2025-05-20 17:21:11', '2025-05-21 00:56:51'),
(78, 'App\\Models\\User', 7, 'auth_token', '464befbb7a72df92a7c628de4a547e0a8b4636ec33c6f3a72ebf088c34685786', '[\"*\"]', '2025-05-21 00:56:44', NULL, '2025-05-20 17:21:51', '2025-05-21 00:56:44'),
(79, 'App\\Models\\User', 7, 'auth_token', 'e7020a0e58077fbb80c809ea83c2ff00db3641e132eaa246843d6cdaed6aa52f', '[\"*\"]', '2025-05-21 00:27:33', NULL, '2025-05-21 00:26:32', '2025-05-21 00:27:33'),
(80, 'App\\Models\\User', 6, 'auth_token', '4e4801e8d4257b2f53c856b0039ad01c00274ce60cb48f952c9f7324ff0b90ce', '[\"*\"]', '2025-05-21 00:29:25', NULL, '2025-05-21 00:27:45', '2025-05-21 00:29:25'),
(81, 'App\\Models\\User', 7, 'auth_token', '8c1385c81f3a5ed71498f722923e13d0f38ed573b6adaacc2e03e33d0275aad8', '[\"*\"]', '2025-05-21 00:30:26', NULL, '2025-05-21 00:29:52', '2025-05-21 00:30:26'),
(82, 'App\\Models\\User', 6, 'auth_token', '281f9f162e43a55677c1334def714185e60cf08bfb0d51de1c04f6a65faf8110', '[\"*\"]', '2025-05-21 00:37:13', NULL, '2025-05-21 00:30:38', '2025-05-21 00:37:13'),
(83, 'App\\Models\\User', 6, 'auth_token', 'e4cb14febfbe0d2d012e0aab226ac8af6f7ee087de2b249745a15b6c26aaa587', '[\"*\"]', '2025-05-22 00:56:04', NULL, '2025-05-21 22:20:51', '2025-05-22 00:56:04'),
(84, 'App\\Models\\User', 6, 'auth_token', 'ebac83c45fe33f0730e61f2c6d635b8eb12eafed17a81846c0ba815135387e00', '[\"*\"]', '2025-05-21 22:31:39', NULL, '2025-05-21 22:31:30', '2025-05-21 22:31:39'),
(85, 'App\\Models\\User', 8, 'auth_token', '18262b3125ca8e3931997f80e7db1d5249d96e52e65bbaaa4a822b770994336c', '[\"*\"]', '2025-05-21 23:11:28', NULL, '2025-05-21 22:32:10', '2025-05-21 23:11:28'),
(86, 'App\\Models\\User', 7, 'auth_token', '31b88d98f352094f780ec67ea9b419b079b80ff505f232ef8a35ab7192b0d50b', '[\"*\"]', '2025-05-22 23:05:38', NULL, '2025-05-21 22:32:45', '2025-05-22 23:05:38'),
(87, 'App\\Models\\User', 6, 'auth_token', '31d0ee5ce6f6182eaf9c7d53a084c363ba53a22be23d52a393be212d756510cc', '[\"*\"]', '2025-05-23 00:52:18', NULL, '2025-05-22 16:56:35', '2025-05-23 00:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `developer_id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_location` varchar(255) NOT NULL,
  `project_category` varchar(255) NOT NULL,
  `total_units` int(11) NOT NULL,
  `available_units` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_details`
--

INSERT INTO `project_details` (`id`, `developer_id`, `project_name`, `project_location`, `project_category`, `total_units`, `available_units`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bellevue', 'Upper Carmen, Cagayan de Oro', 'House and lot', 100, 100, 'Planning', '2025-05-11 18:28:27', '2025-05-11 18:28:27'),
(2, 1, 'Golden Glow Village', 'Upper Carmen, Cagayan de Oro', 'Condominium/Apartment', 50, 50, 'Pre-Development', '2025-05-11 18:28:27', '2025-05-11 18:28:27'),
(3, 2, 'Aspira Tower', 'Cagayan de Oro', 'Condominium/Apartment', 300, 300, 'Ready for Occupancy', '2025-05-11 19:04:09', '2025-05-11 19:04:09'),
(4, 3, 'Camella Ceritos', 'Uptown CDO', 'House and lot', 100, 100, 'Pre-Development', '2025-05-22 17:32:51', '2025-05-22 17:32:51'),
(5, 3, 'Camella Greta', 'CDO Uptown', 'Condominium/Apartment', 100, 100, 'Ongoing', '2025-05-22 17:39:53', '2025-05-22 17:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `images`, `created_at`, `updated_at`) VALUES
(1, 1, 'property_images/1747443938_494325365_639397615770086_542534334084126404_n.jpg', '2025-05-16 17:05:38', '2025-05-16 17:05:38'),
(2, 1, 'property_images/1747443938_494814485_9766862713428573_2094112077946730909_n.jpg', '2025-05-16 17:05:38', '2025-05-16 17:05:38'),
(3, 1, 'property_images/1747443938_494817128_1193053808647490_2498692346832905686_n.jpg', '2025-05-16 17:05:38', '2025-05-16 17:05:38'),
(4, 2, 'property_images/1747444860_f6061bfd-e60d-49e9-a9c5-a8987208e14e.jpg', '2025-05-16 17:21:00', '2025-05-16 17:21:00'),
(5, 2, 'property_images/1747444860_484590799_1802454960520174_7462654808448639264_n.jpg', '2025-05-16 17:21:00', '2025-05-16 17:21:00'),
(6, 2, 'property_images/1747789621_494329324_724222580089626_520573923037205898_n.jpg', '2025-05-20 17:07:01', '2025-05-20 17:07:01'),
(7, 2, 'property_images/1747789621_494341233_554798251017131_7377296996547724807_n.jpg', '2025-05-20 17:07:01', '2025-05-20 17:07:01'),
(8, 2, 'property_images/1747789621_494330361_1870692077101598_8291018926752271468_n.jpg', '2025-05-20 17:07:01', '2025-05-20 17:07:01'),
(9, 3, 'property_images/1747789887_494329324_724222580089626_520573923037205898_n.jpg', '2025-05-20 17:11:27', '2025-05-20 17:11:27'),
(10, 3, 'property_images/1747789887_494341233_554798251017131_7377296996547724807_n.jpg', '2025-05-20 17:11:27', '2025-05-20 17:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `property_listings`
--

CREATE TABLE `property_listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `price_and_rate` double DEFAULT NULL,
  `date_listed` date NOT NULL,
  `lot_area` varchar(255) NOT NULL,
  `floor_area` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `type_of_listing` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_listings`
--

INSERT INTO `property_listings` (`id`, `category`, `price_and_rate`, `date_listed`, `lot_area`, `floor_area`, `details`, `location`, `type_of_listing`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Commercial Properties', 12000, '2025-05-17', '100', '100', '2 CR\r\n1 Bathroom', 'Cagayan de Oro', 'Exclusive', 'Not Sold', '2025-05-16 17:05:38', '2025-05-16 17:05:38'),
(2, 'Rental Properties', 10000, '2025-05-17', '200', '100', '1 CR', 'Cagayan de Oro', 'Exclusive', 'Not Sold', '2025-05-16 17:21:00', '2025-05-16 17:21:00'),
(3, 'Lot only', NULL, '2025-05-21', '100', '250', '1 mais', 'Cagayan de Oro', 'Exclusive', 'Not Sold', '2025-05-20 17:11:27', '2025-05-20 17:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `p_info`
--

CREATE TABLE `p_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `extension_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `complete_address` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_info`
--

INSERT INTO `p_info` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `extension_name`, `phone`, `gender`, `complete_address`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 5, 'John', '', 'Doe', '', '1234567890', 'male', '123 Main Street, City, Country', '', '2025-03-19 23:24:29', '2025-03-19 23:24:29'),
(2, 6, 'ryan', '', 'reyes', '', '09358554398', 'male', 'tagoloan misamis oriental', '', '2025-03-19 23:32:10', '2025-03-19 23:32:10'),
(3, 7, 'Venus', '', 'Reyes', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-19 23:56:36', '2025-03-19 23:56:36'),
(4, 8, 'Aldin', '', 'Tagolimot', '', '09358554398', 'female', 'tagoloan misamis oriental', '', '2025-03-20 00:09:49', '2025-03-20 00:09:49'),
(5, 9, 'Ricky', '', 'Reyes', '', '09358554398', 'male', 'Zone 1, Santa Ana', '', '2025-03-20 00:15:25', '2025-03-20 00:15:25'),
(6, 10, 'John', '', 'Doe', '', '1234567890', 'male', '123 Main Street, City, Country', '', '2025-03-20 00:17:07', '2025-03-20 00:17:07'),
(7, 11, 'John', '', 'Doe', '', '1234567890', 'male', '123 Main Street, City, Country', '', '2025-03-20 00:18:45', '2025-03-20 00:18:45'),
(8, 12, 'John', 'Tagolimot', 'Doe', 'Jr.', '1234567890', 'male', '123 Main Street, City, Country', '', '2025-03-20 00:22:30', '2025-03-20 00:22:30'),
(9, 13, 'Ian', 'Nico', 'Caulin', 'Jr.', '09358554398', 'male', 'tagoloan misamis oriental', '', '2025-03-20 00:24:15', '2025-03-20 00:24:15'),
(10, 14, 'Jason', 'L.', 'Llanes', 'Jr.', '09358554398', 'male', 'tagoloan misamis oriental', '', '2025-03-20 00:45:12', '2025-03-20 00:45:12'),
(11, 15, 'Sample', 'Tagolimot', 'Reyes', 'Jr.', '09358554398', 'male', 'Zone 1, Santa Ana', '', '2025-03-20 00:51:28', '2025-03-20 00:51:28'),
(12, 16, 'Renly', 'Tagolimot', 'Reyes', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-20 07:02:45', '2025-03-20 07:02:45'),
(13, 17, 'Ricky', 'Tagolimot', 'Reyes', 'Jr.', '09358554398', 'male', 'Zone 1, Santa Ana', '', '2025-03-20 07:05:14', '2025-03-20 07:05:14'),
(14, 18, 'Ginalyn', 'Tagolimot', 'Reyes', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-20 07:08:32', '2025-03-20 07:08:32'),
(15, 19, 'Giselle Jane', 'Tagolimot', 'Reyes', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-20 07:17:12', '2025-03-20 07:17:12'),
(16, 20, 'Lyzil', 'Tagolimot', 'Padera', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-23 05:08:21', '2025-03-23 05:08:21'),
(17, 21, 'Tadoy', 'Tagolimot', 'Reyes', 'Jr.', '09358554398', 'male', 'Zone 1, Santa Ana', '', '2025-03-23 20:33:22', '2025-03-23 20:33:22'),
(18, 22, 'Lyzil', 'Tagolimot', 'Padera', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-31 19:21:50', '2025-03-31 19:21:50'),
(19, 23, 'Reyson', '', 'Benedicto', '', '09876543212', 'male', 'Cagayan de Oro City', '', '2025-05-08 06:34:59', '2025-05-08 06:34:59'),
(20, 24, 'Jason', 'Tagolimot', 'Llanes', 'Jr.', '09358554398', 'male', 'Zone 1, Santa Ana Tagoloan Misamis Oriental', '', '2025-05-10 04:21:49', '2025-05-10 04:21:49'),
(21, 25, 'Bato', '', 'Dela Rose', '', '09156274213', 'male', 'Cagayan de Oro', '', '2025-05-11 18:39:06', '2025-05-11 18:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `sales_encodings`
--

CREATE TABLE `sales_encodings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `date_on_sale` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_encodings`
--

INSERT INTO `sales_encodings` (`id`, `agent_id`, `category`, `client_name`, `date_on_sale`, `amount`, `location`, `remarks`, `image`, `created_at`, `updated_at`) VALUES
(3, 18, 'Lot only', 'Paulas Zayas', '2025-05-12', 10000000.00, 'Tagoloan Misamis oriental', 'Not Sold', 'images/1746863986_496009673_122228909648233789_6735027208606461891_n.jpg', '2025-05-09 23:27:29', '2025-05-09 23:59:46'),
(4, 21, 'House and lot', 'Maria de La rosa', '2025-05-13', 2200000.00, 'TierraNava Tagoloan', 'Pre-Selling', 'images/1747018247_0a390f58-8834-417e-b439-2aba8a8b8721.jpg', '2025-05-11 18:50:17', '2025-05-11 18:50:47'),
(5, 19, 'Lot only', 'Jason Llanes', '2025-05-13', 10000000.00, 'Opol Misamis Oriental', 'Sold', 'images/1747147855_494815671_694279916320128_5392280086772437047_n.jpg', '2025-05-13 06:50:55', '2025-05-13 06:50:55'),
(6, 20, 'House and lot', 'Maya Onho', '2025-05-17', 10000000.00, 'Cagayan se Oro', 'Not Sold', 'images/1747449112_IMG_5329.jpeg', '2025-05-16 18:31:25', '2025-05-16 18:31:52'),
(7, 17, 'Condominium/Apartment', 'Paulas Zayas', '2025-05-19', 10000000.00, 'Tagoloan Misamis Oriental', 'Not Sold', 'images/1747790060_494329324_724222580089626_520573923037205898_n.jpg', '2025-05-18 20:47:08', '2025-05-20 17:14:20'),
(8, 3, 'House and lot', 'Paulas Zayas', '2025-05-21', 10000000.00, 'Opol misamis oriental', 'Not Sold', 'images/1747794677_494329324_724222580089626_520573923037205898_n.jpg', '2025-05-20 18:31:17', '2025-05-20 18:31:17'),
(9, 3, 'Condominium/Apartment', 'Paulas Zayas', '2025-05-21', 12000000.00, 'Lumbia CDO', 'Sold', 'images/1747795811_494328333_8389659334492080_3597666067216912070_n.jpg', '2025-05-20 18:50:11', '2025-05-20 18:50:11'),
(10, 3, 'Rental Properties', 'Paulas Zayas', '2025-05-21', 12000000.00, 'Opol misamis oriental', 'Not Sold', 'images/1747796522_494328182_674879152078344_1284409592881419922_n.jpg', '2025-05-20 19:02:02', '2025-05-20 19:02:02'),
(11, 3, 'Commercial Properties', 'Paulas Zayas', '2025-05-21', 14000000.00, 'Lumbia CDO', 'Not Sold', 'images/1747796648_494328130_1212467983847382_2836958540812487728_n.jpg', '2025-05-20 19:04:08', '2025-05-20 19:04:08'),
(12, 3, 'Rental Properties', 'Paulas Zayas', '2025-05-21', 12000000.00, 'Lumbia CDO', 'Sold', 'images/1747796737_494344157_987092493495212_553199359977409574_n.jpg', '2025-05-20 19:05:37', '2025-05-20 19:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2SLXnFl6d99uW3MQjpoMdDZNBjTLWwk9fXR3QRZK', NULL, '192.168.254.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFR4Rjh4aUVLclVCOWJEYTdtRjhtWDFXZnB5dDl4N05LWFFFTTZ5eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDQ6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1746859316),
('9O1Rmvj8RoFvPrwSGMSEHSQV45d5LmY2CG9i4AX1', NULL, '192.168.254.109', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY01hZ1Z4dUhCcURjU0x5N0d6RFYxYXg0R1IzdEJaNU9XYkpob29leCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747453113),
('eTT8NAe68xDrAjCa1aPuHFiZM8va1texrbhd5aQl', NULL, '192.168.254.108', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDFJTzExOWFxYU1MTm94SEgxT0ZEMnJCU3ZLeWJSWWR2dVlidU1pSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDg6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744899828),
('GbT2CK67jKBHma1C2fqiFliWoOtCwOhbfKxW2syc', NULL, '192.168.18.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUtqM2JhNWtkSlNNbjJVdlM3WnJXSDBxRGlMWUhvbTI0UFVWV3F0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xOTIuMTY4LjE4LjEyOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1743746756),
('kujMxiu4UaQrompA8ugMYDYuferrwdDTUXfMdtmj', NULL, '192.168.254.109', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFyVHlyZXZRUHhTRGhZTlhXV1FqYjhGYXJHYUc3UU9NU1M0TlY5VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDk6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747453170),
('tScZTYewsYfpQiu5ybyGAqEb9lgJL8AN2iaaEpZB', NULL, '192.168.18.130', 'PostmanRuntime/7.43.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFhOQmRNOHJNZG1aQ1R6NjJpcmVFSjhtWXFXbm93MmpINVY2ZENpaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjE4LjEzMDo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742455307),
('UzTmG6RKEgaEVe9GJOoOtyIbkNDMlTs31fPQDGqq', NULL, '192.168.254.109', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjhveG1CNHNsOG5tVjMyVnJKeUk4NG9ncWpaMTBiWjVZTjVaUjhXbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDk6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747452741),
('vJeR2yZsSfj8gSjya1N2u3ybREKD8gUY5NWfVUGZ', NULL, '192.168.254.111', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1NXVE5DaGJ6NjlNbkpSTkJ5ajFybmU4b21XZ3BPYW56M2pwVXZ0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMTE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743339047),
('wlA6ekU78rEBXf2G8VBrqHBqiAYUh410JWQeQwcD', NULL, '192.168.254.109', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaU1WdWZlQnBjb2pXV3Jod3JkVTEzd1RtTDF4M2hQYTRHMXBKTkUzQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747453170),
('WsET0A3yClYLynTkZnubAR75H8YGgIQU9IvP2ySy', NULL, '192.168.254.109', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjVCc09RUmdHcWtoQUpQdXVRVVIxYVpmQk42NzVZRTlwT2N6QmM1SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDk6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747453113);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `acct_number` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1 COMMENT '0 = admin 1 = agent/broker',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 = active 1 = Inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `acct_number`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'john_doe', 'john.doe12345@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$1gVHDiUnh1VkcLB/O3QKt.as/Uj1kjD1i3Suv2YdZcvxepmJCTNKu', 1, 1, NULL, '2025-03-19 23:24:29', '2025-03-19 23:24:29'),
(6, 'ryanreyes143', 'ryanjaytagolimotreyes@gmail.com', 'Acc-3ABY7FBZ2', NULL, '$2y$12$zBS4P3VbEmVwGWq6neY/guU6ymTSInNCHU66aXW2pivOj3NYWrJXG', 0, 0, NULL, '2025-03-19 23:32:10', '2025-05-16 21:29:36'),
(7, 'venus123', 'venus@gmail.com', 'Acc-HLSVI8350', NULL, '$2y$12$j1HZcZOgOTP3pNZkzriEcu1pPT3UJG9ZrjyHZnBj64Fjm/caD8icS', 1, 0, NULL, '2025-03-19 23:56:36', '2025-05-16 17:25:43'),
(8, 'aldin123', 'aldin@gmail.com', 'Acc-XATMH48PY', NULL, '$2y$12$1tYNQ6cOX9vIrnvruP6qL.NPdZvaLxReDNLVwhgjFFoeT4KjL6j3a', 2, 0, NULL, '2025-03-20 00:09:49', '2025-05-08 07:10:46'),
(9, 'riki123', 'riki@gmail.com', 'Acc-BYO0VTU86', NULL, '$2y$12$dZzbXtebVZLQ/dQzEPZIz.JiRDIOYECoJa3R4RYJ02fRwGw8oHmAG', 1, 0, NULL, '2025-03-20 00:15:25', '2025-05-08 07:21:10'),
(10, 'john_doe', 'john.doe12345678@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$MX949SneZtYSsYJ4fa.9ROqdEqvg9BBTo6bwW/rb2.OaMh2.o1zkO', 1, 1, NULL, '2025-03-20 00:17:07', '2025-03-20 00:17:07'),
(11, 'john_doe', 'john.doe123456798@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$yIk7GvsG.ZsAZleY1qSgiejxXWUuiCgkuEU3GiauoHWReC1/FSEB2', 1, 0, NULL, '2025-03-20 00:18:45', '2025-05-08 07:21:16'),
(12, 'john_doe', 'john.doe123456796668@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$FtUWi.Ps6MqUyMzzhz4EsO7bSOZJXefgcPKwDlVC5nzWCok/xgbG.', 1, 1, NULL, '2025-03-20 00:22:30', '2025-03-20 00:22:30'),
(13, 'ian123', 'ian@gmail.com', 'Acc-Q0LOC0YSE', NULL, '$2y$12$1bFMMz6S/lewEnESSP7CGOLPOV0EjTyrtQjiomZqRwwyDpK3LUTmW', 1, 0, NULL, '2025-03-20 00:24:15', '2025-05-08 07:21:02'),
(14, 'jason123', 'jason@gmail.com', 'Acc-6YP7CKCLY', NULL, '$2y$12$7MMvtFzmbHo7Rxz/8IccpO8Xb.qAkTHXCBLNnzToeGM..5gGqcIPK', 1, 0, NULL, '2025-03-20 00:45:12', '2025-05-08 07:18:13'),
(15, 'sample_123', 'sample123@gmail.com', 'Acc-RI5AE1JB1', NULL, '$2y$12$lKIPmXuI5FQ8w5vTOzzuQezcygwD9e.nCihGo86KZlUCiLcxbLeCS', 1, 0, NULL, '2025-03-20 00:51:28', '2025-05-08 07:18:07'),
(16, 'renly123', 'renly@gmail.com', 'Acc-RP390C5IB', NULL, '$2y$12$sv6xmzrla6sa3.gMHd4nKesKZSt0JiFbP8cojzDZy2ZaIJK9/o2tu', 2, 0, NULL, '2025-03-20 07:02:45', '2025-05-09 08:48:05'),
(17, 'ricky123', 'ricky@gmail.com', 'Acc-1U6L2HSKM', NULL, '$2y$12$XWciRwpNuo7cUQXSThqhSOXoo00qf/Nf8gFz9ms3WfcCFWgqXuCxe', 1, 0, NULL, '2025-03-20 07:05:14', '2025-05-08 07:17:23'),
(18, 'gina123', 'gina@gmail.com', 'Acc-3XBATUUF2', NULL, '$2y$12$wPgg0eo.YJHreTyrt.0P4.yUwnBNAbfepAILp60ATWnSetmjV4RqS', 1, 0, NULL, '2025-03-20 07:08:32', '2025-05-08 07:16:55'),
(19, 'titil123', 'titil@gmail.com', 'Acc-7VNUN2T7E', NULL, '$2y$12$6ZvaGDT0Dp3EFBvaMGVQL.Tz9b/GTEsvDuGoxWWXe08wnJQtPolPe', 1, 0, NULL, '2025-03-20 07:17:12', '2025-05-08 07:16:50'),
(20, 'lyzil123', 'lyzil@gmail.com', 'Acc-OMOUTQX0U', NULL, '$2y$12$wsDLhK30.OxNAKTZxoIYCegADZyRr5n8r2slWr7anNR3nJ5qM76yi', 1, 0, NULL, '2025-03-23 05:08:21', '2025-05-08 07:10:08'),
(21, 'tadoy123', 'tadoy@gmail.com', 'Acc-NM2URL63G', NULL, '$2y$12$cxTXclggp5Lp8AtCkgEbqeCCN42YDE0V/8MSWbKDNzG88ckUwd0AS', 2, 0, NULL, '2025-03-23 20:33:22', '2025-05-08 07:14:36'),
(22, 'lyzil1234', 'lyzil123@gmail.com', 'Acc-ZQQFCG080', NULL, '$2y$12$RLTp.8eqSDAce7P2YecCAObeXenflLLP4Z8yJswo2.aqheKvf8e7K', 2, 0, NULL, '2025-03-31 19:21:50', '2025-05-09 08:40:36'),
(23, 'reyson@athomes', 'reyson@gmail.com', 'Acc-431PDQ9VH', NULL, '$2y$12$Y6ChrvCINOKM8hHJAd78Ie0TH/X2kW75ZnN6w3F.YDnXAVAnntPLa', 2, 0, NULL, '2025-05-08 06:34:59', '2025-05-08 07:11:36'),
(24, 'jason123', 'jason123@gmail.com', 'Acc-RFT3QLR89', NULL, '$2y$12$RXgOOtaXCVxvCJzTwAx90OsRCOIjWOsCmT9llM2Wgj5J2Tgqmdb0u', 2, 0, NULL, '2025-05-10 04:21:49', '2025-05-16 18:12:01'),
(25, 'Bato23', 'batodelarosa@gmail.com', 'Acc-3MOXTVX5H', NULL, '$2y$12$bnGdX9gEEvv4jbFhw5336e1LQYoVRb6Ym4nb/Z9mI748xpNL7jC4.', 1, 0, NULL, '2025-05-11 18:39:06', '2025-05-16 18:20:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `developer_dev_email_unique` (`dev_email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `identity_details`
--
ALTER TABLE `identity_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identity_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `developer_id` (`developer_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_images_property_id_foreign` (`property_id`);

--
-- Indexes for table `property_listings`
--
ALTER TABLE `property_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_info`
--
ALTER TABLE `p_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_info_user_id_foreign` (`user_id`);

--
-- Indexes for table `sales_encodings`
--
ALTER TABLE `sales_encodings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_encodings_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `developer`
--
ALTER TABLE `developer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identity_details`
--
ALTER TABLE `identity_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `property_listings`
--
ALTER TABLE `property_listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `p_info`
--
ALTER TABLE `p_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sales_encodings`
--
ALTER TABLE `sales_encodings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `identity_details`
--
ALTER TABLE `identity_details`
  ADD CONSTRAINT `identity_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_details`
--
ALTER TABLE `project_details`
  ADD CONSTRAINT `project_details_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`);

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `property_listings` (`id`);

--
-- Constraints for table `p_info`
--
ALTER TABLE `p_info`
  ADD CONSTRAINT `p_info_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_encodings`
--
ALTER TABLE `sales_encodings`
  ADD CONSTRAINT `sales_encodings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `identity_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
