-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2025 at 12:33 AM
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
('93aYkhaj7izoo9eK', 's:7:\"forever\";', 2060395462),
('Lu78OsykogzPSzAx', 's:7:\"forever\";', 2060389622),
('M4yUfaUY8KYISdzC', 's:7:\"forever\";', 2060367972),
('xI2fOeRxoAmSzX9E', 's:7:\"forever\";', 2060390213);

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
  `image` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = active 1 = Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`id`, `dev_name`, `dev_email`, `dev_phone`, `dev_location`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Main Street', '', 0, '2025-03-26 10:23:16', '2025-03-26 10:23:16'),
(2, 'John Doe', 'john.doe@example12345.com', '1234567890', '123 Main Street', '', 0, '2025-03-28 23:11:59', '2025-03-28 23:11:59'),
(3, 'John Doe', 'john.doe@example1234567892424.com', '1234567890', '123 Main Street', '', 0, '2025-03-30 04:59:06', '2025-03-30 04:59:06'),
(4, 'John Doe', 'john.doe@example12345678924246868.com', '1234567890', '123 Main Street', '', 0, '2025-03-30 05:02:54', '2025-03-30 05:02:54'),
(5, 'John Doe', 'john.doe@example1112345678924246868.com', '1234567890', '123 Main Street', '', 0, '2025-03-31 17:12:01', '2025-03-31 17:12:01'),
(6, 'John Doe', 'john.0123doe@example1112345678924246868.com', '1234567890', '123 Main Street', '', 0, '2025-03-31 18:55:09', '2025-03-31 18:55:09'),
(7, 'John Doe', 'john.12310123doe@example1112345678924246868.com', '1234567890', '123 Main Street', '', 0, '2025-03-31 18:55:33', '2025-03-31 18:55:33'),
(8, 'JohnDorf', 'john@gmail.com.ph', '09876543212', 'CDO', 'images/Y2kCSGkytFEoXLkFnd7txl63xO0vZVCI8IQlcQd7.jpg', 0, '2025-04-03 04:43:37', '2025-04-03 04:43:37'),
(9, 'Johndorf', 'john123@gmail.com', '09358554398', 'CDO', 'images/ihCM7bVMltHit34Vzm6jJ1TyPVuWiSPlil9mJygB.jpg', 0, '2025-04-03 05:03:28', '2025-04-03 05:03:28'),
(10, 'johndorf', 'john12345@gmail.com.ph', '09358554398', 'CDO', 'images/yJLKX6dbPaJFvJqc7xRyhEVA9GCmx7j3VINjbOBP.jpg', 0, '2025-04-03 05:17:33', '2025-04-03 05:17:33'),
(11, 'johndorf', 'john123456@gmail.com.ph', '09358554398', 'CDO', 'images/FC4FuRUTeEJFf8PjbRAviu2a80csi7zVRsvagbih.jpg', 0, '2025-04-03 05:19:55', '2025-04-03 05:19:55'),
(12, 'johndorf', 'john0123456@gmail.com.ph', '09358554398', 'CDO', 'images/kGRKytOrrD83ck0AGDueu4NL6sZZ6XUNNS5UKx5v.jpg', 0, '2025-04-03 05:21:01', '2025-04-03 05:21:01'),
(13, 'JohnDorf', 'johndvdvdv@gmail.com.ph', '09876543212', 'CDO', 'images/PJbK22XJf2ZMeQ62NQP7o1wvPSfop4U5vcPUXmSc.jpg', 0, '2025-04-03 05:21:46', '2025-04-03 05:21:46'),
(14, 'johndorf', 'kjwbdjshbh@gmail.com', '09358554398', 'CDO', 'images/Hv6jsCzFVmCdSnOwCGwOnWfKFDHgtaAeIBfct3vk.jpg', 0, '2025-04-03 05:26:54', '2025-04-03 05:26:54'),
(15, 'johndorf', 'kjwbrvrvdjshbh@gmail.com', '09358554398', 'CDO', 'images/02iD1fHOzQYZK0Hach45FtygS0TyY3Modtn8L1TD.jpg', 0, '2025-04-03 05:29:34', '2025-04-03 05:29:34'),
(16, 'johndorf', 'kjwbrvrvdjbgbgbshbh@gmail.com', '09358554398', 'CDO', 'images/XOAlzegikJvNhI1VsYtnqHwgfTonEXOIuyIvGkLp.jpg', 0, '2025-04-03 05:31:36', '2025-04-03 05:31:36'),
(17, 'johndorf', 'ryanjaytagolimotreyes@gmail.com', '09358554398', 'CDO', 'images/vU10xeHnL8zojvcWu7w7xq9Ow81YdbaZgdslxkYd.jpg', 0, '2025-04-03 05:32:52', '2025-04-03 05:32:52'),
(18, 'johndorf', 'ryanjaydvdvdtagolimotreyes@gmail.com', '09358554398', 'CDO', 'images/oDLVcX3rBeAydMxvCU1c3zOBQQ9nAyJoT2yk9HuU.jpg', 0, '2025-04-03 05:35:17', '2025-04-03 05:35:17'),
(19, 'ddvdv', 'vdvd@gmail.com', '09358554398', 'CDO', 'images/DGW4JxS5rCerwKt75McPbmL6V52HXyQDlfmUWjha.jpg', 0, '2025-04-03 05:36:03', '2025-04-03 05:36:03'),
(20, 'johndorf', 'vdvcsc@gmail.com', '09876543212', 'CDO', 'images/qOm3VeoeMoEXXKVkE8k9P9LNTe7YQJgqMpYUZay5.jpg', 0, '2025-04-03 05:47:50', '2025-04-03 05:47:50'),
(21, 'Camella', 'camella@gmail.com', '09358554398', 'CDO', 'images/f6bJtNiWQ2aSGQJFGsNdfaUqnKWmiuMqH77JHkEU.png', 0, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(22, 'vdvdv', 'fbf@gmail.com', 'bfb', 'scsfce', 'images/ZjGbUgiWBb0c6F9XXjcoC8Wn7iagm8EnU9Y0bnLv.png', 0, '2025-04-03 07:35:27', '2025-04-03 07:35:27'),
(23, 'Camella', 'camella123@gmail.com.ph', '09358554398', 'CDO', 'images/Pz8Rf6d8UVyRog6sU2XzvdY8ncPXJIMlEprPgH0H.png', 0, '2025-04-03 21:24:07', '2025-04-03 21:24:07'),
(24, 'camella 2', 'camella2@gmail.com', '09358554398', 'CDO', 'images/UUwuTtKjjP6bvNMbVlE6yeOIF3ITKzKnlFAv9wVE.jpg', 0, '2025-04-03 21:25:51', '2025-04-03 21:25:51');

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
(1, 5, '', '', '09-06-1998', 'XYZ University', '2025-03-19 23:24:29', '2025-03-19 23:24:29'),
(2, 6, '', '', NULL, 'Southern Philippines College', '2025-03-19 23:32:10', '2025-03-19 23:32:10'),
(3, 7, '', '', NULL, 'Southern Philippines College', '2025-03-19 23:56:36', '2025-03-19 23:56:36'),
(4, 8, '', '', '21-03-2025', 'Southern Philippines College', '2025-03-20 00:09:49', '2025-03-20 00:09:49'),
(5, 9, '', '', '21-03-2025', 'Southern Philippines College', '2025-03-20 00:15:25', '2025-03-20 00:15:25'),
(6, 10, '', '', '09-06-1998', 'XYZ University', '2025-03-20 00:17:07', '2025-03-20 00:17:07'),
(7, 11, 'wfe-3435-eff', '2422e', '09-06-1998', 'XYZ University', '2025-03-20 00:18:45', '2025-03-20 00:18:45'),
(8, 12, 'wfe-3435-eff', '2422e', '09-06-1998', 'XYZ University', '2025-03-20 00:22:30', '2025-03-20 00:22:30'),
(9, 13, 'efee4t4grg5y', 'grgr4t54645654trg', '28-03-2025', 'Southern Philippines College', '2025-03-20 00:24:15', '2025-03-20 00:24:15'),
(10, 14, 'efee4t4grg5y', 'grgr4t54645654trg', '27-03-2025', 'Southern Philippines College', '2025-03-20 00:45:12', '2025-03-20 00:45:12'),
(11, 15, 'efee4t4grg5y', 'grgr4t54645654trg', '27-03-2025', 'Southern Philippines College', '2025-03-20 00:51:28', '2025-03-20 00:51:28'),
(12, 16, '', '', NULL, 'Southern Philippines College', '2025-03-20 07:02:45', '2025-03-20 07:02:45'),
(13, 17, 'efee4t4grg5y', 'grgr4t54645654trg', '28-03-2025', 'Southern Philippines College', '2025-03-20 07:05:14', '2025-03-20 07:05:14'),
(14, 18, '', '', NULL, 'Southern Philippines College', '2025-03-20 07:08:32', '2025-03-20 07:08:32'),
(15, 19, '', '', NULL, 'Southern Philippines College', '2025-03-20 07:17:12', '2025-03-20 07:17:12'),
(16, 20, '', '', NULL, 'Southern Philippines College', '2025-03-23 05:08:21', '2025-03-23 05:08:21'),
(17, 21, 'efee4t4grg5y', 'grgr4t54645654trg', '25-03-2025', 'Southern Philippines College', '2025-03-23 20:33:22', '2025-03-23 20:33:22'),
(18, 22, '', '', NULL, 'Southern Philippines College', '2025-03-31 19:21:50', '2025-03-31 19:21:50');

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
(32, '2025_03_26_163357_create_developer_table', 5),
(33, '2025_03_26_164320_create_project_details_table', 6),
(34, '2025_04_01_022743_create_developer_images_table', 7),
(35, '2025_04_17_043139_create_sales_encodings_table', 8),
(36, '2025_04_18_135213_create_property_listings_table', 9),
(37, '2025_04_18_135912_create_property_images_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_location` varchar(255) NOT NULL,
  `project_contact_person` varchar(255) NOT NULL,
  `developer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_details`
--

INSERT INTO `project_details` (`id`, `project_name`, `project_location`, `project_contact_person`, `developer_id`, `created_at`, `updated_at`) VALUES
(1, 'Project Alpha', 'Location Alpha', 'Alice', 1, '2025-03-26 10:23:16', '2025-03-26 10:23:16'),
(2, 'Project Beta', 'Location Beta', 'Bob', 1, '2025-03-26 10:23:16', '2025-03-26 10:23:16'),
(3, 'Project Alpha', 'Location Alpha', 'Alice', 2, '2025-03-28 23:11:59', '2025-03-28 23:11:59'),
(4, 'Project Beta', 'Location Beta', 'Bob', 2, '2025-03-28 23:11:59', '2025-03-28 23:11:59'),
(5, 'Project Alpha', 'Location Alpha', 'Alice', 3, '2025-03-30 04:59:06', '2025-03-30 04:59:06'),
(6, 'Project Beta', 'Location Beta', 'Bob', 3, '2025-03-30 04:59:06', '2025-03-30 04:59:06'),
(7, 'Project Alpha', 'Location Alpha', 'Alice', 4, '2025-03-30 05:02:54', '2025-03-30 05:02:54'),
(8, 'Project Beta', 'Location Beta', 'Bob', 4, '2025-03-30 05:02:54', '2025-03-30 05:02:54'),
(9, 'Project Alpha', 'Location Alpha', 'Alice', 5, '2025-03-31 17:12:01', '2025-03-31 17:12:01'),
(10, 'Project Beta', 'Location Beta', 'Bob', 5, '2025-03-31 17:12:01', '2025-03-31 17:12:01'),
(11, 'Project Alpha', 'Location Alpha', 'Alice', 6, '2025-03-31 18:55:09', '2025-03-31 18:55:09'),
(12, 'Project Beta', 'Location Beta', 'Bob', 6, '2025-03-31 18:55:09', '2025-03-31 18:55:09'),
(13, 'Project Alpha', 'Location Alpha', 'Alice', 7, '2025-03-31 18:55:33', '2025-03-31 18:55:33'),
(14, 'Project Beta', 'Location Beta', 'Bob', 7, '2025-03-31 18:55:33', '2025-03-31 18:55:33'),
(15, 'Project 1', 'Tagoloan', 'Ryan Reyes', 8, '2025-04-03 04:43:37', '2025-04-03 04:43:37'),
(16, 'Project 2', 'Tagoloan', 'Aldin Tagolimot', 8, '2025-04-03 04:43:37', '2025-04-03 04:43:37'),
(17, 'Project 2', 'Villanueva', 'Aldin Tagolimot', 9, '2025-04-03 05:03:28', '2025-04-03 05:03:28'),
(18, 'project 2', 'Villanueva', 'Aldin Tagolimot', 10, '2025-04-03 05:17:33', '2025-04-03 05:17:33'),
(19, 'project 2', 'Villanueva', 'Aldin Tagolimot', 11, '2025-04-03 05:19:55', '2025-04-03 05:19:55'),
(20, 'project 2', 'Villanueva', 'Aldin Tagolimot', 12, '2025-04-03 05:21:01', '2025-04-03 05:21:01'),
(21, 'Project 1', 'Tagoloan', 'Ryan Reyes', 13, '2025-04-03 05:21:46', '2025-04-03 05:21:46'),
(22, 'Project 2', 'Tagoloan', 'Aldin Tagolimot', 13, '2025-04-03 05:21:46', '2025-04-03 05:21:46'),
(23, 'project 2', 'Villanueva', 'Aldin Tagolimot', 14, '2025-04-03 05:26:54', '2025-04-03 05:26:54'),
(24, 'project 2', 'Villanueva', 'Aldin Tagolimot', 15, '2025-04-03 05:29:34', '2025-04-03 05:29:34'),
(25, 'project 1', 'CDO', 'Ryan Jay Tagolimot Reyes', 15, '2025-04-03 05:29:34', '2025-04-03 05:29:34'),
(26, 'project 1', 'CDO', 'Ryan Jay Tagolimot Reyes', 16, '2025-04-03 05:31:36', '2025-04-03 05:31:36'),
(27, 'project 2', 'Villanueva', 'Aldin Tagolimot', 16, '2025-04-03 05:31:36', '2025-04-03 05:31:36'),
(28, 'project 1', 'CDO', 'Ryan Jay Tagolimot Reyes', 16, '2025-04-03 05:31:36', '2025-04-03 05:31:36'),
(29, 'project 1', 'Tagoloan', 'Ryan Jay Tagolimot Reyes', 17, '2025-04-03 05:32:52', '2025-04-03 05:32:52'),
(30, 'project 2', 'Villanueva', 'Aldin Tagolimot', 17, '2025-04-03 05:32:52', '2025-04-03 05:32:52'),
(31, 'project 1', 'Tagoloan', 'Ryan Jay Tagolimot Reyes', 18, '2025-04-03 05:35:17', '2025-04-03 05:35:17'),
(32, 'project 2', 'Villanueva', 'Aldin Tagolimot', 18, '2025-04-03 05:35:17', '2025-04-03 05:35:17'),
(33, 'hmnhm', 'jmj', 'Ryan Jay Tagolimot Reyes', 19, '2025-04-03 05:36:03', '2025-04-03 05:36:03'),
(34, 'jmj', 'fngng', 'jmjm', 19, '2025-04-03 05:36:03', '2025-04-03 05:36:03'),
(35, 'dvdvdw', 'dcvee', 'eceve', 20, '2025-04-03 05:47:50', '2025-04-03 05:47:50'),
(36, 'vrver', 'rvrvf', 'vrrr', 20, '2025-04-03 05:47:50', '2025-04-03 05:47:50'),
(37, 'Greta Model House', 'CDO', 'Ryan Jay Tagolimot Reyes', 21, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(38, 'Freya Model House', 'Tagoloan', 'Aldin Tagolimot', 21, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(39, 'Ella Model House', 'Villanueva', 'Venus Reyes', 21, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(40, 'Dana Model House', 'Jasaan', 'Veronica Padera', 21, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(41, 'Dani Model House', 'Opol', 'Rey Bakaka', 21, '2025-04-03 05:52:54', '2025-04-03 05:52:54'),
(42, 'fsedv', 'csc', 'scs', 22, '2025-04-03 07:35:27', '2025-04-03 07:35:27'),
(43, 'scvs', 'svsv', 'svsv', 22, '2025-04-03 07:35:27', '2025-04-03 07:35:27'),
(44, 'camella 1', 'CDO', 'Ryan Jay Tagolimot Reyes', 23, '2025-04-03 21:24:07', '2025-04-03 21:24:07'),
(45, 'camella 2', 'Tagoloan', 'Aldin Tagolimot', 23, '2025-04-03 21:24:07', '2025-04-03 21:24:07'),
(46, 'camella 3', 'CDO', 'Ryan Jay Tagolimot Reyes', 24, '2025-04-03 21:25:51', '2025-04-03 21:25:51'),
(47, 'camella 4', 'Tagoloan', 'Aldin Tagolimot', 24, '2025-04-03 21:25:51', '2025-04-03 21:25:51');

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
(1, 1, 'property_images/KB2X6ILZmZc7YOUnpJrwtck3czLREuoDxep9dgKE.png', '2025-04-18 06:26:58', '2025-04-18 06:26:58'),
(2, 1, 'property_images/T5DnicpGDBMva6loRLXE930KxcOLsvxqK8SEYjIw.webp', '2025-04-18 06:26:58', '2025-04-18 06:26:58'),
(3, 1, 'property_images/6qVZXjUboY91L3cICGRncCd5sdM441BRWlNBX8vr.jpg', '2025-04-18 06:26:58', '2025-04-18 06:26:58'),
(4, 2, 'property_images/kZx67buFVbTlysp4N4Lj9SxS9yacJDqVNXZX8lrN.png', '2025-04-18 06:40:40', '2025-04-18 06:40:40'),
(5, 2, 'property_images/yHu9uGd8eQi2LycaHQcnsoNXPVunbqBmbd8paWmb.webp', '2025-04-18 06:40:40', '2025-04-18 06:40:40'),
(6, 2, 'property_images/eI2zs845jcMaHEW2HmiNaYfkCgrMZI54llZq6Snw.jpg', '2025-04-18 06:40:40', '2025-04-18 06:40:40'),
(7, 3, 'property_images/5he6jMkq8TaBGImrIomsmbf6mhhiZPndmp2uxzqz.jpg', '2025-04-18 06:50:27', '2025-04-18 06:50:27'),
(8, 3, 'property_images/ABRC2R0DKDWbJUvKSOWNngHlZLOTwLSfQLfRFHys.png', '2025-04-18 06:50:27', '2025-04-18 06:50:27'),
(9, 3, 'property_images/882n7NsKn40izsECttYhAGUAob8yBm3H7Q1Bgy0z.jpg', '2025-04-18 06:50:27', '2025-04-18 06:50:27'),
(10, 4, 'property_images/g4zl3uk5FM2YBPC9eel6Q3SngAb2jDIQLNMBuyCG.jpg', '2025-04-18 06:52:44', '2025-04-18 06:52:44'),
(11, 4, 'property_images/Lo8xUctVJrd472bEeX0U51HVU7zklFZWaAfU3ERU.jpg', '2025-04-18 06:52:44', '2025-04-18 06:52:44'),
(15, 6, 'property_images/odALYqa2MhDpJ0Gc3z9GvBWKg8PuElzyc6GwH8vs.png', '2025-04-18 07:13:49', '2025-04-18 07:13:49'),
(16, 6, 'property_images/ohoGCEFIc6cKzprJgTE1WNXWnaUq0SdAxROi8gYl.png', '2025-04-18 07:13:49', '2025-04-18 07:13:49'),
(17, 7, 'property_images/Dg5Qnthp5ahHrlqHyvKEgmblwCaby065eX2cLYf1.jpg', '2025-04-18 07:15:01', '2025-04-18 07:15:01'),
(18, 7, 'property_images/b5nTQy1J45p2fqkScxCiaTvsQHIxYuqDBfJ1e4xV.webp', '2025-04-18 07:15:01', '2025-04-18 07:15:01'),
(19, 8, 'property_images/NKH8A2RhcwQnc0EoeDl94142D80Ir1QTQiWsiOd5.jpg', '2025-04-18 07:49:30', '2025-04-18 07:49:30'),
(20, 8, 'property_images/dG62FpvsZ2TvthQ90qJF1CEWUHKap9fjRMomqkau.jpg', '2025-04-18 07:49:30', '2025-04-18 07:49:30'),
(21, 8, 'property_images/ji2wm9CdnmdMWfZFJUtqUlFJcseZghKvJTUaUlIx.jpg', '2025-04-18 07:49:30', '2025-04-18 07:49:30'),
(25, 11, 'property_images/RHSruV1t8yDemgJ4HfWd5zpEJYhYrLRWMnaHeMh8.jpg', '2025-04-18 09:09:29', '2025-04-18 09:09:29'),
(26, 12, 'property_images/Yi7nSkUlSXd8TIBfrK7vLOsNmT5JldimY1CCq2YZ.png', '2025-04-18 09:17:30', '2025-04-18 09:17:30'),
(81, 5, 'property_images/OMiBBW7cMRQOuSV41g5RAtFVTKwA8LVAyw7ACRRj.jpg', '2025-04-18 11:43:00', '2025-04-18 11:43:00'),
(82, 5, 'property_images/3YkBZI5fSN2nWMCJnMRzWNOVOIn1CSx5afJS6pvJ.jpg', '2025-04-18 11:43:00', '2025-04-18 11:43:00'),
(83, 5, 'property_images/uQlUV92jTYr88gsVC2YPT3SfKdb8puHnyQedk8q8.jpg', '2025-04-18 11:43:00', '2025-04-18 11:43:00'),
(118, 9, 'property_images/vkHGapupfgcs9cH36EeU3fxENIMsUDcVggVYZweX.jpg', '2025-04-18 12:17:23', '2025-04-18 12:17:23'),
(131, 13, 'property_images/inc3k0jsngYnrCFn5atTIa4qjNZ4PHmuHGYew8Jn.jpg', '2025-04-18 12:22:13', '2025-04-18 12:22:13'),
(150, 14, 'property_images/vHrVMA8h9kIxfuTnjcqZoT8H54oIMAyv6y5POeqk.jpg', '2025-04-18 18:17:24', '2025-04-18 18:17:24'),
(156, 10, 'property_images/BFagdwteHPaxnVFfpf1buHkOOF1ntrUuoDLJy3Xb.jpg', '2025-04-18 18:47:55', '2025-04-18 18:47:55'),
(157, 10, 'property_images/J4f0bj1Ml268zcipD0Ho8NiknuqavAszU175RtfV.png', '2025-04-18 18:47:55', '2025-04-18 18:47:55'),
(159, 5, 'property_images/l5pcq8bPMjlMb36xIWL0OuVKnoYkF38GXBuODHPt.jpg', '2025-04-18 18:52:41', '2025-04-18 18:52:41'),
(160, 5, 'property_images/ja8keEXWfTx9hHwPJVYrp67yZvQLyIeUaiA4u3Zt.png', '2025-04-18 18:52:41', '2025-04-18 18:52:41'),
(162, 9, 'property_images/SN7qbtca7mKiGTAFlawsvkevLJ0iHzIkL5eXA0GG.jpg', '2025-04-18 19:11:24', '2025-04-18 19:11:24'),
(163, 9, 'property_images/08Smea5L0DIjGjvJJRTARWEhKX4pFFv8MjngSMnY.jpg', '2025-04-18 19:11:24', '2025-04-18 19:11:24'),
(164, 9, 'property_images/ulpwydstHVfyZiUMmmii5FeUSrpPA7MhzTndR8VU.jpg', '2025-04-18 19:11:24', '2025-04-18 19:11:24'),
(165, 15, 'property_images/X4ucjvecVqCYxmlwMgcSOanQtJsAClGtbGLQEaV3.jpg', '2025-04-18 19:16:35', '2025-04-18 19:16:35'),
(166, 13, 'property_images/CKAUKXmVw2Rfib7BrMMC70x723YOaIf1FCUjAkD6.jpg', '2025-04-18 19:28:55', '2025-04-18 19:28:55'),
(167, 13, 'property_images/YxlVZwed49dudlofFyv77uPeTMiZrqI5fBXlrLA1.png', '2025-04-18 19:28:56', '2025-04-18 19:28:56'),
(168, 13, 'property_images/U5RX8kVA8ghFEfmOeg9mEoTlFUV2D1TDrZ2ff06g.jpg', '2025-04-18 19:28:56', '2025-04-18 19:28:56'),
(169, 6, 'property_images/ndxqJb5A8hYR3ZWXYcG25OaA3HCMdF1mYwl65JGE.jpg', '2025-04-18 19:31:25', '2025-04-18 19:31:25'),
(170, 6, 'property_images/7Utli5BVYf546LNE9RXdEI1kAaNSHJhNrfvMffCO.jpg', '2025-04-18 19:31:25', '2025-04-18 19:31:25'),
(171, 6, 'property_images/2fuo0mNawe3RTeLivCKKWa47zrQTpSTq947DVRF0.jpg', '2025-04-18 19:31:25', '2025-04-18 19:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `property_listings`
--

CREATE TABLE `property_listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
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

INSERT INTO `property_listings` (`id`, `category`, `date_listed`, `lot_area`, `floor_area`, `details`, `location`, `type_of_listing`, `status`, `created_at`, `updated_at`) VALUES
(1, 'House and lot', '2025-04-18', '100', '100', '2 Bedrooms, 2 Bathrooms, Carport', 'CDO', 'Exclusive', 'Sold', '2025-04-18 06:26:58', '2025-04-18 06:26:58'),
(2, 'Lot only', '2025-04-18', '100', '100', '2 Bedrooms, 2 Bathrooms, Carport', 'CDO', 'Non-Exclusive', 'Not Sold', '2025-04-18 06:40:40', '2025-04-18 06:40:40'),
(3, 'Lot only', '2025-04-18', '100', '100', '2 Bedrooms, 2 Bathrooms, Carport', 'CDO', 'Exclusive', 'Sold', '2025-04-18 06:50:27', '2025-04-18 06:50:27'),
(4, 'Condominium/Apartment', '2025-04-18', '200', '200', 'Sample details', 'Tagoloan', 'Exclusive', 'Not Sold', '2025-04-18 06:52:44', '2025-04-18 06:52:44'),
(5, 'Commercial Properties', '2025-04-18', '300', '150', '2 Bedrooms, 2 Bathrooms, Carport', 'Villanueva', 'Exclusive', 'Not Sold', '2025-04-18 06:55:08', '2025-04-18 06:55:08'),
(6, 'Rental Properties', '2025-04-18', '250', '120', 'Sample Details', 'Claveria', 'Non-Exclusive', 'Not Sold', '2025-04-18 07:13:48', '2025-04-18 07:13:48'),
(7, 'Farm Lot', '2025-04-18', '150', '100', '2 Bedrooms, 2 Bathrooms, Carport', 'CDO', 'Exclusive', 'Not Sold', '2025-04-18 07:15:01', '2025-04-18 07:15:01'),
(8, 'Rental Properties', '2025-04-18', '145', '136', 'Sample details', 'CDO', 'Non-Exclusive', 'Sold', '2025-04-18 07:49:30', '2025-04-18 07:49:30'),
(9, 'Commercial Properties', '2025-04-19', '125', '105', '3 bedrom', 'Villanueva', 'Exclusive', 'Sold', '2025-04-18 07:52:31', '2025-04-18 11:43:51'),
(10, 'House and lot', '2025-04-18', '146', '135', '2 bedrooms, 1 CR,', 'CDO', 'Non-Exclusive', 'Not Sold', '2025-04-18 09:07:49', '2025-04-18 09:07:49'),
(11, 'Condominium/Apartment', '2025-04-18', '178', '45', '2 bedroom, 1 CR, and 1 extra room', 'CDO', 'Exclusive', 'Not Sold', '2025-04-18 09:09:29', '2025-04-18 09:09:29'),
(12, 'Commercial Properties', '2025-04-18', '123', '143', '2 bedroom, 1 CR, 1 swimming pool', 'Claveria', 'Exclusive', 'Not Sold', '2025-04-18 09:17:30', '2025-04-18 09:17:30'),
(13, 'Commercial Properties', '2025-04-18', '125', '105', '3 bedrom', 'Villanueva, Misamis Oriental', 'Exclusive', 'Not Sold', '2025-04-18 09:18:49', '2025-04-18 18:51:16'),
(14, 'House and lot', '2025-04-19', '400', '100', '2 bedrooms,', 'Bugo, Cagayan de Oro', 'Exclusive', 'Pre-Selling', '2025-04-18 18:17:24', '2025-04-18 19:22:43'),
(15, 'Commercial Properties', '2025-04-19', '748', '145', '2 bedroom', 'Cagayan de Oro', 'Non-Exclusive', 'RFO', '2025-04-18 19:16:35', '2025-04-18 19:32:08');

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
(18, 22, 'Lyzil', 'Tagolimot', 'Padera', '', '09358554398', 'female', 'Zone 1, Santa Ana', '', '2025-03-31 19:21:50', '2025-03-31 19:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales_encodings`
--

CREATE TABLE `sales_encodings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
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

INSERT INTO `sales_encodings` (`id`, `agent_id`, `client_name`, `category`, `date_on_sale`, `amount`, `location`, `remarks`, `image`, `created_at`, `updated_at`) VALUES
(2, 18, 'Ryan Reyes', 'House and lot', '2025-04-20', 1000.00, 'opol misamis oriental', 'Full Payment', 'images/hCyUrrHWyvKROdMGTRMcqtMYyLbhxMghhx4nSXpy.png', '2025-04-16 22:49:59', '2025-04-16 22:49:59'),
(3, 18, 'Ryan Reyes', 'Rental Properties', '2025-04-29', 1000.00, 'Lumia CDO', 'Partial Payment', 'images/RTn9Z65EWJ6PaQRwNLQJrKePuENsrF4tkTK4d9CB.png', '2025-04-16 22:59:31', '2025-04-16 22:59:31'),
(4, 18, 'Ryan Reyes', 'House and lot', '2025-04-17', 1000.00, 'Lumia CDO', 'Partial Payment', 'images/krIGVysULzkSwC4i4MkDvU02UbCf51u6jxaeTLi7.png', '2025-04-16 23:14:24', '2025-04-16 23:14:24'),
(5, 18, 'Ryan Reyes', 'Farm Lot', '2025-04-17', 1000.00, 'Lumia CDO', 'Full Payment', 'images/vkT80EJuPKanh2yc3KP6qjVTOlXwLx3IMQCZZPGH.png', '2025-04-16 23:19:35', '2025-04-16 23:19:35'),
(6, 18, 'Ryan Reyes', 'Farm Lot', '2025-04-17', 1000.00, 'Lumia CDO', 'Full Payment', 'images/8t6gQh5cqwzSEDNRhH7PsEfZK1Poub81BkGPFnpO.png', '2025-04-16 23:21:42', '2025-04-16 23:21:42'),
(7, 18, 'Ryan Reyes', 'Farm Lot', '2025-04-17', 1000.00, 'Lumia CDO', 'Full Payment', 'images/w2uJOieBefj7xyuipq0gC1dwMXXsBziJbP3S5nil.png', '2025-04-16 23:21:49', '2025-04-16 23:21:49'),
(8, 18, 'Ryan Reyes', 'Farm Lot', '2025-04-17', 1000.00, 'Lumia CDO', 'Full Payment', 'images/9n1RSDf03b7yU3HO1vCn8ZHnQPcKnaAh1vbhh8FS.png', '2025-04-16 23:22:34', '2025-04-16 23:22:34'),
(9, 18, 'Ryan Reyes', 'Condominium/Apartment', '2025-04-17', 1000.00, 'Lumbia CDO', 'Full Payment', 'images/NCIH1dMpsba9zQdhWWN4tK4j4WmylSSsPtFMeN5f.png', '2025-04-16 23:25:46', '2025-04-16 23:25:46'),
(10, 18, 'Ryan Reyes', 'Rental Properties', '2025-04-17', 1000.00, 'Lumbia CDO', 'Full Payment', 'images/OfkHPkWrHQ5gGiO4DpJwVMp7YBZfKjvLSVAYPg4v.png', '2025-04-17 00:20:15', '2025-04-17 00:20:15'),
(11, 18, 'Ryan Reyes', 'Commercial Properties', '2025-04-17', 1000.00, 'Lumbia CDO', 'Partial Payment', 'images/9LlclrFmN6WoURTgUuD19aicuGfZfVHunqeZwSod.png', '2025-04-17 00:24:09', '2025-04-17 00:24:09'),
(12, 18, 'Ryan Reyes', 'Lot only', '2025-04-17', 1000.00, 'Lumbia CDO', 'Partial Payment', 'images/hYEvRLQLu2AUIwpQHdEwI3vpDrWwi8Whs7G8z5QV.png', '2025-04-17 00:24:50', '2025-04-17 00:24:50'),
(14, 18, 'Ryan Reyes', 'House and lot', '2025-04-17', 1000.00, 'Opol misamis oriental', 'Full Payment', 'images/VzxO6UrH94lBqlI43v9gSFRV4Sg12VXVddW5LXGU.jpg', '2025-04-17 02:44:22', '2025-04-17 21:09:54'),
(22, 18, 'Ryan Reyes', 'House and lot', '2025-04-18', 2200000.00, 'Tagoloan', 'Partial Payment', 'images/MC2qs2NCHcCVVX7XAtnSfAckgpcDcPLZUOZeuLyB.png', '2025-04-18 03:38:03', '2025-04-18 03:38:03'),
(23, 1, 'Ryan Reyes 143', 'Condominium/Apartment', '2025-04-17', 3000.00, 'Opol misamis oriental', 'Full Payment', 'images/VtT0pWQ1Orgad66pXg5Gcf98iOTfg6MXE9bHYam9.jpg', '2025-04-18 04:54:42', '2025-04-18 05:18:51'),
(24, 1, 'Paula\'s Hotel', 'Condominium/Apartment', '2025-04-19', 5000000.00, 'cagayan de  oro', 'Full Payment', 'images/7UbHaAIX955FiRhvFjJPekAyMk5JJJDK7nwHqYhB.jpg', '2025-04-18 18:32:01', '2025-04-18 20:03:20'),
(25, 18, 'Paulas', 'Condominium/Apartment', '2025-04-19', 10000000.00, 'Opol misamis oriental', 'Partial Payment', 'images/zxkMxME7lnUQ8VnK2skByoNiNLAadsg808DM1YfW.jpg', '2025-04-18 19:45:05', '2025-04-18 20:01:45');

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
('eTT8NAe68xDrAjCa1aPuHFiZM8va1texrbhd5aQl', NULL, '192.168.254.108', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDFJTzExOWFxYU1MTm94SEgxT0ZEMnJCU3ZLeWJSWWR2dVlidU1pSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMDg6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744899828),
('GbT2CK67jKBHma1C2fqiFliWoOtCwOhbfKxW2syc', NULL, '192.168.18.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUtqM2JhNWtkSlNNbjJVdlM3WnJXSDBxRGlMWUhvbTI0UFVWV3F0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xOTIuMTY4LjE4LjEyOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1743746756),
('tScZTYewsYfpQiu5ybyGAqEb9lgJL8AN2iaaEpZB', NULL, '192.168.18.130', 'PostmanRuntime/7.43.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFhOQmRNOHJNZG1aQ1R6NjJpcmVFSjhtWXFXbm93MmpINVY2ZENpaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjE4LjEzMDo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742455307),
('vJeR2yZsSfj8gSjya1N2u3ybREKD8gUY5NWfVUGZ', NULL, '192.168.254.111', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1NXVE5DaGJ6NjlNbkpSTkJ5ajFybmU4b21XZ3BPYW56M2pwVXZ0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjI1NC4xMTE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743339047);

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
(2, 'ryanreyes143', 'ryan.reyes@dict.gov.ph', 'Acc-022ZZ1WZ1', NULL, '$2y$12$LD1GXzvpjU9i9DDsDVFIc.a6g6/Ffr3XzqXgk11XI9NbUVHkY9Oo.', 0, 0, NULL, '2025-03-19 22:59:06', '2025-03-19 22:59:06'),
(5, 'john_doe', 'john.doe12345@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$1gVHDiUnh1VkcLB/O3QKt.as/Uj1kjD1i3Suv2YdZcvxepmJCTNKu', 1, 0, NULL, '2025-03-19 23:24:29', '2025-03-19 23:24:29'),
(6, 'sample_123', 'ryanjaytagolimotreyes@gmail.com', 'Acc-3ABY7FBZ2', NULL, '$2y$12$zBS4P3VbEmVwGWq6neY/guU6ymTSInNCHU66aXW2pivOj3NYWrJXG', 1, 1, NULL, '2025-03-19 23:32:10', '2025-03-19 23:32:10'),
(7, 'venus123', 'venus@gmail.com', 'Acc-HLSVI8350', NULL, '$2y$12$j1HZcZOgOTP3pNZkzriEcu1pPT3UJG9ZrjyHZnBj64Fjm/caD8icS', 1, 1, NULL, '2025-03-19 23:56:36', '2025-03-19 23:56:36'),
(8, 'aldin123', 'aldin@gmail.com', 'Acc-XATMH48PY', NULL, '$2y$12$1tYNQ6cOX9vIrnvruP6qL.NPdZvaLxReDNLVwhgjFFoeT4KjL6j3a', 1, 1, NULL, '2025-03-20 00:09:49', '2025-03-20 00:09:49'),
(9, 'riki123', 'riki@gmail.com', 'Acc-BYO0VTU86', NULL, '$2y$12$dZzbXtebVZLQ/dQzEPZIz.JiRDIOYECoJa3R4RYJ02fRwGw8oHmAG', 1, 1, NULL, '2025-03-20 00:15:25', '2025-03-20 00:15:25'),
(10, 'john_doe', 'john.doe12345678@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$MX949SneZtYSsYJ4fa.9ROqdEqvg9BBTo6bwW/rb2.OaMh2.o1zkO', 1, 1, NULL, '2025-03-20 00:17:07', '2025-03-20 00:17:07'),
(11, 'john_doe', 'john.doe123456798@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$yIk7GvsG.ZsAZleY1qSgiejxXWUuiCgkuEU3GiauoHWReC1/FSEB2', 1, 1, NULL, '2025-03-20 00:18:45', '2025-03-20 00:18:45'),
(12, 'john_doe', 'john.doe123456796668@example.com', 'Acc-mwdwmk2ee', NULL, '$2y$12$FtUWi.Ps6MqUyMzzhz4EsO7bSOZJXefgcPKwDlVC5nzWCok/xgbG.', 1, 1, NULL, '2025-03-20 00:22:30', '2025-03-20 00:22:30'),
(13, 'ian123', 'ian@gmail.com', 'Acc-Q0LOC0YSE', NULL, '$2y$12$1bFMMz6S/lewEnESSP7CGOLPOV0EjTyrtQjiomZqRwwyDpK3LUTmW', 1, 1, NULL, '2025-03-20 00:24:15', '2025-03-20 00:24:15'),
(14, 'jason123', 'jason@gmail.com', 'Acc-6YP7CKCLY', NULL, '$2y$12$7MMvtFzmbHo7Rxz/8IccpO8Xb.qAkTHXCBLNnzToeGM..5gGqcIPK', 1, 1, NULL, '2025-03-20 00:45:12', '2025-03-20 00:45:12'),
(15, 'sample_123', 'sample123@gmail.com', 'Acc-RI5AE1JB1', NULL, '$2y$12$lKIPmXuI5FQ8w5vTOzzuQezcygwD9e.nCihGo86KZlUCiLcxbLeCS', 1, 1, NULL, '2025-03-20 00:51:28', '2025-03-20 00:51:28'),
(16, 'renly123', 'renly@gmail.com', 'Acc-RP390C5IB', NULL, '$2y$12$sv6xmzrla6sa3.gMHd4nKesKZSt0JiFbP8cojzDZy2ZaIJK9/o2tu', 1, 1, NULL, '2025-03-20 07:02:45', '2025-03-20 07:02:45'),
(17, 'ricky123', 'ricky@gmail.com', 'Acc-1U6L2HSKM', NULL, '$2y$12$XWciRwpNuo7cUQXSThqhSOXoo00qf/Nf8gFz9ms3WfcCFWgqXuCxe', 1, 1, NULL, '2025-03-20 07:05:14', '2025-03-20 07:05:14'),
(18, 'gina123', 'gina@gmail.com', 'Acc-3XBATUUF2', NULL, '$2y$12$wPgg0eo.YJHreTyrt.0P4.yUwnBNAbfepAILp60ATWnSetmjV4RqS', 1, 1, NULL, '2025-03-20 07:08:32', '2025-03-20 07:08:32'),
(19, 'titil123', 'titil@gmail.com', 'Acc-7VNUN2T7E', NULL, '$2y$12$6ZvaGDT0Dp3EFBvaMGVQL.Tz9b/GTEsvDuGoxWWXe08wnJQtPolPe', 1, 1, NULL, '2025-03-20 07:17:12', '2025-03-20 07:17:12'),
(20, 'lyzil123', 'lyzil@gmail.com', 'Acc-OMOUTQX0U', NULL, '$2y$12$wsDLhK30.OxNAKTZxoIYCegADZyRr5n8r2slWr7anNR3nJ5qM76yi', 1, 1, NULL, '2025-03-23 05:08:21', '2025-03-23 05:08:21'),
(21, 'tadoy123', 'tadoy@gmail.com', 'Acc-NM2URL63G', NULL, '$2y$12$cxTXclggp5Lp8AtCkgEbqeCCN42YDE0V/8MSWbKDNzG88ckUwd0AS', 2, 1, NULL, '2025-03-23 20:33:22', '2025-03-23 20:33:22'),
(22, 'lyzil1234', 'lyzil123@gmail.com', 'Acc-ZQQFCG080', NULL, '$2y$12$RLTp.8eqSDAce7P2YecCAObeXenflLLP4Z8yJswo2.aqheKvf8e7K', 1, 0, NULL, '2025-03-31 19:21:50', '2025-03-31 19:21:50');

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
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_details_developer_id_foreign` (`developer_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identity_details`
--
ALTER TABLE `identity_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `property_listings`
--
ALTER TABLE `property_listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `p_info`
--
ALTER TABLE `p_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sales_encodings`
--
ALTER TABLE `sales_encodings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  ADD CONSTRAINT `project_details_developer_id_foreign` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`);

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
