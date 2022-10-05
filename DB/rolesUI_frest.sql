-- -------------------------------------------------------------
-- TablePlus 4.2.0(388)
--
-- https://tableplus.com/
--
-- Database: rolesUI_frest
-- Generation Time: 2022-10-05 22:51:47.9960
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `active` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_type_id` bigint unsigned DEFAULT NULL,
  `company_level_id` bigint unsigned DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `tehsil_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `reference_id` bigint DEFAULT NULL,
  `reference_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `company_levels`;
CREATE TABLE `company_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `company_types`;
CREATE TABLE `company_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `division_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `urdu_title` text NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `description` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `district_group_id` int DEFAULT NULL,
  `agriculture_district_id` int DEFAULT NULL,
  `epid_district_id` int DEFAULT NULL,
  `sort_id` int DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `population_17` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  KEY `division_id` (`division_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE `divisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_routes`;
CREATE TABLE `permission_routes` (
  `is_default` enum('yes','no') DEFAULT 'no',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `route` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `app_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `app_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `show_in_menu` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tehsils`;
CREATE TABLE `tehsils` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` varchar(10) DEFAULT NULL,
  `is_hq` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is following tehsil is ditrict head quarter, where DC sits',
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1268 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `apps` (`id`, `title`, `description`, `icon`, `route`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Settings', NULL, 'bx bx-wrench', 'settings', 1, '2022-05-16 17:16:02', '2022-10-05 22:23:28', NULL),
(10, 'testing app', NULL, 'bx bx-trash', 'testing', NULL, '2022-10-05 20:58:05', '2022-10-05 20:58:05', NULL);

INSERT INTO `companies` (`id`, `company_type_id`, `company_level_id`, `parent_id`, `country_id`, `province_id`, `division_id`, `district_id`, `tehsil_id`, `title`, `description`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `reference_id`, `reference_model`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 'Developers Department', 'Department for developer accounts', 2, '2022-05-28 18:05:10', '2022-06-23 10:00:33', NULL, NULL, NULL);

INSERT INTO `company_levels` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'National Level', NULL, NULL, NULL, NULL),
(2, 'Provincial Level', NULL, NULL, NULL, NULL),
(3, 'Regional / Divisional Level', NULL, NULL, NULL, NULL),
(4, 'District Level', NULL, NULL, NULL, NULL);

INSERT INTO `company_types` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Developer', NULL, NULL, NULL, NULL);

INSERT INTO `countries` (`id`, `title`, `description`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pakistan', '', 1, NULL, '2015-01-28 16:12:54', '2022-05-16 13:31:12');

INSERT INTO `districts` (`id`, `province_id`, `division_id`, `title`, `urdu_title`, `latitude`, `longitude`, `description`, `active`, `deleted_at`, `created_at`, `updated_at`, `district_group_id`, `agriculture_district_id`, `epid_district_id`, `sort_id`, `area`, `population_17`) VALUES
(1, 1, 7, 'Peshawar', 'پشاور ', '34.014975', '71.580490', 'pesh', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 1, 30, 1, NULL, '4519396'),
(2, 1, 6, 'Mardan', 'مردان', '34.200114', '72.050801', 'mar', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 12, 40, 20, NULL, '2512205'),
(3, 1, 7, 'Charsadda', 'چارسدہ', '34.149433', '71.742781', 'cha', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 11, 31, 10, NULL, '1710963'),
(4, 1, 1, 'Bannu', 'بنوں  ', '32.989724', '70.603833', 'ban', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 8, 61, 100, NULL, '1236371'),
(5, 1, 2, 'Dera Ismail Khan', 'درہ اسماعیل خان', '31.842362', '70.895234', 'dik', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 10, 60, 96, NULL, '1722539'),
(6, 1, 5, 'Dir Upper', ' دیر اپر ', '35.206591', '71.878309', 'dru', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 17, 25, 70, NULL, '1001914'),
(7, 1, 5, 'Dir Lower', 'دیر لوئر', '34.832810', '71.836166', 'drl', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 18, 23, 65, NULL, '1520112'),
(8, 1, 3, 'Abbottabad', 'ابتآباد', '34.168750', '73.221498', 'abt', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 6, 10, 145, '', '1411076'),
(9, 1, 3, 'Battagram', 'بٹگرام   ', '34.676658', '73.025769', 'bat', 1, NULL, '2017-02-08 23:09:00', NULL, 4, 21, 11, 160, NULL, '504558'),
(10, 1, 5, 'Buner', 'بونیر ', '34.394322', '72.615117', 'bnr', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 7, 22, 80, NULL, '949932'),
(11, 1, 5, 'Chitral Lower', 'چترال لوئر   ', '35.852287', '71.787107', 'chi', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 13, 21, 75, NULL, '294552'),
(12, 1, 4, 'Hangu', 'ھنگو ', '33.528665', '71.067605', 'han', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 5, 54, 125, NULL, '549217'),
(13, 1, 3, 'Haripur', 'ہریپور ', '33.995984', '72.936762', 'har', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 23, 12, 140, NULL, '1061843'),
(14, 1, 4, 'Karak', 'کرک ', '33.110118', '71.091156', 'ktk', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 24, 51, 115, NULL, '747712'),
(15, 1, 4, 'Kohat', 'کوہاٹ ', '33.583401', '71.433219', 'kht', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 4, 50, 120, NULL, '1052150'),
(16, 1, 3, 'Kohistan Upper', 'کوہستان اپر ', '35.261126', '73.276536', 'kou', 1, NULL, '2017-02-08 23:09:00', NULL, 4, NULL, 72, 165, NULL, '276907'),
(17, 1, 1, 'Lakki Marwat', 'لکی مروت', '32.546259', '70.716847', 'lak', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 9, 62, 101, NULL, '927557'),
(18, 1, 5, 'Malakand', 'ملاکنڈ  ', '34.503041', '71.904565', 'mal', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 16, 20, 60, NULL, '762529'),
(19, 1, 3, 'Mansehra', 'مانسہرہ ', '34.333882', '73.201062', 'man', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 12, 14, 150, NULL, '1647722'),
(20, 1, 7, 'Nowshera', 'نوشیرہ', '34.015856', '71.975452', 'now', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 2, 32, 5, NULL, '1607580'),
(21, 1, 5, 'Shangla', 'شانگلہ  ', '34.801508', '72.757002', 'sha', 1, NULL, '2017-02-08 23:09:00', NULL, 3, 19, 26, 90, NULL, '802243'),
(22, 1, 6, 'Swabi', 'صوابی ', '34.116416', '72.464278', 'swa', 1, NULL, '2017-02-08 23:09:00', NULL, 2, 15, 41, 30, NULL, '1719875'),
(23, 1, 5, 'Swat', 'سوات ', '34.749212', '72.356271', 'swt', 1, NULL, '2017-02-08 23:09:00', NULL, 1, 20, 24, 85, NULL, '2444991'),
(24, 1, 2, 'Tank', 'ٹانک', '32.341693', '70.526493', 'tnk', 1, NULL, '2017-02-08 23:09:00', NULL, 4, 3, 63, 97, NULL, '414862'),
(25, 1, 3, 'Tor Ghar', 'تورغر', '34.6172337', '72.8586485', 'tgr', 1, NULL, '2017-02-08 23:09:00', NULL, 4, 25, 15, 170, NULL, '181444'),
(26, 1, 3, 'Kohistan Lower', 'کوہستان لوئر   ', '35.261126', '73.276536', 'kol', 1, NULL, '2017-02-08 23:09:00', NULL, 4, 14, 73, 175, NULL, '276907'),
(27, 6, NULL, 'Islamabad', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 7, NULL, 'Ghanche', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 7, NULL, 'Skardu', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 7, NULL, 'Astore', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 7, NULL, 'Diamer', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 7, NULL, 'Ghizer', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 7, NULL, 'Gilgit', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 7, NULL, 'Hunza-Nagar', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 2, NULL, 'Attock', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 2, NULL, 'Bahawalnagar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 2, NULL, 'Bahawalpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 2, NULL, 'Bhakkar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 2, NULL, 'Chakwal', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 2, NULL, 'Chiniot', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 2, NULL, 'Dera Ghazi Khan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 2, NULL, 'Faisalabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 2, NULL, 'Gujranwala', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 2, NULL, 'Gujrat', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 2, NULL, 'Hafizabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 2, NULL, 'Jhang', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 2, NULL, 'Jhelum', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 2, NULL, 'Kasur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 2, NULL, 'Khanewal', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 2, NULL, 'Khushab', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 2, NULL, 'Lahore', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 2, NULL, 'Layyah', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 2, NULL, 'Lodhran', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 2, NULL, 'Mandi Bahauddin', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 2, NULL, 'Mianwali', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 2, NULL, 'Multan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 2, NULL, 'Muzaffargarh', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 2, NULL, 'Narowal', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 2, NULL, 'Nankana Sahib', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 2, NULL, 'Okara', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 2, NULL, 'Pakpattan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 2, NULL, 'Rahim Yar Khan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 2, NULL, 'Rajanpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 2, NULL, 'Rawalpindi', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 2, NULL, 'Sahiwal', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 2, NULL, 'Sargodha', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 2, NULL, 'Sheikhupura', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 2, NULL, 'Sialkot', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 2, NULL, 'Toba Tek Singh', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 2, NULL, 'Vehari', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 3, NULL, 'Dadu', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 3, NULL, 'Ghotki', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 3, NULL, 'Hyderabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 3, NULL, 'Jacobabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 3, NULL, 'Jamshoro', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 3, NULL, 'Karachi', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 3, NULL, 'Kashmore', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 3, NULL, 'Khairpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 3, NULL, 'Larkana', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 3, NULL, 'Matiari', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 3, NULL, 'Mirpurkhas', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 3, NULL, 'Naushahro Firoze', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 3, NULL, 'Shaheed Benazirabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 3, NULL, 'Kambar Shahdadkot', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 3, NULL, 'Sanghar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 3, NULL, 'Shikarpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 3, NULL, 'Sukkur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 3, NULL, 'Tando Allahyar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 3, NULL, 'Tando Muhammad Khan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 3, NULL, 'Tharparkar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 3, NULL, 'Thatta', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 3, NULL, 'Umerkot', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 3, NULL, 'Sujawal', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 4, NULL, 'Awaran', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 4, NULL, 'Barkhan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 4, NULL, 'Kachi(Bolan)', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 4, NULL, 'Chagai', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 4, NULL, 'Dera Bugti', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 4, NULL, 'Gwadar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 4, NULL, 'Harnai', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 4, NULL, 'Jafarabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 4, NULL, 'Jhal Magsi', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 4, NULL, 'Kalat', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 4, NULL, 'Kech(Turbat)', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 4, NULL, 'Kharan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 4, NULL, 'Kohlu', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 4, NULL, 'Khuzdar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 4, NULL, 'Killa Abdullah', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 4, NULL, 'Killa Saifullah', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 4, NULL, 'Lasbela', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 4, NULL, 'Loralai', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 4, NULL, 'Mastung', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 4, NULL, 'Musakhel', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 4, NULL, 'Nasirabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 4, NULL, 'Nushki[9]', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 4, NULL, 'Panjgur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 4, NULL, 'Pishin', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 4, NULL, 'Quetta', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 4, NULL, 'Sherani', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 4, NULL, 'Sibi', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 4, NULL, 'Washuk', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 4, NULL, 'Zhob', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 4, NULL, 'Ziarat', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 4, NULL, 'Lehri', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 4, NULL, 'Sohbatpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 1, 5, 'Bajaur', 'باجوڑ', '34.792033', '71.523887', 'baj', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 33, 300, NULL, '1147035'),
(139, 5, NULL, 'Khar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 1, 7, 'Khyber', 'خیبیر', '33.941935', '71.051311', 'khy', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 34, 300, NULL, '1035118'),
(141, 1, 4, 'Kurram', 'کرّم', '33.5591', '70.2885', 'kurrl', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 52, 300, NULL, '649775'),
(142, 1, 7, 'Mohmand', 'موھمند ', '34.384416', '71.362127', 'moh', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 35, 300, NULL, '489763'),
(143, 1, 1, 'North Waziristan', 'شمالی وزیرستان', '32.947397', '70.012855', 'nwd', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 64, 300, NULL, '569754'),
(144, 1, 4, 'Orakzai', 'اورکزئی', '33.709766', '70.982171', 'ork', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 53, 300, NULL, '266764'),
(145, 1, 2, 'South Waziristan', 'جنوبی وزیرستان', '32.466357', '69.852206', 'swd', 1, NULL, '2017-02-08 23:09:00', NULL, 5, NULL, 65, 300, NULL, '712316'),
(146, 5, NULL, 'FR Bannu', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 5, NULL, 'FR Dera Ismail Khan', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 5, NULL, 'FR Kohat', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 5, NULL, 'FR Lakki Marwat', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 5, NULL, 'FR Peshawar', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 5, NULL, 'FR Tank', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 8, NULL, 'Muzaffarabad', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 8, NULL, 'Hattian', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 8, NULL, 'Neelum', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 8, NULL, 'Mirpur', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 8, NULL, 'Bhimber', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 8, NULL, 'Kotli', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 8, NULL, 'Poonch', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 8, NULL, 'Bagh', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 8, NULL, 'Haveli', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 8, NULL, 'Sudhnati', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 4, NULL, 'Awaran', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 4, NULL, 'barkhan', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 8, NULL, 'Chagai', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 4, NULL, 'Dera bughti', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 4, NULL, 'Gawadar', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 4, NULL, 'Jaffarabad', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 4, NULL, 'jhal magsi', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 4, NULL, 'kalat', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 4, NULL, 'Turbat', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 4, NULL, 'Kharan', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 4, NULL, 'Khuzdar', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 4, NULL, 'Killa Abdullah', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 4, NULL, 'Kohlu', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 4, NULL, 'Lasbela', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 4, NULL, 'Loralal', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 4, NULL, 'Musakhel', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 4, NULL, 'Mustang', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 4, NULL, 'Nasir abad', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 4, NULL, 'Nushki', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 4, NULL, 'Panjgur', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 4, NULL, 'Pishin', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 4, NULL, 'Quetta', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 4, NULL, 'Sibi', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 4, NULL, 'Zhob', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 4, NULL, 'Ziarat', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 8, NULL, 'DISTRICT MUZAFFAR ABAD', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 8, NULL, ' BAGH', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 8, NULL, 'NEELAM', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 8, NULL, 'MIRPUR', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 8, NULL, 'KOTLI', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 8, NULL, 'BHIMBER', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 8, NULL, 'POONCH', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 8, NULL, 'SUDHNOTI', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 8, NULL, 'HATTIAN BALA', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 8, NULL, 'HAVELI', '', '', '', '', 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 3, NULL, 'Badin', '', '', '', NULL, 1, NULL, '2017-02-08 23:09:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 1, 3, 'Kolai Pallas', 'کولائی پالس', '35.261126', '73.276536', 'klp', 1, NULL, '2017-02-08 23:09:00', NULL, 4, NULL, 71, 180, NULL, '276907'),
(200, 1, 5, 'Chitral Upper', 'چترال اپر  ', '35.852287', '71.787107', 'chu', 1, NULL, '2017-02-08 23:09:00', NULL, 4, NULL, 21, 185, NULL, '179371');

INSERT INTO `divisions` (`id`, `province_id`, `title`, `description`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Bannu', 'BN', 1, '2016-05-03 12:36:39', NULL, NULL),
(2, 1, 'Dera Ismail Khan', 'DK', 1, '2016-05-03 12:36:58', NULL, NULL),
(3, 1, 'Hazara', '3', 1, '2016-05-03 12:37:12', NULL, NULL),
(4, 1, 'Kohat', 'KT', 1, '2016-05-03 12:37:29', NULL, NULL),
(5, 1, 'Malakand', 'MK', 1, '2016-05-03 12:37:43', NULL, NULL),
(6, 1, 'Mardan', 'MD', 1, '2016-05-03 12:38:00', NULL, NULL),
(7, 1, 'Peshawar', 'PR', 1, '2016-05-03 12:38:22', NULL, NULL),
(8, 1, 'Hazara', '6', 1, '2016-05-03 12:37:12', NULL, NULL),
(9, 1, 'Peshawar', 'PR', 1, '2016-05-03 12:38:22', NULL, NULL);

INSERT INTO `menus` (`id`, `app_id`, `parent_id`, `title`, `description`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'Apps', NULL, 'bx bx-grid-alt', '2022-05-17 07:31:57', '2022-05-18 05:20:20', NULL),
(2, 1, NULL, 'Menus', NULL, 'bx bx-list-ol', '2022-05-18 05:20:38', '2022-05-20 06:23:15', NULL),
(3, 1, NULL, 'Permissions', NULL, 'bx bx-lock-open', '2022-05-18 05:20:59', '2022-05-20 06:23:33', NULL),
(4, 1, NULL, 'Roles', NULL, 'bx bx-shield-x', '2022-05-20 06:24:57', '2022-05-20 06:24:57', NULL),
(5, 1, NULL, 'Organizations', NULL, 'bx bx-building-house', '2022-05-20 06:25:17', '2022-05-20 06:25:17', NULL),
(7, 1, NULL, 'Units', NULL, 'bx bx-store', '2022-05-20 06:25:17', '2022-05-20 06:25:17', NULL),
(8, 1, NULL, 'Users', NULL, 'bx bx-user-pin', '2022-05-28 13:10:31', '2022-05-28 13:48:00', NULL),
(9, 1, NULL, 'Organization Types', NULL, 'bx bx-category-alt', '2022-06-23 15:51:11', '2022-06-23 15:51:11', NULL);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2022_06_12_145156_create_company_types_table', 1),
(13, '2022_06_12_145506_add_company_type_id_to_companies_table', 1);

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(81, 43, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(82, 44, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(83, 45, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(84, 46, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(85, 47, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(86, 48, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(87, 49, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(88, 50, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(89, 51, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(90, 52, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(91, 53, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(92, 54, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(93, 55, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(94, 56, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(95, 57, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(96, 58, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(97, 59, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(98, 60, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(99, 61, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(100, 62, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(101, 63, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(102, 64, 4, '2022-05-28 13:46:14', '2022-05-28 13:46:14', NULL),
(107, 35, 4, '2022-05-30 08:26:21', '2022-05-30 08:26:21', NULL),
(108, 39, 4, '2022-05-30 08:26:21', '2022-05-30 08:26:21', NULL),
(109, 36, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(110, 37, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(111, 38, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(112, 40, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(113, 41, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(114, 42, 4, '2022-06-12 14:33:44', '2022-06-12 14:33:44', NULL),
(115, 65, 4, '2022-06-23 15:57:23', '2022-06-23 15:57:23', NULL),
(116, 66, 4, '2022-06-23 15:57:23', '2022-06-23 15:57:23', NULL),
(117, 67, 4, '2022-06-23 15:57:23', '2022-06-23 15:57:23', NULL),
(118, 68, 4, '2022-06-23 15:57:23', '2022-06-23 15:57:23', NULL);

INSERT INTO `permission_routes` (`is_default`, `title`, `description`, `route`, `created_at`, `updated_at`, `deleted_at`, `app_id`, `menu_id`, `permission_id`) VALUES
('yes', 'All apps', NULL, 'settings.my-apps.list', '2022-05-28 18:11:30', NULL, NULL, 1, 1, 35),
('yes', 'Edit app', NULL, 'settings.my-apps.edit', '2022-05-28 18:13:16', NULL, NULL, 1, 1, 37),
('no', 'Update app', NULL, 'settings.my-apps.update', '2022-05-28 18:13:16', NULL, NULL, 1, 1, 37),
('yes', 'Delete app', NULL, 'settings.my-apps.delete', '2022-05-28 18:13:52', NULL, NULL, 1, 1, 38),
('yes', 'New app', NULL, 'settings.my-apps.create', '2022-05-28 18:15:49', NULL, NULL, 1, 1, 36),
('no', 'Store app', NULL, 'settings.my-apps.store', '2022-05-28 18:15:49', NULL, NULL, 1, 1, 36),
('yes', 'All menus', NULL, 'settings.menus.list', '2022-05-28 18:16:44', NULL, NULL, 1, 2, 39),
('yes', 'New menu', NULL, 'settings.menus.create', '2022-05-28 18:17:23', NULL, NULL, 1, 2, 40),
('no', 'Store menu', NULL, 'settings.menus.store', '2022-05-28 18:17:23', NULL, NULL, 1, 2, 40),
('yes', 'Edit menu', NULL, 'settings.menus.edit', '2022-05-28 18:18:03', NULL, NULL, 1, 2, 41),
('no', 'Update menu', NULL, 'settings.menus.update', '2022-05-28 18:18:03', NULL, NULL, 1, 2, 41),
('yes', 'Delete menu', NULL, 'settings.menus.delete', '2022-05-28 18:18:40', NULL, NULL, 1, 2, 42),
('yes', 'All Permissions', NULL, 'settings.my-permissions.list', '2022-05-28 18:20:20', NULL, NULL, 1, 3, 43),
('yes', 'Edit permission', NULL, 'settings.my-permissions.edit', '2022-05-28 18:23:11', NULL, NULL, 1, 3, 45),
('no', 'Store permission', NULL, 'settings.my-permissions.update', '2022-05-28 18:23:11', NULL, NULL, 1, 3, 45),
('yes', 'New Permission', NULL, 'settings.my-permissions.create', '2022-05-28 18:24:46', NULL, NULL, 1, 3, 44),
('no', 'New Permission', NULL, 'settings.my-permissions.store', '2022-05-28 18:24:46', NULL, NULL, 1, 3, 44),
('yes', 'Delete permission', NULL, 'settings.my-permissions.delete', '2022-05-28 18:25:19', NULL, NULL, 1, 3, 46),
('yes', 'All roles', NULL, 'settings.my-roles.list', '2022-05-28 18:26:44', NULL, NULL, 1, 4, 47),
('yes', 'New role', NULL, 'settings.my-roles.create', '2022-05-28 18:27:21', NULL, NULL, 1, 4, 48),
('no', 'Store role', NULL, 'settings.my-role.store', '2022-05-28 18:27:21', NULL, NULL, 1, 4, 48),
('yes', 'Edit role', NULL, 'settings.my-roles.edit', '2022-05-28 18:28:08', NULL, NULL, 1, 4, 49),
('no', 'Update role', NULL, 'settings.my-roles.update', '2022-05-28 18:28:08', NULL, NULL, 1, 4, 49),
('yes', 'Delete role', NULL, 'settings.my-roles.delete', '2022-05-28 18:28:39', NULL, NULL, 1, 4, 50),
('yes', 'Role permissions', NULL, 'settings.my-roles.show', '2022-05-28 18:31:16', NULL, NULL, 1, 4, 51),
('no', 'Role permissions save', NULL, 'settings.my-roles.role-permissions-save', '2022-05-28 18:31:16', NULL, NULL, 1, 4, 51),
('yes', 'All Organizations', NULL, 'settings.companies.list', '2022-05-28 18:33:46', NULL, NULL, 1, 5, 52),
('yes', 'New organization', NULL, 'settings.companies.create', '2022-05-28 18:34:53', NULL, NULL, 1, 5, 53),
('no', 'Store organization', NULL, 'settings.companies.store', '2022-05-28 18:34:53', NULL, NULL, 1, 5, 53),
('yes', 'Edit organization', NULL, 'settings.companies.edit', '2022-05-28 18:35:48', NULL, NULL, 1, 5, 54),
('no', 'Update organization', NULL, 'settings.companies.update', '2022-05-28 18:35:48', NULL, NULL, 1, 5, 54),
('yes', 'Delete organization', NULL, 'settings.companies.delete', '2022-05-28 18:36:35', NULL, NULL, 1, 5, 55),
('yes', 'All units', NULL, 'settings.sections.list', '2022-05-28 18:37:17', NULL, NULL, 1, 7, 56),
('yes', 'New unit', NULL, 'settings.sections.create', '2022-05-28 18:37:50', NULL, NULL, 1, 7, 57),
('no', 'Store unit', NULL, 'settings.sections.store', '2022-05-28 18:37:50', NULL, NULL, 1, 7, 57),
('yes', 'Edit unit', NULL, 'settings.sections.edit', '2022-05-28 18:38:10', NULL, NULL, 1, 7, 58),
('no', 'Update unit', NULL, 'settings.sections.udpate', '2022-05-28 18:38:10', NULL, NULL, 1, 7, 58),
('yes', 'Delete unit', NULL, 'settings.sections.delete', '2022-05-28 18:38:55', NULL, NULL, 1, 7, 59),
('yes', 'All users', NULL, 'settings.users-mgt.list', '2022-05-28 18:41:06', NULL, NULL, 1, 8, 60),
('yes', 'New user', NULL, 'settings.users-mgt.create', '2022-05-28 18:42:09', NULL, NULL, 1, 8, 61),
('no', 'Store user', NULL, 'settings.users-mgt.store', '2022-05-28 18:42:09', NULL, NULL, 1, 8, 61),
('yes', 'Edit user', NULL, 'settings.users-mgt.edit', '2022-05-28 18:42:58', NULL, NULL, 1, 8, 62),
('no', 'Update user', NULL, 'settings.users-mgt.update', '2022-05-28 18:42:58', NULL, NULL, 1, 8, 62),
('yes', 'Delete user', NULL, 'settings.users-mgt.delete', '2022-05-28 18:43:34', NULL, NULL, 1, 8, 63),
('yes', 'User permissions', NULL, 'settings.users-mgt.show', '2022-05-28 18:45:02', NULL, NULL, 1, 8, 64),
('no', 'User permissions save', NULL, 'settings.user-mgt.user-permissions-save', '2022-05-28 18:45:02', NULL, NULL, 1, 8, 64),
('yes', 'Organization Types', NULL, 'settings.company-types.list', '2022-06-23 20:53:11', NULL, NULL, 1, 9, 65),
('yes', 'New Type', NULL, 'settings.company-types.create', '2022-06-23 20:54:45', NULL, NULL, 1, 9, 66),
('no', 'Store type', NULL, 'settings.company-types.store', '2022-06-23 20:54:45', NULL, NULL, 1, 9, 66),
('yes', 'Edit organization type', NULL, 'settings.company-types.edit', '2022-06-23 20:56:02', NULL, NULL, 1, 9, 67),
('no', 'Update organization type', NULL, 'settings.company-types.update', '2022-06-23 20:56:02', NULL, NULL, 1, 9, 67),
('yes', 'Delete organization type', NULL, 'settings.company-types.delete', '2022-06-23 20:56:36', NULL, NULL, 1, 9, 68);

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`, `deleted_at`, `app_id`, `menu_id`, `show_in_menu`) VALUES
(35, 'Can view apps', 'apps.view', NULL, 'Permission', '2022-05-28 13:11:30', '2022-05-28 13:11:30', NULL, 1, 1, 'yes'),
(36, 'Can create apps', 'apps.create', NULL, 'Permission', '2022-05-28 13:12:03', '2022-05-28 13:12:03', NULL, 1, 1, 'yes'),
(37, 'Can edit apps', 'apps.edit', NULL, 'Permission', '2022-05-28 13:13:16', '2022-05-28 13:13:16', NULL, 1, 1, 'no'),
(38, 'Can delete apps', 'apps.delete', NULL, 'Permission', '2022-05-28 13:13:52', '2022-05-28 13:13:52', NULL, 1, 1, 'no'),
(39, 'Can view menus', 'menus.view', NULL, 'Permission', '2022-05-28 13:16:44', '2022-05-28 13:16:44', NULL, 1, 2, 'yes'),
(40, 'Can create menus', 'menus.create', NULL, 'Permission', '2022-05-28 13:17:23', '2022-05-28 13:17:23', NULL, 1, 2, 'yes'),
(41, 'Can edit menus', 'menus.edit', NULL, 'Permission', '2022-05-28 13:18:03', '2022-05-28 13:18:03', NULL, 1, 2, 'no'),
(42, 'Can delete menus', 'menus.delete', NULL, 'Permission', '2022-05-28 13:18:40', '2022-05-28 13:18:40', NULL, 1, 2, 'no'),
(43, 'Can view permissions', 'permissions.view', NULL, 'Permission', '2022-05-28 13:20:20', '2022-05-28 13:20:20', NULL, 1, 3, 'yes'),
(44, 'Can create permissions', 'permissions.create', NULL, 'Permission', '2022-05-28 13:22:20', '2022-05-28 13:22:20', NULL, 1, 3, 'yes'),
(45, 'Can edit permissions', 'permissions.edit', NULL, 'Permission', '2022-05-28 13:23:11', '2022-05-28 13:23:11', NULL, 1, 3, 'no'),
(46, 'Can delete permissions', 'permission.delete', NULL, 'Permission', '2022-05-28 13:25:19', '2022-05-28 13:25:19', NULL, 1, 3, 'no'),
(47, 'Can view roles', 'roles.view', NULL, 'Permission', '2022-05-28 13:26:44', '2022-05-28 13:26:44', NULL, 1, 4, 'yes'),
(48, 'Can create roles', 'roles.create', NULL, 'Permission', '2022-05-28 13:27:21', '2022-05-28 13:27:21', NULL, 1, 4, 'yes'),
(49, 'Can edit roles', 'roles.edit', NULL, 'Permission', '2022-05-28 13:28:08', '2022-05-28 13:28:08', NULL, 1, 4, 'no'),
(50, 'Can delete roles', 'roles.delete', NULL, 'Permission', '2022-05-28 13:28:39', '2022-05-28 13:28:39', NULL, 1, 4, 'no'),
(51, 'Can assign permissions to roles', 'roles.assign.permissions', NULL, 'Permission', '2022-05-28 13:31:16', '2022-05-28 13:31:16', NULL, 1, 4, 'no'),
(52, 'Can view organizations', 'organizations.view', NULL, 'Permission', '2022-05-28 13:33:46', '2022-05-28 13:33:46', NULL, 1, 5, 'yes'),
(53, 'Can create organizations', 'organizations.create', NULL, 'Permission', '2022-05-28 13:34:53', '2022-05-28 13:34:53', NULL, 1, 5, 'yes'),
(54, 'Can edit organization', 'organizations.edit', NULL, 'Permission', '2022-05-28 13:35:48', '2022-05-28 13:35:48', NULL, 1, 5, 'no'),
(55, 'Can delete organizations', 'organizations.delete', NULL, 'Permission', '2022-05-28 13:36:35', '2022-05-28 13:36:35', NULL, 1, 5, 'no'),
(56, 'Can view units', 'sections.view', NULL, 'Permission', '2022-05-28 13:37:17', '2022-05-28 13:37:17', NULL, 1, 7, 'yes'),
(57, 'Can create units', 'sections.create', NULL, 'Permission', '2022-05-28 13:37:50', '2022-05-28 13:37:50', NULL, 1, 7, 'yes'),
(58, 'Can edit units', 'sections.edit', NULL, 'Permission', '2022-05-28 13:38:10', '2022-05-28 13:38:10', NULL, 1, 7, 'no'),
(59, 'Can delete units', 'sections.delete', NULL, 'Permission', '2022-05-28 13:38:55', '2022-05-28 13:38:55', NULL, 1, 7, 'no'),
(60, 'Can view users', 'users.mgt.list', NULL, 'Permission', '2022-05-28 13:41:06', '2022-05-28 13:41:06', NULL, 1, 8, 'yes'),
(61, 'Can create users', 'users.mgt.create', NULL, 'Permission', '2022-05-28 13:42:09', '2022-05-28 13:42:09', NULL, 1, 8, 'yes'),
(62, 'Can edit users', 'users.mgt.edit', NULL, 'Permission', '2022-05-28 13:42:58', '2022-05-28 13:42:58', NULL, 1, 8, 'no'),
(63, 'Can delete users', 'users.mgt.delete', NULL, 'Permission', '2022-05-28 13:43:34', '2022-05-28 13:43:34', NULL, 1, 8, 'no'),
(64, 'Can assign permissions to users', 'users.mgt.assign.permissions', NULL, 'Permission', '2022-05-28 13:45:02', '2022-05-28 13:45:02', NULL, 1, 8, 'no'),
(65, 'Can view organization types', 'organization.types.view', NULL, 'Permission', '2022-06-23 15:53:11', '2022-06-23 15:53:11', NULL, 1, 9, 'yes'),
(66, 'Can create organization type', 'organization.types.create', NULL, 'Permission', '2022-06-23 15:54:45', '2022-06-23 15:54:45', NULL, 1, 9, 'yes'),
(67, 'Can edit organization type', 'organization.type.edit', NULL, 'Permission', '2022-06-23 15:56:02', '2022-06-23 15:56:02', NULL, 1, 9, 'no'),
(68, 'Can delete organization types', 'organization.type.delete', NULL, 'Permission', '2022-06-23 15:56:36', '2022-06-23 15:56:36', NULL, 1, 9, 'no');

INSERT INTO `provinces` (`id`, `country_id`, `title`, `description`, `active`, `deleted_at`, `created_at`, `update_at`) VALUES
(1, 1, 'Khyber Pakhtunkhwa', 'KP', 1, NULL, '2015-02-06 16:44:31', '2015-02-06 00:00:00'),
(2, 1, 'Punjab', 'PB', 1, NULL, '2015-02-06 19:43:48', '2015-02-06 19:43:48'),
(3, 1, 'Sindh', 'SD', 1, NULL, '2015-02-06 19:44:01', '2015-02-06 19:44:01'),
(4, 1, 'Balochistan', 'BN', 1, NULL, '2015-02-06 19:44:11', '2015-02-06 19:44:11'),
(5, 1, 'FATA', 'FT', 1, NULL, '2015-04-22 09:45:37', NULL),
(6, 1, 'Islamabad (Capital Area)', 'ID', 1, NULL, '2015-05-03 18:03:14', NULL),
(7, 1, 'Gilgit & Biltestan', 'GB', 1, NULL, '2015-05-11 11:09:18', NULL),
(8, 1, 'Azad Jammu and Kashmir', 'AJ', 1, NULL, '2015-05-12 12:42:39', NULL);

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 4, 2, '2022-05-26 06:45:29', '2022-05-26 06:45:29', NULL);

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Developer', 'developer', 'Developer role for system settings', 1, '2022-05-13 07:15:04', '2022-05-28 12:59:16', NULL),
(21, 'testing role', 'testing.role', NULL, 2, '2022-10-05 21:55:42', '2022-10-05 21:55:42', NULL);

INSERT INTO `sections` (`id`, `parent_id`, `company_id`, `title`, `description`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, 'Developers Unit', NULL, 2, '2022-05-28 13:08:29', '2022-05-28 13:08:29', NULL);

INSERT INTO `tehsils` (`id`, `district_id`, `title`, `created_at`, `updated_at`, `deleted_at`, `description`, `is_hq`) VALUES
(1, 2, 'Mardan', '2017-08-07 11:07:45', NULL, NULL, 'mar', 1),
(2, 2, 'Takhtbhai', '2017-08-07 11:07:45', NULL, NULL, 'tak', 0),
(3, 2, 'Katlang', '2017-08-07 11:08:01', NULL, NULL, 'kat', 0),
(4, 1, 'Town I', '2017-08-07 11:08:01', NULL, NULL, 'tw1', 0),
(5, 2, 'Rustam', '2017-08-07 11:08:01', NULL, NULL, 'rus', 0),
(6, 3, 'Charsadda', '2017-08-07 11:08:01', NULL, NULL, 'chd', 1),
(7, 3, 'Shabqadar', '2017-08-07 11:08:01', NULL, NULL, 'sbd', 0),
(8, 3, 'Tangi', '2017-08-07 11:08:01', NULL, NULL, 'tng', 0),
(9, 13, 'Haripur', '2017-08-07 11:08:01', NULL, NULL, 'har', 1),
(10, 13, 'Ghazi', '2017-08-07 11:08:01', NULL, NULL, 'gha', 0),
(11, 8, 'Abbottabad', '2017-12-08 16:14:05', NULL, NULL, 'abb', 1),
(12, 8, 'Havelian', '2019-11-07 15:55:32', NULL, NULL, 'hav', 0),
(13, 4, 'Bannu', '2017-12-08 16:14:05', NULL, NULL, 'ban', 1),
(14, 4, 'Domail', '2017-12-08 16:14:05', NULL, NULL, 'dom', 0),
(15, 9, 'Battagram', '2017-12-08 16:14:05', NULL, NULL, 'bat', 1),
(16, 9, 'Alai', '2017-12-08 16:14:05', NULL, NULL, 'ala', 0),
(17, 10, 'Daggar', '2017-12-08 16:14:05', NULL, NULL, 'dag', 1),
(18, 10, 'Gagra', '2017-12-08 16:14:05', NULL, NULL, 'gag', 0),
(19, 10, 'Mandanar', '2017-12-08 16:14:05', NULL, NULL, 'mnd', 0),
(20, 10, 'Khaddo Khel', '2017-12-08 16:14:05', NULL, NULL, 'kdk', 0),
(21, 11, 'Chitral', '2017-12-08 16:14:05', NULL, NULL, 'chi', 1),
(22, 200, 'Mastuj', '2017-12-08 16:14:05', NULL, NULL, 'mas', 1),
(23, 5, 'DIKHAN', '2017-12-08 16:14:05', NULL, NULL, 'dik', 1),
(24, 5, 'PAROA', '2017-12-08 16:14:05', NULL, NULL, 'par', 0),
(25, 5, 'Kulachi', '2017-12-08 16:14:05', NULL, NULL, 'kul', 0),
(26, 5, 'PAHARPUR', '2017-12-08 16:14:05', NULL, NULL, 'pah', 0),
(27, 5, 'Daraban', '2017-12-08 16:14:05', NULL, NULL, 'dar', 0),
(28, 7, 'Adanzai', '2017-12-08 16:14:05', NULL, NULL, 'ada', 0),
(29, 7, 'Khaal', '2017-12-08 16:14:05', NULL, NULL, 'kha', 0),
(30, 7, 'Munda', '2017-12-08 16:14:05', NULL, NULL, 'mun', 0),
(31, 7, 'Timargara', '2017-12-08 16:14:05', NULL, NULL, 'tim', 1),
(32, 7, 'Balambat', '2017-12-08 16:14:05', NULL, NULL, 'bmb', 0),
(33, 7, 'Lal Qilla', '2017-12-08 16:14:05', NULL, NULL, 'lal', 0),
(34, 7, 'Samarbagh', '2017-12-08 16:14:05', NULL, NULL, 'sam', 0),
(35, 6, 'Dir', '2017-12-08 16:14:05', NULL, NULL, 'dir', 1),
(36, 6, 'Kalkot', '2017-12-08 16:14:05', NULL, NULL, 'kak', 0),
(37, 6, 'Warri', '2017-12-08 16:14:05', NULL, NULL, 'war', 0),
(38, 6, 'Barawal', '2017-12-08 16:14:05', NULL, NULL, 'bwl', 0),
(39, 12, 'Hangu', '2017-12-08 16:14:05', NULL, NULL, 'han', 1),
(40, 12, 'Tall', '2017-12-08 16:14:05', NULL, NULL, 'tal', 0),
(41, 14, 'Karak', '2017-12-08 16:14:05', NULL, NULL, 'ktk', 1),
(42, 14, 'Takht-e-Nasrati', '2017-12-08 16:14:05', NULL, NULL, 'tkn', 0),
(43, 14, 'Banda Daud Shah', '2017-12-08 16:14:05', NULL, NULL, 'bds', 0),
(44, 15, 'Kohat', '2017-12-08 16:14:05', NULL, NULL, 'koh', 1),
(45, 15, 'Lachi', '2017-12-08 16:14:05', NULL, NULL, 'lac', 0),
(46, 16, 'Dassu', '2017-12-08 16:14:05', NULL, NULL, 'das', 1),
(47, 16, 'Kundiya', '2017-12-08 16:14:05', NULL, NULL, 'kun', 0),
(48, 26, 'Pattan', '2017-12-08 16:14:05', NULL, NULL, 'pat', 1),
(49, 198, 'Palas', '2017-12-08 16:14:05', NULL, NULL, 'pal', 1),
(50, 17, 'Lakki Marwat', '2017-12-08 16:14:05', NULL, NULL, 'lak', 1),
(51, 17, 'Sarai Naurang', '2017-12-08 16:14:05', NULL, NULL, 'san', 0),
(52, 18, 'Dargai', '2017-12-08 16:14:05', NULL, NULL, 'drg', 0),
(53, 18, 'Batkhela', '2017-12-08 16:14:05', NULL, NULL, 'btk', 1),
(54, 19, 'Mansehra', '2017-12-08 16:14:05', NULL, NULL, 'man', 1),
(55, 19, 'Balakot', '2017-12-08 16:14:05', NULL, NULL, 'bal', 0),
(56, 19, 'Oghi', '2017-12-08 16:14:05', NULL, NULL, 'ogh', 0),
(57, 20, 'Nowshera', '2017-12-08 16:14:05', NULL, NULL, 'now', 1),
(58, 20, 'Pabbi', '2017-12-08 16:14:05', NULL, NULL, 'pab', 0),
(59, 20, 'Jehangira', '2017-12-08 16:14:05', NULL, NULL, 'jeh', 0),
(60, 1, 'Town II', '2017-12-08 16:14:05', NULL, NULL, 'tw2', 0),
(61, 1, 'Town III', '2017-12-08 16:14:05', NULL, NULL, 'tw3', 0),
(62, 1, 'Town IV', '2017-12-08 16:14:05', NULL, NULL, 'tw4', 0),
(63, 1, 'City', '2017-12-08 16:14:05', NULL, NULL, 'city', 0),
(64, 21, 'Alpuri', '2017-12-08 16:14:05', NULL, NULL, 'alp', 1),
(65, 21, 'Puran', '2017-12-08 16:14:05', NULL, NULL, 'pur', 0),
(66, 22, 'Swabi', '2017-12-08 16:14:05', NULL, NULL, 'swa', 1),
(67, 22, 'Razar', '2017-12-08 16:14:05', NULL, NULL, 'raz', 0),
(68, 22, 'Topi', '2017-12-08 16:14:05', NULL, NULL, 'top', 0),
(69, 22, 'lahor', '2017-12-08 16:14:05', NULL, NULL, 'lah', 0),
(70, 23, 'Babozai', '2017-12-08 16:14:05', NULL, NULL, 'bab', 1),
(71, 23, 'Kabal', '2017-12-08 16:14:05', NULL, NULL, 'kab', 0),
(72, 23, 'Khuazakhela', '2017-12-08 16:14:05', NULL, NULL, 'khu', 0),
(73, 23, 'Barikot', '2017-12-08 16:14:05', NULL, NULL, 'brk', 0),
(74, 23, 'Bahrain', '2017-12-08 16:14:05', NULL, NULL, 'bah', 0),
(75, 23, 'Charbagh', '2017-12-08 16:14:05', NULL, NULL, 'cha', 0),
(76, 23, 'Matta', '2017-12-08 16:14:05', NULL, NULL, 'mat', 0),
(77, 24, 'Tank', '2017-12-08 16:14:05', NULL, NULL, 'tan', 1),
(78, 25, 'Hussainzai', '2017-12-08 16:14:05', NULL, NULL, 'hus', 0),
(79, 25, 'judbah', '2017-12-08 16:14:05', NULL, NULL, 'jud', 1),
(80, 4, 'Baka Khel', '2017-12-08 16:14:05', NULL, NULL, 'bak', 0),
(83, 23, 'Kalam', '2017-12-08 16:14:05', NULL, NULL, 'kal', 0),
(84, 13, 'Khanpur', '2017-08-07 11:07:45', NULL, NULL, 'knp', 0),
(85, 20, 'Khair Abad', '2019-02-12 05:00:00', NULL, NULL, 'kbd', 0),
(86, 11, 'Drosh', '2017-12-08 16:14:05', NULL, NULL, 'dro', 0),
(87, 200, 'Mulkhow', '2017-12-08 16:14:05', NULL, NULL, 'mul', 0),
(88, 5, 'Darazinda', '2017-12-08 16:14:05', NULL, NULL, 'daz', 0),
(89, 138, 'Khar', '2019-04-08 05:00:00', NULL, NULL, 'khr', 1),
(90, 138, 'Nawagai', '2019-04-08 05:00:00', NULL, NULL, 'naw', 0),
(91, 143, 'Miranshah', '2019-04-20 21:39:20', NULL, NULL, 'mns', 1),
(92, 143, 'Datta khel', '2019-04-20 21:39:21', NULL, NULL, 'dat', 0),
(93, 143, 'Ghulam Khan', '2019-04-20 21:39:25', NULL, NULL, 'ghu', 0),
(94, 143, 'Mirali', '2019-04-20 21:40:36', NULL, NULL, 'mir', 0),
(95, 143, 'Spinwam', '2019-04-20 21:40:37', NULL, NULL, 'spi', 0),
(96, 143, 'Shewa', '2019-04-20 21:40:38', NULL, NULL, 'she', 0),
(97, 143, 'Shawal', '2019-04-20 21:40:39', NULL, NULL, 'sha', 0),
(98, 143, 'Razmak', '2019-04-20 21:40:40', NULL, NULL, 'rzk', 0),
(99, 143, 'Dossali', '2019-04-20 21:40:40', NULL, NULL, 'dos', 0),
(100, 143, 'Garyum', '2019-04-20 21:41:52', NULL, NULL, 'gar', 0),
(101, 138, 'Loi Mamund', '2019-04-26 16:26:24', NULL, NULL, 'loi', 0),
(102, 138, 'Barang', '2019-04-26 16:26:54', NULL, NULL, 'brn', 0),
(103, 138, 'Salarzai', '2019-04-26 16:27:15', NULL, NULL, 'sal', 0),
(104, 138, 'Utmankhel', '2019-04-26 16:27:57', NULL, NULL, 'utm', 0),
(105, 138, 'Warah Mamund', '2019-04-26 16:28:22', NULL, NULL, 'wam', 0),
(106, 4, 'Kakki', '2017-12-08 16:14:05', NULL, NULL, 'kkk', 0),
(107, 4, 'Miryan', '2017-12-08 16:14:05', NULL, NULL, 'mry', 0),
(108, 142, 'Upper Mohmand', '2019-05-14 10:01:44', NULL, NULL, 'upm', 0),
(109, 142, 'Lower Mohmand', '2019-05-14 10:01:44', NULL, NULL, 'lom', 0),
(110, 142, 'Baizai Mohmand', '2019-05-14 10:01:44', NULL, NULL, 'bai', 0),
(111, 140, 'Bara', '2019-05-22 16:40:38', NULL, NULL, 'bar', 0),
(112, 140, 'Jamrud', '2019-05-22 16:40:43', NULL, NULL, 'jam', 1),
(113, 140, 'Landikotal', '2019-05-22 16:40:48', NULL, NULL, 'lan', 0),
(114, 6, 'Sharingal', '2019-05-22 14:11:34', NULL, NULL, 'shr', 0),
(115, 6, 'Larjam', '2019-05-22 14:11:36', NULL, NULL, 'lar', 0),
(116, 24, 'TSD', '2019-05-23 17:38:53', NULL, NULL, 'tsd', 0),
(117, 18, 'Thana Bazai', '2017-12-08 16:14:05', NULL, NULL, 'tha', 0),
(118, 141, 'Upper Kurram', '2019-07-08 12:32:18', NULL, NULL, 'upk', 0),
(119, 141, 'Central Kurram', '2019-07-08 12:32:18', NULL, NULL, 'cek', 0),
(120, 141, 'Lower Kurram', '2019-07-08 12:32:18', NULL, NULL, 'lok', 0),
(121, 8, 'Lora', '2017-12-08 16:14:05', NULL, NULL, 'lor', 0),
(1212, 144, 'Upper Orakzai', '2019-07-16 16:01:31', NULL, NULL, 'upo', 0),
(1213, 144, 'Lower Orakzai', '2019-07-16 16:01:31', NULL, NULL, 'loo', 0),
(1214, 144, 'Central Orakzai', '2019-07-16 16:01:31', NULL, NULL, 'ceo', 0),
(1215, 144, 'Ismailzai', '2019-07-16 16:01:31', NULL, NULL, 'ism', 0),
(1216, 145, 'Birmil', '2019-09-20 11:48:39', NULL, NULL, 'bir', 0),
(1217, 145, 'Ladha', '2019-09-20 11:48:46', NULL, NULL, 'lad', 0),
(1218, 145, 'Makin', '2019-09-20 11:48:59', NULL, NULL, 'mak', 0),
(1219, 145, 'Sararogha', '2019-09-20 11:49:12', NULL, NULL, 'sar', 0),
(1220, 145, 'Serwekai', '2019-09-20 11:49:32', NULL, NULL, 'ser', 0),
(1221, 145, 'Tiarza', '2019-09-20 11:49:50', NULL, NULL, 'tia', 0),
(1222, 145, 'Toi Khulla', '2019-09-20 11:50:09', NULL, NULL, 'toi', 0),
(1223, 145, 'Wanna', '2019-09-20 11:50:18', NULL, NULL, 'wan', 1),
(1224, 17, 'Bettani', '2019-10-03 15:24:14', NULL, NULL, 'bet', 0),
(1225, 11, 'Booni', '2017-12-08 16:14:05', NULL, NULL, 'boo', 0),
(1226, 1, 'Hassan Khel', '2017-12-08 16:14:05', NULL, NULL, 'has', 0),
(1227, 200, 'Mastuj', '2017-08-07 11:08:01', NULL, '2020-11-06 16:42:00', 'msj', 0),
(1228, 200, 'Torkhow', '2017-08-07 11:08:01', NULL, NULL, 'mut', 0),
(1229, 15, 'Gumbat', '2019-11-07 15:54:11', NULL, NULL, 'gum', 0),
(1230, 8, 'Lower Tanawal', '2019-11-07 15:55:10', NULL, NULL, 'lot', 0),
(1232, 21, 'Chakisar', '2019-11-07 15:58:23', NULL, NULL, 'chk', 0),
(1233, 21, 'Besham', '2019-11-07 15:58:42', NULL, NULL, 'bes', 0),
(1234, 21, 'Martung', '2019-11-07 15:58:58', NULL, NULL, 'mtg', 0),
(1235, 145, 'Shakai', '2019-11-07 16:01:43', NULL, NULL, 'ski', 0),
(1236, 145, 'Shawal', '2019-11-07 16:02:12', NULL, NULL, 'shw', 0),
(1237, 19, 'Baffa Pakhal', '2019-11-07 16:03:18', NULL, NULL, 'baf', 0),
(1238, 19, 'Darband', '2019-11-07 16:03:37', NULL, NULL, 'dad', 0),
(1239, 138, 'Chamarkand', '2019-11-07 16:32:41', NULL, NULL, 'ckd', 0),
(1241, 1, 'Shah Alam', '2017-12-08 16:14:05', NULL, NULL, 'shlm', 0),
(1242, 1, 'Saddar', '2019-11-22 10:52:20', NULL, NULL, 'sdrp', 1),
(1243, 1, 'Mattani', '2019-11-22 10:52:20', NULL, NULL, 'mtni', 0),
(1244, 15, 'Darra', '2019-11-07 15:54:11', NULL, NULL, 'gum', 0),
(1245, 21, 'Chakisar', '2019-11-07 15:58:42', NULL, '2021-04-27 11:34:19', 'bes', 0),
(1246, 10, 'Chagharzi', '2017-12-08 16:14:05', NULL, NULL, 'kdk', 0),
(1247, 10, 'Gadezi', '2017-12-08 16:14:05', NULL, NULL, 'kdk', 0),
(1248, 142, 'Ambar', '2020-11-04 18:24:37', NULL, NULL, NULL, 0),
(1249, 142, 'Ekka Ghund', '2020-11-04 18:24:41', NULL, NULL, NULL, 0),
(1250, 142, 'Haleemzai', '2020-11-04 18:25:28', NULL, NULL, NULL, 0),
(1251, 142, 'Pandiali', '2020-11-04 18:25:50', NULL, NULL, NULL, 0),
(1252, 142, 'Parang Ghar', '2020-11-04 18:26:14', NULL, NULL, NULL, 0),
(1253, 142, 'Safi Lakaro', '2020-11-04 18:26:54', NULL, NULL, NULL, 0),
(1254, 142, 'Baizai', '2020-11-04 18:27:18', NULL, NULL, NULL, 0),
(1255, 142, 'KHAWEZAI', '2020-11-04 18:27:42', NULL, NULL, NULL, 0),
(1256, 4, 'Wazir', '2021-04-26 11:34:19', NULL, NULL, NULL, 0),
(1257, 11, 'Garam Chashma', '2021-04-26 11:34:19', NULL, NULL, NULL, 0),
(1258, 140, 'Tirah Maidan', '2021-04-26 11:34:19', NULL, NULL, NULL, 0),
(1259, 140, 'Dara Adam Khel', '2021-04-27 11:34:19', NULL, '2021-04-27 11:34:19', NULL, 0),
(1260, 140, 'Dara Adam Khel', '2021-04-27 11:34:19', NULL, NULL, NULL, 0),
(1261, 24, 'Jandola', '2021-04-27 11:34:19', NULL, NULL, NULL, 0),
(1262, 25, 'DourMera', '2021-04-27 11:34:19', NULL, NULL, NULL, 0),
(1263, 25, 'Kandar', '2021-04-27 11:34:19', NULL, NULL, NULL, 0),
(1264, 2, 'Garhi Kapora', '2021-04-27 11:34:19', NULL, NULL, NULL, 0),
(1265, 1, 'SMT', '2021-04-27 11:34:19', NULL, '2022-01-15 20:03:52', NULL, 0),
(1266, 201, 'Kurram upper', '2021-07-07 11:34:19', NULL, '2021-07-10 12:22:00', NULL, 0),
(1267, 17, 'Ghazni Khel', '2019-10-03 15:24:14', NULL, NULL, 'ghzn', 0);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `company_id`, `section_id`, `parent_id`, `description`, `deleted_at`) VALUES
(2, 'Super Admin', 'admin@gmail.com', NULL, '$2y$10$Hj1rGTe2rq6VE638bV0q6e8HTdCfECx1VAK/szRdJzBMiIPx94ese', NULL, '2022-05-13 07:15:04', '2022-06-23 16:12:35', 'admin', 1, NULL, NULL, NULL, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;