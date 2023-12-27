-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: platinum
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_category_children`
--

DROP TABLE IF EXISTS `_category_children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_category_children` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Category_children_AB_unique` (`A`,`B`),
  KEY `_Category_children_B_index` (`B`),
  CONSTRAINT `_Category_children_A_fkey` FOREIGN KEY (`A`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Category_children_B_fkey` FOREIGN KEY (`B`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_category_children`
--

LOCK TABLES `_category_children` WRITE;
/*!40000 ALTER TABLE `_category_children` DISABLE KEYS */;
/*!40000 ALTER TABLE `_category_children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_category`
--

DROP TABLE IF EXISTS `_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_category` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_category_AB_unique` (`A`,`B`),
  KEY `_Product_category_B_index` (`B`),
  CONSTRAINT `_Product_category_A_fkey` FOREIGN KEY (`A`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_category_B_fkey` FOREIGN KEY (`B`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_category`
--

LOCK TABLES `_product_category` WRITE;
/*!40000 ALTER TABLE `_product_category` DISABLE KEYS */;
INSERT INTO `_product_category` VALUES ('04d4d2c1-9ff5-4582-936a-c3085cf6f63e','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('15fc1637-6f7e-460d-8fbf-3e4f70fd4382','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('c77c3a1b-8177-42c9-b3d9-3bdf9e227878','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('04d4d2c1-9ff5-4582-936a-c3085cf6f63e','afa9bd97-566c-46c7-bd9b-654782360c2b'),('079d02b0-bd87-45ac-9e6e-6b78df823a7d','afa9bd97-566c-46c7-bd9b-654782360c2b'),('15fc1637-6f7e-460d-8fbf-3e4f70fd4382','afa9bd97-566c-46c7-bd9b-654782360c2b');
/*!40000 ALTER TABLE `_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_extras`
--

DROP TABLE IF EXISTS `_product_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_extras` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_extras_AB_unique` (`A`,`B`),
  KEY `_Product_extras_B_index` (`B`),
  CONSTRAINT `_Product_extras_A_fkey` FOREIGN KEY (`A`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_extras_B_fkey` FOREIGN KEY (`B`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_extras`
--

LOCK TABLES `_product_extras` WRITE;
/*!40000 ALTER TABLE `_product_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `_product_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_images`
--

DROP TABLE IF EXISTS `_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_images` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_images_AB_unique` (`A`,`B`),
  KEY `_Product_images_B_index` (`B`),
  CONSTRAINT `_Product_images_A_fkey` FOREIGN KEY (`A`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_images_B_fkey` FOREIGN KEY (`B`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_images`
--

LOCK TABLES `_product_images` WRITE;
/*!40000 ALTER TABLE `_product_images` DISABLE KEYS */;
INSERT INTO `_product_images` VALUES ('60137bf1-42a4-40ec-90ab-5402128267cc','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('c4f0f5f3-dde5-4ef7-82df-308398f7e3bd','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('cf515cc6-9c65-48d6-99d8-0aad92b5a391','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('f036e909-c881-4d33-b168-9a10aaca2723','86bea4ff-bf9b-49e0-874f-ca0436391a62'),('abbea42e-47f8-4520-89a5-be50a379e331','afa9bd97-566c-46c7-bd9b-654782360c2b'),('ebba07c2-94b8-44ed-b410-3fa1084ee59a','afa9bd97-566c-46c7-bd9b-654782360c2b'),('f5e73b34-eea9-433f-b489-c846854c03dd','afa9bd97-566c-46c7-bd9b-654782360c2b'),('f8638306-0c58-456c-9c9e-aa2fc8e7da8d','afa9bd97-566c-46c7-bd9b-654782360c2b');
/*!40000 ALTER TABLE `_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_relatedproducts`
--

DROP TABLE IF EXISTS `_product_relatedproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_relatedproducts` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_relatedProducts_AB_unique` (`A`,`B`),
  KEY `_Product_relatedProducts_B_index` (`B`),
  CONSTRAINT `_Product_relatedProducts_A_fkey` FOREIGN KEY (`A`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_relatedProducts_B_fkey` FOREIGN KEY (`B`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_relatedproducts`
--

LOCK TABLES `_product_relatedproducts` WRITE;
/*!40000 ALTER TABLE `_product_relatedproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `_product_relatedproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_services`
--

DROP TABLE IF EXISTS `_product_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_services` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_services_AB_unique` (`A`,`B`),
  KEY `_Product_services_B_index` (`B`),
  CONSTRAINT `_Product_services_A_fkey` FOREIGN KEY (`A`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_services_B_fkey` FOREIGN KEY (`B`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_services`
--

LOCK TABLES `_product_services` WRITE;
/*!40000 ALTER TABLE `_product_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `_product_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_product_tags`
--

DROP TABLE IF EXISTS `_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_product_tags` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Product_tags_AB_unique` (`A`,`B`),
  KEY `_Product_tags_B_index` (`B`),
  CONSTRAINT `_Product_tags_A_fkey` FOREIGN KEY (`A`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Product_tags_B_fkey` FOREIGN KEY (`B`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_product_tags`
--

LOCK TABLES `_product_tags` WRITE;
/*!40000 ALTER TABLE `_product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tag_products`
--

DROP TABLE IF EXISTS `_tag_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tag_products` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_Tag_products_AB_unique` (`A`,`B`),
  KEY `_Tag_products_B_index` (`B`),
  CONSTRAINT `_Tag_products_A_fkey` FOREIGN KEY (`A`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_Tag_products_B_fkey` FOREIGN KEY (`B`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tag_products`
--

LOCK TABLES `_tag_products` WRITE;
/*!40000 ALTER TABLE `_tag_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tag_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_orders`
--

DROP TABLE IF EXISTS `_user_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_user_orders` (
  `A` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `B` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `_User_orders_AB_unique` (`A`,`B`),
  KEY `_User_orders_B_index` (`B`),
  CONSTRAINT `_User_orders_A_fkey` FOREIGN KEY (`A`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_User_orders_B_fkey` FOREIGN KEY (`B`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_orders`
--

LOCK TABLES `_user_orders` WRITE;
/*!40000 ALTER TABLE `_user_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `_user_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cart_userId_key` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `seoTitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoDescription` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoCanonical` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `caption` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Category_image_idx` (`image`),
  CONSTRAINT `Category_image_fkey` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('04d4d2c1-9ff5-4582-936a-c3085cf6f63e','special','Специальные предложения',NULL,1,'','','','2023-12-25 14:55:52.927','2023-12-25 14:55:52.927',''),('079d02b0-bd87-45ac-9e6e-6b78df823a7d','motornye-lodki-i-katera','Моторные лодки и катера','1938c8bc-a738-442c-a653-90200af83a21',1,'Моторные лодки и катера, алюминиевые, от производителя | ТАКТИКА  8-800-222-48-68 | Каталог','Купить моторную лодку, катер. Алюминиевую лодку от Российского производителя, низкие цены, с доставкой по всей России.','https://tactic-boat.ru/motornye-lodki-i-katera','2023-12-25 07:53:40.044','2023-12-25 07:53:40.044',''),('15fc1637-6f7e-460d-8fbf-3e4f70fd4382','popular','Популярные товары',NULL,1,'','','','2023-12-25 14:55:13.653','2023-12-25 14:55:13.653',''),('8f6429c1-d6fe-44f8-9688-31c4579ec4a9','lodochnye-motory','Лодочные моторы','447aafa9-bdb5-432c-886a-14f5136cdbb2',1,'Лодочные моторы для алюминиевых лодок купить | tactic-boat.ru','Лодочные моторы для алюминиевых лодок двухтактные и четырехтактные для лодки. Мощность от 3 л.с  до 300 л.с. Купить на официальном сайте. Tactic-boat.ru','https://tactic-boat.ru/lodochnye-motory/','2023-12-25 09:10:51.351','2023-12-25 09:10:51.351',''),('c77c3a1b-8177-42c9-b3d9-3bdf9e227878','kayutnye-katera/','Каютные катера','3678843c-f1b3-4daa-8575-9bcca6057adc',1,'Каютные катера Тактика купить у производителя | tactic-boat.ru','Каютные катера Тактика купить у производителя. Российские алюминиевые катера с каютой для рыбалки и отдыха. Выгодные цены. Варианты комплектаций. Доставка по России. Официальный сайт tactic-boat.ru','https://tactic-boat.ru/kayutnye-katera/','2023-12-25 17:09:36.213','2023-12-25 17:09:36.213','Каютные и кабинные катера'),('dd67c2ed-116f-46bf-b40e-5fb1ce93f95b','lodochnye-tenty','Прицепы и тенты','ff52489c-b854-4938-a789-f3d02a4b3310',1,'Лодочные прицепы и тенты на лодки Тактика | tactic-boat.ru','Лодочные прицепы и тенты для лодок Тактика купить у производителя.','https://tactic-boat.ru/lodochnye-tenty/','2023-12-25 09:04:12.702','2023-12-25 09:04:12.702','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriteslist`
--

DROP TABLE IF EXISTS `favoriteslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriteslist` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FavoritesList_userId_key` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteslist`
--

LOCK TABLES `favoriteslist` WRITE;
/*!40000 ALTER TABLE `favoriteslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriteslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `altText` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image_filesize` int DEFAULT NULL,
  `image_extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_width` int DEFAULT NULL,
  `image_height` int DEFAULT NULL,
  `image_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('1938c8bc-a738-442c-a653-90200af83a21','motornye-lodki-i-katera','',84052,'png',580,180,'c313abff-551f-4cd3-97ac-ee3c1c4893b8'),('3678843c-f1b3-4daa-8575-9bcca6057adc','kayutnye-katera','',140454,'png',662,442,'67a873b2-149e-4905-b503-681474f5a255'),('447aafa9-bdb5-432c-886a-14f5136cdbb2','lodochnye-motory','',43523,'png',138,270,'dd23fe28-2f0b-414c-a917-e5ab9a4b48bd'),('4a10a6e1-f10f-4d58-98f0-e09a68fcea7f','b','',30970,'jpg',600,450,'cc068497-3854-44fb-9549-c810f6702d20'),('60137bf1-42a4-40ec-90ab-5402128267cc','b4','',45422,'jpg',600,450,'71cb5746-0b6f-4c15-a467-acfc3e3b5b41'),('abbea42e-47f8-4520-89a5-be50a379e331','boat4','',34407,'jpg',600,450,'f4e31cd6-398f-4e91-b53e-e65b2f3ecd66'),('c4f0f5f3-dde5-4ef7-82df-308398f7e3bd','b2','',39517,'jpg',600,450,'85d4e9a2-b99d-4cc9-ad75-103f70d23eca'),('cf515cc6-9c65-48d6-99d8-0aad92b5a391','b1','',45592,'jpg',600,450,'e88d5a58-8b5f-4bb5-9a8f-3ec29cd710b9'),('d3448c80-68c4-43ef-bc15-c08ea22c4d4d','boat','',22977,'jpg',600,450,'85056a07-acb5-410f-b404-aaf8905d3ee2'),('ebba07c2-94b8-44ed-b410-3fa1084ee59a','boat3','',52527,'jpg',600,450,'59ee6e10-77f8-422b-8c4a-95a7957d69c1'),('f036e909-c881-4d33-b168-9a10aaca2723','b3','',104349,'jpg',800,750,'e27c22d0-88ca-4346-9e81-370dc6d5c1cb'),('f5e73b34-eea9-433f-b489-c846854c03dd','boat2','',37253,'jpg',600,450,'25b5c44f-bbf3-467d-8004-412d35a3a391'),('f8638306-0c58-456c-9c9e-aa2fc8e7da8d','boat1','',16742,'jpg',600,450,'496dea3f-5cb6-4339-90fb-dfa720f0131b'),('ff52489c-b854-4938-a789-f3d02a4b3310','lodochnye-tenty','',57635,'png',338,232,'73b44052-15e5-4567-ae23-d42d8ef53479');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` json DEFAULT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_user_idx` (`user`),
  KEY `Order_status_idx` (`status`),
  CONSTRAINT `Order_status_fkey` FOREIGN KEY (`status`) REFERENCES `orderstatus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Order_user_fkey` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price` int DEFAULT NULL,
  `oldPrice` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendorCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `balance` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `subCategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colorName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `colorCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `material` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `handlingType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sideHeight` double DEFAULT NULL,
  `transomHeight` double DEFAULT NULL,
  `overallLength` double DEFAULT NULL,
  `overallWidth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `loadCapacity` double DEFAULT NULL,
  `permissibleMotorPower` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deadriseAmidships` double DEFAULT NULL,
  `deadriseTransom` double DEFAULT NULL,
  `passengers` int DEFAULT NULL,
  `beadThickness` double DEFAULT NULL,
  `bottomThickness` double DEFAULT NULL,
  `specifications` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `properties` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoTitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoDescription` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoCanonical` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `clicks` int DEFAULT '0',
  `orders` int DEFAULT '0',
  `rating` double DEFAULT NULL,
  `ratings` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Product_link_key` (`link`),
  KEY `Product_image_idx` (`image`),
  KEY `Product_subCategory_idx` (`subCategory`),
  CONSTRAINT `Product_image_fkey` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Product_subCategory_fkey` FOREIGN KEY (`subCategory`) REFERENCES `subcategory` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('86bea4ff-bf9b-49e0-874f-ca0436391a62','Алюминиевая лодка Тактика 6.0 Hard Top',' Тактика 6.0 Hard Top — флагман верфи «Тактика» и предмет гордости для его владельца','Вашему вниманию представлен спортивный Тактика 6.0 Hard Top — флагман верфи «Тактика» и предмет гордости для его владельца. Максимальная скорость до 110 км/ч достигается с подвесным мотором в 150 л/с, Вам не будет равных на воде. Внушительные размеры и экстерьер показывают статус и престиж, высота борта обеспечивает Вашу безопасность. Жесткая крыша позволяет укрыться от дождя, а в знойную жару от палящего солнца.\n\nДля отдыха можно спокойно расположиться на носовой палубе, которая вмещает до 3 человек. Приятный естественный свет освещает каюту через большой потолочный люк и 2 световых окна',1400000,NULL,10000,'4a10a6e1-f10f-4d58-98f0-e09a68fcea7f','6.0 Hard Top',NULL,1,NULL,'','','alyuminievaya-lodka-taktika-6-0-hard-top','','','',850,640,600,230,600,800,'150',NULL,19,6,3,4,'','','Алюминиевая лодка Тактика 6,0 Hard Top купить от производителя tactic-boat.ru','','https://tactic-boat.ru/motornye-lodki-i-katera/alyuminievaya-lodka-taktika-6-0-hard-top','2023-12-25 17:06:37.739','2023-12-25 17:06:37.739',0,0,5,3),('afa9bd97-566c-46c7-bd9b-654782360c2b','Алюминиевая лодка Тактика 430','Алюминиевая лодка Тактика-430 предназначена для прогулок, рыбной ловли и охоты на реках и озерах.','Алюминиевая лодка Тактика-270 предназначена для прогулок, рыбной ловли и охоты на реках и озерах при волне с высотой не более 0,3 м. и температуре воздуха от -5° С до +40° С. Способами перемещения по воде могут являться как весла, так и подвесной мотор до 3 л/с.',252200,NULL,2500,'d3448c80-68c4-43ef-bc15-c08ea22c4d4d','т430рf',NULL,1,NULL,'','','alyuminievaya-lodka-taktika-270','Морской АМГ-5М',' Моторно-гребная лодка','Румпельное',350,380,270,100,30,150,'1-3',8,5,2,1.5,2,'','','Алюминиевая лодка Тактика 370','Алюминиевая лодка Тактика 370 купить у производителя. Моторно-гребная лодка под мотор 5-15 л.с. Длина 3.7 м, ширина 1.3 м. Грузоподъемность 300 кг. Румпельное управление. Доставка по России. Сайт tactic-boat.ru','https://tactic-boat.ru/motornye-lodki-i-katera/alyuminievaya-lodka-taktika-370','2023-12-25 07:01:50.549','2023-12-25 07:01:50.549',0,0,5,14);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `vendorCode` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `clicks` int DEFAULT NULL,
  `orders` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_image_idx` (`image`),
  KEY `Service_category_idx` (`category`),
  CONSTRAINT `Service_category_fkey` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Service_image_fkey` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `seoTitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoDescription` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seoCanonical` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `SubCategory_parent_idx` (`parent`),
  KEY `SubCategory_image_idx` (`image`),
  CONSTRAINT `SubCategory_image_fkey` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SubCategory_parent_fkey` FOREIGN KEY (`parent`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telegram` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `roleName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `house` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`),
  KEY `User_photo_idx` (`photo`),
  CONSTRAINT `User_photo_fkey` FOREIGN KEY (`photo`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('14bf03d7-b6c0-4d4a-a41e-7eb995e6100d','admin','admin@tb.ru','$2a$10$31ugSRLOsMkeRBErD3pehuHHCLa7MSbXHS/rjleRs6YjZTUYJtjsS','','',NULL,'','','','user','','','','','','','2023-12-21 14:03:49.410','2023-12-21 14:03:49.410');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-26 18:15:49
