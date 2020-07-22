-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for spk-ahp
CREATE DATABASE IF NOT EXISTS `spk-ahp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `spk-ahp`;

-- Dumping structure for table spk-ahp.alternatives
CREATE TABLE IF NOT EXISTS `alternatives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alternatives_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.alternatives: ~3 rows (approximately)
/*!40000 ALTER TABLE `alternatives` DISABLE KEYS */;
INSERT INTO `alternatives` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'A1', 'Dosen A', '2020-07-21 22:47:53', '2020-07-21 22:50:12', NULL),
	(2, 'A2', 'Dosen B', '2020-07-21 22:50:22', '2020-07-21 22:50:22', NULL),
	(3, 'A3', 'Dosen C', '2020-07-21 22:50:29', '2020-07-21 22:50:29', NULL);
/*!40000 ALTER TABLE `alternatives` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.alternative_comparisons
CREATE TABLE IF NOT EXISTS `alternative_comparisons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) unsigned NOT NULL,
  `x_alternative_id` int(10) unsigned NOT NULL,
  `y_alternative_id` int(10) unsigned NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_comparisons_criteria_id_foreign` (`criteria_id`),
  KEY `alternative_comparisons_x_alternative_id_foreign` (`x_alternative_id`),
  KEY `alternative_comparisons_y_alternative_id_foreign` (`y_alternative_id`),
  CONSTRAINT `alternative_comparisons_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alternative_comparisons_x_alternative_id_foreign` FOREIGN KEY (`x_alternative_id`) REFERENCES `alternatives` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alternative_comparisons_y_alternative_id_foreign` FOREIGN KEY (`y_alternative_id`) REFERENCES `alternatives` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.alternative_comparisons: ~42 rows (approximately)
/*!40000 ALTER TABLE `alternative_comparisons` DISABLE KEYS */;
INSERT INTO `alternative_comparisons` (`id`, `criteria_id`, `x_alternative_id`, `y_alternative_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 2, 2.00000, '2020-07-21 23:12:31', '2020-07-21 23:12:31'),
	(2, 1, 2, 1, 0.50000, '2020-07-21 23:12:31', '2020-07-21 23:12:31'),
	(3, 1, 1, 3, 2.00000, '2020-07-21 23:13:05', '2020-07-21 23:13:05'),
	(4, 1, 3, 1, 0.50000, '2020-07-21 23:13:05', '2020-07-21 23:13:05'),
	(5, 1, 1, 1, 1.00000, '2020-07-21 23:13:12', '2020-07-21 23:13:12'),
	(6, 1, 2, 3, 2.00000, '2020-07-21 23:13:24', '2020-07-21 23:13:24'),
	(7, 1, 3, 2, 0.50000, '2020-07-21 23:13:24', '2020-07-21 23:13:24'),
	(8, 1, 2, 2, 1.00000, '2020-07-21 23:13:33', '2020-07-21 23:13:33'),
	(9, 1, 3, 3, 1.00000, '2020-07-21 23:13:41', '2020-07-21 23:13:41'),
	(10, 2, 1, 2, 4.00000, '2020-07-21 23:14:34', '2020-07-21 23:14:34'),
	(11, 2, 2, 1, 0.25000, '2020-07-21 23:14:34', '2020-07-21 23:14:34'),
	(12, 2, 1, 3, 1.00000, '2020-07-21 23:14:41', '2020-07-21 23:16:03'),
	(13, 2, 3, 1, 1.00000, '2020-07-21 23:14:41', '2020-07-21 23:16:03'),
	(14, 2, 1, 1, 1.00000, '2020-07-21 23:14:48', '2020-07-21 23:14:48'),
	(15, 2, 2, 2, 1.00000, '2020-07-21 23:14:55', '2020-07-21 23:14:55'),
	(16, 2, 2, 3, 0.25000, '2020-07-21 23:15:04', '2020-07-21 23:15:14'),
	(17, 2, 3, 2, 4.00000, '2020-07-21 23:15:05', '2020-07-21 23:15:14'),
	(18, 2, 3, 3, 1.00000, '2020-07-21 23:15:26', '2020-07-21 23:15:26'),
	(19, 3, 1, 1, 1.00000, '2020-07-21 23:16:20', '2020-07-21 23:16:20'),
	(20, 3, 2, 2, 1.00000, '2020-07-21 23:16:24', '2020-07-21 23:16:24'),
	(21, 3, 3, 3, 1.00000, '2020-07-21 23:16:30', '2020-07-21 23:16:30'),
	(22, 3, 1, 2, 1.00000, '2020-07-21 23:16:39', '2020-07-21 23:17:11'),
	(23, 3, 2, 1, 1.00000, '2020-07-21 23:16:39', '2020-07-21 23:17:11'),
	(24, 3, 1, 3, 1.00000, '2020-07-21 23:16:46', '2020-07-21 23:17:26'),
	(25, 3, 3, 1, 1.00000, '2020-07-21 23:16:46', '2020-07-21 23:17:26'),
	(26, 3, 2, 3, 1.00000, '2020-07-21 23:16:51', '2020-07-21 23:17:20'),
	(27, 3, 3, 2, 1.00000, '2020-07-21 23:16:51', '2020-07-21 23:17:20'),
	(28, 4, 1, 1, 1.00000, '2020-07-21 23:18:00', '2020-07-21 23:18:00'),
	(29, 4, 2, 2, 1.00000, '2020-07-21 23:18:05', '2020-07-21 23:18:05'),
	(30, 4, 3, 3, 1.00000, '2020-07-21 23:18:09', '2020-07-21 23:18:09'),
	(31, 4, 2, 1, 5.00000, '2020-07-21 23:18:16', '2020-07-21 23:18:16'),
	(32, 4, 1, 2, 0.20000, '2020-07-21 23:18:16', '2020-07-21 23:18:16'),
	(33, 4, 3, 1, 5.00000, '2020-07-21 23:18:24', '2020-07-21 23:18:24'),
	(34, 4, 1, 3, 0.20000, '2020-07-21 23:18:24', '2020-07-21 23:18:24'),
	(35, 4, 2, 3, 1.00000, '2020-07-21 23:18:32', '2020-07-21 23:18:32'),
	(36, 4, 3, 2, 1.00000, '2020-07-21 23:18:32', '2020-07-21 23:18:32'),
	(37, 5, 1, 1, 1.00000, '2020-07-21 23:18:50', '2020-07-21 23:18:50'),
	(38, 5, 2, 2, 1.00000, '2020-07-21 23:18:54', '2020-07-21 23:18:54'),
	(39, 5, 3, 3, 1.00000, '2020-07-21 23:18:59', '2020-07-21 23:18:59'),
	(40, 5, 1, 2, 1.00000, '2020-07-21 23:19:08', '2020-07-21 23:19:08'),
	(41, 5, 2, 1, 1.00000, '2020-07-21 23:19:08', '2020-07-21 23:19:08'),
	(42, 5, 1, 3, 3.00000, '2020-07-21 23:19:20', '2020-07-21 23:19:20'),
	(43, 5, 3, 1, 0.33333, '2020-07-21 23:19:20', '2020-07-21 23:19:20'),
	(44, 5, 2, 3, 3.00000, '2020-07-21 23:19:34', '2020-07-21 23:19:34'),
	(45, 5, 3, 2, 0.33333, '2020-07-21 23:19:34', '2020-07-21 23:19:34');
/*!40000 ALTER TABLE `alternative_comparisons` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.alternative_details
CREATE TABLE IF NOT EXISTS `alternative_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alternative_id` int(10) unsigned NOT NULL,
  `criteria_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_details_alternative_id_foreign` (`alternative_id`),
  KEY `alternative_details_criteria_id_foreign` (`criteria_id`),
  CONSTRAINT `alternative_details_alternative_id_foreign` FOREIGN KEY (`alternative_id`) REFERENCES `alternatives` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alternative_details_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.alternative_details: ~14 rows (approximately)
/*!40000 ALTER TABLE `alternative_details` DISABLE KEYS */;
INSERT INTO `alternative_details` (`id`, `alternative_id`, `criteria_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'S2', '2020-07-21 22:50:34', '2020-07-21 22:50:34'),
	(2, 2, 1, 'S2', '2020-07-21 22:50:38', '2020-07-21 22:50:38'),
	(3, 3, 1, 'S1', '2020-07-21 22:50:42', '2020-07-21 22:50:42'),
	(4, 1, 2, 'Informatika', '2020-07-21 22:50:48', '2020-07-21 22:50:48'),
	(5, 2, 2, 'Non-Informatika', '2020-07-21 22:50:53', '2020-07-21 22:50:53'),
	(6, 3, 2, 'Informatika', '2020-07-21 22:50:59', '2020-07-21 22:50:59'),
	(7, 1, 3, 'Tetap', '2020-07-21 22:51:04', '2020-07-21 22:51:04'),
	(8, 2, 3, 'Tetap', '2020-07-21 22:51:15', '2020-07-21 22:51:15'),
	(9, 3, 3, 'Tetap', '2020-07-21 22:51:21', '2020-07-21 22:51:21'),
	(10, 1, 4, 'Cukup Sesuai', '2020-07-21 22:51:30', '2020-07-21 22:51:30'),
	(11, 2, 4, 'Sangat Sesuai', '2020-07-21 22:51:35', '2020-07-21 22:51:35'),
	(12, 3, 4, 'Sangat Sesuai', '2020-07-21 22:51:42', '2020-07-21 22:51:42'),
	(13, 1, 5, '>3 Tahun', '2020-07-21 22:51:47', '2020-07-21 22:51:47'),
	(14, 2, 5, '>3 Tahun', '2020-07-21 22:51:55', '2020-07-21 22:52:09'),
	(15, 3, 5, '1-3 Tahun', '2020-07-21 22:52:00', '2020-07-21 22:52:00');
/*!40000 ALTER TABLE `alternative_details` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.alternative_normalizations
CREATE TABLE IF NOT EXISTS `alternative_normalizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comparison_id` int(10) unsigned NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_normalizations_comparison_id_foreign` (`comparison_id`),
  CONSTRAINT `alternative_normalizations_comparison_id_foreign` FOREIGN KEY (`comparison_id`) REFERENCES `alternative_comparisons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.alternative_normalizations: ~45 rows (approximately)
/*!40000 ALTER TABLE `alternative_normalizations` DISABLE KEYS */;
INSERT INTO `alternative_normalizations` (`id`, `comparison_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 2, 0.25000, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(2, 4, 0.25000, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(3, 5, 0.50000, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(4, 1, 0.57143, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(5, 7, 0.14286, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(6, 8, 0.28571, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(7, 3, 0.40000, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(8, 6, 0.40000, '2020-07-21 23:13:43', '2020-07-21 23:13:43'),
	(9, 9, 0.20000, '2020-07-21 23:13:44', '2020-07-21 23:13:44'),
	(10, 11, 0.16667, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(11, 13, 0.16667, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(12, 14, 0.66667, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(13, 10, 0.44444, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(14, 15, 0.11111, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(15, 17, 0.44444, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(16, 12, 0.76190, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(17, 16, 0.04762, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(18, 18, 0.19048, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(19, 19, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(20, 23, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(21, 25, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(22, 20, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(23, 22, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(24, 27, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(25, 21, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(26, 24, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(27, 26, 0.33333, '2020-07-21 23:17:29', '2020-07-21 23:17:29'),
	(28, 28, 0.09091, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(29, 31, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(30, 33, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(31, 29, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(32, 32, 0.09091, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(33, 36, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(34, 30, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(35, 34, 0.09091, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(36, 35, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(37, 37, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(38, 41, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(39, 43, 0.14286, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(40, 38, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(41, 40, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(42, 45, 0.14286, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(43, 39, 0.14286, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(44, 42, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(45, 44, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36');
/*!40000 ALTER TABLE `alternative_normalizations` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.alternative_priorities
CREATE TABLE IF NOT EXISTS `alternative_priorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) unsigned NOT NULL,
  `alternative_id` int(10) unsigned NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_priorities_criteria_id_foreign` (`criteria_id`),
  KEY `alternative_priorities_alternative_id_foreign` (`alternative_id`),
  CONSTRAINT `alternative_priorities_alternative_id_foreign` FOREIGN KEY (`alternative_id`) REFERENCES `alternatives` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alternative_priorities_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.alternative_priorities: ~15 rows (approximately)
/*!40000 ALTER TABLE `alternative_priorities` DISABLE KEYS */;
INSERT INTO `alternative_priorities` (`id`, `criteria_id`, `alternative_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 0.49048, '2020-07-21 23:13:44', '2020-07-21 23:13:44'),
	(2, 1, 2, 0.31190, '2020-07-21 23:13:44', '2020-07-21 23:13:44'),
	(3, 1, 3, 0.19762, '2020-07-21 23:13:44', '2020-07-21 23:13:44'),
	(4, 2, 1, 0.62434, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(5, 2, 2, 0.10847, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(6, 2, 3, 0.26720, '2020-07-21 23:15:33', '2020-07-21 23:15:33'),
	(7, 3, 1, 0.33333, '2020-07-21 23:17:30', '2020-07-21 23:17:30'),
	(8, 3, 2, 0.33333, '2020-07-21 23:17:30', '2020-07-21 23:17:30'),
	(9, 3, 3, 0.33333, '2020-07-21 23:17:30', '2020-07-21 23:17:30'),
	(10, 4, 1, 0.09091, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(11, 4, 2, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(12, 4, 3, 0.45455, '2020-07-21 23:18:35', '2020-07-21 23:18:35'),
	(13, 5, 1, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(14, 5, 2, 0.42857, '2020-07-21 23:19:36', '2020-07-21 23:19:36'),
	(15, 5, 3, 0.14286, '2020-07-21 23:19:36', '2020-07-21 23:19:36');
/*!40000 ALTER TABLE `alternative_priorities` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.criterias
CREATE TABLE IF NOT EXISTS `criterias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterias_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.criterias: ~5 rows (approximately)
/*!40000 ALTER TABLE `criterias` DISABLE KEYS */;
INSERT INTO `criterias` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'C1', 'Tingkat Pendidikan', '2020-07-21 22:38:04', '2020-07-21 22:43:31', NULL),
	(2, 'C2', 'Latar Belakang', '2020-07-21 22:38:04', '2020-07-21 22:43:39', NULL),
	(3, 'C3', 'Status Dosen', '2020-07-21 22:38:04', '2020-07-21 22:47:20', NULL),
	(4, 'C4', 'Kesesuaian', '2020-07-21 22:38:04', '2020-07-21 22:47:27', NULL),
	(5, 'C5', 'Pengalaman Membimbing', '2020-07-21 22:38:04', '2020-07-21 22:47:37', NULL);
/*!40000 ALTER TABLE `criterias` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.criteria_comparisons
CREATE TABLE IF NOT EXISTS `criteria_comparisons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_criteria_id` int(10) unsigned NOT NULL,
  `value` double(8,2) NOT NULL,
  `second_criteria_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_comparisons_first_criteria_id_foreign` (`first_criteria_id`),
  KEY `criteria_comparisons_second_criteria_id_foreign` (`second_criteria_id`),
  CONSTRAINT `criteria_comparisons_first_criteria_id_foreign` FOREIGN KEY (`first_criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `criteria_comparisons_second_criteria_id_foreign` FOREIGN KEY (`second_criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.criteria_comparisons: ~22 rows (approximately)
/*!40000 ALTER TABLE `criteria_comparisons` DISABLE KEYS */;
INSERT INTO `criteria_comparisons` (`id`, `first_criteria_id`, `value`, `second_criteria_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1.00, 1, '2020-07-21 22:38:04', '2020-07-21 22:38:04'),
	(2, 2, 1.00, 2, '2020-07-21 22:38:04', '2020-07-21 22:38:04'),
	(3, 3, 1.00, 3, '2020-07-21 22:38:04', '2020-07-21 22:38:04'),
	(4, 4, 1.00, 4, '2020-07-21 22:38:04', '2020-07-21 22:38:04'),
	(5, 5, 1.00, 5, '2020-07-21 22:38:04', '2020-07-21 22:38:04'),
	(6, 2, 5.00, 1, '2020-07-21 22:53:04', '2020-07-21 22:53:04'),
	(7, 1, 0.20, 2, '2020-07-21 22:53:04', '2020-07-21 22:53:04'),
	(8, 3, 3.00, 1, '2020-07-21 22:53:19', '2020-07-21 22:53:19'),
	(9, 1, 0.33, 3, '2020-07-21 22:53:19', '2020-07-21 22:53:19'),
	(10, 4, 5.00, 1, '2020-07-21 22:56:01', '2020-07-21 22:56:01'),
	(11, 1, 0.20, 4, '2020-07-21 22:56:01', '2020-07-21 22:56:01'),
	(12, 5, 3.00, 1, '2020-07-21 22:56:14', '2020-07-21 22:56:14'),
	(13, 1, 0.33, 5, '2020-07-21 22:56:14', '2020-07-21 22:56:14'),
	(14, 2, 3.00, 3, '2020-07-21 22:56:39', '2020-07-21 22:56:39'),
	(15, 3, 0.33, 2, '2020-07-21 22:56:39', '2020-07-21 22:56:39'),
	(16, 2, 4.00, 5, '2020-07-21 22:56:52', '2020-07-21 22:56:52'),
	(17, 5, 0.25, 2, '2020-07-21 22:56:52', '2020-07-21 22:56:52'),
	(18, 3, 2.00, 5, '2020-07-21 22:57:03', '2020-07-21 22:57:24'),
	(19, 5, 0.50, 3, '2020-07-21 22:57:03', '2020-07-21 22:57:24'),
	(20, 4, 3.00, 5, '2020-07-21 22:57:32', '2020-07-21 22:57:32'),
	(21, 5, 0.33, 4, '2020-07-21 22:57:32', '2020-07-21 22:57:32'),
	(22, 4, 2.00, 2, '2020-07-21 22:58:01', '2020-07-21 22:58:01'),
	(23, 2, 0.50, 4, '2020-07-21 22:58:01', '2020-07-21 22:58:01'),
	(24, 4, 3.00, 3, '2020-07-21 22:58:20', '2020-07-21 22:58:20'),
	(25, 3, 0.33, 4, '2020-07-21 22:58:20', '2020-07-21 22:58:20');
/*!40000 ALTER TABLE `criteria_comparisons` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.criteria_normalizations
CREATE TABLE IF NOT EXISTS `criteria_normalizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comparison_id` int(10) unsigned NOT NULL,
  `value` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_normalizations_comparison_id_foreign` (`comparison_id`),
  CONSTRAINT `criteria_normalizations_comparison_id_foreign` FOREIGN KEY (`comparison_id`) REFERENCES `criteria_comparisons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.criteria_normalizations: ~25 rows (approximately)
/*!40000 ALTER TABLE `criteria_normalizations` DISABLE KEYS */;
INSERT INTO `criteria_normalizations` (`id`, `comparison_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 0.0588, '2020-07-21 22:49:27', '2020-07-21 22:58:25'),
	(2, 2, 0.2646, '2020-07-21 22:49:27', '2020-07-21 22:58:25'),
	(3, 3, 0.1277, '2020-07-21 22:49:27', '2020-07-21 22:58:25'),
	(4, 4, 0.4237, '2020-07-21 22:49:27', '2020-07-21 22:58:25'),
	(5, 5, 0.0968, '2020-07-21 22:49:27', '2020-07-21 22:58:25'),
	(6, 6, 0.2941, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(7, 8, 0.1765, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(8, 10, 0.2941, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(9, 12, 0.1765, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(10, 7, 0.0529, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(11, 15, 0.0873, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(12, 17, 0.0661, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(13, 22, 0.5291, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(14, 9, 0.0421, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(15, 14, 0.3831, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(16, 19, 0.0639, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(17, 24, 0.3831, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(18, 11, 0.0847, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(19, 21, 0.1398, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(20, 23, 0.2119, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(21, 25, 0.1398, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(22, 13, 0.0319, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(23, 16, 0.3872, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(24, 18, 0.1936, '2020-07-21 22:58:25', '2020-07-21 22:58:25'),
	(25, 20, 0.2904, '2020-07-21 22:58:25', '2020-07-21 22:58:25');
/*!40000 ALTER TABLE `criteria_normalizations` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.criteria_priorities
CREATE TABLE IF NOT EXISTS `criteria_priorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) unsigned NOT NULL,
  `value` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_priorities_criteria_id_foreign` (`criteria_id`),
  CONSTRAINT `criteria_priorities_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.criteria_priorities: ~5 rows (approximately)
/*!40000 ALTER TABLE `criteria_priorities` DISABLE KEYS */;
INSERT INTO `criteria_priorities` (`id`, `criteria_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 0.0541, '2020-07-21 22:49:27', '2020-07-22 02:06:24'),
	(2, 2, 0.3082, '2020-07-21 22:49:27', '2020-07-22 02:06:24'),
	(3, 3, 0.1450, '2020-07-21 22:49:27', '2020-07-22 02:06:24'),
	(4, 4, 0.3841, '2020-07-21 22:49:27', '2020-07-22 02:06:24'),
	(5, 5, 0.1086, '2020-07-21 22:49:27', '2020-07-22 02:06:24');
/*!40000 ALTER TABLE `criteria_priorities` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.index_random
CREATE TABLE IF NOT EXISTS `index_random` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n` tinyint(3) unsigned NOT NULL,
  `IR` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.index_random: ~10 rows (approximately)
/*!40000 ALTER TABLE `index_random` DISABLE KEYS */;
INSERT INTO `index_random` (`id`, `n`, `IR`, `created_at`, `updated_at`) VALUES
	(1, 1, 0.00, NULL, NULL),
	(2, 2, 0.00, NULL, NULL),
	(3, 3, 0.58, NULL, NULL),
	(4, 4, 0.90, NULL, NULL),
	(5, 5, 1.12, NULL, NULL),
	(6, 6, 1.24, NULL, NULL),
	(7, 7, 1.32, NULL, NULL),
	(8, 8, 1.41, NULL, NULL),
	(9, 9, 1.45, NULL, NULL),
	(10, 10, 1.49, NULL, NULL);
/*!40000 ALTER TABLE `index_random` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.migrations: ~14 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2018_11_27_001124_create_roles_table', 1),
	(3, '2018_11_27_001516_create_role_user_table', 1),
	(4, '2018_11_27_082023_create_criterias_table', 1),
	(5, '2018_11_27_082143_create_alternatives_table', 1),
	(6, '2018_11_27_083235_create_alternative_details_table', 1),
	(7, '2018_12_03_132203_create_criteria_comparisons_table', 1),
	(8, '2018_12_04_062859_create_rating_scales_table', 1),
	(9, '2018_12_05_011024_create_criteria_normalizations_table', 1),
	(10, '2018_12_05_045538_create_criteria_priorities_table', 1),
	(11, '2018_12_16_031947_create_alternative_comparisons_table', 1),
	(12, '2018_12_16_105826_create_alternative_normalizations_table', 1),
	(13, '2018_12_16_131631_create_alternative_priorities_table', 1),
	(14, '2018_12_18_103508_create_index_randoms_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.rating_scales
CREATE TABLE IF NOT EXISTS `rating_scales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(10) unsigned NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.rating_scales: ~9 rows (approximately)
/*!40000 ALTER TABLE `rating_scales` DISABLE KEYS */;
INSERT INTO `rating_scales` (`id`, `value`, `caption`, `detail`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Sama pentingnya', 'Kedua elemen mempunyai pengaruh yang sama.', NULL, NULL),
	(2, 2, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
	(3, 3, 'Sedikit lebih penting', 'Pengalaman dan penilaian sangat memihak satu elemen dibandingkan dengan pasangannya.', NULL, NULL),
	(4, 4, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
	(5, 5, 'Lebih Penting', 'Satu elemen sangat disukai dan secara praktis dominasinya sangat nyata, dibandingkan dengan elemen pasangannya.', NULL, NULL),
	(6, 6, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
	(7, 7, 'Sangat penting', 'Satu elemen terbukti sangat disukai dan secara praktis dominasinya sangat, dibandingkan dengan elemen pasangannya.', NULL, NULL),
	(8, 8, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
	(9, 9, 'Mutlak lebih penting', 'Satu elemen mutlak lebih disukai dibandingkan dengan pasangannya, pada tingkat keyakinan tertinggi', NULL, NULL);
/*!40000 ALTER TABLE `rating_scales` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'superadmin', 'Superadmin', NULL, NULL, NULL),
	(2, 'admin', 'Administrator', NULL, NULL, NULL),
	(3, 'user', 'User', NULL, NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.role_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(2, 2, 3, NULL, NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table spk-ahp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table spk-ahp.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, 'Randy', 'randy', 'randy@randy.com', NULL, '$2y$10$5iJbg3RJZqgJacMEPQgK8.w.AG79b.VJDcPPAa9ijJM7mSvC2Bleu', 'PpZlUpjc2JClTl9mtc0E7Y4rytKVADl9acoQQ58dAgdb64PUITjYQntMklmz', '2020-07-21 22:43:14', '2020-07-21 22:43:14', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
