-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for chat
CREATE DATABASE IF NOT EXISTS `chat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chat`;

-- Dumping structure for table chat.message
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_create` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `rd` bit(1) DEFAULT NULL,
  `auth_id` int DEFAULT NULL,
  `user1_id` int DEFAULT NULL,
  `user2_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9rmal80bnn8gff0si0g7kgnyh` (`auth_id`),
  KEY `FK497s3ysr2023nk2hpdvpjjnul` (`user1_id`),
  KEY `FKrn0o4i3ne4o6uprvmqglaw5bu` (`user2_id`),
  CONSTRAINT `FK497s3ysr2023nk2hpdvpjjnul` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK9rmal80bnn8gff0si0g7kgnyh` FOREIGN KEY (`auth_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrn0o4i3ne4o6uprvmqglaw5bu` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table chat.message: ~9 rows (approximately)
INSERT INTO `message` (`id`, `date_create`, `message`, `rd`, `auth_id`, `user1_id`, `user2_id`) VALUES
	(1, '2024-01-12 20:07:33.809000', 'hello word', b'0', 6, 6, 8),
	(2, '2024-01-13 09:13:26.945000', 'sdlkfewf', b'0', 5, 5, NULL),
	(3, '2024-01-13 09:34:46.500000', 'kjewewkj', b'0', 5, 5, NULL),
	(4, '2024-01-13 09:34:54.906000', 'rgjgke', b'0', 6, 6, NULL),
	(5, '2024-01-13 09:46:07.920000', 'hello', b'0', 6, 6, NULL),
	(6, '2024-01-13 09:46:11.862000', 'hello', b'0', 6, 6, NULL),
	(7, '2024-01-13 09:46:17.934000', 'cava', b'0', 8, 8, NULL),
	(8, '2024-01-13 11:01:50.195000', 'hello', b'0', 6, 6, NULL),
	(9, '2024-01-13 11:02:03.878000', 'bonjour', b'0', 7, 7, NULL),
	(10, '2024-01-13 11:08:58.663000', 'fgg', b'0', 6, 6, NULL);

-- Dumping structure for table chat.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table chat.user: ~5 rows (approximately)
INSERT INTO `user` (`id`, `email`, `gender`, `image`, `name`, `password`) VALUES
	(1, 'knknkj', 'M', '', 'jknkj', 'jkjjkk'),
	(5, 'mywem@mailinator.com', 'M', 'Default\\M.jpg', 'Price Mccoy', 'Pa$$w0rd!'),
	(6, 'wawyvuvaku@mailinator.com', 'M', 'Default\\M.jpg', 'Nina Watson', 'Pa$$w0rd!'),
	(7, 'wubiqezyby@mailinator.com', 'F', 'Default\\F.jpg', 'Xyla Aguirre', 'Pa$$w0rd!'),
	(8, 'pedamasur@mailinator.com', 'F', 'Default\\F.jpg', 'Chancellor Hansen', 'Pa$$w0rd!');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
