-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_02_19_041522_create_personal_access_tokens_table',1),(5,'2025_02_19_044438_create_products_table',2),(6,'2025_02_19_050159_create_orders_table',3),(7,'2025_02_19_050219_create_order_items_table',3),(8,'2025_02_19_055421_create_carts_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,3,3,400.00,'2025-02-19 03:32:25','2025-02-19 03:32:25'),(2,2,4,3,1500.00,'2025-02-19 03:48:29','2025-02-19 03:48:29'),(3,2,6,1,200.00,'2025-02-19 03:48:29','2025-02-19 03:48:29'),(4,3,3,3,400.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(5,3,4,2,1500.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(6,4,3,3,400.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(7,4,6,1,200.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(8,5,4,2,1500.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(9,5,6,3,200.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(10,6,5,3,800.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(11,6,6,3,200.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(12,7,1,3,45.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(13,7,6,1,200.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(14,8,1,1,45.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(15,8,5,1,800.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(16,9,3,3,400.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(17,9,4,3,1500.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(18,10,1,1,45.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(19,10,6,3,200.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(20,11,3,2,400.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(21,11,4,3,1500.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(22,12,3,3,400.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(23,12,5,2,800.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(24,13,3,1,400.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(25,13,4,1,1500.00,'2025-02-19 03:48:31','2025-02-19 03:48:31');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,1200.00,'2025-02-19 03:32:25','2025-02-19 03:32:25'),(2,3,4700.00,'2025-02-19 03:48:29','2025-02-19 03:48:29'),(3,5,4200.00,'2025-02-19 03:48:29','2025-02-19 03:48:30'),(4,6,1400.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(5,7,3600.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(6,8,3000.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(7,9,335.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(8,10,845.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(9,11,5700.00,'2025-02-19 03:48:30','2025-02-19 03:48:30'),(10,12,645.00,'2025-02-19 03:48:30','2025-02-19 03:48:31'),(11,13,5300.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(12,14,2800.00,'2025-02-19 03:48:31','2025-02-19 03:48:31'),(13,15,1900.00,'2025-02-19 03:48:31','2025-02-19 03:48:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (8,'App\\Models\\User',3,'API Token','79a82cf21ec9b7d12994333b94be018e66b8fb5eec4e48f3479ddb7c2518cadc','[\"*\"]','2025-02-19 03:21:21',NULL,'2025-02-19 01:41:57','2025-02-19 03:21:21'),(9,'App\\Models\\User',3,'API Token','96cf5ab5358cc9dad10e0d09c916f6ba8d9b6c0b51c3195f1b55834b2945145c','[\"*\"]','2025-02-19 03:49:56',NULL,'2025-02-19 03:04:54','2025-02-19 03:49:56');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Lux Soap','Lux Bath Soaps',45.00,55,NULL,'2025-02-19 01:56:39','2025-02-19 02:28:30'),(3,'Bag','School bag',400.00,25,NULL,'2025-02-19 02:55:26','2025-02-19 02:55:26'),(4,'Laptop','Gaming Laptop',1500.00,10,NULL,'2025-02-19 03:48:29','2025-02-19 03:48:29'),(5,'Smartphone','Android Phone',800.00,20,NULL,'2025-02-19 03:48:29','2025-02-19 03:48:29'),(6,'Headphones','Noise-canceling',200.00,15,NULL,'2025-02-19 03:48:29','2025-02-19 03:48:29');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('dtUrEGJYFc4QNFTFP6dod1d5lNKoLqJnIqckmD6T',NULL,'127.0.0.1','PostmanRuntime/7.43.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjVyb2hkN0VtdmxMbEZ4N2ZXcjNuVjlVWm9oaTVMRm9uN1VQR2h2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739946363),('hAo9fx6cAgdaQARCeaYQcHsRQHlP59uUuJEuohuJ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmRGV2dhTlNGa0Q2dzZNM3l5S0gzSDhmdlNGOW1kaldpMDRpMm9rMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739943200);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Raiju','raijutt@gmail.com',NULL,'$2y$12$522gp3ctx63ihQyay6vMJu9kKAn2p.bPvbWBudAe1L2qw9tJNr8m6',NULL,'2025-02-19 01:20:14','2025-02-19 01:20:14'),(5,'Admin','admin@gmail.com',NULL,'$2y$12$k7xDK1IGxuxJzA3.p7X7dej70vLP4EM.WkxofqqP1PI5bbVL80WGa',NULL,'2025-02-19 03:48:28','2025-02-19 03:48:28'),(6,'Loren Cole','mgerhold@example.org','2025-02-19 03:48:28','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','CfxRU9ftaf','2025-02-19 03:48:29','2025-02-19 03:48:29'),(7,'Vergie Waelchi V','huel.elenor@example.net','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','6ck6SoTRji','2025-02-19 03:48:29','2025-02-19 03:48:29'),(8,'Prof. Tyson Nikolaus V','stowne@example.net','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','fILYZxyDJy','2025-02-19 03:48:29','2025-02-19 03:48:29'),(9,'Chet Quitzon','irma13@example.com','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','vXNrOsgUgn','2025-02-19 03:48:29','2025-02-19 03:48:29'),(10,'Vince Parker IV','fokuneva@example.org','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','zPZ0q19RpL','2025-02-19 03:48:29','2025-02-19 03:48:29'),(11,'Deion Kassulke','xkulas@example.net','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','4i09ZECACz','2025-02-19 03:48:29','2025-02-19 03:48:29'),(12,'Ruthe Marks DVM','cronin.jeff@example.org','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','YJsPLc23O6','2025-02-19 03:48:29','2025-02-19 03:48:29'),(13,'Eddie Conroy IV','friedrich.maggio@example.net','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','AKMyKuGI20','2025-02-19 03:48:29','2025-02-19 03:48:29'),(14,'Marianna Kemmer','durward.streich@example.org','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','nhl7yxvMN0','2025-02-19 03:48:29','2025-02-19 03:48:29'),(15,'Ms. Karelle Hodkiewicz','destiny64@example.net','2025-02-19 03:48:29','$2y$12$06qYA/3HliFIQH5Ozz71z.GxiCUxS2KJARmoiraJcRk1B40jUH9Li','bkfZR1AriL','2025-02-19 03:48:29','2025-02-19 03:48:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19 15:24:43
