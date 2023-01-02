-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2023 at 09:43 AM
-- Server version: 10.3.37-MariaDB-log-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asadinpe_updatedkarukart`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `category_des` text NOT NULL,
  `image` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 for active 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `category_des`, `image`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Crafting', 'crafting', 'Crafting item', '179105521.jpg', 1, '2022-12-30 03:26:23', '2022-12-30 20:27:47'),
(9, 'Clothing', 'clothing', 'clothing items', '1191762067.jpeg', 1, '2022-12-30 03:27:23', '2022-12-30 20:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(191) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 FOR ACTIVE 2 FOR INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `bn_name` varchar(191) DEFAULT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `lon` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_division_id_foreign` (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE IF NOT EXISTS `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `bn_name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `divisions_name_unique` (`name`),
  UNIQUE KEY `divisions_bn_name_unique` (`bn_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_06_171487_create_divisions_table', 1),
(6, '2021_09_06_171488_create_districts_table', 1),
(7, '2021_09_06_171499_create_thanas_table', 1),
(8, '2021_09_06_171500_create_unions_table', 1),
(10, '2022_09_30_115544_create_product_galleries_table', 1),
(11, '2022_10_03_175319_create_categories_table', 1),
(12, '2022_10_04_154246_create_coupons_table', 1),
(13, '2022_10_08_101137_create_sub_categories_table', 1),
(14, '2022_10_12_170155_create_subscribes_table', 1),
(15, '2022_10_18_191743_create_roles_table', 1),
(16, '2022_10_26_060641_create_settings_table', 1),
(17, '2022_10_26_194801_create_sliders_table', 1),
(18, '2022_10_27_172254_create_wishlists_table', 1),
(19, '2022_11_09_093836_create_vendor_messages_table', 1),
(21, '2022_09_29_192934_create_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `amount`, `address`, `status`, `transaction_id`, `currency`) VALUES
(4, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '63aeb83761ab5', 'BDT'),
(5, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '63aeb861130ba', 'BDT'),
(6, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '63af04d7815f9', 'BDT'),
(7, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '63b063a41b795', 'BDT');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `product_code` varchar(80) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_slug` varchar(191) NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `discount_price` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `thumbnails` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 For Pending 1 Approved',
  `short_desc` text NOT NULL,
  `long_desc` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `product_code`, `product_name`, `product_slug`, `product_price`, `discount_price`, `quantity`, `cat_id`, `subcat_id`, `thumbnails`, `status`, `short_desc`, `long_desc`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 13, 'GG-87', 'Nakshi Katha', 'nakshi-katha', 850, 441, 56, 1, 1, '678243496.jpg', 1, 'fdgsdfg', '<p>dfghhdfhgd</p>', 13, 1, '2022-12-15 00:46:47', '2022-12-30 02:56:41'),
(7, 16, '102', 'Blue Salwar', 'blue-salwar', 300, 0, 10, 9, 14, '1004739356.jpg', 1, 'Color: Dark blue\r\nsize: 40,43,44', '<p>Color: Dark blue</p><p>size: 40,43,44</p>', 16, NULL, '2022-12-30 18:08:34', '2022-12-30 23:52:32'),
(8, 18, '201', 'Nakshi Katha', 'nakshi-katha', 500, 0, 5, 9, 12, '76299102.jpg', 1, 'Nakshi katha the cultural heritafe of bangladesh\r\ncolor available', '<p>Nakshi katha the cultural heritafe of bangladesh</p><p>color available</p>', 18, NULL, '2022-12-30 23:47:33', '2022-12-30 23:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_galleries`
--

CREATE TABLE IF NOT EXISTS `product_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_code` varchar(191) NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `product_code`, `images`, `created_at`, `updated_at`) VALUES
(1, 'Pro-1', '1017834967.png', '2022-12-04 05:20:34', '2022-12-04 05:20:34'),
(2, 'Pro-1', '1788115361.png', '2022-12-04 05:20:34', '2022-12-04 05:20:34'),
(3, 'Pro-1', '93325987.png', '2022-12-04 05:20:35', '2022-12-04 05:20:35'),
(4, 'Pro-1', '1680621135.png', '2022-12-04 05:20:35', '2022-12-04 05:20:35'),
(5, 'SS-2345', '950575835.png', '2022-12-04 06:16:45', '2022-12-04 06:16:45'),
(6, 'SS-2345', '287327233.png', '2022-12-04 06:16:45', '2022-12-04 06:16:45'),
(7, 'SS-2345', '2047122633.png', '2022-12-04 06:16:45', '2022-12-04 06:16:45'),
(8, 'SS-2345', '478345577.png', '2022-12-04 06:16:45', '2022-12-04 06:16:45'),
(9, 'MAC-656', '1507270975.png', '2022-12-04 06:18:43', '2022-12-04 06:18:43'),
(10, 'MAC-656', '710205401.png', '2022-12-04 06:18:44', '2022-12-04 06:18:44'),
(11, 'MAC-656', '92899125.png', '2022-12-04 06:18:44', '2022-12-04 06:18:44'),
(12, 'IP-345', '1336600011.png', '2022-12-04 06:19:51', '2022-12-04 06:19:51'),
(13, 'IP-345', '2080386449.png', '2022-12-04 06:19:52', '2022-12-04 06:19:52'),
(14, 'IP-345', '1101336992.png', '2022-12-04 06:19:52', '2022-12-04 06:19:52'),
(15, 'MAC-3454', '1933031252.png', '2022-12-04 06:21:05', '2022-12-04 06:21:05'),
(16, 'MAC-3454', '545067217.png', '2022-12-04 06:21:05', '2022-12-04 06:21:05'),
(17, 'MAC-3454', '2073075430.png', '2022-12-04 06:21:05', '2022-12-04 06:21:05'),
(18, 'PH-3454', '2024982554.png', '2022-12-04 06:22:11', '2022-12-04 06:22:11'),
(19, 'PH-3454', '664322742.png', '2022-12-04 06:22:11', '2022-12-04 06:22:11'),
(20, 'PH-3454', '654812167.png', '2022-12-04 06:22:11', '2022-12-04 06:22:11'),
(21, 'PH-3454', '2115306083.png', '2022-12-04 06:22:12', '2022-12-04 06:22:12'),
(22, 'PH-3454', '307346722.png', '2022-12-04 06:22:12', '2022-12-04 06:22:12'),
(23, 'PH-3454', '2082568550.png', '2022-12-04 06:22:12', '2022-12-04 06:22:12'),
(24, 'ffghfgh-bvf', '1097846679.png', '2022-12-15 00:31:43', '2022-12-15 00:31:43'),
(25, 'ffghfgh-bvf', '545105715.png', '2022-12-15 00:31:43', '2022-12-15 00:31:43'),
(26, 'ffghfgh-bvf', '1832145445.png', '2022-12-15 00:31:43', '2022-12-15 00:31:43'),
(27, 'ffghfgh-bvf', '1172042647.png', '2022-12-15 00:31:44', '2022-12-15 00:31:44'),
(28, 'V-99', '1136779035.png', '2022-12-15 00:33:32', '2022-12-15 00:33:32'),
(29, 'V-99', '81487046.png', '2022-12-15 00:33:33', '2022-12-15 00:33:33'),
(30, 'V-99', '1841649452.png', '2022-12-15 00:33:33', '2022-12-15 00:33:33'),
(31, 'ffghfgh-bvf', '701125430.png', '2022-12-15 00:46:47', '2022-12-15 00:46:47'),
(32, 'ffghfgh-bvf', '782696649.png', '2022-12-15 00:46:47', '2022-12-15 00:46:47'),
(35, 'GG-Canello', '622675603.png', '2022-12-15 01:36:50', '2022-12-15 01:36:50'),
(36, 'GG-Canello', '1149684865.png', '2022-12-15 01:36:51', '2022-12-15 01:36:51'),
(40, 'GG-Canello', '1824209416.png', '2022-12-15 14:16:25', '2022-12-15 14:16:25'),
(41, 'GG-Canello', '29255245.png', '2022-12-15 14:16:25', '2022-12-15 14:16:25'),
(42, 'GG-Canello', '1300968853.png', '2022-12-15 14:16:25', '2022-12-15 14:16:25'),
(54, 'GG-87', '880488920.jpg', '2022-12-30 02:50:57', '2022-12-30 02:50:57'),
(55, 'GG-87', '373428559.jpg', '2022-12-30 02:50:57', '2022-12-30 02:50:57'),
(56, 'GG-87', '1761914640.jpg', '2022-12-30 02:50:57', '2022-12-30 02:50:57'),
(58, '102', '1015519424.jpg', '2022-12-30 18:08:34', '2022-12-30 18:08:34'),
(59, '201', '1128526816.jpg', '2022-12-30 23:47:33', '2022-12-30 23:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(191) NOT NULL,
  `role_comments` varchar(191) NOT NULL,
  `role_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_comments`, `role_status`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Not Availabel', 1, '2022-12-12 20:33:36', NULL),
(2, 'admin', 'Not Available', 1, '2022-12-12 20:34:03', NULL),
(3, 'vendor', 'Not Availabel', 1, '2022-12-12 20:34:17', NULL),
(4, 'customer', 'Not Available', 1, '2022-12-12 20:34:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) DEFAULT NULL,
  `company_phone` varchar(191) DEFAULT NULL,
  `pic` varchar(191) DEFAULT NULL,
  `youtube_link` varchar(191) DEFAULT NULL,
  `instagram_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `facebook_link` varchar(191) DEFAULT NULL,
  `linkedin_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_phone`, `pic`, `youtube_link`, `instagram_link`, `twitter_link`, `facebook_link`, `linkedin_link`, `created_at`, `updated_at`) VALUES
(1, 'KARU CART', '01815555347', '2111727842.png', 'http://youtube.com', 'http://instagram.com', 'http://twitter.com', 'http://facebook.com', 'http://linkedin.com', '2022-12-04 04:51:59', '2022-12-04 06:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) NOT NULL,
  `product_category` varchar(191) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_disPrice` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1. for Active 2. for Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `product_name`, `product_category`, `product_price`, `product_disPrice`, `title`, `description`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'New Arrival Products', 8000, 7500, 'Best Nakshi kantha In the World', 'Best Nakshi kantha In the World.', '685177756.jpg', 'MackBook Pro', 1, '0000-00-00 00:00:00', '2022-12-31 13:05:30'),
(2, '2', 'Most Popular Products', 15000, 13000, 'Karu Kart In the World Class', 'Best Karu Cart in the world', '485071690.jpg', 'Apple Watch', 1, '0000-00-00 00:00:00', '2022-12-31 13:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE IF NOT EXISTS `subscribes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mostakimemon181@gmail.com', '2022-12-30 23:48:43', '2022-12-30 23:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `sub_name` varchar(191) NOT NULL,
  `sub_slug` varchar(191) DEFAULT NULL,
  `sub_image` varchar(191) DEFAULT NULL,
  `sub_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `sub_name`, `sub_slug`, `sub_image`, `sub_status`, `created_at`, `updated_at`) VALUES
(12, 9, 'Shari', 'shari', '1068898535.jpg', 1, '2022-12-30 17:49:33', '2022-12-30 17:49:33'),
(13, 9, 'Punjabi', 'punjabi', '442281749.jpg', 1, '2022-12-30 17:51:58', '2022-12-30 17:51:58'),
(14, 9, 'Kamiz', 'kamiz', '102915600.jpg', 1, '2022-12-30 17:56:18', '2022-12-30 17:56:18'),
(15, 9, 'T-shirt', 't-shirt', '2002398416.jpg', 1, '2022-12-30 17:56:37', '2022-12-30 17:56:37'),
(16, 9, 'Shirt', 'shirt', '313080901.jpg', 1, '2022-12-30 17:56:48', '2022-12-30 17:56:48'),
(17, 7, 'Clay craft', 'clay-craft', '387067698.jpg', 1, '2022-12-30 18:00:35', '2022-12-30 18:00:35'),
(18, 7, 'Wooden craft', 'wooden-craft', '1128713101.jpeg', 1, '2022-12-30 18:00:53', '2022-12-30 18:00:53'),
(19, 7, 'Metal craft', 'metal-craft', '1012807748.jpg', 1, '2022-12-30 18:01:07', '2022-12-30 18:01:07'),
(20, 7, 'jute craft', 'jute-craft', '1219406594.jpg', 1, '2022-12-30 18:01:41', '2022-12-30 18:01:41'),
(21, 7, 'handmade painiting', 'handmade-painiting', '1987423298.jpg', 1, '2022-12-30 18:02:21', '2022-12-30 18:02:21'),
(22, 7, 'Clothing craft', 'clothing-craft', '851960406.jpg', 1, '2022-12-30 23:52:15', '2022-12-30 23:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE IF NOT EXISTS `thanas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `bn_name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thanas_district_id_foreign` (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unions`
--

CREATE TABLE IF NOT EXISTS `unions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `bn_name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `thana_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unions_thana_id_foreign` (`thana_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `nid` int(11) DEFAULT NULL,
  `role_id` int(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `bkash` varchar(191) DEFAULT NULL,
  `rocket` varchar(191) DEFAULT NULL,
  `nagad` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_nid_unique` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `nid`, `role_id`, `photo`, `bkash`, `rocket`, `nagad`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@mail.com', '015984498', 1961157458, 1, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$6TrPQCTOv.DC2MU.hxSQieXkPtmyQpTEDpX2ztuHrd2S5wOQVzgSy', NULL, '2022-12-04 04:51:59', '2022-12-04 04:51:59'),
(3, 'Aziz', 'admin@mail.com', '015984488', 1245875684, 2, 'backend/user/1752222332999295.png', '01835061968', NULL, NULL, 1, NULL, '$2y$10$QqYS90luzSP4XcEVT9oir.lccg2kVZkONuSf59ikRcOsYdtA.g3wO', NULL, '2022-12-04 04:51:59', '2022-12-30 18:04:01'),
(4, 'Vendor', 'vendor@mail.com', '015914488', 1921157488, 3, 'backend/user/1753628055456620.png', '01857807803', '018578078035', '018578078035', 1, NULL, '$2y$10$6TrPQCTOv.DC2MU.hxSQieXkPtmyQpTEDpX2ztuHrd2S5wOQVzgSy', NULL, '2022-12-04 04:51:59', '2022-12-30 02:47:17'),
(5, 'Customer', 'customer@mail.com', '015314488', 1921757488, 4, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$6TrPQCTOv.DC2MU.hxSQieXkPtmyQpTEDpX2ztuHrd2S5wOQVzgSy', NULL, '2022-12-04 04:51:59', '2022-12-04 04:51:59'),
(8, 'Admin 2', 'admin2@mail.com', '013984488', 1961957488, 2, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$6TrPQCTOv.DC2MU.hxSQieXkPtmyQpTEDpX2ztuHrd2S5wOQVzgSy', NULL, '2022-12-04 04:51:59', '2022-12-04 04:51:59'),
(9, 'Khayrul Islam Shanto', 'khayrul@gmail.com', '018350619398', 1234567890, 4, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$AlBBEEz7493UCC3eHLiO4OAJSkOBWN1Mh/FgpUIc6IxNP/ASPEndS', NULL, '2022-12-13 12:40:57', '2022-12-14 06:59:07'),
(10, 'shanto', 'shanto@mail.com', '01524586587', 1452658745, 4, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$lx2h.Ji8IAJfPhWksXYKMe1g38kUixIOlT2hlElaxdKzHAcA0Vtkq', NULL, '2022-12-13 12:44:20', '2022-12-13 12:44:20'),
(12, 'Writer', 'writer@mail.com', '012457854465', NULL, 3, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$mdiTzPK2IeR6M20YP1U1gOVBNGOGR9d9tb9.d4LwB8Me3hX445HwW', NULL, '2022-12-14 08:18:40', '2022-12-14 08:28:40'),
(13, 'AL-MAMUN', 'almamoon602@gmail.com', '01701130474', NULL, 3, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$WRpGbSZm2wOUloSHG4kxn.7MT3GXh5aOrsI5H.Q1RlCVVYhtasRtO', NULL, '2022-12-14 23:22:51', '2022-12-14 23:22:51'),
(14, 'Mohammad AL-MAMUN', 'almamoon605@gmail.com', '017011304987', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$J6uzkSiXfWQG7xRaAr6xFOCm3nysxoa010xH8c4AlMxKDOoDYh1BK', NULL, '2022-12-15 14:11:26', '2022-12-15 14:11:26'),
(15, 'deserte', 'deserte@mail.com', '015657011304', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$TvsCT5cb.ACK9om6dZ/EP./6fEzLtzsaugxSnzQbpdj5vg8AGISQa', NULL, '2022-12-21 02:20:00', '2022-12-21 02:20:00'),
(16, 'aziz', 'ria@mail.com', '01884370667', NULL, 3, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$JPxSsRNmVMyg70AUcyJAlOitgju2K3ZYyw7O1uRKqkRAQHTuR2.yK', NULL, '2022-12-30 17:10:33', '2022-12-30 17:10:33'),
(17, 'prince', 'prince@mail.com', '01338897231', NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$cxIEP7AUvLbxZNJl75RxXOh6v.NbHHko956JhKx70IjWnQg6m/WHK', NULL, '2022-12-30 20:31:24', '2022-12-30 20:31:24'),
(18, 'shafin', 'shafin@mail.com', '01876271642', NULL, 3, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$3VUy9xhdK2O3JMNfhClVoucyrE5gRtqLS6PaDy2ims9n/lvo/QjKu', NULL, '2022-12-30 23:43:39', '2022-12-30 23:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_messages`
--

CREATE TABLE IF NOT EXISTS `vendor_messages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2 COMMENT '1=User, 2=Vendor',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `pro_id`, `created_at`, `updated_at`) VALUES
(4, 4, 2, '2022-12-15 02:57:13', '2022-12-15 02:57:13'),
(5, 1, 2, '2022-12-29 21:37:53', '2022-12-29 21:37:53'),
(6, 3, 5, '2022-12-29 21:58:45', '2022-12-29 21:58:45'),
(7, 3, 2, '2022-12-30 15:06:20', '2022-12-30 15:06:20'),
(8, 16, 1, '2022-12-30 17:16:07', '2022-12-30 17:16:07');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thanas`
--
ALTER TABLE `thanas`
  ADD CONSTRAINT `thanas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unions`
--
ALTER TABLE `unions`
  ADD CONSTRAINT `unions_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
