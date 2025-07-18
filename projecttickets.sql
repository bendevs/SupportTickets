-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-04-2025 a las 20:16:55
-- Versión del servidor: 9.2.0
-- Versión de PHP: 8.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `projecttickets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `batch_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subject` (`subject_type`,`subject_id`) USING BTREE,
  KEY `causer` (`causer_type`,`causer_id`) USING BTREE,
  KEY `activity_log_log_name_index` (`log_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\Ticket', 'created', 1, 'App\\Models\\User', 15, '[]', NULL, '2024-05-09 05:10:23', '2024-05-09 05:10:23'),
(2, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 1, 'App\\Models\\User', 15, '[]', NULL, '2024-05-09 05:10:23', '2024-05-09 05:10:23'),
(3, 'default', 'created', 'App\\Models\\Ticket', 'created', 2, 'App\\Models\\User', 23, '[]', NULL, '2024-05-09 05:14:09', '2024-05-09 05:14:09'),
(4, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 2, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:15:12', '2024-05-09 05:15:12'),
(5, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:15:53', '2024-05-09 05:15:53'),
(6, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 2, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:16:18', '2024-05-09 05:16:18'),
(7, 'default', 'created', 'App\\Models\\Ticket', 'created', 3, 'App\\Models\\User', 24, '[]', NULL, '2024-05-09 05:18:57', '2024-05-09 05:18:57'),
(8, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 3, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:19:42', '2024-05-09 05:19:42'),
(9, 'default', 'created', 'App\\Models\\Ticket', 'created', 4, 'App\\Models\\User', 25, '[]', NULL, '2024-05-09 05:23:41', '2024-05-09 05:23:41'),
(10, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 4, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:24:17', '2024-05-09 05:24:17'),
(11, 'default', 'created', 'App\\Models\\Ticket', 'created', 5, 'App\\Models\\User', 26, '[]', NULL, '2024-05-09 05:27:17', '2024-05-09 05:27:17'),
(12, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 5, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:27:57', '2024-05-09 05:27:57'),
(13, 'default', 'created', 'App\\Models\\Ticket', 'created', 6, 'App\\Models\\User', 27, '[]', NULL, '2024-05-09 05:30:47', '2024-05-09 05:30:47'),
(14, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 6, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:31:42', '2024-05-09 05:31:42'),
(15, 'default', 'created', 'App\\Models\\Ticket', 'created', 7, 'App\\Models\\User', 28, '[]', NULL, '2024-05-09 05:35:37', '2024-05-09 05:35:37'),
(16, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 7, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:36:16', '2024-05-09 05:36:16'),
(17, 'default', 'created', 'App\\Models\\Ticket', 'created', 8, 'App\\Models\\User', 29, '[]', NULL, '2024-05-09 05:40:41', '2024-05-09 05:40:41'),
(18, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 8, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:41:35', '2024-05-09 05:41:35'),
(19, 'default', 'created', 'App\\Models\\Ticket', 'created', 9, 'App\\Models\\User', 30, '[]', NULL, '2024-05-09 05:44:54', '2024-05-09 05:44:54'),
(20, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 9, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:45:37', '2024-05-09 05:45:37'),
(21, 'default', 'created', 'App\\Models\\Ticket', 'created', 10, 'App\\Models\\User', 30, '[]', NULL, '2024-05-09 05:47:32', '2024-05-09 05:47:32'),
(22, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 10, 'App\\Models\\User', 1, '[]', NULL, '2024-05-09 05:48:17', '2024-05-09 05:48:17'),
(23, 'default', 'created', 'App\\Models\\Ticket', 'created', 11, 'App\\Models\\User', 31, '[]', NULL, '2024-05-09 05:54:50', '2024-05-09 05:54:50'),
(24, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 11, 'App\\Models\\User', 1, '[]', NULL, '2024-05-13 04:47:47', '2024-05-13 04:47:47'),
(25, 'default', 'created', 'App\\Models\\Ticket', 'created', 12, 'App\\Models\\User', 93, '[]', NULL, '2024-05-13 05:13:23', '2024-05-13 05:13:23'),
(26, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 12, 'App\\Models\\User', 1, '[]', NULL, '2024-05-19 17:17:03', '2024-05-19 17:17:03'),
(27, 'default', 'created', 'App\\Models\\Ticket', 'created', 13, 'App\\Models\\User', 22, '[]', NULL, '2024-05-21 02:49:13', '2024-05-21 02:49:13'),
(28, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 13, 'App\\Models\\User', 22, '[]', NULL, '2024-05-21 02:49:13', '2024-05-21 02:49:13'),
(29, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 13, 'App\\Models\\User', 1, '[]', NULL, '2024-05-21 02:50:54', '2024-05-21 02:50:54'),
(30, 'default', 'created', 'App\\Models\\Ticket', 'created', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-06-20 05:29:36', '2024-06-20 05:29:36'),
(31, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-06-20 05:29:36', '2024-06-20 05:29:36'),
(32, 'default', 'created', 'App\\Models\\Ticket', 'created', 15, 'App\\Models\\User', 1, '[]', NULL, '2024-06-20 05:35:06', '2024-06-20 05:35:06'),
(33, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 15, 'App\\Models\\User', 1, '[]', NULL, '2024-06-20 05:35:06', '2024-06-20 05:35:06'),
(34, 'default', 'created', 'App\\Models\\Ticket', 'created', 16, 'App\\Models\\User', 22, '[]', NULL, '2024-06-20 05:36:35', '2024-06-20 05:36:35'),
(35, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 16, 'App\\Models\\User', 22, '[]', NULL, '2024-06-20 05:36:35', '2024-06-20 05:36:35'),
(36, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 16, 'App\\Models\\User', 1, '[]', NULL, '2024-06-22 04:06:37', '2024-06-22 04:06:37'),
(37, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 15, 'App\\Models\\User', 19, '[]', NULL, '2024-06-22 04:24:31', '2024-06-22 04:24:31'),
(38, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 15, 'App\\Models\\User', 19, '[]', NULL, '2024-06-22 04:41:27', '2024-06-22 04:41:27'),
(39, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 19, '[]', NULL, '2024-06-22 04:42:04', '2024-06-22 04:42:04'),
(40, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 1, 'App\\Models\\User', 19, '[]', NULL, '2024-06-22 04:53:02', '2024-06-22 04:53:02'),
(41, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 16, 'App\\Models\\User', 1, '[]', NULL, '2024-06-22 05:06:45', '2024-06-22 05:06:45'),
(42, 'default', 'created', 'App\\Models\\Ticket', 'created', 17, 'App\\Models\\User', 1, '[]', NULL, '2024-07-17 06:02:59', '2024-07-17 06:02:59'),
(43, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 17, 'App\\Models\\User', 1, '[]', NULL, '2024-07-17 06:02:59', '2024-07-17 06:02:59'),
(44, 'default', 'created', 'App\\Models\\Ticket', 'created', 18, 'App\\Models\\User', 1, '[]', NULL, '2024-07-17 06:35:46', '2024-07-17 06:35:46'),
(45, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 18, 'App\\Models\\User', 1, '[]', NULL, '2024-07-17 06:35:46', '2024-07-17 06:35:46'),
(46, 'default', 'created', 'App\\Models\\Ticket', 'created', 19, 'App\\Models\\User', 22, '[]', NULL, '2024-08-06 04:37:25', '2024-08-06 04:37:25'),
(47, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 19, 'App\\Models\\User', 22, '[]', NULL, '2024-08-06 04:37:25', '2024-08-06 04:37:25'),
(48, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 19, 'App\\Models\\User', 1, '[]', NULL, '2024-08-06 04:47:19', '2024-08-06 04:47:19'),
(49, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 19, 'App\\Models\\User', 1, '[]', NULL, '2024-09-11 00:29:38', '2024-09-11 00:29:38'),
(50, 'default', 'created', 'App\\Models\\Ticket', 'created', 20, 'App\\Models\\User', 1, '[]', NULL, '2024-09-11 23:00:09', '2024-09-11 23:00:09'),
(51, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 20, 'App\\Models\\User', 1, '[]', NULL, '2024-09-11 23:00:09', '2024-09-11 23:00:09'),
(52, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 13, 'App\\Models\\User', 1, '[]', NULL, '2024-09-11 23:57:02', '2024-09-11 23:57:02'),
(53, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 13, 'App\\Models\\User', 1, '[]', NULL, '2024-09-11 23:58:39', '2024-09-11 23:58:39'),
(54, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 15, 'App\\Models\\User', 1, '[]', NULL, '2024-09-12 01:39:38', '2024-09-12 01:39:38'),
(55, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-09-12 01:44:12', '2024-09-12 01:44:12'),
(56, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-09-12 01:45:21', '2024-09-12 01:45:21'),
(57, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-09-12 23:22:39', '2024-09-12 23:22:39'),
(58, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-09-12 23:24:39', '2024-09-12 23:24:39'),
(59, 'default', 'created', 'App\\Models\\Ticket', 'created', 21, 'App\\Models\\User', 103, '[]', NULL, '2024-09-13 02:01:54', '2024-09-13 02:01:54'),
(60, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 21, 'App\\Models\\User', 103, '[]', NULL, '2024-09-13 02:01:54', '2024-09-13 02:01:54'),
(61, 'default', 'created', 'App\\Models\\Ticket', 'created', 22, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:22:24', '2024-09-28 18:22:24'),
(62, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 22, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:22:24', '2024-09-28 18:22:24'),
(63, 'default', 'created', 'App\\Models\\Ticket', 'created', 23, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:44:12', '2024-09-28 18:44:12'),
(64, 'default', 'created', 'App\\Models\\Ticket', 'created', 24, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:51:27', '2024-09-28 18:51:27'),
(65, 'default', 'created', 'App\\Models\\Ticket', 'created', 25, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:51:48', '2024-09-28 18:51:48'),
(66, 'default', 'created', 'App\\Models\\Ticket', 'created', 26, 'App\\Models\\User', 1, '[]', NULL, '2024-09-28 18:52:05', '2024-09-28 18:52:05'),
(67, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 23, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 00:38:44', '2024-09-29 00:38:44'),
(68, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 24, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 00:38:50', '2024-09-29 00:38:50'),
(69, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 26, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 00:38:59', '2024-09-29 00:38:59'),
(70, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 25, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 00:42:56', '2024-09-29 00:42:56'),
(71, 'default', 'created', 'App\\Models\\Ticket', 'created', 27, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 06:32:13', '2024-09-29 06:32:13'),
(72, 'default', 'created', 'App\\Models\\Ticket', 'created', 28, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 06:33:00', '2024-09-29 06:33:00'),
(73, 'default', 'created', 'App\\Models\\Ticket', 'created', 29, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 06:37:19', '2024-09-29 06:37:19'),
(74, 'default', 'created', 'App\\Models\\Ticket', 'created', 30, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 06:48:12', '2024-09-29 06:48:12'),
(75, 'default', 'created', 'App\\Models\\Ticket', 'created', 31, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 06:49:56', '2024-09-29 06:49:56'),
(76, 'default', 'created', 'App\\Models\\Ticket', 'created', 32, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:00:19', '2024-09-29 07:00:19'),
(77, 'default', 'created', 'App\\Models\\Ticket', 'created', 33, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:45:52', '2024-09-29 07:45:52'),
(78, 'default', 'created', 'App\\Models\\Ticket', 'created', 34, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:49:30', '2024-09-29 07:49:30'),
(79, 'default', 'deleted', 'App\\Models\\Ticket', 'deleted', 31, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:50:00', '2024-09-29 07:50:00'),
(80, 'default', 'created', 'App\\Models\\Ticket', 'created', 35, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:50:35', '2024-09-29 07:50:35'),
(81, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 35, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:51:52', '2024-09-29 07:51:52'),
(82, 'default', 'created', 'App\\Models\\Ticket', 'created', 36, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 07:54:03', '2024-09-29 07:54:03'),
(83, 'default', 'created', 'App\\Models\\Ticket', 'created', 37, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 08:21:12', '2024-09-29 08:21:12'),
(84, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 37, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 08:21:37', '2024-09-29 08:21:37'),
(85, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 37, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 08:27:08', '2024-09-29 08:27:08'),
(86, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 37, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 08:27:18', '2024-09-29 08:27:18'),
(87, 'default', 'created', 'App\\Models\\Ticket', 'created', 38, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 08:56:21', '2024-09-29 08:56:21'),
(88, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 38, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 19:54:12', '2024-09-29 19:54:12'),
(89, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 38, 'App\\Models\\User', 1, '[]', NULL, '2024-09-29 21:35:40', '2024-09-29 21:35:40'),
(90, 'default', 'created', 'App\\Models\\Ticket', 'created', 39, 'App\\Models\\User', 2, '[]', NULL, '2024-09-30 00:21:58', '2024-09-30 00:21:58'),
(91, 'default', 'created', 'App\\Models\\Ticket', 'created', 40, 'App\\Models\\User', 2, '[]', NULL, '2024-09-30 00:24:09', '2024-09-30 00:24:09'),
(92, 'default', 'created', 'App\\Models\\Ticket', 'created', 41, 'App\\Models\\User', 2, '[]', NULL, '2024-09-30 00:59:21', '2024-09-30 00:59:21'),
(93, 'default', 'created', 'App\\Models\\Ticket', 'created', 42, 'App\\Models\\User', 2, '[]', NULL, '2024-09-30 01:06:08', '2024-09-30 01:06:08'),
(94, 'default', 'created', 'App\\Models\\Ticket', 'created', 43, 'App\\Models\\User', 103, '[]', NULL, '2024-09-30 01:55:19', '2024-09-30 01:55:19'),
(95, 'default', 'created', 'App\\Models\\Ticket', 'created', 44, 'App\\Models\\User', 102, '[]', NULL, '2024-09-30 02:02:36', '2024-09-30 02:02:36'),
(96, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 44, 'App\\Models\\User', 102, '[]', NULL, '2024-09-30 02:29:35', '2024-09-30 02:29:35'),
(97, 'default', 'created', 'App\\Models\\Ticket', 'created', 45, 'App\\Models\\User', 1, '[]', NULL, '2024-10-20 14:50:13', '2024-10-20 14:50:13'),
(98, 'default', 'created', 'App\\Models\\Ticket', 'created', 46, 'App\\Models\\User', 103, '[]', NULL, '2024-10-30 01:44:20', '2024-10-30 01:44:20'),
(99, 'default', 'created', 'App\\Models\\Ticket', 'created', 47, 'App\\Models\\User', 103, '[]', NULL, '2024-10-30 02:10:46', '2024-10-30 02:10:46'),
(100, 'default', 'created', 'App\\Models\\Ticket', 'created', 48, 'App\\Models\\User', 1, '[]', NULL, '2024-10-30 02:54:15', '2024-10-30 02:54:15'),
(101, 'default', 'created', 'App\\Models\\Ticket', 'created', 49, 'App\\Models\\User', 1, '[]', NULL, '2024-10-30 03:08:07', '2024-10-30 03:08:07'),
(102, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 49, 'App\\Models\\User', 1, '[]', NULL, '2024-10-30 03:08:29', '2024-10-30 03:08:29'),
(103, 'default', 'created', 'App\\Models\\Ticket', 'created', 50, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:12:15', '2024-11-30 22:12:15'),
(104, 'default', 'created', 'App\\Models\\Ticket', 'created', 51, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:15:17', '2024-11-30 22:15:17'),
(105, 'default', 'created', 'App\\Models\\Ticket', 'created', 52, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:16:17', '2024-11-30 22:16:17'),
(106, 'default', 'created', 'App\\Models\\Ticket', 'created', 53, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:17:03', '2024-11-30 22:17:03'),
(107, 'default', 'created', 'App\\Models\\Ticket', 'created', 54, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:21:07', '2024-11-30 22:21:07'),
(108, 'default', 'created', 'App\\Models\\Ticket', 'created', 55, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 22:26:40', '2024-11-30 22:26:40'),
(109, 'default', 'created', 'App\\Models\\Ticket', 'created', 56, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:00:49', '2024-11-30 23:00:49'),
(110, 'default', 'created', 'App\\Models\\Ticket', 'created', 57, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:05:34', '2024-11-30 23:05:34'),
(111, 'default', 'created', 'App\\Models\\Ticket', 'created', 58, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:22:24', '2024-11-30 23:22:24'),
(112, 'default', 'created', 'App\\Models\\Ticket', 'created', 59, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:24:36', '2024-11-30 23:24:36'),
(113, 'default', 'created', 'App\\Models\\Ticket', 'created', 60, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:28:54', '2024-11-30 23:28:54'),
(114, 'default', 'created', 'App\\Models\\Ticket', 'created', 61, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:31:09', '2024-11-30 23:31:09'),
(115, 'default', 'created', 'App\\Models\\Ticket', 'created', 62, 'App\\Models\\User', 103, '[]', NULL, '2024-11-30 23:37:18', '2024-11-30 23:37:18'),
(116, 'default', 'created', 'App\\Models\\Ticket', 'created', 63, 'App\\Models\\User', 102, '[]', NULL, '2024-12-18 00:37:44', '2024-12-18 00:37:44'),
(117, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 63, 'App\\Models\\User', 102, '[]', NULL, '2024-12-18 00:38:11', '2024-12-18 00:38:11'),
(118, 'default', 'created', 'App\\Models\\Ticket', 'created', 64, 'App\\Models\\User', 1, '[]', NULL, '2024-12-23 01:46:18', '2024-12-23 01:46:18'),
(119, 'default', 'created', 'App\\Models\\Ticket', 'created', 65, 'App\\Models\\User', 1, '[]', NULL, '2024-12-23 01:48:29', '2024-12-23 01:48:29'),
(120, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 62, 'App\\Models\\User', 1, '[]', NULL, '2025-02-04 03:07:58', '2025-02-04 03:07:58'),
(121, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 21, 'App\\Models\\User', 1, '[]', NULL, '2025-02-04 03:17:31', '2025-02-04 03:17:31'),
(122, 'default', 'created', 'App\\Models\\Ticket', 'created', 66, 'App\\Models\\User', 1, '[]', NULL, '2025-02-09 03:45:47', '2025-02-09 03:45:47'),
(123, 'default', 'created', 'App\\Models\\Ticket', 'created', 67, 'App\\Models\\User', 1, '[]', NULL, '2025-02-09 03:51:43', '2025-02-09 03:51:43'),
(124, 'default', 'created', 'App\\Models\\Ticket', 'created', 68, 'App\\Models\\User', 1, '[]', NULL, '2025-02-09 03:53:23', '2025-02-09 03:53:23'),
(125, 'default', 'created', 'App\\Models\\Ticket', 'created', 69, 'App\\Models\\User', 38, '[]', NULL, '2025-02-11 02:15:15', '2025-02-11 02:15:15'),
(126, 'default', 'created', 'App\\Models\\Ticket', 'created', 70, 'App\\Models\\User', 43, '[]', NULL, '2025-02-11 02:19:46', '2025-02-11 02:19:46'),
(127, 'default', 'created', 'App\\Models\\Ticket', 'created', 71, 'App\\Models\\User', 42, '[]', NULL, '2025-02-11 02:21:49', '2025-02-11 02:21:49'),
(128, 'default', 'created', 'App\\Models\\Ticket', 'created', 72, 'App\\Models\\User', 47, '[]', NULL, '2025-02-11 02:24:45', '2025-02-11 02:24:45'),
(129, 'default', 'created', 'App\\Models\\Ticket', 'created', 73, 'App\\Models\\User', 24, '[]', NULL, '2025-02-11 23:17:48', '2025-02-11 23:17:48'),
(130, 'default', 'created', 'App\\Models\\Ticket', 'created', 74, 'App\\Models\\User', 29, '[]', NULL, '2025-02-11 23:19:50', '2025-02-11 23:19:50'),
(131, 'default', 'created', 'App\\Models\\Ticket', 'created', 75, 'App\\Models\\User', 47, '[]', NULL, '2025-02-11 23:23:06', '2025-02-11 23:23:06'),
(132, 'default', 'created', 'App\\Models\\Ticket', 'created', 76, 'App\\Models\\User', 32, '[]', NULL, '2025-02-11 23:24:51', '2025-02-11 23:24:51'),
(133, 'default', 'created', 'App\\Models\\Ticket', 'created', 77, 'App\\Models\\User', 41, '[]', NULL, '2025-02-11 23:27:18', '2025-02-11 23:27:18'),
(134, 'default', 'created', 'App\\Models\\Ticket', 'created', 78, 'App\\Models\\User', 105, '[]', NULL, '2025-02-11 23:29:46', '2025-02-11 23:29:46'),
(135, 'default', 'created', 'App\\Models\\Ticket', 'created', 79, 'App\\Models\\User', 59, '[]', NULL, '2025-02-11 23:31:47', '2025-02-11 23:31:47'),
(136, 'default', 'created', 'App\\Models\\Ticket', 'created', 80, 'App\\Models\\User', 95, '[]', NULL, '2025-02-11 23:34:05', '2025-02-11 23:34:05'),
(137, 'default', 'created', 'App\\Models\\Ticket', 'created', 81, 'App\\Models\\User', 98, '[]', NULL, '2025-02-11 23:35:49', '2025-02-11 23:35:49'),
(138, 'default', 'created', 'App\\Models\\Ticket', 'created', 82, 'App\\Models\\User', 93, '[]', NULL, '2025-02-12 00:02:14', '2025-02-12 00:02:14'),
(139, 'default', 'created', 'App\\Models\\Ticket', 'created', 83, 'App\\Models\\User', 88, '[]', NULL, '2025-02-12 00:06:16', '2025-02-12 00:06:16'),
(140, 'default', 'created', 'App\\Models\\Ticket', 'created', 84, 'App\\Models\\User', 84, '[]', NULL, '2025-02-12 00:09:43', '2025-02-12 00:09:43'),
(141, 'default', 'created', 'App\\Models\\Ticket', 'created', 85, 'App\\Models\\User', 80, '[]', NULL, '2025-02-12 00:11:58', '2025-02-12 00:11:58'),
(142, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 85, 'App\\Models\\User', 21, '[]', NULL, '2025-02-17 21:06:47', '2025-02-17 21:06:47'),
(143, 'default', 'created', 'App\\Models\\Ticket', 'created', 86, 'App\\Models\\User', 80, '[]', NULL, '2025-02-17 21:10:23', '2025-02-17 21:10:23'),
(144, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 86, 'App\\Models\\User', 22, '[]', NULL, '2025-02-17 21:13:15', '2025-02-17 21:13:15'),
(145, 'default', 'created', 'App\\Models\\Ticket', 'created', 87, 'App\\Models\\User', 80, '[]', NULL, '2025-02-21 01:44:52', '2025-02-21 01:44:52'),
(146, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 87, 'App\\Models\\User', 21, '[]', NULL, '2025-02-21 01:45:49', '2025-02-21 01:45:49'),
(147, 'default', 'created', 'App\\Models\\Ticket', 'created', 88, 'App\\Models\\User', 106, '[]', NULL, '2025-02-21 01:56:47', '2025-02-21 01:56:47'),
(148, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 6, 'App\\Models\\User', 17, '[]', NULL, '2025-02-21 01:58:19', '2025-02-21 01:58:19'),
(149, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 6, 'App\\Models\\User', 17, '[]', NULL, '2025-02-21 01:58:41', '2025-02-21 01:58:41'),
(150, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 88, 'App\\Models\\User', 17, '[]', NULL, '2025-02-21 01:59:05', '2025-02-21 01:59:05'),
(151, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 84, 'App\\Models\\User', 21, '[]', NULL, '2025-02-21 02:11:55', '2025-02-21 02:11:55'),
(152, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 83, 'App\\Models\\User', 22, '[]', NULL, '2025-02-21 02:15:27', '2025-02-21 02:15:27'),
(153, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 80, 'App\\Models\\User', 18, '[]', NULL, '2025-02-21 02:16:52', '2025-02-21 02:16:52'),
(154, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 79, 'App\\Models\\User', 16, '[]', NULL, '2025-02-21 02:27:11', '2025-02-21 02:27:11'),
(155, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 11, 'App\\Models\\User', 20, '[]', NULL, '2025-02-21 02:32:43', '2025-02-21 02:32:43'),
(156, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 82, 'App\\Models\\User', 21, '[]', NULL, '2025-02-21 02:49:13', '2025-02-21 02:49:13'),
(157, 'default', 'created', 'App\\Models\\Ticket', 'created', 89, 'App\\Models\\User', 107, '[]', NULL, '2025-03-01 20:38:40', '2025-03-01 20:38:40'),
(158, 'default', 'updated', 'App\\Models\\Ticket', 'updated', 89, 'App\\Models\\User', 21, '[]', NULL, '2025-03-01 20:40:18', '2025-03-01 20:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tecnico_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_tecnico_id` (`tecnico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `is_visible`, `created_at`, `updated_at`, `tecnico_id`) VALUES
(2, 'Problema tecnico', 'problema-tecnico', 1, '2024-05-06 04:46:47', '2025-01-29 04:16:06', 7),
(5, 'impresora', 'impresora', 1, '2024-05-08 06:24:04', '2025-02-11 02:03:53', 7),
(6, 'software', 'software', 1, '2024-05-08 06:24:12', '2025-02-11 02:04:04', 8),
(7, 'soporte técnico', 'soporte-tecnico', 1, '2024-05-08 06:24:44', '2025-02-11 02:04:22', 7),
(8, 'Infraestructura Redes y Servicios', 'infraestructura-redes-y-servicios', 1, '2024-05-08 06:25:26', '2025-02-11 02:04:33', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_ticket`
--

DROP TABLE IF EXISTS `category_ticket`;
CREATE TABLE IF NOT EXISTS `category_ticket` (
  `category_id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `category_ticket`
--

INSERT INTO `category_ticket` (`category_id`, `ticket_id`) VALUES
(9, 1),
(14, 2),
(6, 3),
(5, 4),
(5, 5),
(7, 6),
(5, 7),
(6, 8),
(7, 9),
(5, 10),
(5, 11),
(5, 12),
(6, 13),
(6, 14),
(14, 15),
(6, 16),
(2, 17),
(5, 18),
(17, 19),
(2, 20),
(1, 14),
(2, 14),
(3, 14),
(4, 14),
(5, 14),
(7, 14),
(11, 14),
(12, 14),
(1, 21),
(2, 22),
(2, 24),
(2, 26),
(2, 27),
(2, 28),
(1, 29),
(13, 29),
(2, 30),
(8, 30),
(13, 30),
(2, 31),
(2, 32),
(8, 32),
(2, 33),
(10, 33),
(1, 34),
(9, 34),
(14, 34),
(1, 35),
(2, 35),
(2, 36),
(4, 36),
(1, 37),
(2, 37),
(8, 37),
(9, 37),
(2, 38),
(9, 38),
(14, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(3, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(3, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(4, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(4, 66),
(2, 67),
(5, 68),
(6, 69),
(5, 70),
(5, 71),
(7, 72),
(6, 73),
(7, 74),
(5, 75),
(5, 76),
(5, 77),
(6, 78),
(6, 79),
(6, 80),
(2, 81),
(5, 82),
(2, 83),
(5, 84),
(2, 85),
(2, 86),
(5, 87),
(6, 88),
(7, 89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_equipo_nuevo`
--

DROP TABLE IF EXISTS `configuracion_equipo_nuevo`;
CREATE TABLE IF NOT EXISTS `configuracion_equipo_nuevo` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `nombre_equipo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `area_unidad` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estadoEquipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_institucional` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion_equipo_nuevo`
--

INSERT INTO `configuracion_equipo_nuevo` (`id`, `id_usuario`, `nombre_equipo`, `tipo`, `area_unidad`, `estadoEquipo`, `direccion_ip`, `correo_institucional`, `created_at`, `updated_at`) VALUES
(2, 23, 'Acer 12', 'Computadora', 'SISTEMAS', NULL, '127.0.0.1', 'AntonioMudi@gob.com.bo', '2024-09-22 21:50:48', '2024-09-28 05:10:38'),
(4, 67, 'dell optiplex 307', 'Computadora', 'UNIDAD DE GESTION DE LA INVERSION SECTORIAL', NULL, '127.0.0.1', 'vicente.lara@vipfe.gob.bo', '2024-09-28 04:52:34', '2025-02-11 01:25:23'),
(5, 65, 'Acer 12', 'Laptop', 'VICEMINISTERIO DE INVERSION PUBLICA Y FINANCIAMIENTO EXTERNO', NULL, '127.0.0.1', 'AntonioMudi@gob.com.bo', '2024-09-28 05:07:35', '2025-02-11 01:23:15'),
(6, 27, 'think pad 14', 'Laptop', 'PRESUPUESTOS', NULL, '127.0.0.1', 'silviaSoliz@com.bo', '2024-09-29 07:53:19', '2024-09-29 07:53:19'),
(7, 91, 'dell Company 12', 'Laptop', 'ADMINISTRACION', NULL, '127.0.0.1', 'magali.paz@planificacion.gob.bo', '2024-12-22 22:49:37', '2024-12-22 22:49:37'),
(8, 76, 'Impresora epson L3110', 'Impresora', 'RECURSOS HUMANOS', NULL, '127.0.0.1', 'jorge.brito@vipfe.gob.bo', '2025-02-09 03:48:13', '2025-02-09 03:48:13'),
(9, 24, 'dell optiplex 5050', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'william.valencia@planificacion.gob.bo', '2025-02-09 03:48:47', '2025-02-11 23:16:36'),
(11, 25, 'optiplex 7050', 'Computadora', 'JURIDICA', NULL, '127.0.0.1', 'steve.mendoza@planificacion.gob.bo', '2025-02-11 00:20:10', '2025-02-11 00:20:10'),
(12, 26, 'dell optiplex 508', 'Computadora', 'JURIDICA', NULL, '127.0.0.1', 'paola.arteaga@planificacion.go.bo', '2025-02-11 00:20:48', '2025-02-11 00:20:48'),
(13, 27, 'DELL OPTIPLEX 5080', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'silvia.soliz@planificacion.gob.bo', '2025-02-11 00:21:32', '2025-02-11 00:21:32'),
(14, 28, 'DELL OPTIPLEX 5090', 'Computadora', 'JURIDICA', NULL, '127.0.0.1', 'maria.luna@planificacion.go.bo', '2025-02-11 00:22:04', '2025-02-11 00:22:04'),
(15, 29, 'dell optiplex 7080', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'jose.maldonado@planificacion.gob.bo', '2025-02-11 00:23:00', '2025-02-11 00:23:00'),
(16, 30, 'dell optiplex 7480', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'cecilia.guachalla@planificacion.gob.bo', '2025-02-11 00:23:31', '2025-02-11 00:23:31'),
(17, 31, 'dell optiplex 7090', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'inti.aliaga@planificacion.gob.bo', '2025-02-11 00:24:05', '2025-02-11 00:24:05'),
(18, 32, 'dell optiplex 7490', 'Computadora', 'ASUNTOS JURIDICOS', NULL, '127.0.0.1', 'mario.galvan@planificacion.gob.bo', '2025-02-11 00:24:50', '2025-02-11 00:24:50'),
(19, 33, 'dell optiplex 7490', 'Computadora', 'JURIDICA', NULL, '127.0.0.1', 'edith.lazo@planificacion.gob.bo', '2025-02-11 00:26:16', '2025-02-11 00:26:16'),
(20, 34, 'dell optiplex 7000', 'Computadora', 'ASUNTOS ADMINISTRATIVOS', 'Activo', '127.0.0.1', 'alvaro.cuellar@planificacion.gob.bo', '2025-02-11 00:27:15', '2025-02-21 01:58:41'),
(21, 35, 'dell optiplex 7780', 'Computadora', 'ASUNTOS ADMINISTRATIVOS', NULL, '127.0.0.1', 'mercedes.burgos@planificacion.gob.bo', '2025-02-11 00:27:49', '2025-02-11 00:27:49'),
(22, 36, 'dell optiplex 7071', 'Computadora', 'FINANCIERA', NULL, '127.0.0.1', 'otilia.choque@planificacion.gob.bo', '2025-02-11 00:29:12', '2025-02-11 00:29:12'),
(23, 37, 'dell optiplex 7780', 'Computadora', 'FINANCIERA', NULL, '127.0.0.1', 'marcelo.yanpasi@planificacion.gob.bo', '2025-02-11 00:29:45', '2025-02-11 00:29:45'),
(24, 38, 'dell optiplex 7080', 'Computadora', 'CONTABILIDAD', NULL, '127.0.0.1', 'willy.calzada@planificacion.gob.bo', '2025-02-11 00:32:17', '2025-02-11 00:32:17'),
(25, 39, 'dell optiplex 5000', 'Computadora', 'CONTABILIDAD', NULL, '127.0.0.1', 'silverio.colque@planificacion.gob.bo', '2025-02-11 01:04:04', '2025-02-11 01:04:04'),
(26, 40, 'dell optiplex 7071', 'Computadora', 'CONTABILIDAD', NULL, '127.0.0.1', 'patricia.claros@planificacion.gob.bo', '2025-02-11 01:04:22', '2025-02-11 01:04:22'),
(27, 41, 'dell optiplex 5490', 'Computadora', 'TESORERIA', NULL, '127.0.0.1', 'yesenia.jimenez@planificacion.gob.bo', '2025-02-11 01:04:55', '2025-02-11 01:04:55'),
(28, 42, 'dell optiplex 5480', 'Computadora', 'ADMINISTRACION', NULL, '127.0.0.1', 'paola.salas@planificacion.gob.bo', '2025-02-11 01:05:33', '2025-02-11 01:05:33'),
(29, 43, 'dell optiplex 5080', 'Computadora', 'ADMINISTRACION', NULL, '127.0.0.1', 'carla.henrich@planificacion.gob.bo', '2025-02-11 01:05:55', '2025-02-11 01:05:55'),
(30, 44, 'dell optiplex 7071', 'Computadora', 'ACTIVOS FIJOS', NULL, '127.0.0.1', 'gustavo.calle@planificacion.gob.bo', '2025-02-11 01:07:16', '2025-02-11 01:07:16'),
(31, 45, 'dell optiplex 7080', 'Computadora', 'SERVICIOS GENERALES', NULL, '127.0.0.1', 'omar.uzquiano@planificacion.gob.bo', '2025-02-11 01:08:00', '2025-02-11 01:08:00'),
(32, 46, 'dell optiplex 7071', 'Computadora', 'SERVICIOS GENERALES', NULL, '127.0.0.1', 'jose.lima@planificacion.gob.bo', '2025-02-11 01:09:03', '2025-02-11 01:09:03'),
(33, 47, 'dell optiplex 7071', 'Computadora', 'ADQUISICIONES', NULL, '127.0.0.1', 'olga.serrudo@planificacion.gob.bo', '2025-02-11 01:09:51', '2025-02-11 01:09:51'),
(34, 48, 'dell optiplex 5090', 'Computadora', 'ACTIVOS FIJOS', NULL, '127.0.0.1', 'claudia.aguilar@planificacion.gob.bo', '2025-02-11 01:10:24', '2025-02-11 01:10:24'),
(35, 49, 'dell optiplex 5050', 'Computadora', 'ADMINISTRACION', NULL, '127.0.0.1', 'gabriel.osco@planificacion.gob.bo', '2025-02-11 01:10:52', '2025-02-11 01:10:52'),
(36, 50, 'dell optiplex 3080', 'Computadora', 'CORRESPONDENCIA', NULL, '127.0.0.1', 'mariel.rodriguez@planificacion.gob.bo', '2025-02-11 01:11:20', '2025-02-11 01:11:20'),
(37, 51, 'dell optiplex 505', 'Computadora', 'RECURSOS HUMANOS', NULL, '127.0.0.1', 'andres.bocangel@planificacion.gob.bo', '2025-02-11 01:11:50', '2025-02-11 01:11:50'),
(38, 52, 'dell optiplex 3090', 'Computadora', 'RECURSOS HUMANOS', NULL, '127.0.0.1', 'carla.duenas@planificacion.gob.bo', '2025-02-11 01:12:26', '2025-02-11 01:12:26'),
(39, 53, 'dell optiplex 7071', 'Computadora', 'VICEMINISTERIO DE PLANIFICACION Y COORDINACION', NULL, '127.0.0.1', 'carlos.guachalla@planificacion.gob.bo', '2025-02-11 01:14:22', '2025-02-11 01:14:22'),
(40, 54, 'dell optiplex 5490', 'Computadora', 'DIRECCION GENERAL DEL SISTEMA DE PLANIFICACION INTEGRAL ESTATAL', NULL, '127.0.0.1', 'franz.quiqsbert@planificacion.gob.bo', '2025-02-11 01:15:02', '2025-02-11 01:15:02'),
(41, 55, 'dell optiplex 5000', 'Computadora', 'DIRECCION GENERAL DE SEGUIMIENTO Y COORDINACION', NULL, '127.0.0.1', 'estefany.quispe@planificacion.gob.bo', '2025-02-11 01:15:44', '2025-02-11 01:15:44'),
(42, 56, 'dell optiplex 7780', 'Computadora', 'DIRECCION GENERAL DEL SISTEMA DE PLANIFICACION INTEGRAL ESTATAL', NULL, '127.0.0.1', 'fidel.chacolla@planificacion.gob.bo', '2025-02-11 01:17:03', '2025-02-11 01:17:03'),
(43, 57, 'dell optiplex 7780', 'Computadora', 'DIRECCION GENERAL DE SEGUIMIENTO Y COORDINACION', NULL, '127.0.0.1', 'edson.apaza@planificacion.gob.bo', '2025-02-11 01:17:49', '2025-02-11 01:17:49'),
(44, 58, 'dell optiplex 3090', 'Computadora', 'DIRECCION GENERAL DE SEGUIMIENTO Y COORDINACION', NULL, '127.0.0.1', 'julia.monje@planificacion.gob.bo', '2025-02-11 01:18:20', '2025-02-11 01:18:20'),
(45, 59, 'dell optiplex 3280', 'Computadora', 'DIRECCION GENERAL DE PLANIFICACION TERRITORIAL', 'Activo', '127.0.0.1', 'ronald.ortube@planificacion.gob.bo', '2025-02-11 01:18:40', '2025-02-21 02:27:11'),
(46, 60, 'dell optiplex 5080', 'Computadora', 'VICEMINISTERIO DE PLANIFICACION ESTRATEGICA DEL ESTADO', NULL, '127.0.0.1', 'vanessa.nunez@planificacion.gob.bo', '2025-02-11 01:19:13', '2025-02-11 01:19:13'),
(47, 61, 'dell optiplex 3040', 'Computadora', 'VICEMINISTERIO DE PLANIFICACION ESTRATEGICA DEL ESTADO', NULL, '127.0.0.1', 'cristobal.mamani@planificacion.gob.bo', '2025-02-11 01:19:53', '2025-02-11 01:19:53'),
(48, 62, 'dell optiplex 5040', 'Computadora', 'DIRECCION GENERAL DE EMPRESAS ESTATALES', NULL, '127.0.0.1', 'marco.vargas@planificacion.gob.bo', '2025-02-11 01:21:27', '2025-02-11 01:21:27'),
(49, 63, 'dell optiplex 3070', 'Computadora', 'DIRECCION GENERAL DE EMPRESAS ESTATALES', NULL, '127.0.0.1', 'jorge.arnez@planificacion.gob.bo', '2025-02-11 01:22:26', '2025-02-11 01:22:26'),
(50, 64, 'dell optiplex 5050', 'Computadora', 'DIRECCION GENERAL DE SEGUIMIENTO Y COORDINACION', NULL, '127.0.0.1', 'claudia.ruiz@planificacion.gob.bo', '2025-02-11 01:22:48', '2025-02-11 01:22:48'),
(51, 66, 'dell optiplex 7490', 'Computadora', 'VICEMINISTERIO DE INVERSION PUBLICA Y FINANCIAMIENTO EXTERNO', NULL, '127.0.0.1', 'malena.ayllon@vipfe.gob.bo', '2025-02-11 01:24:17', '2025-02-11 01:24:17'),
(52, 68, 'dell optiplex 3040', 'Computadora', 'DIRECCION GENERAL DE PROGRAMACION Y PREINVERSION', NULL, '127.0.0.1', 'karina.garcia@vipfe.gob.bo', '2025-02-11 01:26:04', '2025-02-11 01:26:04'),
(53, 69, 'dell optiplex 5250', 'Computadora', 'UNIDAD DE PROGRAMACION DE LA INVERSION', NULL, '127.0.0.1', 'boris.calcina@vipfe.gob.bo', '2025-02-11 01:26:27', '2025-02-11 01:26:27'),
(54, 70, 'dell optiplex 5000', 'Computadora', 'UNIDAD DE PROGRAMACION DE LA INVERSION', NULL, '127.0.0.1', 'gary.tintaya@vipfe.gob.bo', '2025-02-11 01:26:50', '2025-02-11 01:26:50'),
(55, 71, 'dell optiplex 5050', 'Computadora', 'UNIDAD DE PROGRAMACION DE LA INVERSION', NULL, '127.0.0.1', 'monica.condori@vipfe.gob.bo', '2025-02-11 01:28:54', '2025-02-11 01:28:54'),
(56, 72, 'dell optiplex 3011', 'Computadora', 'DIRECCION GENERAL DE PROGRAMACION Y PREINVERSION', NULL, '127.0.0.1', 'yola.mayta@vipfe.gob.bo', '2025-02-11 01:29:57', '2025-02-11 01:29:57'),
(57, 73, 'dell optiplex 3040', 'Computadora', 'UNIDAD_DE_PREINVERSION', NULL, '127.0.0.1', 'juan.valdivia@vipfe.gob.bo', '2025-02-11 01:30:22', '2025-02-11 01:30:22'),
(58, 74, 'dell optiplex 5080', 'Computadora', 'DIRECCION GENERAL DE GESTION DE FINANCIAMIENTO EXTERNO', NULL, '127.0.0.1', 'lourdes.matienzo@vipfe.gob.bo', '2025-02-11 01:30:55', '2025-02-11 01:30:55'),
(59, 75, 'dell optiplex 5080', 'Computadora', 'DIRECCION GENERAL DE GESTION DE FINANCIAMIENTO EXTERNO', NULL, '127.0.0.1', 'fabiola.ramos@vipfe.gob.bo', '2025-02-11 01:31:30', '2025-02-11 01:31:30'),
(60, 76, 'dell optiplex 7010', 'Computadora', 'UNIDAD DE NEGOCIACION DEL FINANCIAMIENTO', NULL, '127.0.0.1', 'jorge.brito@vipfe.gob.bo', '2025-02-11 01:33:45', '2025-02-11 01:33:45'),
(61, 77, 'dell optiplex 5080', 'Computadora', 'UNIDAD DE NEGOCIACION DEL FINANCIAMIENTO', NULL, '127.0.0.1', 'aldhemar.yujra@vipfe.gob.bo', '2025-02-11 01:34:07', '2025-02-11 01:34:07'),
(62, 78, 'dell optiplex 5080', 'Computadora', 'UNIDAD OPERATIVA DE FINANCIAMIENTO', NULL, '127.0.0.1', 'rodrigo.meneses@vipfe.gob.bo', '2025-02-11 01:34:30', '2025-02-11 01:34:30'),
(63, 79, 'dell optiplex 508', 'Computadora', 'UNIDAD OPERATIVA DE FINANCIAMIENTO', NULL, '127.0.0.1', 'sergio.arrieta@vipfe.gob.bo', '2025-02-11 01:34:52', '2025-02-11 01:34:52'),
(64, 80, 'dell optiplex 5050', 'Computadora', 'UNIDAD DE ADMINISTRACION DE PROGRAMAS', 'Activo', '127.0.0.1', 'veronica.gamarra@vipfe.gob.bo', '2025-02-11 01:35:53', '2025-02-17 21:06:47'),
(65, 81, 'dell optiplex 3040', 'Computadora', 'UNIDAD DE ADMINISTRACION DE PROGRAMAS', NULL, '127.0.0.1', 'paulino.ruiz@vipfe.gob.bo', '2025-02-11 01:36:38', '2025-02-11 01:36:38'),
(66, 82, 'dell optiplex 3090', 'Computadora', 'UNIDAD OPERATIVA DE FINANCIAMIENTO', NULL, '127.0.0.1', 'veronica.rocha@vipfe.gob.bo', '2025-02-11 01:37:33', '2025-02-11 01:37:33'),
(67, 83, 'dell optiplex 5080', 'Computadora', 'DIRECCION GENERAL DE GESTION DE LA INVERSION PUBLICA', NULL, '127.0.0.1', 'betty.achu@vipfe.gob.bo', '2025-02-11 01:38:37', '2025-02-11 01:38:37'),
(68, 84, 'dell optiplex 3011', 'Computadora', 'DIRECCION GENERAL DE GESTION DE LA INVERSION PUBLICA', 'Activo', '127.0.0.1', 'uber.madueno@vipfe.gob.bo', '2025-02-11 01:39:12', '2025-02-21 02:11:55'),
(69, 85, 'dell optiplex 5050', 'Computadora', 'UNIDAD DE GESTION DE LA INVERSION TERRITORIAL', NULL, '127.0.0.1', 'jose.nina@vipfe.gob.bo', '2025-02-11 01:39:41', '2025-02-11 01:39:41'),
(70, 86, 'dell optiplex 3040', 'Computadora', 'UNIDAD DE GESTION DE LA INVERSION SECTORIAL', NULL, '127.0.0.1', 'aracely.cadena@vipfe.gob.bo', '2025-02-11 01:40:49', '2025-02-11 01:40:49'),
(71, 87, 'dell optiplex 5080', 'Computadora', 'UNIDAD DE GESTION DE LA INVERSION SECTORIAL', NULL, '127.0.0.1', 'carlos.lopez@vipfe.gob.bo', '2025-02-11 01:41:38', '2025-02-11 01:41:38'),
(72, 88, 'dell optiplex 5080', 'Computadora', 'UNIDAD DE GESTION DE LA INVERSION SECTORIAL', 'Activo', '127.0.0.1', 'felix.vargas@vipfe.gob.bo', '2025-02-11 01:42:59', '2025-02-21 02:15:27'),
(73, 89, 'dell optiplex 3040', 'Computadora', 'VICEMINISTERIO DE CIENCIA Y TECNOLOGÍA', NULL, '127.0.0.1', 'mauricio.gonzales@planificacion.gob.bo', '2025-02-11 01:45:19', '2025-02-11 01:45:19'),
(74, 90, 'dell optiplex 5050', 'Computadora', 'DIRECCIÓN GENERAL DE CIENCIA Y CONOCIMIENTO', NULL, '127.0.0.1', 'milenka.acarapi@planificacion.gob.bo', '2025-02-11 01:46:47', '2025-02-11 01:46:47'),
(75, 91, 'dell optiplex 5050', 'Computadora', 'DIRECCIÓN GENERAL DE CIENCIA Y CONOCIMIENTO', NULL, '127.0.0.1', 'magali.paz@planificacion.gob.bo', '2025-02-11 01:47:21', '2025-02-11 01:47:21'),
(76, 92, 'dell optiplex 5050', 'Computadora', 'DIRECCIÓN GENERAL DE TECNOLOGÍA E INNOVACIÓN', NULL, '127.0.0.1', 'juan.torrico@planificacion.gob.bo', '2025-02-11 01:47:41', '2025-02-11 01:47:41'),
(77, 93, 'dell optiplex 5050', 'Computadora', 'DIRECCIÓN GENERAL DE TECNOLOGÍA E INNOVACIÓN', 'Activo', '127.0.0.1', 'eliana.vargas@planificacion.gob.bo', '2025-02-11 01:48:10', '2025-02-21 02:49:13'),
(78, 94, 'dell optiplex 3040', 'Computadora', 'VICEMINISTERIO DE CIENCIA Y TECNOLOGÍA', NULL, '127.0.0.1', 'daniela.valverde@planificacion.gob.bo', '2025-02-11 01:48:57', '2025-02-11 01:48:57'),
(79, 95, 'dell optiplex 3040', 'Computadora', 'UNIDAD_DE_PREINVERSION', 'Activo', '127.0.0.1', 'yerko.palacios@planificacion.gob.bo', '2025-02-11 01:50:25', '2025-02-21 02:16:52'),
(80, 96, 'dell optiplex 5080', 'Computadora', 'UNIDAD_DE_PREINVERSION', NULL, '127.0.0.1', 'shirley.gutierrez@planificacion.gob.bo', '2025-02-11 01:51:12', '2025-02-11 01:51:12'),
(81, 97, 'dell optiplex 5050', 'Computadora', 'DESPACHO MINISTERIAL', NULL, '127.0.0.1', 'melani.osorio@planificacion.gob.bo', '2025-02-11 01:51:36', '2025-02-11 01:51:47'),
(82, 98, 'dell optiplex 3040', 'Computadora', 'PROGRAMA DE INTERVENCIONES URBANAS', NULL, '127.0.0.1', 'prycila.tito@planificacion.gob.bo', '2025-02-11 01:52:08', '2025-02-11 01:52:08'),
(83, 99, 'dell optiplex 3040', 'Computadora', 'UNIDAD DE COORDINACIÓN GENERAL DE PLAN NACIONAL DE EMPLEO', NULL, '127.0.0.1', 'maria.saravia@planificacion.gob.bo', '2025-02-11 01:52:58', '2025-02-11 01:52:58'),
(84, 105, 'dell optiplex 3040', 'Computadora', 'UNIDAD DE NEGOCIACION DEL FINANCIAMIENTO', NULL, '127.0.0.1', 'paulo.moreno@planificacion.gob.bo', '2025-02-11 01:56:33', '2025-02-11 01:56:33'),
(85, 106, 'Optiplex 7050', 'Computadora', 'PRESUPUESTOS', 'Activo', '127.0.0.1', 'luis.apaza@planificacion.gob.bo', '2025-02-21 01:54:20', '2025-02-21 01:59:05'),
(86, 107, 'DELL OPTIPLEX 7050', 'Computadora', 'TRANSPARENCIA', 'Activo', '127.0.0.1', 'dsflores@gmail.com', '2025-03-01 20:35:03', '2025-03-01 20:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_equipo`
--

DROP TABLE IF EXISTS `estado_equipo`;
CREATE TABLE IF NOT EXISTS `estado_equipo` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_equipo` bigint UNSIGNED NOT NULL,
  `id_tickets` bigint UNSIGNED NOT NULL,
  `estado` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ubicacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estado_equipo` (`id_equipo`),
  KEY `fk_tickets_estado_equipo` (`id_tickets`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_equipo`
--

INSERT INTO `estado_equipo` (`id`, `id_equipo`, `id_tickets`, `estado`, `ubicacion`, `created_at`, `updated_at`) VALUES
(1, 6, 38, 'en_mantenimiento', 'Mantenimiento en Exterior', '2024-09-29 08:56:21', '2024-09-29 22:39:16'),
(2, 2, 34, 'en_mantenimiento', 'Mantenimiento en Exterior', '2024-09-29 22:51:09', '2024-09-29 22:51:28'),
(3, 5, 40, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-09-30 00:24:09', '2024-09-30 00:24:09'),
(4, 2, 42, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-09-30 01:06:08', '2024-09-30 01:06:08'),
(5, 4, 43, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-09-30 01:55:19', '2024-09-30 01:55:19'),
(6, 6, 44, 'en_mantenimiento', 'Mantenimiento en Exterior', '2024-09-30 02:02:36', '2024-12-01 05:13:40'),
(7, 2, 45, 'en_mantenimiento', 'Mantenimiento en Exterior', '2024-10-20 14:50:13', '2024-10-20 14:55:24'),
(8, 4, 46, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-10-30 01:44:20', '2024-10-30 01:44:20'),
(9, 6, 47, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-10-30 02:10:46', '2024-10-30 02:10:46'),
(10, 2, 48, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-10-30 02:54:16', '2024-10-30 02:54:16'),
(11, 4, 49, 'en_mantenimiento', 'Mantenimiento en establecimiento', '2024-10-30 03:08:07', '2024-10-30 03:08:29'),
(19, 2, 57, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-11-30 23:05:34', '2024-11-30 23:05:34'),
(20, 4, 58, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-11-30 23:22:24', '2024-11-30 23:22:24'),
(21, 4, 59, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-11-30 23:24:36', '2024-11-30 23:24:36'),
(22, 4, 60, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-11-30 23:28:54', '2024-11-30 23:28:54'),
(23, 2, 61, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-11-30 23:31:09', '2024-11-30 23:31:09'),
(24, 2, 62, 'arreglado', 'Mantenimiento en establecimiento', '2024-11-30 23:37:18', '2025-02-04 03:07:58'),
(25, 2, 63, 'en_mantenimiento', 'Mantenimiento en establecimiento', '2024-12-18 00:37:45', '2024-12-18 00:38:11'),
(26, 2, 64, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-12-23 01:46:19', '2024-12-23 01:46:19'),
(27, 4, 65, 'en mantenimiento', 'Mantenimiento en establecimiento', '2024-12-23 01:48:29', '2024-12-23 01:48:29'),
(28, 2, 21, 'en_mantenimiento', 'Mantenimiento en establecimiento', '2025-02-04 03:17:31', '2025-02-04 03:17:40'),
(29, 2, 66, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-09 03:45:47', '2025-02-09 03:45:47'),
(30, 9, 67, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-09 03:51:43', '2025-02-09 03:51:43'),
(31, 8, 68, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-09 03:53:23', '2025-02-09 03:53:23'),
(32, 24, 69, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 02:15:15', '2025-02-11 02:15:15'),
(33, 29, 70, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 02:19:46', '2025-02-11 02:19:46'),
(34, 28, 71, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 02:21:49', '2025-02-11 02:21:49'),
(35, 33, 72, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 02:24:45', '2025-02-11 02:24:45'),
(36, 9, 73, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:17:48', '2025-02-11 23:17:48'),
(37, 15, 74, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:19:51', '2025-02-11 23:19:51'),
(38, 33, 75, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:23:06', '2025-02-11 23:23:06'),
(39, 18, 76, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:24:51', '2025-02-11 23:24:51'),
(40, 27, 77, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:27:18', '2025-02-11 23:27:18'),
(41, 84, 78, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:29:46', '2025-02-11 23:29:46'),
(42, 45, 79, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-11 23:31:48', '2025-02-21 02:27:11'),
(43, 79, 80, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-11 23:34:05', '2025-02-21 02:16:52'),
(44, 82, 81, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-11 23:35:50', '2025-02-11 23:35:50'),
(45, 77, 82, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-12 00:02:15', '2025-02-21 02:49:13'),
(46, 72, 83, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-12 00:06:16', '2025-02-21 02:15:27'),
(47, 68, 84, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-12 00:09:43', '2025-02-21 02:11:55'),
(48, 64, 85, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-12 00:11:58', '2025-02-17 21:06:47'),
(49, 64, 86, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-17 21:10:24', '2025-02-17 21:12:46'),
(50, 64, 87, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-21 01:44:52', '2025-02-21 01:45:49'),
(51, 85, 88, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-21 01:56:47', '2025-02-21 01:59:05'),
(52, 20, 6, 'arreglado', 'Mantenimiento en establecimiento', '2025-02-21 01:58:19', '2025-02-21 01:58:41'),
(53, 21, 11, 'en mantenimiento', 'Mantenimiento en establecimiento', '2025-02-21 02:32:43', '2025-02-21 02:32:43'),
(54, 86, 89, 'arreglado', 'Mantenimiento en establecimiento', '2025-03-01 20:38:41', '2025-03-01 20:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `labels`
--

INSERT INTO `labels` (`id`, `name`, `slug`, `is_visible`, `created_at`, `updated_at`) VALUES
(1, 'problema', 'problema', 1, '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(2, 'pregunta', 'pregunta', 1, '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(3, 'mejora', 'mejora', 1, '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(4, 'sugerencia', 'sugerencia', 1, '2024-05-08 06:34:24', '2024-05-08 06:34:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label_ticket`
--

DROP TABLE IF EXISTS `label_ticket`;
CREATE TABLE IF NOT EXISTS `label_ticket` (
  `label_id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `label_ticket`
--

INSERT INTO `label_ticket` (`label_id`, `ticket_id`) VALUES
(3, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(3, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(3, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(2, 14),
(1, 21),
(1, 22),
(1, 24),
(1, 27),
(1, 28),
(1, 29),
(2, 29),
(2, 30),
(3, 30),
(1, 31),
(2, 31),
(2, 32),
(1, 33),
(1, 34),
(2, 34),
(1, 35),
(3, 35),
(1, 36),
(1, 37),
(2, 37),
(1, 38),
(2, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(2, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(2, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(3, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `media_uuid_unique` (`uuid`) USING BTREE,
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE,
  KEY `media_order_column_index` (`order_column`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `ticket_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 16, 'como realizaste la instalacion del OCS inventory', '2024-06-22 04:02:20', '2024-06-22 04:02:20'),
(2, 1, 16, 'como realizaste la instalacion del OCS inventory', '2024-06-22 04:02:23', '2024-06-22 04:02:23'),
(3, 1, 16, 'se realizo la instalacion con la la configuracion de bajando el agente de la pagina de OCS inventory y colocar el  servidor del OCS ocs.planificacion.gob.boy se coloca el nombre del usuario', '2024-06-22 04:06:24', '2024-06-22 04:06:24'),
(4, 19, 15, 'como soluciono el problema de que los telefonos se cuelgan?', '2024-06-22 04:25:37', '2024-06-22 04:25:37'),
(5, 1, 15, 'Se configuro los telefono en DHCP y ademas antes de colocarlos en DHCP se reinicio de fabrica', '2024-06-22 04:26:47', '2024-06-22 04:26:47'),
(6, 19, 15, 'gracias', '2024-06-22 04:41:09', '2024-06-22 04:41:09'),
(7, 1, 17, 'se debe probar con otro cable o sino probar si el corat pico esta bien', '2024-07-17 06:04:20', '2024-07-17 06:04:20'),
(8, 1, 2, 'por favor indique como solucionar problema de telefono', '2024-07-29 05:18:49', '2024-07-29 05:18:49'),
(9, 1, 19, 'como puedo resolver ese problaema', '2024-08-06 04:40:28', '2024-08-06 04:40:28'),
(10, 1, 14, 'arreglar', '2024-09-12 01:46:40', '2024-09-12 01:46:40'),
(11, 1, 28, '<p>vfvdfvdfs</p>', '2024-09-29 06:33:20', '2024-09-29 06:33:20'),
(12, 1, 29, '<p>sadaszxczx</p>', '2024-09-29 06:37:27', '2024-09-29 06:37:27'),
(13, 1, 30, '<p>csdcasac</p>', '2024-09-29 06:48:18', '2024-09-29 06:48:18'),
(14, 1, 31, '<p>sadasvfvxczv</p>', '2024-09-29 06:50:04', '2024-09-29 06:50:04'),
(15, 1, 32, '<p>reparalo</p>', '2024-09-29 07:00:27', '2024-09-29 07:00:27'),
(16, 1, 33, '<p>asdasd</p>', '2024-09-29 07:45:56', '2024-09-29 07:45:56'),
(17, 1, 34, '<p>bien hecho</p>', '2024-09-29 07:49:40', '2024-09-29 07:49:40'),
(18, 1, 35, '<p>en proceso</p>', '2024-09-29 07:51:41', '2024-09-29 07:51:41'),
(19, 1, 36, '<p>esta en proceso</p>', '2024-09-29 07:54:13', '2024-09-29 07:54:13'),
(20, 1, 37, '<p>llenado</p>', '2024-09-29 08:21:27', '2024-09-29 08:21:27'),
(21, 1, 38, '<p>reparado</p>', '2024-09-29 08:56:28', '2024-09-29 08:56:28'),
(22, 2, 40, '<p>arreglalo</p>', '2024-09-30 00:24:26', '2024-09-30 00:24:26'),
(23, 2, 42, '<p>generado</p>', '2024-09-30 01:06:17', '2024-09-30 01:06:17'),
(24, 103, 43, '<p>por favor</p>', '2024-09-30 01:55:25', '2024-09-30 01:55:25'),
(25, 102, 44, '<p>arreglar</p>', '2024-09-30 02:02:42', '2024-09-30 02:02:42'),
(26, 1, 45, '<p>sdgfdg</p>', '2024-10-20 14:53:29', '2024-10-20 14:53:29'),
(27, 103, 46, '<p>bienvenido</p>', '2024-10-30 01:44:30', '2024-10-30 01:44:30'),
(28, 103, 46, '<p>bienvenido</p>', '2024-10-30 01:51:07', '2024-10-30 01:51:07'),
(29, 103, 46, '<p>bienvenido</p>', '2024-10-30 02:05:30', '2024-10-30 02:05:30'),
(30, 103, 46, '<p>como tas</p><p>&nbsp;</p>', '2024-10-30 02:05:49', '2024-10-30 02:05:49'),
(31, 103, 46, '<p>como tas</p><p>&nbsp;</p>', '2024-10-30 02:07:06', '2024-10-30 02:07:06'),
(32, 1, 48, '<p>arreglo</p>', '2024-10-30 02:54:25', '2024-10-30 02:54:25'),
(33, 1, 49, '<p>por favor arreglalo</p><p>&nbsp;</p>', '2024-10-30 03:08:16', '2024-10-30 03:08:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_19_181852_create_tickets_table', 1),
(6, '2022_10_19_181853_create_messages_table', 1),
(7, '2022_10_19_181854_create_categories_table', 1),
(8, '2022_10_19_181855_create_labels_table', 1),
(9, '2022_10_19_181856_create_category_ticket_table', 1),
(10, '2022_10_19_181857_create_label_ticket_table', 1),
(11, '2022_11_05_121601_add_assigned_to_column_into_tickets_table', 1),
(12, '2022_11_07_114457_create_activity_log_table', 1),
(13, '2022_11_07_114458_add_event_column_to_activity_log_table', 1),
(14, '2022_11_07_114459_add_batch_uuid_column_to_activity_log_table', 1),
(15, '2022_11_07_130044_create_media_table', 1),
(16, '2022_11_11_105316_create_permission_tables', 1),
(17, '2024_04_21_053413_agregar_campos_ticket', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
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
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(3, 'App\\Models\\User', 34),
(3, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 47),
(3, 'App\\Models\\User', 48),
(3, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 50),
(3, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 54),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 66),
(3, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 69),
(3, 'App\\Models\\User', 70),
(3, 'App\\Models\\User', 71),
(3, 'App\\Models\\User', 72),
(3, 'App\\Models\\User', 73),
(3, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 76),
(3, 'App\\Models\\User', 77),
(3, 'App\\Models\\User', 78),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 80),
(3, 'App\\Models\\User', 81),
(3, 'App\\Models\\User', 82),
(3, 'App\\Models\\User', 83),
(3, 'App\\Models\\User', 84),
(3, 'App\\Models\\User', 85),
(3, 'App\\Models\\User', 86),
(3, 'App\\Models\\User', 87),
(3, 'App\\Models\\User', 88),
(3, 'App\\Models\\User', 89),
(3, 'App\\Models\\User', 90),
(3, 'App\\Models\\User', 91),
(3, 'App\\Models\\User', 92),
(3, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 94),
(3, 'App\\Models\\User', 95),
(3, 'App\\Models\\User', 96),
(3, 'App\\Models\\User', 97),
(3, 'App\\Models\\User', 98),
(3, 'App\\Models\\User', 99),
(3, 'App\\Models\\User', 100),
(2, 'App\\Models\\User', 102),
(3, 'App\\Models\\User', 103),
(1, 'App\\Models\\User', 104),
(2, 'App\\Models\\User', 105),
(3, 'App\\Models\\User', 106),
(3, 'App\\Models\\User', 107);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('kevinmigu0000@yahoo.com', '$2y$10$ipHwEs6nHg.9CyXgDiauY.DbaG7HzUJEsF5KOfcpqTAxu.ctIKBZe', '2024-09-30 00:19:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_especialidad`
--

DROP TABLE IF EXISTS `personal_especialidad`;
CREATE TABLE IF NOT EXISTS `personal_especialidad` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_especialidades` bigint UNSIGNED NOT NULL,
  `id_users` bigint UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PersonaEspecialidad_Especialidad` (`id_especialidades`),
  KEY `fk_PersonaEspecialidad_Users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal_especialidad`
--

INSERT INTO `personal_especialidad` (`id`, `id_especialidades`, `id_users`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(3, 6, 20, '2023-01-02', NULL, '2024-09-28 16:01:06', '2024-09-28 16:01:06'),
(4, 7, 21, '2024-09-28', NULL, '2024-09-28 16:02:15', '2024-09-28 16:02:15'),
(7, 8, 16, '2024-09-28', NULL, '2024-09-28 16:22:05', '2024-09-28 16:22:05'),
(8, 9, 19, '2024-09-28', NULL, '2024-09-28 16:22:21', '2024-09-28 16:22:21'),
(9, 8, 18, '2024-09-28', NULL, '2024-09-28 16:22:38', '2024-09-28 16:22:38'),
(10, 8, 17, '2024-09-28', NULL, '2024-09-28 16:26:02', '2024-09-28 16:26:02'),
(11, 9, 15, '2025-02-10', NULL, '2024-09-28 16:26:18', '2025-02-11 02:05:07'),
(12, 7, 22, '2024-09-28', NULL, '2024-09-28 16:26:35', '2024-09-28 16:26:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(2, 'agent', 'web', '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(3, 'user', 'web', '2024-05-06 04:46:47', '2024-05-06 04:46:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablaticketvaloracion`
--

DROP TABLE IF EXISTS `tablaticketvaloracion`;
CREATE TABLE IF NOT EXISTS `tablaticketvaloracion` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `NivelAtencion` tinyint(1) NOT NULL,
  `IdUsuario` bigint UNSIGNED NOT NULL,
  `idTecnico` bigint UNSIGNED NOT NULL,
  `idTicket` bigint UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_IdUsuario` (`IdUsuario`),
  KEY `fk_idTecnico` (`idTecnico`),
  KEY `fk_idTicket` (`idTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tablaticketvaloracion`
--

INSERT INTO `tablaticketvaloracion` (`id`, `NivelAtencion`, `IdUsuario`, `idTecnico`, `idTicket`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 3, 103, 22, 62, NULL, '2025-02-04 03:51:24', '2025-02-04 03:51:24'),
(2, 3, 80, 21, 85, NULL, '2025-02-17 21:07:22', '2025-02-17 21:07:22'),
(3, 2, 80, 22, 86, NULL, '2025-02-17 21:17:09', '2025-02-17 21:17:09'),
(4, 3, 80, 21, 87, NULL, '2025-02-21 01:46:30', '2025-02-21 01:46:30'),
(5, 2, 106, 17, 88, NULL, '2025-02-21 01:59:48', '2025-02-21 01:59:48'),
(6, 3, 27, 17, 6, NULL, '2025-02-21 02:00:32', '2025-02-21 02:00:32'),
(7, 2, 84, 21, 84, NULL, '2025-02-21 02:12:26', '2025-02-21 02:12:26'),
(8, 2, 88, 22, 83, NULL, '2025-02-21 02:15:43', '2025-02-21 02:15:43'),
(9, 2, 95, 18, 80, NULL, '2025-02-21 02:22:36', '2025-02-21 02:22:36'),
(10, 2, 59, 16, 79, NULL, '2025-02-21 02:27:53', '2025-02-21 02:27:53'),
(11, 2, 31, 20, 11, NULL, '2025-02-21 02:33:25', '2025-02-21 02:33:25'),
(12, 2, 93, 21, 82, NULL, '2025-02-21 02:51:21', '2025-02-21 02:51:21'),
(13, 3, 107, 21, 89, NULL, '2025-03-01 20:41:02', '2025-03-01 20:41:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
CREATE TABLE IF NOT EXISTS `tecnico` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caracteristica` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `especialidad`, `caracteristica`, `created_at`, `updated_at`) VALUES
(6, 'Sistemas del ministerio', 'Control general del sistema', '2024-09-28 15:43:54', '2024-09-28 15:43:54'),
(7, 'soporte técnico', 'Arreglo de computadoras y equipos en general', '2024-09-28 15:44:18', '2024-09-28 15:44:36'),
(8, 'software', 'mantenimiento de los programas y el sistema operativo', '2024-09-28 15:57:52', '2024-09-28 15:57:52'),
(9, 'Redes y soporte técnico', 'Arreglo de la conexión lan y wan en general', '2024-09-28 15:58:28', '2024-09-28 15:58:28'),
(10, 'redes y servidores', 'arreglo de los servidores', '2024-09-28 15:59:59', '2024-09-28 15:59:59'),
(11, 'General', 'Mayormente para Consultas', '2025-01-29 04:25:47', '2025-01-29 04:25:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'bajo',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'abierto',
  `is_resolved` tinyint(1) NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `departamento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fecha_soporte` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `uuid`, `user_id`, `title`, `message`, `priority`, `status`, `is_resolved`, `is_locked`, `assigned_to`, `departamento`, `fecha_soporte`, `created_at`, `updated_at`) VALUES
(1, NULL, 15, 'mantenimiento de servidores', '<p>Se necesita configurar los servidores del MPD</p>', 'alto', 'cerrado', 0, 0, 19, 'CONTABILIDAD', '2024-01-09 01:15:00', '2024-05-09 05:10:23', '2024-06-22 04:53:02'),
(2, NULL, 23, 'revision de telefono', 'Se necesita la revision de mi telefono porque no recibe ni tampoco recibe llamadas', 'normal', 'abierto', 0, 0, 21, 'ADMINISTRACION', '2024-01-09 01:15:00', '2024-05-09 05:14:09', '2024-05-09 05:16:18'),
(3, NULL, 24, 'instalacion de complementos de excel', 'necesite que se instale complementos para excel', 'bajo', 'abierto', 0, 0, 20, 'CONTABILIDAD', '2024-01-10 01:19:00', '2024-05-09 05:18:57', '2024-05-09 05:19:42'),
(4, NULL, 25, 'instalacion de impresora', 'Se requiere que se instale la impresora', 'normal', 'abierto', 0, 0, 21, 'AUDITORIA', '2024-01-10 01:24:00', '2024-05-09 05:23:41', '2024-05-09 05:24:17'),
(5, NULL, 26, 'La impresora no imprime', 'La impresora no funciona cuando mando a imprimir', 'bajo', 'abierto', 0, 0, 16, 'ADMINISTRACION', '2024-01-11 01:27:00', '2024-05-09 05:27:17', '2024-05-09 05:27:57'),
(6, NULL, 27, 'mantenimiento de escaner', '<p>Se necesita realizar mantenimiento de escaner</p>', 'normal', 'cerrado', 0, 0, 17, 'AUDITORIA', '2024-01-11 01:31:00', '2024-05-09 05:30:47', '2025-02-21 01:58:41'),
(7, NULL, 28, 'Impresora mancha la hoja', 'la impresion sale con manchas en las hojas', 'normal', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-01-11 01:36:00', '2024-05-09 05:35:37', '2024-05-09 05:36:16'),
(8, NULL, 29, 'instalacion de zoom', 'Se necesita instalar zoom en mi equipo de computacion', 'bajo', 'abierto', 0, 0, 20, 'CONTABILIDAD', '2024-01-12 01:41:00', '2024-05-09 05:40:41', '2024-05-09 05:41:35'),
(9, NULL, 30, 'equipo lento', 'mi equipo de computacion esta demasiado lento', 'bajo', 'abierto', 0, 0, 18, 'CONTABILIDAD', '2024-01-12 01:45:00', '2024-05-09 05:44:54', '2024-05-09 05:45:37'),
(10, NULL, 30, 'No funciona la impresora', 'Se requiere que se me arregle la impresora', 'normal', 'abierto', 0, 0, 15, 'ADMINISTRACION', '2024-01-13 01:48:00', '2024-05-09 05:47:32', '2024-05-09 05:48:17'),
(11, NULL, 31, 'instalacion de impresora', '<p>Se necesita realizar la instalacion de impresora</p>', 'normal', 'cerrado', 0, 0, 20, 'AUDITORIA', '2024-01-13 00:47:00', '2024-05-09 05:54:49', '2025-02-21 02:32:43'),
(12, NULL, 93, 'impresora', 'falla de mandado de impresion', 'normal', 'abierto', 0, 0, 21, 'CONTABILIDAD', '2024-05-02 13:16:00', '2024-05-13 05:13:23', '2024-05-19 17:17:03'),
(13, NULL, 22, 'instalación de software', '<p>necesito instalar office por favor</p>', 'normal', 'cerrado', 0, 0, 19, 'CONTABILIDAD', '2024-05-20 22:50:00', '2024-05-21 02:49:13', '2024-09-11 23:58:39'),
(14, NULL, 1, 'instalacion de argis', '<p>instalación de programa argis para diseño de mapas y actualizar a la ultima versión</p>', 'normal', 'cerrado', 0, 0, 19, 'SISTEMAS', '2024-06-21 20:00:00', '2024-06-20 05:29:36', '2024-09-12 23:24:39'),
(16, NULL, 22, 'instalacion de OCS inventory', '<p>Realiza la instalacion de software OCS inventory para realizacion de inventario de los equipos de mi unidad</p>', 'normal', 'abierto', 0, 0, 16, 'AUDITORIA', '2024-06-22 00:06:00', '2024-06-20 05:36:35', '2024-06-22 05:06:45'),
(17, NULL, 1, 'no enciende mi equipo', '<p>no enciende mi equipo,puede que sea un problemas electrico</p>', 'normal', 'abierto', 0, 0, 22, 'TRANSPARENCIA', NULL, '2024-07-17 06:02:59', '2024-07-17 06:02:59'),
(18, NULL, 1, 'toner', '<p>chorrea el polvo de toner de la impresora</p>', 'normal', 'abierto', 0, 0, 20, 'JURIDICA', NULL, '2024-07-17 06:35:46', '2024-07-17 06:35:46'),
(19, NULL, 22, 'problema de disco duro', '<p>probla de disco duro</p>', 'normal', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-08-05 21:00:00', '2024-08-06 04:37:25', '2024-09-11 00:29:38'),
(20, NULL, 1, 'Mantenimiento de Hardware', '<p>Se encontró exceso de polvo en las maquinas&nbsp;</p>', 'alto', 'abierto', 0, 0, 20, 'ADMINISTRACION', NULL, '2024-09-11 23:00:09', '2024-09-11 23:00:09'),
(21, NULL, 103, 'Error en la chimenea', '<p>no se prende utilicen magia navideña</p>', 'bajo', 'cerrado', 0, 0, 15, 'UNIDAD DE PROGRAMACION DE LA INVERSION', NULL, '2024-09-13 02:01:54', '2025-02-04 03:17:31'),
(22, NULL, 1, 'dcfsfs', '<p>fdsdfsdf</p>', 'alto', 'abierto', 0, 0, 16, NULL, NULL, '2024-09-28 18:22:24', '2024-09-28 18:22:24'),
(27, NULL, 1, 'vxcfds', '<p>xcfgfsfgsd</p>', 'normal', 'abierto', 0, 0, NULL, NULL, NULL, '2024-09-29 06:32:13', '2024-09-29 06:32:13'),
(28, NULL, 1, 'vxcfds', '<p>asasfsdvsd</p>', 'normal', 'abierto', 0, 0, NULL, NULL, NULL, '2024-09-29 06:33:00', '2024-09-29 06:33:00'),
(29, NULL, 1, 'fncxnfd', '<p>tgsdfgfvxbvcxb</p>', 'normal', 'abierto', 0, 0, NULL, NULL, NULL, '2024-09-29 06:37:19', '2024-09-29 06:37:19'),
(30, NULL, 1, 'dsgsdgf', '<p>hjbvjhsdbv</p>', 'normal', 'abierto', 0, 0, NULL, NULL, '2024-09-29 06:48:12', '2024-09-29 06:48:12', '2024-09-29 06:48:12'),
(32, NULL, 1, 'fasdfsaf', '<p>dfssdfvfv</p>', 'alto', 'abierto', 0, 0, NULL, 'CONTABILIDAD', '2024-09-29 07:00:19', '2024-09-29 07:00:19', '2024-09-29 07:00:19'),
(33, NULL, 1, 'bhshdjcsdc', '<p>sasdaszxc</p>', 'alto', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-09-29 07:45:52', '2024-09-29 07:45:52', '2024-09-29 07:45:52'),
(34, NULL, 1, 'JMVKGBNF', '<p>nghnudkfnkf</p>', 'normal', 'abierto', 0, 0, 15, 'SISTEMAS', '2024-09-29 07:49:30', '2024-09-29 07:49:30', '2024-09-29 07:49:30'),
(35, NULL, 1, 'fghfgnbn', '<p>buena</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-09-29 07:50:35', '2024-09-29 07:50:35', '2024-09-29 07:51:52'),
(36, NULL, 1, 'arreglamelo', '<p>por favor arreglamelo</p>', 'normal', 'abierto', 0, 0, 22, 'PRESUPUESTOS', '2024-09-29 07:54:03', '2024-09-29 07:54:03', '2024-09-29 07:54:03'),
(37, NULL, 1, 'tres', '<p>cuatro</p>', 'normal', 'cerrado', 0, 0, 15, 'PRESUPUESTOS', '2024-09-29 08:21:12', '2024-09-29 08:21:12', '2024-09-29 08:27:18'),
(38, NULL, 1, 'reparación de mantenimiento', '<p>reparar la computadora</p>', 'normal', 'abierto', 0, 0, 15, 'PRESUPUESTOS', '2024-09-29 08:56:21', '2024-09-29 08:56:21', '2024-09-29 21:35:40'),
(39, NULL, 2, 'Arreglo de Monitores', NULL, 'normal', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-09-30 00:21:58', '2024-09-30 00:21:58', '2024-09-30 00:21:58'),
(40, NULL, 2, 'Arreglo de Monitores', NULL, 'normal', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-09-30 00:24:09', '2024-09-30 00:24:09', '2024-09-30 00:24:09'),
(41, NULL, 2, 'Maquina', '<p>algo</p>', 'bajo', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-09-30 00:59:21', '2024-09-30 00:59:21', '2024-09-30 00:59:21'),
(42, NULL, 2, 'Maquina', '<p>algo</p>', 'bajo', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-09-30 01:06:08', '2024-09-30 01:06:08', '2024-09-30 01:06:08'),
(43, NULL, 103, 'Arreglo de maquina', '<p>reparar maquina</p>', 'bajo', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-09-30 01:55:19', '2024-09-30 01:55:19', '2024-09-30 01:55:19'),
(44, NULL, 102, 'Arreglo de Maquinas', '<p>maquinas</p>', 'normal', 'abierto', 0, 0, 22, 'PRESUPUESTOS', '2024-09-30 02:02:36', '2024-09-30 02:02:36', '2024-09-30 02:29:35'),
(45, NULL, 1, 'compoutadora', '<p>dxfdsfsdf</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-10-20 14:50:13', '2024-10-20 14:50:13', '2024-10-20 14:50:13'),
(46, NULL, 103, 'algo', '<p>algo</p>', 'normal', 'abierto', 0, 0, 21, 'CONTABILIDAD', '2024-10-30 01:44:19', '2024-10-30 01:44:19', '2024-10-30 01:44:19'),
(47, NULL, 103, 'error en la compu', '<p>desinstalación</p>', 'normal', 'abierto', 0, 0, 22, 'PRESUPUESTOS', '2024-10-30 02:10:46', '2024-10-30 02:10:46', '2024-10-30 02:10:46'),
(48, NULL, 1, 'panel de conrol', '<p>mensaje</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-10-30 02:54:15', '2024-10-30 02:54:15', '2024-10-30 02:54:15'),
(49, NULL, 1, 'Actualización de los programas neutros', '<p>actualízalo</p>', 'bajo', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-10-30 03:08:07', '2024-10-30 03:08:07', '2024-10-30 03:08:29'),
(57, NULL, 103, 'Creación de algo', '<p>algo</p>', 'normal', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-11-30 23:05:34', '2024-11-30 23:05:34', '2024-11-30 23:05:34'),
(58, NULL, 103, 'arreglo de la maquina', '<p>arreglar</p>', 'bajo', 'abierto', 0, 0, 21, 'CONTABILIDAD', '2024-11-30 23:22:24', '2024-11-30 23:22:24', '2024-11-30 23:22:24'),
(59, NULL, 103, 'arreglo de la maquina', '<p>arreglar</p>', 'bajo', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-11-30 23:24:36', '2024-11-30 23:24:36', '2024-11-30 23:24:36'),
(60, NULL, 103, 'arreglo de la maquina', '<p>errrjehje</p>', 'bajo', 'abierto', 0, 0, 22, 'CONTABILIDAD', '2024-11-30 23:28:54', '2024-11-30 23:28:54', '2024-11-30 23:28:54'),
(61, NULL, 103, 'error de aplciación', '<p>error</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-11-30 23:31:09', '2024-11-30 23:31:09', '2024-11-30 23:31:09'),
(62, NULL, 103, 'Error en la creación', '<p>cvhbdfjhyvbfsdjhv</p>', 'bajo', 'cerrado', 0, 0, 22, 'SISTEMAS', '2024-11-30 23:37:18', '2024-11-30 23:37:18', '2025-02-04 03:07:57'),
(63, NULL, 102, 'perritos', '<p>dsfsfsdfsdf</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2024-12-18 00:37:44', '2024-12-18 00:37:44', '2024-12-18 00:38:11'),
(64, NULL, 1, 'dfvhbdfhjv', '<p>mvbsdjhvb&nbsp;</p>', 'normal', 'abierto', 0, 0, 22, 'SISTEMAS', '2024-12-23 01:46:18', '2024-12-23 01:46:18', '2024-12-23 01:46:18'),
(65, NULL, 1, 'jiipy', '<p>saadasd</p>', 'alto', 'abierto', 0, 0, 21, 'CONTABILIDAD', '2024-12-23 01:48:29', '2024-12-23 01:48:29', '2024-12-23 01:48:29'),
(66, NULL, 1, 'Arreglo de las seriales de Word', '<p>Adicionar las nuevas seriales</p>', 'bajo', 'abierto', 0, 0, 21, 'SISTEMAS', '2025-02-09 03:45:46', '2025-02-09 03:45:46', '2025-02-09 03:45:46'),
(67, NULL, 1, 'Scanner erroneo', '<p>La tapa del scanner se descompuso</p>', 'normal', 'abierto', 0, 0, 22, 'ASUNTOS JURIDICOS', '2025-02-09 03:51:43', '2025-02-09 03:51:43', '2025-02-09 03:51:43'),
(68, NULL, 1, 'Tintas de impresora descompuestas', '<p>Arreglar las tintas de la impresora</p>', 'bajo', 'abierto', 0, 0, 22, 'RECURSOS HUMANOS', '2025-02-09 03:53:23', '2025-02-09 03:53:23', '2025-02-09 03:53:23'),
(69, NULL, 38, 'instalacion de complementos de excel', 'Se necesita instalar complementos en excel', 'normal', 'abierto', 0, 0, 18, 'CONTABILIDAD', '2025-02-11 02:15:15', '2025-02-11 02:15:15', '2025-02-11 02:15:15'),
(70, NULL, 43, 'instalacion de impresora', 'Se necesita instalar la impresora para el area de Administracion', 'normal', 'abierto', 0, 0, 21, 'ADMINISTRACION', '2025-02-11 02:19:46', '2025-02-11 02:19:46', '2025-02-11 02:19:46'),
(71, NULL, 42, 'la impresora no imprime', 'la impresora no imprime al mandar una hoja', 'bajo', 'abierto', 0, 0, 21, 'ADMINISTRACION', '2025-02-11 02:21:49', '2025-02-11 02:21:49', '2025-02-11 02:21:49'),
(72, NULL, 47, 'mantenimiento de escaner', 'Se necesita realizar el mantenimiento adecuado del escaner', 'normal', 'abierto', 0, 0, 21, 'ADQUISICIONES', '2025-02-11 02:24:45', '2025-02-11 02:24:45', '2025-02-11 02:24:45'),
(73, NULL, 24, 'instalacion de zoom', 'Se necesita instalar zoom en mi equipo de computacion para realizar reuniones', 'bajo', 'abierto', 0, 0, 16, 'ASUNTOS JURIDICOS', '2025-02-11 23:17:48', '2025-02-11 23:17:48', '2025-02-11 23:17:48'),
(74, NULL, 29, 'equipo demasiado lento', 'mi equipo de computacion esta demasiado lento', 'normal', 'abierto', 0, 0, 21, 'ASUNTOS JURIDICOS', '2025-02-11 23:19:50', '2025-02-11 23:19:50', '2025-02-11 23:19:50'),
(75, NULL, 47, 'no funciona la impresora', 'No funciona la impresora se requiere atencion', 'bajo', 'abierto', 0, 0, 22, 'ADQUISICIONES', '2025-02-11 23:23:06', '2025-02-11 23:23:06', '2025-02-11 23:23:06'),
(76, NULL, 32, 'se necesita instalar la impresora', 'instalacion de impresora para el area de juridica', 'normal', 'abierto', 0, 0, 21, 'ASUNTOS JURIDICOS', '2025-02-11 23:24:51', '2025-02-11 23:24:51', '2025-02-11 23:24:51'),
(77, NULL, 41, 'impresora falla cuando mando a imprimir', 'mi equipo no reconoce la impresora', 'normal', 'abierto', 0, 0, 21, 'TESORERIA', '2025-02-11 23:27:18', '2025-02-11 23:27:18', '2025-02-11 23:27:18'),
(78, NULL, 105, 'instalacion y activacion de office', 'neceisto la instalacion de office y tambien la activacion', 'bajo', 'abierto', 0, 0, 18, 'UNIDAD DE NEGOCIACION DEL FINANCIAMIENTO', '2025-02-11 23:29:46', '2025-02-11 23:29:46', '2025-02-11 23:29:46'),
(79, NULL, 59, 'intaacion de argis', '<p>Se neceista instalar Argis para realizacion de datos con mapas</p>', 'normal', 'cerrado', 0, 0, 16, 'DIRECCION GENERAL DE PLANIFICACION TERRITORIAL', '2025-02-11 23:31:47', '2025-02-11 23:31:47', '2025-02-21 02:27:11'),
(80, NULL, 95, 'instalacion de OS inventory', '<p>Se debe instalar OCS inventory en los equipos de computacion</p>', 'normal', 'cerrado', 0, 0, 18, 'UNIDAD_DE_PREINVERSION', '2025-02-11 23:34:05', '2025-02-11 23:34:05', '2025-02-21 02:16:52'),
(81, NULL, 98, 'mi equipo de computacion no enciende', 'mi equipo no enciende me aparece una pantalla negra', 'normal', 'abierto', 0, 0, 22, 'PROGRAMA DE INTERVENCIONES URBANAS', '2025-02-11 23:35:49', '2025-02-11 23:35:49', '2025-02-11 23:35:49'),
(82, NULL, 93, 'chorrea toner en mi impresora', '<p>chorrea el toner en la impresora y mancha la hoja</p>', 'normal', 'cerrado', 0, 0, 21, 'DIRECCIÓN GENERAL DE TECNOLOGÍA E INNOVACIÓN', '2025-02-12 00:02:14', '2025-02-12 00:02:14', '2025-02-21 02:49:13'),
(83, NULL, 88, 'problemas con mi disco duro', '<p>mi equipo esta con problemas, se cuelga y no responde ni el teclado ni el mous</p>', 'normal', 'cerrado', 0, 0, 22, 'UNIDAD DE GESTION DE LA INVERSION SECTORIAL', '2025-02-12 00:06:16', '2025-02-12 00:06:16', '2025-02-21 02:15:27'),
(84, NULL, 84, 'atasco de papel en la impresora', '<p>se atasco la hoja en la impresora de trabajo</p>', 'normal', 'cerrado', 0, 0, 21, 'DIRECCION GENERAL DE GESTION DE LA INVERSION PUBLICA', '2025-02-12 00:09:43', '2025-02-12 00:09:43', '2025-02-21 02:11:55'),
(85, NULL, 80, 'pantalla azul', '<p>me aparecio la pantalla azul en mi equipo de computacion mientras realizaba mis actividades</p>', 'normal', 'cerrado', 0, 0, 21, 'UNIDAD DE ADMINISTRACION DE PROGRAMAS', '2025-02-12 00:11:58', '2025-02-12 00:11:58', '2025-02-17 21:06:47'),
(86, NULL, 80, 'equipo no enciende', '<p>mi equipo de computación no enciende</p>', 'normal', 'cerrado', 0, 0, 22, 'UNIDAD DE ADMINISTRACION DE PROGRAMAS', '2025-02-17 21:10:23', '2025-02-17 21:10:23', '2025-02-17 21:13:15'),
(87, NULL, 80, 'atasco de papel', '<p>Se atasco el papel en la bandeja de jalado de hoja</p>', 'normal', 'cerrado', 0, 0, 21, 'UNIDAD DE ADMINISTRACION DE PROGRAMAS', '2025-02-21 01:44:51', '2025-02-21 01:44:51', '2025-02-21 01:45:49'),
(88, NULL, 106, 'agregar para crear hoja de ruta', '<p>agregacion de modulo de creacion &nbsp;de hojas de ruta</p>', 'normal', 'cerrado', 0, 0, 17, 'PRESUPUESTOS', '2025-02-21 01:56:47', '2025-02-21 01:56:47', '2025-02-21 01:59:05'),
(89, NULL, 107, 'no enciende el equipo', '<p>no enciende el equipo</p>', 'normal', 'cerrado', 0, 0, 21, 'TRANSPARENCIA', '2025-03-01 20:38:40', '2025-03-01 20:38:40', '2025-03-01 20:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@admin.com', '2024-05-06 04:46:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1bcV7Lmvr3ya7g4QDiANr35iNi68gYi6H9iKhw9h4AOSnaaZYezneXF9uagV', '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(2, 'Agent User', 'agent@agent.com', '2024-05-06 04:46:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rxoirNcegAsTXJJHK81vJ3vV0EMkc24Fww4wqbLay3ysTWTmdbPRUzlReu8I', '2024-05-06 04:46:47', '2024-05-06 04:46:47'),
(3, 'Laurence Hammes', 'grimes.gerald@example.com', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3VXVfZdQdd', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(4, 'Dr. Uriel Bartell', 'regan08@example.com', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'a9KdG1r8Hj', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(5, 'Everardo Morissette', 'javier.langworth@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bhzjQaGZLh', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(6, 'Nona O\'Kon', 'collins.eva@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4MDlqxRW2i', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(7, 'Prof. Annetta Swaniawski', 'porter15@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'apEccJdrRc', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(8, 'Leatha Paucek', 'khilpert@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8ggNVlOUdQ', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(9, 'Beau Ullrich', 'jazmin.blick@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aq2TqLwYBV', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(10, 'Dion Bailey', 'vstokes@example.com', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MQYF1PuTk3', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(11, 'Fannie Quitzon II', 'edgar05@example.org', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Uln5SSXS1R', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(12, 'Dr. Raoul Harber', 'jasmin.schmidt@example.net', '2024-05-06 04:46:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lspO5BloKq', '2024-05-06 04:46:48', '2024-05-06 04:46:48'),
(15, 'Samuel Puñi Condori', 'samuel.puni@planificacion.gob.bo', NULL, '$2y$10$/yyXl4EUoHZKLaST.qxOdu3CvmKKFozq/q6XliF4p7OPM4iU7DUZ6', NULL, '2024-05-08 04:40:47', '2025-02-21 01:40:05'),
(16, 'karla Ayde Luna', 'karla.luna@planificacion.gob.bo', NULL, '$2y$10$SgD.be4BYMMDut9BO1evJOGF8aJBPWpe7MxMpGjFR8CjUcRePgs.O', NULL, '2024-05-08 04:46:29', '2025-02-21 01:40:20'),
(17, 'Richard Cuela Limachi', 'richard.cuela@planificacion.gob.bo', NULL, '$2y$10$qbIXCcW//fBCHsd5sRIcCeAO7lw99YvV2lkOKRxDCVQC6dyNliGpe', NULL, '2024-05-08 04:48:41', '2025-02-21 01:40:32'),
(18, 'Maria Luisa Palomeque', 'maria.palomeque@planificacion.gob.bo', NULL, '$2y$10$lq7uxMoDvg7wlIlUSTPWNeRQxW/OVPJeZOdRozyQv08RxLRYOYNiC', NULL, '2024-05-08 04:50:52', '2025-02-21 01:40:46'),
(19, 'Marcos Alcon Astete', 'marcos.alcon@planificacion.gob.bo', NULL, '$2y$10$58LWAc.7LqE/JoH83m8hiumOeYGUA5GHzGT87TM9ArNgEyLRzqc7W', NULL, '2024-05-08 04:51:30', '2025-02-21 01:41:02'),
(20, 'Fred Linares Ibañez', 'fred.linares@planificacion.gob.bo', NULL, '$2y$10$P.XyVggdL5CQIVaJRoF3NusFcxqhSuZBbBuZKLldUlxQ7RS9cWoMi', NULL, '2024-05-08 04:52:35', '2025-02-21 02:31:49'),
(21, 'Juan Gabriel Gonzales', 'juan.gonzales@planificacion.gob.bo', NULL, '$2y$10$n1hi092mOvMsgX1kaKIIR.P8zTyYTDLnqAr/Q4iZF09fmlwsEtZ4i', NULL, '2024-05-08 04:53:41', '2025-02-21 01:41:54'),
(22, 'Sergio Velasquez Noriega', 'sergio.velasquez@planificacion.gob.bo', NULL, '$2y$10$AGkBZXAx/O3BUEfOlfGZgu8XrQIGkE69cm1cNfMToWOh6xx2TVmu.', NULL, '2024-05-08 04:54:22', '2025-02-21 01:42:20'),
(23, 'Beatriz Leonor Perez Apaz', 'beatriz.perez@planificacion.gob.bo', NULL, '$2y$10$Awsz9zIvigaGMPiNMPxXD.LLb6iCeK6e5IYZn.3iG2ZIoWFkZmxqe', NULL, '2024-05-08 04:55:54', '2025-02-11 02:10:42'),
(24, 'William Valencia Angardoña', 'william.valencia@planificacion.gob.bo', NULL, '$2y$10$2tht3OvL9qMHKWQoroJdLuHrYmftwDo2.zVjoGXBFCPfhovNOPMMi', NULL, '2024-05-08 04:57:05', '2025-02-11 23:13:15'),
(25, 'Steve Gerson Mendoza', 'steve.mendoza@planificacion.gob.bo', NULL, '$2y$10$wPC6izdiOODNa2Foq2sbP.PBKwQzAVFetYT1FkbxboKq0oS9phDrO', NULL, '2024-05-08 04:58:09', '2024-05-08 05:00:28'),
(26, 'Paola Artega Diaz', 'paola.arteaga@planificacion.go.bo', NULL, '$2y$10$wXS1NO2wRqpJeP.kj//CcOwglYia6kZ637Oyeg3maubkC6uVj30kK', NULL, '2024-05-08 04:59:05', '2024-05-09 05:28:40'),
(27, 'Silvia Soliz iVazeta', 'silvia.soliz@planificacion.gob.bo', NULL, '$2y$10$Cz6uXW7/O5D7cljXZOubs.Weo8A2mGiMssIaTJQfW3Wm6Arv6JAv.', NULL, '2024-05-08 05:00:05', '2024-05-08 05:00:05'),
(28, 'Maria Alejandra Luna Pizarro', 'maria.luna@planificacion.go.bo', NULL, '$2y$10$q2CvM0IsaeluGDJioO4Obe1IMKaXb3xXoSRhDvaTFCwmmwMzkKbQu', NULL, '2024-05-08 05:01:43', '2025-02-11 23:11:53'),
(29, 'Jose Maldonado Jover', 'jose.maldonado@planificacion.gob.bo', NULL, '$2y$10$DurcTJPZrZg8DdN6Ac7YNOFSvku1vunTJpjE9XErrn4D6TqkH5JMC', NULL, '2024-05-08 05:03:49', '2025-02-11 23:18:55'),
(30, 'Cecilia Carmen Guachalla Ferrufino', 'cecilia.guachalla@planificacion.gob.bo', NULL, '$2y$10$TMsC.ob8yl/BBCow3seD6OwY3q9doFyHQZMNyCLJTxQRVxdqbe3oy', NULL, '2024-05-08 05:05:22', '2024-05-08 05:05:22'),
(31, 'Inti Aliaga Herrera', 'inti.aliaga@planificacion.gob.bo', NULL, '$2y$10$r9vqz2RvBUrli7cMQX7UJOaGSeCCP/kQWIqFb3XJr15lH7YNYxJPy', NULL, '2024-05-08 05:06:51', '2024-05-08 05:06:51'),
(32, 'Mario Galvan Soliz', 'mario.galvan@planificacion.gob.bo', NULL, '$2y$10$Q9CjdQelIzgBa4xc.o/KN.JvuztASZu6T8dzBc2oPZMBRDRu/KhaO', NULL, '2024-05-08 05:07:40', '2025-02-11 23:23:40'),
(33, 'Edith Lazo Segurondo', 'edith.lazo@planificacion.gob.bo', NULL, '$2y$10$arhVPUKkE9GPSL81E0OOmOXmWZTI24mR9ryOsER2gnPay9s3fH55G', NULL, '2024-05-08 05:08:43', '2024-05-08 05:08:43'),
(34, 'Alvaro Cuellar Almendras', 'alvaro.cuellar@planificacion.gob.bo', NULL, '$2y$10$PK2mPDRSVtJhUXAefY9aY.Za9jKXqFoAWIgfkOD1COBI38BrjCJiO', NULL, '2024-05-08 05:09:47', '2024-05-08 05:09:47'),
(35, 'Mercedes Burgos Olivera', 'mercedes.burgos@planificacion.gob.bo', NULL, '$2y$10$1cHRyYQdO4hwYfE6SXRU1OrOJ0E7.xOdxHoVXsAySL.TXsbYa0bbq', NULL, '2024-05-08 05:10:22', '2024-05-08 05:10:22'),
(36, 'Otilia Choque Veliz', 'otilia.choque@planificacion.gob.bo', NULL, '$2y$10$iDsZhceurKmoBsY7gjeG9.h1dzxD185WOpTKgkgKHCtLXIAwmX8hu', NULL, '2024-05-08 05:11:14', '2024-05-08 05:11:14'),
(37, 'Marcelo Yampasi Villalobos', 'marcelo.yanpasi@planificacion.gob.bo', NULL, '$2y$10$QnUsAOZXibSY2GvGzfndP.yT28S9uiVggXS5/HCF7njGD72XkAbS2', NULL, '2024-05-08 05:11:58', '2024-05-08 05:11:58'),
(38, 'Willy Calzada Saravia', 'willy.calzada@planificacion.gob.bo', NULL, '$2y$10$6iNTfiNwsQhOBqJXzMGY9.Ivf3iRm7fFbE44ObzsEq66/.lE5jqGO', NULL, '2024-05-08 05:12:54', '2025-02-11 02:13:13'),
(39, 'Silverio Colque Mamani', 'silverio.colque@planificacion.gob.bo', NULL, '$2y$10$vgqX7ZvoZr27NwaxyOFosurdLSV1QBllzbF87Xndh76Fr4UvGOmjG', NULL, '2024-05-08 05:13:28', '2024-05-08 05:13:28'),
(40, 'Patricia Claros Tinta', 'patricia.claros@planificacion.gob.bo', NULL, '$2y$10$7ad07bhjzeEIurHb8zevHeTMrL.VVbVTtYRb30XzgUWhEkWNV0hku', NULL, '2024-05-08 05:14:24', '2024-05-08 05:14:24'),
(41, 'Yesenia Jimenez Paxi', 'yesenia.jimenez@planificacion.gob.bo', NULL, '$2y$10$rGf.XyYgRtVmVnr0aSpnOec2nRv3UoEfIRz9bCVpTLpBqXegZonEa', NULL, '2024-05-08 05:15:06', '2025-02-11 23:25:45'),
(42, 'Paola Salas Melgar', 'paola.salas@planificacion.gob.bo', NULL, '$2y$10$hzFjBPK54VhAyKi2psbGXeX1Q62lG3CwChVTS9h23FtNhaJCV6ADC', NULL, '2024-05-08 05:15:53', '2025-02-11 02:20:23'),
(43, 'Carla Henrich Rengel', 'carla.henrich@planificacion.gob.bo', NULL, '$2y$10$jyszfEDJFCmfK8l2DEXQses18JQ5Y8E/lttyeSg9aRE/VZnd9FvBS', NULL, '2024-05-08 05:16:42', '2025-02-11 02:16:17'),
(44, 'Gustavo Calle Villamil', 'gustavo.calle@planificacion.gob.bo', NULL, '$2y$10$9I0O3bvrKOinEO0ebwELve.kthEa01q83bj699gkm4hACLdk8cywO', NULL, '2024-05-08 05:17:16', '2024-05-08 05:17:16'),
(45, 'Omar Uzquiano Arene', 'omar.uzquiano@planificacion.gob.bo', NULL, '$2y$10$yQwnqvTEgfNDWh8C6xEqSOzgge9Cfk8prMFzkhD2bn9xzsqI/fTvG', NULL, '2024-05-08 05:18:15', '2024-05-08 05:18:15'),
(46, 'Jose Luis Lima de la Barra', 'jose.lima@planificacion.gob.bo', NULL, '$2y$10$KTsNNsI04F/HR/2VqGUvsO.pCgyWMpb50BYT7UvQ2YzuooJSE7xWy', NULL, '2024-05-08 05:19:19', '2024-05-08 05:19:19'),
(47, 'Olga Serrudo Molina', 'olga.serrudo@planificacion.gob.bo', NULL, '$2y$10$gz6X/LM9CgfPLBXpv1IN/OrpLv6pURHQ0nQyquNtG9z75GzVAornW', NULL, '2024-05-08 05:20:20', '2025-02-11 23:21:51'),
(48, 'Claudia Aguilar Navia', 'claudia.aguilar@planificacion.gob.bo', NULL, '$2y$10$Oo6IprBBoVQhgh/A9MxpDuUail1DJFM3wxQc1Rnm3wv3twA/5lYrK', NULL, '2024-05-08 05:21:11', '2024-05-08 05:21:11'),
(49, 'Gabriel Osco Quispe', 'gabriel.osco@planificacion.gob.bo', NULL, '$2y$10$7mgT9Kl5xRL4nB5DmUDq1.3ee0RtFidw9e3UqyJJ904pD40q1476W', NULL, '2024-05-08 05:21:50', '2024-05-08 05:21:50'),
(50, 'Mariel Rodriguez Hebe', 'mariel.rodriguez@planificacion.gob.bo', NULL, '$2y$10$s9Eg6R2noazXQN5iuYnsi.C60om/dfXpsCoij4z9YIOOnO1agtBHi', NULL, '2024-05-08 05:22:30', '2024-06-22 04:08:25'),
(51, 'Andres Bocangel Ibañez', 'andres.bocangel@planificacion.gob.bo', NULL, '$2y$10$9xc8GLJC35eEdWDxmGQz3uhOFHuKo1qULgUnV8AsdgmcG5ilYVvhe', NULL, '2024-05-08 05:24:04', '2024-05-08 05:24:04'),
(52, 'Carla Dueñas Duran', 'carla.duenas@planificacion.gob.bo', NULL, '$2y$10$dGmdhYE/xZ24VNpcG9z6nuMLurpmp3yCoIlAYJykTN2QJoq1Rk1uO', NULL, '2024-05-08 05:25:46', '2024-05-08 05:25:46'),
(53, 'Carlos Guachalla Terrazas', 'carlos.guachalla@planificacion.gob.bo', NULL, '$2y$10$ob87qG8n..twDrhrXzG/KuvFH0z8Fdu7FScHbTt/eNL87rPro3jzi', NULL, '2024-05-08 05:27:00', '2024-05-08 05:27:00'),
(54, 'Franz Quisbert Parra', 'franz.quiqsbert@planificacion.gob.bo', NULL, '$2y$10$2FeH0oVrqx/lz1Gi5P5JO.h/Q8MmDlz4J2sHqzQiBHL/zEXHY0nEq', NULL, '2024-05-08 05:27:55', '2024-05-08 05:27:55'),
(55, 'Estefany Quispe Apaza', 'estefany.quispe@planificacion.gob.bo', NULL, '$2y$10$zd8KV9NFq5udjHnJ246GXOTjxTPsdw8eppwpPcJgQtP9xnlohPx26', NULL, '2024-05-08 05:28:51', '2024-05-08 05:35:34'),
(56, 'Fidel Chacolla Choquecallata', 'fidel.chacolla@planificacion.gob.bo', NULL, '$2y$10$WpeYKlZpvvUCP6EtZ7is1uvle3sbCMqOa7ALUs.m8569J19owmqSm', NULL, '2024-05-08 05:30:03', '2024-05-08 05:30:03'),
(57, 'Edson Apaza Otalora', 'edson.apaza@planificacion.gob.bo', NULL, '$2y$10$wwFg4KLVG0KpFkVS5e3SDeBnQdjpYhRM2S/6R7GKk5oIzfYmXAgPy', NULL, '2024-05-08 05:30:50', '2024-05-08 05:30:50'),
(58, 'Julia Monje Bernal', 'julia.monje@planificacion.gob.bo', NULL, '$2y$10$l2UPfH.3YTVscz22f11SQuXuw4P0iegecrYwDW9wVfQi1cnkUjLzK', NULL, '2024-05-08 05:31:55', '2024-05-08 05:31:55'),
(59, 'Ronald Ortube Bentarcurt', 'ronald.ortube@planificacion.gob.bo', NULL, '$2y$10$NQDftvt0y5M3ch3cEPCNW.26Lb64aDzZ0/vcIyzavcfJe3HkOH1zy', NULL, '2024-05-08 05:32:47', '2025-02-11 23:30:30'),
(60, 'Vanessa Nuñez Millan', 'vanessa.nunez@planificacion.gob.bo', NULL, '$2y$10$9t.83dpkkdO3fY1ZyRG/q.TRlbEzCi8dIgDtBk2fWF6jwI9biD/Mm', NULL, '2024-05-08 05:34:10', '2024-05-08 05:34:10'),
(61, 'Cristobal Mamani Cano', 'cristobal.mamani@planificacion.gob.bo', NULL, '$2y$10$l8JHgBJWVCpLCb8Zs6nxcO6lO6IRUNHORY0F.OHmLeNSiaHO0cMhy', NULL, '2024-05-08 05:34:59', '2024-05-08 05:34:59'),
(62, 'Marco Antonio Vargas Paco', 'marco.vargas@planificacion.gob.bo', NULL, '$2y$10$zMYfHEoYVDU01N5SOM6wH..knJVMH3VjQrnw4RqkChj9/Qq.ti9FO', NULL, '2024-05-08 05:36:57', '2024-05-08 05:36:57'),
(63, 'Jorge Arnez Ayano', 'jorge.arnez@planificacion.gob.bo', NULL, '$2y$10$QlYXsc7WPfZcJ32AXtHdxu62NIk9lnjWce49PM/t5EmR1dTE6vmi6', NULL, '2024-05-08 05:37:42', '2024-05-08 05:37:42'),
(64, 'Claudia Ruiz Morales', 'claudia.ruiz@planificacion.gob.bo', NULL, '$2y$10$eG01pMErD2MMidUN/PJDvO.wu3adRiiWdonXHUnblmWmsSQ0RkOuy', NULL, '2024-05-08 05:38:33', '2024-05-08 05:38:33'),
(65, 'Antonio Mullisaca Diaz', 'antonio.mullisaca@vipfe.gob.bo', NULL, '$2y$10$7.amCYOvIBIwg4w4hY0t1e2qwxMu5x4leCDOAv0ZEbicLsKKuaIE6', NULL, '2024-05-08 05:39:20', '2024-05-08 05:39:20'),
(66, 'Malena Ayllon Luza', 'malena.ayllon@vipfe.gob.bo', NULL, '$2y$10$eRoueF7ocAjuHZQe9olo/eB0ZwaI5GbABGrMS9aAEYtw8mAkjYfFi', NULL, '2024-05-08 05:40:03', '2024-05-08 05:40:03'),
(67, 'Vicente Lara Flores', 'vicente.flores@vipfe.gob.bo', NULL, '$2y$10$GAh.yqCPKJAIpSwzSiJxy.j2rJaP00q6YxfOKHFpXZ1vRCggK41UW', NULL, '2024-05-08 05:42:58', '2024-05-08 05:42:58'),
(68, 'Karina Garcia Campos', 'karina.garcia@vipfe.gob.bo', NULL, '$2y$10$G5Mc97lj.q4dFFA.jyKZuO585ZEvfqPsRmB7qgbdTOugG4K06OnWG', NULL, '2024-05-08 05:43:39', '2024-05-08 05:47:23'),
(69, 'Boris Calcina Hernani', 'boris.calcina@vipfe.gob.bo', NULL, '$2y$10$mTnD330zyVkFx/6U7qrDpuF.s/hDx9aDLzCQl0vFmuU3cAt0HamoW', NULL, '2024-05-08 05:44:44', '2024-05-08 05:47:49'),
(70, 'Gary Tintaya Quispe', 'gary.tintaya@vipfe.gob.bo', NULL, '$2y$10$miYdHfjA.CE7uMwmgQinFuj9eHZpwivPLcQfAimYaUjsAMzr/bgzW', NULL, '2024-05-08 05:45:43', '2024-05-08 05:48:06'),
(71, 'Monica Condori Apaza', 'monica.condori@vipfe.gob.bo', NULL, '$2y$10$aTj4LgIcziD.rcLS6tJ0I.PoSeKF3lRkBTdlQxuI30cPZMp9KSEv.', NULL, '2024-05-08 05:46:28', '2024-05-08 05:48:28'),
(72, 'Yola Mayta Tola', 'yola.mayta@vipfe.gob.bo', NULL, '$2y$10$fbPqdOGuNr8DTLZCphmDqemN7XdIloZJAdDt6LSnKHCRnm/Zdlkvy', NULL, '2024-05-08 05:46:59', '2024-05-08 05:46:59'),
(73, 'Juan Valdivia del Castillo', 'juan.valdivia@vipfe.gob.bo', NULL, '$2y$10$uKFe..GpSudBSZYKhMqW5.hwVNzxSU1eODJr62B.VHrxaQQV2m2r.', NULL, '2024-05-08 05:49:43', '2024-05-08 05:49:43'),
(74, 'Lourdes Matienzo Gil', 'lourdes.matienzo@vipfe.gob.bo', NULL, '$2y$10$oFyZ20laxaGYFo0z20haXeW8bjl0ec5H15HJn8L.1jdevR7jfcxpu', NULL, '2024-05-08 05:50:26', '2024-05-08 05:50:26'),
(75, 'Fabiola Vargas Ramos', 'fabiola.ramos@vipfe.gob.bo', NULL, '$2y$10$ApcBhVWyWklNe6epRhpHcO9762NQ9qIcMm5Q6IjbQopNG.D1vPgqe', NULL, '2024-05-08 05:55:19', '2024-05-08 05:56:36'),
(76, 'Jorge Brito Pozo', 'jorge.brito@vipfe.gob.bo', NULL, '$2y$10$HmMmzYesoqr61PWuQwjC7evV/yXG0pOd/hdPEhfq68v23SFtlXhR2', NULL, '2024-05-08 05:56:13', '2024-05-08 05:57:02'),
(77, 'Aldhemar Yujra Romero', 'aldhemar.yujra@vipfe.gob.bo', NULL, '$2y$10$8NVvM0baBqtEHnfzakXJFO0o4p4wTSZr79CxLy7DrB2vtHkyB5H9W', NULL, '2024-05-08 05:57:57', '2024-05-08 05:57:57'),
(78, 'Rodrigo Meneses Delgadillo', 'rodrigo.meneses@vipfe.gob.bo', NULL, '$2y$10$HwF.kjxhP1IRoT8AqDhtUeTkVsRl0D8UXJRR3qa2ybHAwVdV4zzgi', NULL, '2024-05-08 05:59:20', '2024-05-08 05:59:20'),
(79, 'Sergio Arrieta Peñaranda', 'sergio.arrieta@vipfe.gob.bo', NULL, '$2y$10$jdUBKeoMP2854ycQW.HfRu0UNzwKatzuxUjmar8j5AcE56LyELyS2', NULL, '2024-05-08 06:00:25', '2024-05-08 06:00:25'),
(80, 'Veronica Gamarra Turdera', 'veronica.gamarra@vipfe.gob.bo', NULL, '$2y$10$X6VDjedZ05IuWiphWqD1ceCNRPrjwY76VQGOSR3.qiLBbUofQYmsi', NULL, '2024-05-08 06:02:28', '2025-02-17 21:04:18'),
(81, 'Paulino Ruiz Huanca', 'paulino.ruiz@vipfe.gob.bo', NULL, '$2y$10$z0F9Q/dI/EoKO/2fUuhnQOw/sDNPV4kITz5ZpGOwoPcR3S5QoPT4K', NULL, '2024-05-08 06:03:16', '2024-05-08 06:03:16'),
(82, 'Veronica Rocha Calatayud', 'veronica.rocha@vipfe.gob.bo', NULL, '$2y$10$6cFtYaom5TIasBaIEHBVluQR4szHj6FnqAiRUU2kn3i9a5Gaa3ZOy', NULL, '2024-05-08 06:05:06', '2024-05-08 06:05:06'),
(83, 'Betty Achu Ticona', 'betty.achu@vipfe.gob.bo', NULL, '$2y$10$KowrbYxlKcCUt97kOd4Y8.AafSJjeIjmCCaFOXUUJj9GhryiTvHvC', NULL, '2024-05-08 06:05:51', '2024-05-08 06:05:51'),
(84, 'Uber Madueño Huallpa', 'uber.madueno@vipfe.gob.bo', NULL, '$2y$10$EmRD.0ZWWyMvDI/KFk8ks.LbC9ksI9KdjxEjRkeXxvOx0J5Kos5Wa', NULL, '2024-05-08 06:06:57', '2025-02-12 00:07:38'),
(85, 'Jose Luis Nina Choque', 'jose.nina@vipfe.gob.bo', NULL, '$2y$10$jTYQApa08alDHqBJJoTn5uu9WJQFtleXMFK2InxzuIn1SdbOlXYHO', NULL, '2024-05-08 06:08:04', '2024-05-08 06:08:04'),
(86, 'Aracely Cadena Villasante', 'aracely.cadena@vipfe.gob.bo', NULL, '$2y$10$Wck0QfT1zTudwSxpLDUm0.gNWJBeUrGfvtlNeQ0N2c.5iiEp6dLtK', NULL, '2024-05-08 06:08:50', '2024-05-08 06:08:50'),
(87, 'Carlos Lopez Gonzales', 'carlos.lopez@vipfe.gob.bo', NULL, '$2y$10$6/qTiyqDuZ4fy5BqIkH2heE3q3efDkTfRKsmUR/PDPqz1hkwv2s7m', NULL, '2024-05-08 06:09:27', '2024-05-08 06:09:27'),
(88, 'Felix Vargas Gonzales', 'felix.vargas@vipfe.gob.bo', NULL, '$2y$10$veiE.nxHc2hsJHJ4YBGLM.jzR4IuD43P39oGe66m2wpuEuWU9wQ5.', NULL, '2024-05-08 06:10:27', '2025-02-12 00:05:41'),
(89, 'Mauricio Cespedes Quiroga', 'mauricio.gonzales@planificacion.gob.bo', NULL, '$2y$10$BsQy7szi9OomJgOQm.uaoObTFWO3.pzLuCEI.N67nCKsWDIEE9vnW', NULL, '2024-05-08 06:11:56', '2024-05-08 06:11:56'),
(90, 'Milenka Acarapi Perez', 'milenka.acarapi@planificacion.gob.bo', NULL, '$2y$10$dx/sSnYbd5r02voold9kjugwwf8LSOtzl3Z4GmOyIcyTvYuQMJtTq', NULL, '2024-05-08 06:12:47', '2024-05-08 06:12:47'),
(91, 'Magali Paz Garcia', 'magali.paz@planificacion.gob.bo', NULL, '$2y$10$OccGlSwISQ7BNlREEnIet.9XYrkEAjlBFSnGhrM1NVWpv0up7Ko0i', NULL, '2024-05-08 06:13:35', '2024-05-08 06:13:35'),
(92, 'Juan Pablo Torrico Ballivian', 'juan.torrico@planificacion.gob.bo', NULL, '$2y$10$Ytj57TCRXcHV9UOqDPEfAeuxmtJqbaXpHUkhuvWNTb4rYdifkrcym', NULL, '2024-05-08 06:14:53', '2024-05-08 06:14:53'),
(93, 'Eliana Oniz Vargas', 'eliana.vargas@planificacion.gob.bo', NULL, '$2y$10$DFBu.CsUP1NCHrBq9wOsqOTg2PqvakilnXGqQ9wYoNU2w.7ZzybYS', NULL, '2024-05-08 06:15:50', '2025-02-12 00:01:08'),
(94, 'Daniela Valverde Valero', 'daniela.valverde@planificacion.gob.bo', NULL, '$2y$10$AkFrfx2z3W0hBE6xCtaff.BpSiIey3ZpWCPLYxw71WJ3/ElIi/CUe', NULL, '2024-05-08 06:16:49', '2024-05-08 06:16:49'),
(95, 'Yerko Palacios Tellez', 'yerko.palacios@vipfe.gob.bo', NULL, '$2y$10$PPLg9ENzPPK.j5TxF.Rgsuca2QmqtlklaE/Zm40KIrGcFQoK8eGJm', NULL, '2024-05-08 06:17:50', '2025-02-21 02:22:19'),
(96, 'Shirley Gutierrez Roman', 'shirley.gutierrez@planificacion.gob.bo', NULL, '$2y$10$TJ9Dudk2sSEAyZvMF3.I1Oj4iRcUN2p5yv2qh/v6RwhA1.ip5DDvW', NULL, '2024-05-08 06:18:41', '2024-05-08 06:18:41'),
(97, 'Melani Osorio Rioja', 'melani.osorio@planificacion.gob.bo', NULL, '$2y$10$vMpEjRtI3ZTO/Hts1wSz..LFcWFI2nsKDLQOAm9bf4SC9oZEyDh4C', NULL, '2024-05-08 06:20:03', '2024-05-08 06:20:03'),
(98, 'Prysila Tito Perea', 'prycila.tito@planificacion.gob.bo', NULL, '$2y$10$nujsNpNXSToKsy7O9xAeoOt3MF3OT0eGhkrvoU2CuWXv6J1F60Gsq', NULL, '2024-05-08 06:21:10', '2024-05-08 06:21:10'),
(99, 'Maria Saravia Melgar', 'maria.saravia@planificacion.gob.bo', NULL, '$2y$10$CxXVkDLH17d.Iba5yuyS4ub5pL7unHcBioBFbUNE1SFwT5O4.45gm', NULL, '2024-05-08 06:22:11', '2024-05-08 06:22:11'),
(100, 'Paola Andrea Noriega', 'paola.noriega@planificacion.gob.bo', NULL, '$2y$10$7Ei9pSzku7dfatb.miIh2uey5FR/mrvuKp1WqhIIKsHT1oWDqTJ9W', NULL, '2024-07-17 06:01:32', '2024-07-17 06:01:32'),
(102, 'Kevin Miguel Acho Condori', 'kevinmigu0000@yahoo.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2024-09-12 02:43:09', '2024-09-12 02:43:09'),
(103, 'Juanito Arcoiris', 'kevinmigu0000@outlook.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2024-09-12 02:48:04', '2024-09-13 01:58:43'),
(104, 'Kevin Acho Condori', 'kevinmigu0000@gmail.com', NULL, '$2y$10$MXbLj5xnIoTdOuZ1irNYY.2dh5UzO12QF0RlHtrFA5.AAp.sh8tXq', NULL, '2024-11-30 20:20:58', '2024-11-30 20:20:58'),
(105, 'Paulo Moreno', 'paulo.moreno@planificacion.gob.bo', NULL, '$2y$10$DoBHF4dd14pQUEy.8Xb4dOLyWvy1sJUbubb1kV4CMKLt5ZlET3pmG', NULL, '2025-02-11 01:56:07', '2025-02-11 23:27:58'),
(106, 'Luis Apaza', 'luis.apaza@planificacion.gob.bo', NULL, '$2y$10$G1cvbCRy36PrEpuC7hZAD.dZgrv8WhSrcKaNpT0xa8KQX/WAkVYxq', NULL, '2025-02-21 01:53:33', '2025-02-21 01:53:33'),
(107, 'David Flores', 'dsflores@gmail.com', NULL, '$2y$10$aotU885mHnQHQFrmVh5pEelBGDszKiezgsV3HDR0UGndAuXvUZyBW', NULL, '2025-03-01 20:33:26', '2025-03-01 20:33:26');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_tecnico_id` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `configuracion_equipo_nuevo`
--
ALTER TABLE `configuracion_equipo_nuevo`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado_equipo`
--
ALTER TABLE `estado_equipo`
  ADD CONSTRAINT `fk_estado_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `configuracion_equipo_nuevo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tickets_estado_equipo` FOREIGN KEY (`id_tickets`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personal_especialidad`
--
ALTER TABLE `personal_especialidad`
  ADD CONSTRAINT `fk_PersonaEspecialidad_Especialidad` FOREIGN KEY (`id_especialidades`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `fk_PersonaEspecialidad_Users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tablaticketvaloracion`
--
ALTER TABLE `tablaticketvaloracion`
  ADD CONSTRAINT `fk_idTecnico` FOREIGN KEY (`idTecnico`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idTicket` FOREIGN KEY (`idTicket`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`IdUsuario`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
