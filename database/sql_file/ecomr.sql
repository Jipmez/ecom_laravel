-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2022 at 02:10 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomr`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'laptops', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(2, 'Desktops', 'desktops', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(3, 'Phones', 'phones', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(4, 'Tablets', 'tablets', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(5, 'TVs', 'tvs', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(6, 'Cameras', 'cameras', '2022-09-18 04:23:48', '2022-09-18 04:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_08_19_000000_create_failed_jobs_table', 1),
(5, '2022_10_16_185424_create_products_table', 1),
(6, '2022_10_17_195112_create_categories_table', 1),
(7, '2022_10_20_114921_create_tags_table', 1),
(8, '2022_10_20_115306_create_products_tags_table', 1),
(9, '2022_10_22_185425_create_orders_table', 1),
(10, '2022_10_22_190613_create_order_product_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT 0,
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int(11) DEFAULT NULL,
  `billing_tax` int(11) DEFAULT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT 0,
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
(1, NULL, 'mezj972@gmail.com', 'Jachike Mezue', NULL, NULL, NULL, NULL, '09898239', NULL, 0, NULL, NULL, NULL, 200, 'stripe', 0, NULL, '2022-09-23 11:20:20', '2022-09-23 11:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 35, 1, 1, '2022-09-23 11:20:20', '2022-09-23 11:20:20');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'laptop0', 'laptop-0', '15 inches 1TB SSD 16 GB', 8199, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, '<p>Simple. suyiudgdfgfzzfsfsd</p>', '2022-09-18 04:23:48', '2022-09-28 11:02:42'),
(2, 'laptop1', 'laptop-1', '15 inches 1TB SSD 16 GB RAM', 8972, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(3, 'laptop2', 'laptop-2', '15 inches 1TB SSD 16 GB RAM', 2906, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(4, 'laptop3', 'laptop-3', '15 inches 1TB SSD 16 GB RAM', 5242, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(5, 'laptop4', 'laptop-4', '15 inches 1TB SSD 16 GB RAM', 4447, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(6, 'laptop5', 'laptop-5', '15 inches 1TB SSD 16 GB RAM', 6619, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(7, 'laptop6', 'laptop-6', '15 inches 1TB SSD 16 GB RAM', 2581, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(8, 'laptop7', 'laptop-7', '15 inches 1TB SSD 16 GB RAM', 2591, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(9, 'laptop8', 'laptop-8', '15 inches 1TB SSD 16 GB RAM', 1508, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(10, 'laptop9', 'laptop-9', '15 inches 1TB SSD 16 GB RAM', 7491, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(11, 'laptop10', 'laptop-10', '15 inches 1TB SSD 16 GB RAM', 6667, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(12, 'laptop11', 'laptop-11', '15 inches 1TB SSD 16 GB RAM', 8510, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(13, 'laptop12', 'laptop-12', '15 inches 1TB SSD 16 GB RAM', 1181, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(14, 'laptop13', 'laptop-13', '15 inches 1TB SSD 16 GB RAM', 9216, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(15, 'laptop14', 'laptop-14', '15 inches 1TB SSD 16 GB RAM', 2445, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(16, 'laptop15', 'laptop-15', '15 inches 1TB SSD 16 GB RAM', 2866, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(17, 'laptop16', 'laptop-16', '15 inches 1TB SSD 16 GB RAM', 7908, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(18, 'laptop17', 'laptop-17', '15 inches 1TB SSD 16 GB RAM', 3948, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(19, 'laptop18', 'laptop-18', '15 inches 1TB SSD 16 GB RAM', 5905, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(20, 'laptop19', 'laptop-19', '15 inches 1TB SSD 16 GB RAM', 8743, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(21, 'Desktop0', 'desktop-0', '15 inches 1TB SSD 16 GB RAM', 4493, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(22, 'Desktop1', 'desktop-1', '15 inches 1TB SSD 16 GB RAM', 9659, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(23, 'Desktop2', 'desktop-2', '15 inches 1TB SSD 16 GB RAM', 4961, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(24, 'Desktop3', 'desktop-3', '15 inches 1TB SSD 16 GB RAM', 5524, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(25, 'Desktop4', 'desktop-4', '15 inches 1TB SSD 16 GB RAM', 6871, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(26, 'Desktop5', 'desktop-5', '15 inches 1TB SSD 16 GB RAM', 9613, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(27, 'Desktop6', 'desktop-6', '15 inches 1TB SSD 16 GB RAM', 7910, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(28, 'Desktop7', 'desktop-7', '15 inches 1TB SSD 16 GB RAM', 6624, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(29, 'Desktop8', 'desktop-8', '15 inches 1TB SSD 16 GB RAM', 1935, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(30, 'Desktop9', 'desktop-9', '15 inches 1TB SSD 16 GB RAM', 2213, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(31, 'Desktop10', 'desktop-10', '15 inches 1TB SSD 16 GB RAM', 8040, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(32, 'Desktop11', 'desktop-11', '15 inches 1TB SSD 16 GB RAM', 6050, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(33, 'Desktop12', 'desktop-12', '15 inches 1TB SSD 16 GB RAM', 3882, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(34, 'Desktop13', 'desktop-13', '15 inches 1TB SSD 16 GB RAM', 6243, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(35, 'Desktop14', 'desktop-14', '15 inches 1TB SSD 16 GB RAM', 5548, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 9, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-23 11:20:20'),
(36, 'Desktop15', 'desktop-15', '15 inches 1TB SSD 16 GB RAM', 1760, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(37, 'Desktop16', 'desktop-16', '15 inches 1TB SSD 16 GB RAM', 9627, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(38, 'Desktop17', 'desktop-17', '15 inches 1TB SSD 16 GB RAM', 8213, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(39, 'Desktop18', 'desktop-18', '15 inches 1TB SSD 16 GB RAM', 3100, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(40, 'Desktop19', 'desktop-19', '15 inches 1TB SSD 16 GB RAM', 2821, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(41, 'Phone0', 'phone-0', '15 inches 1TB SSD 16 GB RAM', 6542, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(42, 'Phone1', 'phone-1', '15 inches 1TB SSD 16 GB RAM', 6282, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(43, 'Phone2', 'phone-2', '15 inches 1TB SSD 16 GB RAM', 6193, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(44, 'Phone3', 'phone-3', '15 inches 1TB SSD 16 GB RAM', 4894, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(45, 'Phone4', 'phone-4', '15 inches 1TB SSD 16 GB RAM', 1844, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(46, 'Phone5', 'phone-5', '15 inches 1TB SSD 16 GB RAM', 6898, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(47, 'Phone6', 'phone-6', '15 inches 1TB SSD 16 GB RAM', 3407, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(48, 'Phone7', 'phone-7', '15 inches 1TB SSD 16 GB RAM', 7522, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(49, 'Phone8', 'phone-8', '15 inches 1TB SSD 16 GB RAM', 6100, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(50, 'Phone9', 'phone-9', '15 inches 1TB SSD 16 GB RAM', 4197, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(51, 'Phone10', 'phone-10', '15 inches 1TB SSD 16 GB RAM', 4374, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(52, 'Phone11', 'phone-11', '15 inches 1TB SSD 16 GB RAM', 6795, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(53, 'Phone12', 'phone-12', '15 inches 1TB SSD 16 GB RAM', 4991, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(54, 'Phone13', 'phone-13', '15 inches 1TB SSD 16 GB RAM', 4265, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(55, 'Phone14', 'phone-14', '15 inches 1TB SSD 16 GB RAM', 2026, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(56, 'Phone15', 'phone-15', '15 inches 1TB SSD 16 GB RAM', 7576, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(57, 'Phone16', 'phone-16', '15 inches 1TB SSD 16 GB RAM', 8484, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(58, 'Phone17', 'phone-17', '15 inches 1TB SSD 16 GB RAM', 3046, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(59, 'Phone18', 'phone-18', '15 inches 1TB SSD 16 GB RAM', 6386, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(60, 'Phone19', 'phone-19', '15 inches 1TB SSD 16 GB RAM', 8080, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(61, 'Tablet0', 'tablet-0', '15 inches 1TB SSD 16 GB RAM', 8111, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(62, 'Tablet1', 'tablet-1', '15 inches 1TB SSD 16 GB RAM', 8711, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(63, 'Tablet2', 'tablet-2', '15 inches 1TB SSD 16 GB RAM', 6607, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(64, 'Tablet3', 'tablet-3', '15 inches 1TB SSD 16 GB RAM', 6136, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(65, 'Tablet4', 'tablet-4', '15 inches 1TB SSD 16 GB RAM', 2762, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(66, 'Tablet5', 'tablet-5', '15 inches 1TB SSD 16 GB RAM', 7604, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(67, 'Tablet6', 'tablet-6', '15 inches 1TB SSD 16 GB RAM', 5196, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(68, 'Tablet7', 'tablet-7', '15 inches 1TB SSD 16 GB RAM', 2360, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(69, 'Tablet8', 'tablet-8', '15 inches 1TB SSD 16 GB RAM', 2001, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(70, 'Tablet9', 'tablet-9', '15 inches 1TB SSD 16 GB RAM', 4575, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(71, 'Tablet10', 'tablet-10', '15 inches 1TB SSD 16 GB RAM', 3387, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(72, 'Tablet11', 'tablet-11', '15 inches 1TB SSD 16 GB RAM', 3155, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(73, 'Tablet12', 'tablet-12', '15 inches 1TB SSD 16 GB RAM', 3708, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(74, 'Tablet13', 'tablet-13', '15 inches 1TB SSD 16 GB RAM', 3118, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(75, 'Tablet14', 'tablet-14', '15 inches 1TB SSD 16 GB RAM', 7750, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(76, 'Tablet15', 'tablet-15', '15 inches 1TB SSD 16 GB RAM', 7285, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(77, 'Tablet16', 'tablet-16', '15 inches 1TB SSD 16 GB RAM', 6089, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(78, 'Tablet17', 'tablet-17', '15 inches 1TB SSD 16 GB RAM', 2324, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(79, 'Tablet18', 'tablet-18', '15 inches 1TB SSD 16 GB RAM', 8065, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(80, 'Tablet19', 'tablet-19', '15 inches 1TB SSD 16 GB RAM', 9208, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(81, 'TV0', 'tv-0', '15 inches 1TB SSD 16 GB RAM', 1743, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(82, 'TV1', 'tv-1', '15 inches 1TB SSD 16 GB RAM', 6193, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(83, 'TV2', 'tv-2', '15 inches 1TB SSD 16 GB RAM', 4159, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(84, 'TV3', 'tv-3', '15 inches 1TB SSD 16 GB RAM', 4713, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(85, 'TV4', 'tv-4', '15 inches 1TB SSD 16 GB RAM', 4119, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(86, 'TV5', 'tv-5', '15 inches 1TB SSD 16 GB RAM', 4147, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(87, 'TV6', 'tv-6', '15 inches 1TB SSD 16 GB RAM', 8111, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(88, 'TV7', 'tv-7', '15 inches 1TB SSD 16 GB RAM', 1810, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(89, 'TV8', 'tv-8', '15 inches 1TB SSD 16 GB RAM', 1254, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(90, 'TV9', 'tv-9', '15 inches 1TB SSD 16 GB RAM', 8379, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(91, 'TV10', 'tv-10', '15 inches 1TB SSD 16 GB RAM', 4491, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(92, 'TV11', 'tv-11', '15 inches 1TB SSD 16 GB RAM', 9550, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(93, 'TV12', 'tv-12', '15 inches 1TB SSD 16 GB RAM', 5269, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(94, 'TV13', 'tv-13', '15 inches 1TB SSD 16 GB RAM', 2075, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(95, 'TV14', 'tv-14', '15 inches 1TB SSD 16 GB RAM', 1676, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(96, 'TV15', 'tv-15', '15 inches 1TB SSD 16 GB RAM', 7178, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(97, 'TV16', 'tv-16', '15 inches 1TB SSD 16 GB RAM', 7026, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(98, 'TV17', 'tv-17', '15 inches 1TB SSD 16 GB RAM', 5028, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(99, 'TV18', 'tv-18', '15 inches 1TB SSD 16 GB RAM', 9256, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(100, 'TV19', 'tv-19', '15 inches 1TB SSD 16 GB RAM', 7761, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(101, 'Camera0', 'camera-0', '15 inches 1TB SSD 16 GB RAM', 2246, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48');
INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(102, 'Camera1', 'camera-1', '15 inches 1TB SSD 16 GB RAM', 1391, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(103, 'Camera2', 'camera-2', '15 inches 1TB SSD 16 GB RAM', 8103, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(104, 'Camera3', 'camera-3', '15 inches 1TB SSD 16 GB RAM', 3603, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(105, 'Camera4', 'camera-4', '15 inches 1TB SSD 16 GB RAM', 9881, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(106, 'Camera5', 'camera-5', '15 inches 1TB SSD 16 GB RAM', 2155, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(107, 'Camera6', 'camera-6', '15 inches 1TB SSD 16 GB RAM', 8803, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(108, 'Camera7', 'camera-7', '15 inches 1TB SSD 16 GB RAM', 3647, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(109, 'Camera8', 'camera-8', '15 inches 1TB SSD 16 GB RAM', 3522, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(110, 'Camera9', 'camera-9', '15 inches 1TB SSD 16 GB RAM', 9149, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(111, 'Camera10', 'camera-10', '15 inches 1TB SSD 16 GB RAM', 9006, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(112, 'Camera11', 'camera-11', '15 inches 1TB SSD 16 GB RAM', 9885, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(113, 'Camera12', 'camera-12', '15 inches 1TB SSD 16 GB RAM', 2534, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(114, 'Camera13', 'camera-13', '15 inches 1TB SSD 16 GB RAM', 1086, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(115, 'Camera14', 'camera-14', '15 inches 1TB SSD 16 GB RAM', 7180, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(116, 'Camera15', 'camera-15', '15 inches 1TB SSD 16 GB RAM', 8826, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(117, 'Camera16', 'camera-16', '15 inches 1TB SSD 16 GB RAM', 1229, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(118, 'Camera17', 'camera-17', '15 inches 1TB SSD 16 GB RAM', 5779, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(119, 'Camera18', 'camera-18', '15 inches 1TB SSD 16 GB RAM', 8804, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(120, 'Camera19', 'camera-19', '15 inches 1TB SSD 16 GB RAM', 4743, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(128, 'Core 2', 'cameras-5194', 'Standard Operation', 1232, 'products/dummy/1664366994.png', NULL, 0, 10, 6, '<p>More of the same class</p>', '2022-09-28 11:09:54', '2022-09-28 11:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 84, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(2, 51, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(3, 52, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(4, 38, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(5, 4, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(6, 30, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(7, 59, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(8, 72, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(9, 46, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(10, 6, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(11, 66, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(12, 64, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(13, 86, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(14, 68, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(15, 8, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(16, 2, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(17, 55, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(18, 46, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(19, 17, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(20, 94, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(21, 68, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(22, 6, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(23, 78, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(24, 84, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(25, 107, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(26, 8, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(27, 6, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(28, 21, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(29, 105, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(30, 112, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(31, 120, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(32, 99, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(33, 18, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(34, 110, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(35, 41, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(36, 80, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(37, 68, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(38, 22, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(39, 94, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(40, 20, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(41, 51, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(42, 33, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(43, 37, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(44, 110, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(45, 17, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(46, 93, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(47, 20, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(48, 43, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(49, 13, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(50, 71, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(51, 68, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(52, 45, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(53, 37, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(54, 102, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(55, 83, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(56, 41, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(57, 62, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(58, 21, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(59, 88, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(60, 68, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(61, 49, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(62, 74, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(63, 45, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(64, 33, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(65, 11, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(66, 40, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(67, 104, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(68, 3, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(69, 35, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(70, 90, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(71, 18, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(72, 91, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(73, 92, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(74, 83, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(75, 31, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(76, 21, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(77, 81, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(78, 7, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(79, 29, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(80, 61, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(81, 51, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(82, 4, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(83, 8, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(84, 114, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(85, 117, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(86, 119, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(87, 82, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(88, 120, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(89, 44, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(90, 7, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(91, 103, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(92, 56, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(93, 97, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(94, 75, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(95, 89, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(96, 13, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(97, 118, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(98, 89, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(99, 74, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(100, 46, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(101, 66, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(102, 29, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(103, 33, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(104, 103, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(105, 13, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(106, 16, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(107, 52, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(108, 74, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(109, 93, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(110, 30, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(111, 119, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(112, 80, 1, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(113, 21, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(114, 108, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(115, 45, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(116, 16, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(117, 61, 3, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(118, 58, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(119, 114, 2, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(120, 108, 4, '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(126, 128, 2, '2022-09-28 11:09:54', '2022-09-28 11:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-09-18 04:41:21', '2022-09-18 04:41:21'),
(2, 'user', 'Normal User', '2022-09-18 04:41:21', '2022-09-18 04:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tag 0', 'tag-0', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(2, 'Tag 1', 'tag-1', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(3, 'Tag 2', 'tag-2', '2022-09-18 04:23:48', '2022-09-18 04:23:48'),
(4, 'Tag 3', 'tag-3', '2022-09-18 04:23:48', '2022-09-18 04:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(2, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$zCRbxngkwcRNNaSehI8rn.zNL1VWqNR6h.ZsRHFCk.8rk7qz8C2Hy', 'UAu6T8C6yWKmJ6Q6JB7kMbhO1C1VGzD8Ovi8CGdaUcVIXs3h4KDLEei9TIVC', NULL, '2022-09-18 04:42:55', '2022-09-18 04:42:55'),
(3, 2, 'jet', 'jet@gmail.com', 'users/default.png', NULL, '$2y$10$R9aWDS7A9rMxoqId1f7RZOiLrrVj/tjLkBlunmQGy.FNseE7NqdXi', NULL, NULL, '2022-09-23 12:56:16', '2022-09-23 12:56:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
