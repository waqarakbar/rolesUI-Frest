-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 02, 2023 at 01:09 PM
-- Server version: 5.7.26-log
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\User', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad\", \"text\": null}}', NULL, '2023-02-06 13:56:33', '2023-02-06 13:56:33'),
(2, 'default', 'created', 'App\\Models\\User', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad\", \"text\": null}}', NULL, '2023-02-06 14:04:14', '2023-02-06 14:04:14'),
(3, 'default', 'created', 'App\\Models\\Visitor', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-06 14:04:14', '2023-02-06 14:04:14'),
(4, 'default', 'created', 'App\\Models\\User', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"test\", \"text\": null}}', NULL, '2023-02-06 14:07:26', '2023-02-06 14:07:26'),
(5, 'default', 'created', 'App\\Models\\Visitor', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-06 14:07:26', '2023-02-06 14:07:26'),
(6, 'default', 'created', 'App\\Models\\User', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad\", \"text\": null}}', NULL, '2023-02-06 14:18:12', '2023-02-06 14:18:12'),
(7, 'default', 'created', 'App\\Models\\Visitor', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-06 14:18:12', '2023-02-06 14:18:12'),
(8, 'default', 'created', 'App\\Models\\User', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"test\", \"text\": null}}', NULL, '2023-02-06 14:21:13', '2023-02-06 14:21:13'),
(9, 'default', 'created', 'App\\Models\\Visitor', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-06 14:21:13', '2023-02-06 14:21:13'),
(10, 'default', 'created', 'App\\Models\\User', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"test 2\", \"text\": null}}', NULL, '2023-02-07 03:03:47', '2023-02-07 03:03:47'),
(11, 'default', 'created', 'App\\Models\\User', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"test 2\", \"text\": null}}', NULL, '2023-02-07 03:14:22', '2023-02-07 03:14:22'),
(12, 'default', 'created', 'App\\Models\\User', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad\", \"text\": null}}', NULL, '2023-02-07 04:28:26', '2023-02-07 04:28:26'),
(13, 'default', 'created', 'App\\Models\\User', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad\", \"text\": null}}', NULL, '2023-02-07 04:30:46', '2023-02-07 04:30:46'),
(14, 'default', 'created', 'App\\Models\\User', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Wiring Time\", \"text\": null}}', NULL, '2023-02-07 04:49:36', '2023-02-07 04:49:36'),
(15, 'default', 'created', 'App\\Models\\User', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Wiring Time\", \"text\": null}}', NULL, '2023-02-07 04:51:46', '2023-02-07 04:51:46'),
(16, 'default', 'created', 'App\\Models\\User', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Warranty\", \"text\": null}}', NULL, '2023-02-07 04:53:06', '2023-02-07 04:53:06'),
(17, 'default', 'created', 'App\\Models\\User', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Warranty\", \"text\": null}}', NULL, '2023-02-07 04:55:31', '2023-02-07 04:55:31'),
(18, 'default', 'created', 'App\\Models\\User', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Warranty\", \"text\": null}}', NULL, '2023-02-07 04:56:14', '2023-02-07 04:56:14'),
(19, 'default', 'created', 'App\\Models\\User', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Warranty\", \"text\": null}}', NULL, '2023-02-07 04:57:23', '2023-02-07 04:57:23'),
(20, 'default', 'created', 'App\\Models\\User', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Wiring Time\", \"text\": null}}', NULL, '2023-02-07 05:03:47', '2023-02-07 05:03:47'),
(21, 'default', 'created', 'App\\Models\\User', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"jawad khan\", \"text\": null}}', NULL, '2023-02-07 05:18:23', '2023-02-07 05:18:23'),
(22, 'default', 'created', 'App\\Models\\Visitor', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-07 05:18:23', '2023-02-07 05:18:23'),
(23, 'default', 'deleted', 'App\\Models\\User', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"test\", \"text\": null}}', NULL, '2023-02-07 07:06:33', '2023-02-07 07:06:33'),
(24, 'default', 'created', 'App\\Models\\Visitor', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-07 07:26:29', '2023-02-07 07:26:29'),
(25, 'default', 'created', 'App\\Models\\Visitor', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-07 07:42:07', '2023-02-07 07:42:07'),
(26, 'default', 'created', 'App\\Models\\Visitor', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-07 07:45:46', '2023-02-07 07:45:46'),
(27, 'default', 'created', 'App\\Models\\Visitor', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:17:28', '2023-02-08 00:17:28'),
(28, 'default', 'created', 'App\\Models\\Visitor', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:18:17', '2023-02-08 00:18:17'),
(29, 'default', 'created', 'App\\Models\\Visitor', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:20:14', '2023-02-08 00:20:14'),
(30, 'default', 'created', 'App\\Models\\Visitor', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:23:40', '2023-02-08 00:23:40'),
(31, 'default', 'created', 'App\\Models\\Visitor', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:24:28', '2023-02-08 00:24:28'),
(32, 'default', 'created', 'App\\Models\\Visitor', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:24:44', '2023-02-08 00:24:44'),
(33, 'default', 'created', 'App\\Models\\Visitor', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:26:15', '2023-02-08 00:26:15'),
(34, 'default', 'created', 'App\\Models\\Visitor', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:28:01', '2023-02-08 00:28:01'),
(35, 'default', 'created', 'App\\Models\\Visitor', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:28:20', '2023-02-08 00:28:20'),
(36, 'default', 'created', 'App\\Models\\Visitor', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:29:45', '2023-02-08 00:29:45'),
(37, 'default', 'created', 'App\\Models\\Visitor', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:31:40', '2023-02-08 00:31:40'),
(38, 'default', 'created', 'App\\Models\\Visitor', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:32:38', '2023-02-08 00:32:38'),
(39, 'default', 'created', 'App\\Models\\Visitor', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:33:38', '2023-02-08 00:33:38'),
(40, 'default', 'created', 'App\\Models\\Visitor', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:33:56', '2023-02-08 00:33:56'),
(41, 'default', 'created', 'App\\Models\\Visitor', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 00:57:24', '2023-02-08 00:57:24'),
(42, 'default', 'created', 'App\\Models\\User', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"imran\", \"text\": null}}', NULL, '2023-02-08 02:53:36', '2023-02-08 02:53:36'),
(43, 'default', 'created', 'App\\Models\\Visitor', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 02:53:36', '2023-02-08 02:53:36'),
(44, 'default', 'created', 'App\\Models\\Visitor', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 03:20:52', '2023-02-08 03:20:52'),
(45, 'default', 'created', 'App\\Models\\Visitor', 'created', 4, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 04:38:40', '2023-02-08 04:38:40'),
(46, 'default', 'created', 'App\\Models\\User', 'created', 20, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": \"imran khan\", \"text\": null}}', NULL, '2023-02-08 04:40:46', '2023-02-08 04:40:46'),
(47, 'default', 'created', 'App\\Models\\Visitor', 'created', 5, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 04:42:09', '2023-02-08 04:42:09'),
(48, 'default', 'created', 'App\\Models\\User', 'created', 21, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": \"imran khan\", \"text\": null}}', NULL, '2023-02-08 04:44:10', '2023-02-08 04:44:10'),
(49, 'default', 'created', 'App\\Models\\Visitor', 'created', 6, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 04:45:43', '2023-02-08 04:45:43'),
(50, 'default', 'created', 'App\\Models\\User', 'created', 22, 'App\\Models\\User', 19, '{\"attributes\": {\"name\": \"imran khan\", \"text\": null}}', NULL, '2023-02-08 04:46:18', '2023-02-08 04:46:18'),
(51, 'default', 'created', 'App\\Models\\Visitor', 'created', 7, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 05:08:18', '2023-02-08 05:08:18'),
(52, 'default', 'created', 'App\\Models\\Visitor', 'created', 8, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 05:08:39', '2023-02-08 05:08:39'),
(53, 'default', 'created', 'App\\Models\\Visitor', 'created', 9, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 05:08:46', '2023-02-08 05:08:46'),
(54, 'default', 'created', 'App\\Models\\User', 'created', 23, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": \"imran khan\", \"text\": null}}', NULL, '2023-02-08 05:12:16', '2023-02-08 05:12:16'),
(55, 'default', 'created', 'App\\Models\\Visitor', 'created', 10, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 05:12:16', '2023-02-08 05:12:16'),
(56, 'default', 'created', 'App\\Models\\Visitor', 'created', 11, 'App\\Models\\User', 18, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-08 05:20:21', '2023-02-08 05:20:21'),
(57, 'default', 'created', 'App\\Models\\User', 'created', 24, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"admin.department@vms.com\", \"text\": null}}', NULL, '2023-02-09 02:26:13', '2023-02-09 02:26:13'),
(58, 'default', 'deleted', 'App\\Models\\User', 'deleted', 16, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Warranty\", \"text\": null}}', NULL, '2023-02-09 02:32:16', '2023-02-09 02:32:16'),
(59, 'default', 'deleted', 'App\\Models\\User', 'deleted', 17, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Wiring Time\", \"text\": null}}', NULL, '2023-02-09 02:32:23', '2023-02-09 02:32:23'),
(60, 'default', 'deleted', 'App\\Models\\User', 'deleted', 19, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"imran khan\", \"text\": null}}', NULL, '2023-02-09 02:32:32', '2023-02-09 02:32:32'),
(61, 'default', 'created', 'App\\Models\\User', 'created', 25, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"khan\", \"text\": null}}', NULL, '2023-02-09 02:47:29', '2023-02-09 02:47:29'),
(62, 'default', 'created', 'App\\Models\\Visitor', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-09 02:47:31', '2023-02-09 02:47:31'),
(63, 'default', 'created', 'App\\Models\\User', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"admin.health@vms.com\", \"text\": null}}', NULL, '2023-02-09 03:01:15', '2023-02-09 03:01:15'),
(64, 'default', 'deleted', 'App\\Models\\User', 'deleted', 12, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Wiring Time\", \"text\": null}}', NULL, '2023-02-09 03:01:33', '2023-02-09 03:01:33'),
(65, 'default', 'deleted', 'App\\Models\\User', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"test 2\", \"text\": null}}', NULL, '2023-02-09 03:01:37', '2023-02-09 03:01:37'),
(66, 'default', 'deleted', 'App\\Models\\User', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"test 2\", \"text\": null}}', NULL, '2023-02-09 03:01:42', '2023-02-09 03:01:42'),
(67, 'default', 'created', 'App\\Models\\User', 'created', 27, NULL, NULL, '{\"attributes\": {\"name\": \"imran\", \"text\": null}}', NULL, '2023-02-09 04:54:54', '2023-02-09 04:54:54'),
(68, 'default', 'created', 'App\\Models\\User', 'created', 28, NULL, NULL, '{\"attributes\": {\"name\": \"imran\", \"text\": null}}', NULL, '2023-02-09 04:55:43', '2023-02-09 04:55:43'),
(69, 'default', 'created', 'App\\Models\\User', 'created', 29, NULL, NULL, '{\"attributes\": {\"name\": \"imran\", \"text\": null}}', NULL, '2023-02-09 04:57:05', '2023-02-09 04:57:05'),
(70, 'default', 'created', 'App\\Models\\User', 'created', 30, NULL, NULL, '{\"attributes\": {\"name\": \"imran\", \"text\": null}}', NULL, '2023-02-10 04:15:06', '2023-02-10 04:15:06'),
(71, 'default', 'created', 'App\\Models\\Visitor', 'created', 13, 'App\\Models\\User', 30, '{\"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-10 04:16:30', '2023-02-10 04:16:30'),
(72, 'default', 'updated', 'App\\Models\\Visitor', 'updated', 9, 'App\\Models\\User', 26, '{\"old\": {\"name\": null, \"text\": null}, \"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-14 06:42:30', '2023-02-14 06:42:30'),
(73, 'default', 'updated', 'App\\Models\\Visitor', 'updated', 9, 'App\\Models\\User', 26, '{\"old\": {\"name\": null, \"text\": null}, \"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-14 06:43:53', '2023-02-14 06:43:53'),
(74, 'default', 'updated', 'App\\Models\\Visitor', 'updated', 9, 'App\\Models\\User', 26, '{\"old\": {\"name\": null, \"text\": null}, \"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-14 06:45:00', '2023-02-14 06:45:00'),
(75, 'default', 'updated', 'App\\Models\\Visitor', 'updated', 9, 'App\\Models\\User', 26, '{\"old\": {\"name\": null, \"text\": null}, \"attributes\": {\"name\": null, \"text\": null}}', NULL, '2023-02-14 06:45:27', '2023-02-14 06:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tehsil_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_user_id_foreign` (`user_id`),
  KEY `departments_tehsil_id_foreign` (`tehsil_id`),
  KEY `departments_district_id_foreign` (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `status`, `user_id`, `district_id`, `tehsil_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(10, 'Relief, Rehabilitation & Settlement Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Planning & Development Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Establishment Department ', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Elementary & Secondary Education Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Home & Tribal Affairs Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Higher Education, Archives and Libraries Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Health Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Minerals Development Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Zakat, Ushr, Social Welfare and Women Empowerment Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Board of Revenue', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Local Government, Elections and Rural Development Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Industries, Commerce and Technical Education Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Transport and Mass Transit Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Finance Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'Forestry, Environment & Wildlife Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Social Welfare Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Labour Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Inter Provincial Coordination Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Energy and Power Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Agriculture, Livestock and Cooperative Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'Administration Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Housing Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Population Walfare Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Auqaf, Hajj, Religious and Minority Affairs Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'Sports, Culture & Tourism Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'Excise, Taxation & Narcotics Control Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'Public Health Engineering', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'Science & Technology and Information Technology Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'Food Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'Information and Public Relation Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'Irrigation Department', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'Law, Parliamentary Affairs & Human Rights', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'Communication and Works Department', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

DROP TABLE IF EXISTS `gates`;
CREATE TABLE IF NOT EXISTS `gates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Gate 1', 1, NULL, NULL, NULL),
(2, 'Gate 2', 1, NULL, NULL, NULL),
(3, 'Gate 3', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 18, 'e5346cc6-b58a-45e8-b3ea-03a24eadcc85', 'user_profile', 'med9723', 'user_proifle_1675765103.png', 'image/png', 'media', 'media', 52204, '[]', '[]', '[]', '[]', 1, '2023-02-07 05:18:23', '2023-02-07 05:18:23'),
(2, 'App\\Models\\User', 18, 'c7c91933-102a-43d5-969d-c2c899d1109f', 'cnic_front', 'med97B0', 'cnic_front_1675765103.png', 'image/png', 'media', 'media', 52204, '[]', '[]', '[]', '[]', 2, '2023-02-07 05:18:23', '2023-02-07 05:18:23'),
(3, 'App\\Models\\User', 18, '7b1166c0-5551-4ab9-91e2-a28ea8359b39', 'cnic_back', 'med97C1', 'cnic_back_1675765103.png', 'image/png', 'media', 'media', 52204, '[]', '[]', '[]', '[]', 3, '2023-02-07 05:18:23', '2023-02-07 05:18:23'),
(4, 'App\\Models\\User', 7, '9c63141a-7f60-4bec-8035-d4ed068457b6', 'user_profile', 'medDD88', 'user_proifle_1675772789.png', 'image/png', 'media', 'media', 45780, '[]', '[]', '[]', '[]', 1, '2023-02-07 07:26:29', '2023-02-07 07:26:29'),
(5, 'App\\Models\\User', 7, '23cfa431-520f-4c78-a009-ac418a754326', 'cnic_front', 'medDDF6', 'cnic_front_1675772789.png', 'image/png', 'media', 'media', 45780, '[]', '[]', '[]', '[]', 2, '2023-02-07 07:26:29', '2023-02-07 07:26:29'),
(6, 'App\\Models\\User', 7, '895641c8-7554-4730-ba96-ee602e03b58c', 'cnic_back', 'medDE17', 'cnic_back_1675772789.png', 'image/png', 'media', 'media', 45780, '[]', '[]', '[]', '[]', 3, '2023-02-07 07:26:29', '2023-02-07 07:26:29'),
(7, 'App\\Models\\User', 7, '4e99feed-2b91-4c77-9193-e5db4f8d3090', 'user_profile', 'med2DAB', 'user_proifle_1675773727.png', 'image/png', 'media', 'media', 50088, '[]', '[]', '[]', '[]', 4, '2023-02-07 07:42:07', '2023-02-07 07:42:07'),
(8, 'App\\Models\\User', 7, 'd7da4726-639f-400c-9a0a-daf87a2d731a', 'cnic_front', 'med2DEA', 'cnic_front_1675773727.png', 'image/png', 'media', 'media', 50088, '[]', '[]', '[]', '[]', 5, '2023-02-07 07:42:07', '2023-02-07 07:42:07'),
(9, 'App\\Models\\User', 7, '4af1b985-298e-48a9-9d60-cab3ad05a099', 'cnic_back', 'med2DFB', 'cnic_back_1675773727.png', 'image/png', 'media', 'media', 50088, '[]', '[]', '[]', '[]', 6, '2023-02-07 07:42:07', '2023-02-07 07:42:07'),
(10, 'App\\Models\\User', 25, '7cc39ee0-7313-421e-8f90-84091ba5fb21', 'user_profile', 'med2775', 'user_proifle_1675928849.png', 'image/png', 'media', 'media', 43232, '[]', '[]', '[]', '[]', 1, '2023-02-09 02:47:30', '2023-02-09 02:47:30'),
(11, 'App\\Models\\User', 25, '1ef45943-ed14-4bd7-b2ff-7a434159d9cc', 'cnic_front', 'med2E9A', 'cnic_front_1675928851.png', 'image/png', 'media', 'media', 43232, '[]', '[]', '[]', '[]', 2, '2023-02-09 02:47:31', '2023-02-09 02:47:31'),
(12, 'App\\Models\\User', 25, '19445a2f-ec2a-4fc7-b79d-b1f044cff53a', 'cnic_back', 'med2EBA', 'cnic_back_1675928851.png', 'image/png', 'media', 'media', 43232, '[]', '[]', '[]', '[]', 3, '2023-02-09 02:47:31', '2023-02-09 02:47:31'),
(13, 'App\\Models\\User', 28, '0f2b1b91-0807-4c37-bac5-c191497220c0', 'cnic_front', 'med5F93', 'cnic_front_1675936544.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 1, '2023-02-09 04:55:44', '2023-02-09 04:55:44'),
(14, 'App\\Models\\User', 28, '2d9d6a09-8761-4fc4-a3ca-f5320a48f39b', 'cnic_back', 'med6551', 'cnic_back_1675936545.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 2, '2023-02-09 04:55:45', '2023-02-09 04:55:45'),
(15, 'App\\Models\\User', 29, 'dbd5a368-53d2-4eaa-8154-7a401fd22e8e', 'cnic_front', 'med9E59', 'cnic_front_1675936625.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 1, '2023-02-09 04:57:05', '2023-02-09 04:57:05'),
(16, 'App\\Models\\User', 29, 'd16a2da3-8b8d-49b3-8e02-cc1605eac786', 'cnic_back', 'med9E98', 'cnic_back_1675936625.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 2, '2023-02-09 04:57:05', '2023-02-09 04:57:05'),
(17, 'App\\Models\\User', 30, '346d3675-0752-45b0-9a40-0ad07b3d6b6b', 'user_profile', 'med8979', 'user_profile_1676020506.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 1, '2023-02-10 04:15:07', '2023-02-10 04:15:07'),
(18, 'App\\Models\\User', 30, '3d228b8d-215d-4d8e-9db7-7ed4ca9d82ac', 'cnic_front', 'med9060', 'cnic_front_1676020508.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 2, '2023-02-10 04:15:08', '2023-02-10 04:15:08'),
(19, 'App\\Models\\User', 30, 'a1c9ef44-613c-4fc3-90bc-fac2c519ac16', 'cnic_back', 'med9070', 'cnic_back_1676020508.png', 'image/png', 'media', 'media', 35227, '[]', '[]', '[]', '[]', 3, '2023-02-10 04:15:08', '2023-02-10 04:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `isGeneric` tinyint(1) NOT NULL DEFAULT '1',
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_department_id_foreign` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `status`, `isGeneric`, `department_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 1, 1, NULL, NULL, '2023-02-06 08:21:00', '2023-02-06 08:21:00'),
(2, 'role', 1, 1, NULL, NULL, '2023-02-06 08:21:00', '2023-02-06 08:21:00'),
(4, 'department', 1, 1, NULL, NULL, '2023-02-06 08:22:12', '2023-02-06 08:22:12'),
(5, 'visitor', 1, 1, NULL, NULL, '2023-02-06 11:29:55', '2023-02-06 11:29:55'),
(6, 'report', 1, 1, NULL, NULL, '2023-02-13 21:37:37', '2023-02-13 21:37:37'),
(7, 'request', 1, 1, NULL, NULL, '2023-02-13 21:37:37', '2023-02-13 21:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_02_080817_create_departments_table', 1),
(6, '2023_01_03_080818_create_menus_table', 1),
(7, '2023_01_03_082045_create_permission_tables', 1),
(8, '2023_01_04_042846_basic_admin_permission_seeder', 1),
(9, '2023_01_04_044457_add_menu_id_to_permissions', 1),
(11, '2023_01_27_090637_create_districts_table', 2),
(12, '2023_01_27_090909_create_tehsils_table', 2),
(18, '2023_01_12_063847_add_depertment_id_to_users_table', 4),
(14, '2023_02_06_130258_create_activity_log_table', 3),
(15, '2023_02_06_130259_add_event_column_to_activity_log_table', 3),
(16, '2023_02_06_130300_add_batch_uuid_column_to_activity_log_table', 3),
(19, '2023_01_30_050309_add_district_id_to_departments', 4),
(20, '2023_02_06_150609_create_gates_table', 4),
(21, '2023_02_06_153326_add_cnic_to_users', 5),
(22, '2023_02_06_153535_create_visitors_table', 6),
(23, '2023_02_07_060922_add_creator_id_to_visitors', 7),
(24, '2023_02_07_070954_create_media_table', 7),
(25, '2023_02_09_072754_add_date_to_visitors', 8),
(26, '2023_02_13_110453_add_passenger_column_to_visitor_table', 9),
(27, '2023_02_14_091542_create_vehcile_manufacturers_table', 10),
(28, '2023_02_14_093146_add_license_no_to_visitors_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 26);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  KEY `permissions_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `menu_id`) VALUES
(1, 'user-list', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 1),
(2, 'user-create', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 1),
(3, 'user-edit', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 1),
(4, 'user-delete', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 1),
(5, 'role-list', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 2),
(6, 'role-create', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 2),
(7, 'role-edit', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 2),
(8, 'role-delete', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 2),
(9, 'branch-list', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 3),
(10, 'branch-create', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 3),
(11, 'branch-edit', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 3),
(12, 'branch-delete', 'web', '2023-02-06 08:21:00', '2023-02-06 08:21:00', 3),
(13, 'department-list', 'web', '2023-02-06 08:22:12', '2023-02-06 08:22:12', 4),
(14, 'department-create', 'web', '2023-02-06 08:22:12', '2023-02-06 08:22:12', 4),
(15, 'department-edit', 'web', '2023-02-06 08:22:12', '2023-02-06 08:22:12', 4),
(16, 'department-delete', 'web', '2023-02-06 08:22:12', '2023-02-06 08:22:12', 4),
(17, 'visitor-list', 'web', '2023-02-06 11:29:55', '2023-02-06 11:29:55', 5),
(18, 'visitor-create', 'web', '2023-02-06 11:29:55', '2023-02-06 11:29:55', 5),
(19, 'visitor-edit', 'web', '2023-02-06 11:29:55', '2023-02-06 11:29:55', 5),
(20, 'visitor-delete', 'web', '2023-02-06 11:29:55', '2023-02-06 11:29:55', 5),
(21, 'report-list', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 6),
(22, 'report-create', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 6),
(23, 'report-edit', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 6),
(24, 'report-delete', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 6),
(25, 'request-list', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 7),
(26, 'request-create', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 7),
(27, 'request-edit', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 7),
(28, 'request-delete', 'web', '2023-02-13 21:37:37', '2023-02-13 21:37:37', 7);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(15, 'App\\Models\\User', 1, 'mobile-app', 'd3b40c17a5ef948f7953c8a2ea859602e0530f69fcbedcdaf096430d9592f042', '[\"*\"]', '2023-02-08 10:06:09', NULL, '2023-02-08 10:05:19', '2023-02-08 10:06:09'),
(6, 'App\\Models\\User', 19, 'mobile-app', '3aa6f065c2359894e52e62196579c55e3762f762739bfd4bebb9bd131e92ef6e', '[\"*\"]', '2023-02-08 04:46:18', NULL, '2023-02-08 03:28:58', '2023-02-08 04:46:18'),
(14, 'App\\Models\\User', 18, 'mobile-app', '9453f30c00390236249698e46472fd44612e23fdb2300384b84cf4982e67cd87', '[\"*\"]', '2023-02-08 10:04:14', NULL, '2023-02-08 09:22:44', '2023-02-08 10:04:14'),
(8, 'App\\Models\\User', 23, 'mobile-app', 'c8fac7efa638ed10bb0a93e1a98f9ce4ad6a9dff3292cea76c56940c52425ea7', '[\"*\"]', NULL, NULL, '2023-02-08 05:12:16', '2023-02-08 05:12:16'),
(16, 'App\\Models\\User', 28, 'mobile-app', '220e571a155254003fb51fb13e9fb3fa718a3ba472120eb5baaac76c3ab22844', '[\"*\"]', NULL, NULL, '2023-02-09 04:55:45', '2023-02-09 04:55:45'),
(17, 'App\\Models\\User', 29, 'mobile-app', '48ec707e3ecdf95d0267d642c43827aba91c1d20a0116d084b891925d85bc89a', '[\"*\"]', NULL, NULL, '2023-02-09 04:57:05', '2023-02-09 04:57:05'),
(19, 'App\\Models\\User', 30, 'mobile-app', 'a2004a93f82d0bdedb334a846131fc0edaced3a40da75842a794db344d7ca29d', '[\"*\"]', '2023-02-10 04:16:30', NULL, '2023-02-10 04:15:37', '2023-02-10 04:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2023-02-06 08:20:26', '2023-02-06 08:20:26'),
(2, 'Computer operator', 'web', '2023-02-06 11:31:17', '2023-02-06 11:31:17'),
(3, 'visitor', 'web', '2023-02-06 14:00:23', '2023-02-06 14:00:23'),
(4, 'Department', 'web', '2023-02-09 02:25:14', '2023-02-13 21:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(17, 4),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(19, 4),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tehsils`
--

DROP TABLE IF EXISTS `tehsils`;
CREATE TABLE IF NOT EXISTS `tehsils` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tehsils_district_id_foreign` (`district_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visitor',
  `superapp_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cnic` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrcode` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_department_id_foreign` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `type`, `superapp_id`, `department_id`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `cnic`, `mobile`, `qrcode`) VALUES
(1, 'admin', 'admin@admin.com', 1, 'system', NULL, NULL, NULL, '$2y$10$S8BjDO/Hsu1VV1wU5MSr9ukaxJt34v5kGSXp7GIe14JewA3WoFRge', NULL, NULL, '2023-02-06 08:16:33', '2023-02-06 08:16:33', NULL, NULL, NULL),
(6, 'test', 'admin@khan.com', 1, '2', NULL, 17, NULL, '$2y$10$jRUrO5kP7gZqtDcDeTJhlOIK0cYf1Go7avJtCm3kKocL8Y8cnP15K', NULL, '2023-02-07 07:06:33', '2023-02-06 14:21:13', '2023-02-07 07:06:33', '1234567891452', '0319569589', '964525ffv'),
(5, 'jawad', 'jawad@gmail.com', 1, 'visitor', NULL, NULL, NULL, '$2y$10$O1PchwiY0PAYyIeZFxirKeQqE2eE1rVXqibS2OQibhvxj7zhkW6Ei', NULL, NULL, '2023-02-06 14:18:12', '2023-02-06 14:18:12', '1234567891452', NULL, NULL),
(7, 'test 2', 'admin@sholarship.com', 1, '2', NULL, 48, NULL, '$2y$10$LBQbfD04dVGT/QnaIyLyEeBl3YD.QTkAwamsKqjzxLnk95bnmetJe', NULL, '2023-02-09 03:01:37', '2023-02-07 03:03:47', '2023-02-09 03:01:37', '1720194844201', NULL, '9645'),
(8, 'test 2', 'test.tech@gmail.com', 1, '2', NULL, 48, NULL, '$2y$10$U7IiXzKbChbHkOG0/PJJAe6z2WkkAo6nQt6lBXCeiX5GdYdDSHc9K', NULL, '2023-02-09 03:01:42', '2023-02-07 03:14:22', '2023-02-09 03:01:42', '1720194844206', NULL, '9645'),
(12, 'Wiring Time', 'amaan@gmail.com', 1, '2', NULL, 13, NULL, '$2y$10$vLUGxmJ6D6pbXA.6KQMv/.uK/Wpj5Xid2PNMgILEMuw8pybDbeD/C', NULL, '2023-02-09 03:01:33', '2023-02-07 04:51:46', '2023-02-09 03:01:33', NULL, 'test', '964525ffv'),
(16, 'Warranty', 'admin@stellar.edu', 1, '1', NULL, 55, NULL, '$2y$10$qbwvOrQb31oHmOVhYf6yLu9YDJMNGk70jD6NJAMxQa5DVywFHFm4a', NULL, '2023-02-09 02:32:16', '2023-02-07 04:57:23', '2023-02-09 02:32:16', NULL, 'test', '964525ffv'),
(17, 'Wiring Time', 'khan@gmail.com', 1, '1', NULL, 16, NULL, '$2y$10$XIOLLYe1cZ23PRgxeFgbbuSurLeVwqnfnc9m1osxRiblI6vJV6GnO', NULL, '2023-02-09 02:32:23', '2023-02-07 05:03:47', '2023-02-09 02:32:23', NULL, NULL, NULL),
(24, 'admin.department@vms.com', 'admin.department@vms.com', 1, 'visitor', NULL, NULL, '2023-02-09 02:26:12', '$2y$10$Jy65DsjnL3jD67PVj8A3G.Yk2vkwUCOR41Wm5dQQTj29ATbUwmJee', NULL, NULL, '2023-02-09 02:26:12', '2023-02-09 02:26:12', NULL, NULL, NULL),
(19, 'imran khan', '2323223', 1, 'visitor', NULL, NULL, NULL, '$2y$10$pNoq59P2WuRc8dtdeskt3uaOABV1sksPcq3Dz1YtBL.HFZMkwwinG', NULL, '2023-02-09 02:32:32', '2023-02-08 05:12:16', '2023-02-09 02:32:32', '2323223', NULL, NULL),
(18, 'imran khan', '23232236', 1, 'visitor', NULL, NULL, NULL, '$2y$10$JhXxac1de2NlzZF6ALsvjeCtOBzqjznZo/ouHucUO4yuxqjEVBZ36', NULL, NULL, '2023-02-08 04:46:18', '2023-02-08 04:46:18', '23232236', NULL, NULL),
(25, 'khan', '123456789', 1, '1', NULL, 59, NULL, '$2y$10$KdZ8RnlFsFaWx.7zRdnM3OL0IPMU5BSbABNtfCDaO23FgzQAF7th2', NULL, NULL, '2023-02-09 02:47:29', '2023-02-09 02:47:29', '123456789', '03130991811', '9645'),
(26, 'Admin Health', 'admin.health@vms.com', 1, 'visitor', NULL, 16, '2023-02-09 03:01:15', '$2y$10$DqWzz4ZIWMPwBdrXGUQPxeU5Hn4WUvYGNGjoC49Obf8XyUyni6YkO', NULL, NULL, '2023-02-09 03:01:15', '2023-02-09 03:01:15', NULL, NULL, NULL),
(27, 'imran', '123456789a3e', 1, 'visitor', NULL, NULL, NULL, '$2y$10$C5ahGRwqkvDoHgXhv5lvl.CqcoRq04VGASELWVmGKkrXps.3Yh4Qu', NULL, NULL, '2023-02-09 04:54:53', '2023-02-09 04:54:53', '123456789a3e', NULL, NULL),
(28, 'imran', '123456789a3e2', 1, 'visitor', NULL, NULL, NULL, '$2y$10$d0HcjVMGvPbCxeLOQzQpV./ZAt25mVkTwJEny2yLRfGyAN4r8twZ.', NULL, NULL, '2023-02-09 04:55:43', '2023-02-09 04:55:43', '123456789a3e2', NULL, NULL),
(29, 'imran', '123456789a3e23', 1, 'visitor', NULL, NULL, NULL, '$2y$10$f8g0.yohKfjJApti0Y8/vOkmZm0E.Br.AF8ACdo0JRYdZ60GNof6K', NULL, NULL, '2023-02-09 04:57:05', '2023-02-09 04:57:05', '123456789a3e23', NULL, NULL),
(30, 'imran', '1234567899', 1, 'visitor', NULL, NULL, NULL, '$2y$10$xHP4sRWav5bKFXg9FgFbgOc5RR29kW3DpJNb1ejlri7PC0dedAGp2', NULL, NULL, '2023-02-10 04:15:06', '2023-02-10 04:15:06', '1234567899', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehcile_manufacturers`
--

DROP TABLE IF EXISTS `vehcile_manufacturers`;
CREATE TABLE IF NOT EXISTS `vehcile_manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehcile_manufacturers`
--

INSERT INTO `vehcile_manufacturers` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Acura', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(2, 'Alfa-Romeo', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(3, 'Aston Martin', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(4, 'Audi', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(5, 'BMW', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(6, 'Bentley', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(7, 'Buick', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(8, 'Cadilac', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(9, 'Chevrolet', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(10, 'Chrysler', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(11, 'Daewoo', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(12, 'Daihatsu', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(13, 'Dodge', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(14, 'Eagle', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(15, 'Ferrari', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(16, 'Fiat', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(17, 'Fisker', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(18, 'Ford', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(19, 'Freighliner', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(20, 'GMC - General Motors Company', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(21, 'Genesis', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(22, 'Geo', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(23, 'Honda', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(24, 'Hummer', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(25, 'Hyundai', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(26, 'Infinity', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(27, 'Isuzu', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(28, 'Jaguar', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(29, 'Jeep', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(30, 'Kla', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(31, 'Lamborghini', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(32, 'Land Rover', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(33, 'Lexus', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(34, 'Lincoln', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(35, 'Lotus', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(36, 'Mazda', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(37, 'Maserati', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(38, 'Maybach', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(39, 'McLaren', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(40, 'Mercedez-Benz', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(41, 'Mercury', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(42, 'Mini', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(43, 'Mitsubishi', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(44, 'Nissan', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(45, 'Oldsmobile', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(46, 'Panoz', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(47, 'Plymouth', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(48, 'Polestar', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(49, 'Pontiac', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(50, 'Porsche', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(51, 'Ram', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(52, 'Rivian', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(53, 'Rolls_Royce', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(54, 'Saab', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(55, 'Saturn', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(56, 'Smart', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(57, 'Subaru', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(58, 'Susuki', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(59, 'Tesla', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(60, 'Toyota', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(61, 'Volkswagen', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28'),
(62, 'Volvo', NULL, '2023-02-14 04:32:28', '2023-02-14 04:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` bigint(20) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 for pedestrain 2 for with vehicle',
  `vechical_no` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `source` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tehsil_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `data_source` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `qrcode` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visiting_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visiting_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_reason` text COLLATE utf8mb4_unicode_ci,
  `passenger` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_make` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_no` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitors_user_id_foreign` (`user_id`),
  KEY `visitors_department_id_foreign` (`department_id`),
  KEY `visitors_gate_id_foreign` (`gate_id`),
  KEY `visitors_tehsil_id_foreign` (`tehsil_id`),
  KEY `visitors_district_id_foreign` (`district_id`),
  KEY `visitors_creator_id_foreign` (`creator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `type`, `vechical_no`, `purpose`, `status`, `source`, `user_id`, `department_id`, `gate_id`, `tehsil_id`, `district_id`, `deleted_at`, `created_at`, `updated_at`, `creator_id`, `data_source`, `qrcode`, `visiting_date`, `visiting_time`, `rejected_reason`, `passenger`, `vehicle_make`, `license_no`) VALUES
(1, 2, '5787', NULL, 1, 'direct', 18, 11, 1, NULL, NULL, NULL, '2023-02-08 00:57:24', '2023-02-08 00:57:24', 1, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, NULL, 1, 'direct', 19, 10, 1, NULL, NULL, NULL, '2023-02-08 02:53:36', '2023-02-08 02:53:36', 1, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, NULL, NULL, 1, 'direct', 1, 10, 1, NULL, NULL, NULL, '2023-02-08 03:20:52', '2023-02-08 03:20:52', 1, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, NULL, NULL, 1, 'direct', 19, 10, 1, NULL, NULL, NULL, '2023-02-08 04:38:40', '2023-02-08 04:38:40', 19, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, 1, 'direct', 20, 10, 1, NULL, NULL, NULL, '2023-02-08 04:42:09', '2023-02-08 04:42:09', 19, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, 1, 'direct', 21, 10, 1, NULL, NULL, NULL, '2023-02-08 04:45:43', '2023-02-08 04:45:43', 19, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, 1, 'direct', 18, 10, 1, NULL, NULL, NULL, '2023-02-08 05:08:18', '2023-02-08 05:08:18', 18, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, NULL, NULL, 1, 'direct', 18, 10, 1, NULL, NULL, NULL, '2023-02-08 05:08:39', '2023-02-08 05:08:39', 18, 'web', NULL, '2023-02-09', '07:47:31', NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, 4, 'direct', 1, 16, 1, NULL, NULL, NULL, '2023-02-08 05:08:46', '2023-02-14 06:45:27', 18, 'web', NULL, NULL, '01:11', 'fdafdfdas', NULL, NULL, NULL),
(10, 1, NULL, NULL, 1, 'direct', 1, 16, 1, NULL, NULL, NULL, '2023-02-08 05:12:16', '2023-02-08 05:12:16', 18, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, 1, 'direct', 1, 16, 1, NULL, NULL, NULL, '2023-02-08 05:20:21', '2023-02-08 05:20:21', 18, 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, NULL, NULL, 1, 'direct', 25, 59, 1, NULL, NULL, NULL, '2023-02-09 02:47:31', '2023-02-09 02:47:31', 1, 'web', '9645', '2023-02-09', '07:47:31', NULL, NULL, NULL, NULL),
(13, 1, '343', NULL, 2, 'direct', 30, NULL, NULL, NULL, NULL, NULL, '2023-02-10 04:16:30', '2023-02-10 04:16:30', NULL, 'API', NULL, '01/03/1995', '01:10:00', NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
