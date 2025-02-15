CREATE DATABASE  IF NOT EXISTS `genie` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `genie`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: genie
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `genie_id` varchar(100) NOT NULL,
  `genie_pwd` varchar(100) NOT NULL,
  `ROLE` varchar(100) NOT NULL,
  `withdrawal` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','ADMIN',1),('seller','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','SELLER',1),('seller_bearbrick','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','SELLER',1),('seller_lego','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','SELLER',1),('user','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','USER',1),('user_kim','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','USER',1),('user_lee','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','USER',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_num` int NOT NULL AUTO_INCREMENT,
  `genie_id` varchar(100) NOT NULL,
  `receiver_name` varchar(45) NOT NULL,
  `receiver_tel` varchar(100) NOT NULL,
  `receiver_zipcode` varchar(100) NOT NULL,
  `receiver_addr` varchar(500) NOT NULL,
  `receiver_detailaddr` varchar(500) NOT NULL,
  PRIMARY KEY (`address_num`),
  KEY `fk_user_copy1_user1_idx` (`genie_id`),
  CONSTRAINT `fk_user_copy1_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (41,'user','김유저','010-1234-4321','05644','서울 송파구 가락로34길 3','디테일한 상세주소');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administer`
--

DROP TABLE IF EXISTS `administer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administer` (
  `genie_id` varchar(100) NOT NULL,
  `administer_name` varchar(100) NOT NULL,
  `administer_phone` varchar(100) NOT NULL,
  `administer_email` varchar(150) NOT NULL,
  `writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`genie_id`),
  UNIQUE KEY `administer_email_UNIQUE` (`administer_email`),
  KEY `fk_administer_account1_idx` (`genie_id`),
  CONSTRAINT `fk_administer_account1` FOREIGN KEY (`genie_id`) REFERENCES `account` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administer`
--

LOCK TABLES `administer` WRITE;
/*!40000 ALTER TABLE `administer` DISABLE KEYS */;
INSERT INTO `administer` VALUES ('admin','관리자','010-1234-1234','admin@naver.com','2022-09-30 10:26:36');
/*!40000 ALTER TABLE `administer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_num` int NOT NULL AUTO_INCREMENT,
  `genie_id` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  `cart_price` int NOT NULL,
  `cart_qty` int NOT NULL,
  `cart_writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_num`),
  KEY `fk_cart_user1_idx` (`genie_id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,'user_kim',95,69900,1,'2022-09-30 14:17:42'),(27,'user_kim',125,838006,1,'2022-10-05 15:39:26'),(40,'user_kim',84,100,1,'2022-10-06 16:44:59');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` varchar(45) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_category_eng` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1','생일','birth'),('10','키덜트','kidult'),('11','요리','cook'),('12','홈파티','home'),('2','기념일','anni'),('3','명절','hday'),('4','집들이','house'),('5','서프라이즈','surprise'),('6','응원','cheer'),('7','캠핑','camping'),('8','반려동물','pet'),('9','운동','exer');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `genie_id` varchar(45) NOT NULL,
  `product_id` int NOT NULL,
  `inquiry_title` varchar(45) NOT NULL,
  `inquiry_content` varchar(45) NOT NULL,
  `inquiry_status` varchar(45) NOT NULL,
  `inquiry_writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_inquiry_user1_idx` (`genie_id`),
  CONSTRAINT `fk_inquiry_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myorder`
--

DROP TABLE IF EXISTS `myorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myorder` (
  `order_num` varchar(100) NOT NULL,
  `genie_id` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  `recipient_name` varchar(45) NOT NULL,
  `recipient_phone` varchar(30) NOT NULL,
  `recipient_address` varchar(255) NOT NULL,
  `recipient_request` varchar(100) NOT NULL,
  `recipient_delivery_status` varchar(100) NOT NULL DEFAULT 'delivery_prepared',
  `order_price` int NOT NULL,
  `order_qty` int NOT NULL,
  `order_writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(45) NOT NULL DEFAULT 'card',
  KEY `fk_order_user1_idx` (`genie_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myorder`
--

LOCK TABLES `myorder` WRITE;
/*!40000 ALTER TABLE `myorder` DISABLE KEYS */;
INSERT INTO `myorder` VALUES ('imp_898453201212','user',2,'김유저','010-1234-4321','서울 송파구 가락로34길 3, 디테일한 상세주소','1234','delivery_prepared',100,1,'2022-10-12 17:47:47','card'),('imp_898453201212','user',1,'김유저','010-1234-4321','서울 송파구 가락로34길 3, 디테일한 상세주소','1234','delivery_prepared',100,1,'2022-10-12 17:47:47','card');
/*!40000 ALTER TABLE `myorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `genie_id` varchar(100) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_tag` varchar(200) NOT NULL,
  `product_name` longtext NOT NULL,
  `product_price` int NOT NULL,
  `product_info` longtext NOT NULL,
  `product_stock` int NOT NULL DEFAULT '0',
  `product_quantity` int NOT NULL DEFAULT '0',
  `product_hit` int NOT NULL DEFAULT '0',
  `product_like` int NOT NULL DEFAULT '0',
  `product_writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_image1` longtext NOT NULL,
  `product_image2` longtext NOT NULL,
  `product_image3` longtext NOT NULL,
  `product_mbti` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_seller1_idx` (`genie_id`),
  CONSTRAINT `fk_product_seller1` FOREIGN KEY (`genie_id`) REFERENCES `seller` (`genie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'seller','생일','친구/지인,감사,10대이하,여성','헤라 센슈얼 쉬어 스테인 \"미니쿠션 증정\"',100,'선물받는 분의 각인 가능한 맞춤형 틴트',100,100,30,0,'2022-09-26 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220518150446_947a008391e749c787c27ec6fabb9982.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220329103530_3258651847f0459db4dd48f078b46b99.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220329103533_6ebefaf5adc84ed486d4fb743551c21b.jpg','I'),(2,'seller','생일','친구/지인,감사,10대이하,여성','록시땅 샤워 젤 250ml (12종 중 택1)',100,'싱그러운 자연스러운 향이 몸과 마음을 힐링시켜줍니다',100,100,53,0,'2022-09-27 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810094325_b59a2d07323e4360bbaea5550f78d172.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810094329_00f04b4495b74b2fbcca655f35a121ae.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810094333_0cdc700cdff84de79ea9e489306c5ce5.jpg','I'),(3,'seller','생일','친구/지인,감사,10대이하,남성','부드럽고 촉촉한 식감의 오설록 녹차 치즈케이크',29800,'오설록의 대표 케이크인 녹차케이크',100,100,43,0,'2022-09-28 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220726174850_0503f5e257c94063a7898d5fc4b97584.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220526131302_2481c5d8dc914b6595b9caf56fb516e8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220526131254_db5f2dab2989476cb69872a5b735acbb.jpg','I'),(4,'seller','생일','친구/지인,감사,10대이하,남성','\"면역력 증진\" 정원삼 6년근 고려홍삼정 365스틱 30포 + 3포 증정',20000,'면역력에 좋은 삼으로 만든 식품',100,100,6,0,'2022-09-29 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220822161205_ebd985ebc3f34c9d972df791b04f6bc5.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220822161209_ac2277523c5143089dee60bab336bd62.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220822161213_f75cbd66614e49fb9d2c545de0242af2.jpg','I'),(5,'seller','생일','친구/지인,감사,10대이하,남성','\"에너지 선물\" 정관장 활기력 20ml x 10병',29000,'부모님들이 좋아하는 에너지음료',100,100,1,0,'2022-09-30 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211125165452_f27943eecfa340b084ea08778cc7d47e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211125165449_f3b307d39af64bd79f0b51eaa62b0328.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211125165428_fdfc769f71774ab88cf55e3d8f18e7e7.jpg','I'),(6,'seller','생일','친구/지인,감사,10대이하,여성','입생로랑1위 벨벳틴트세트(+리브르 1.2ml 향수) \'톡별\'',49000,'입생로랑 베스트 아이템 틴트',100,100,2,0,'2022-10-01 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220304103018_7cef90537390461eb00fefb501a9e79f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220304103022_af8aecb8f5664544b61275d5a41bb467.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220304103022_af8aecb8f5664544b61275d5a41bb467.jpg','I'),(7,'seller','생일','친구/지인,감사,10대이하,여성','멀티밤',29400,'다양하게 사용가능한 멀티밤',100,100,2,0,'2022-10-02 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220823210114_1cdcf156eadc490f80bfb6ee539fbfec.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220412165113_132e7b5c88ce4d6496f718f7c9bc8784.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220412165119_d7b6b90454b04ea2a580db04fd12c418.png','E'),(8,'seller','생일','친구/지인,감사,10대이하,여성','NEW 디올 어딕트 립스틱',51000,'여성들의 원픽 듣기만해도 좋아하는 디올립스틱',100,100,1,0,'2022-10-03 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220901115154_b4b3ff352de74b2ab90908affd0ed381.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220901115159_5bda0611f252415fb67bc70a49092fd9.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220901115207_d30f1ae6e70f4e4faef7e4bb19f13ab1.jpg','E'),(9,'seller','생일','친구/지인,감사,10대이하,여성','짱구 라인쿠션 유리토끼',22500,'귀여운 짱구캐릭터가 들어가 있는 무션',100,100,1,0,'2022-10-04 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FBCnRSES86yRRnuV5bZBq_Q%2FvH3fmR20EttcOvhI9haPizHosXFZnhyCRlpk65ESsbI.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FBCnRSES86yRRnuV5bZBq_Q%2FHrxT_niDjzvHaRl382aHclvpwaNI4cXDgywlgziLJSs.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FBCnRSES86yRRnuV5bZBq_Q%2FHrxT_niDjzvHaRl382aHclvpwaNI4cXDgywlgziLJSs.jpg','E'),(10,'seller','생일','친구/지인,감사,10대이하,여성','바디오일 & 우드 괄사 세트 (4종 중 택1)',35000,'피부에 보습을 더하는 바디오일',100,100,1,0,'2022-10-05 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825110527_d6909dbacad44cf18c43ef5d429d71ee.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825110545_268adc9e86644cadb31b913d8bde0bf0.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825110549_b16b0cbe9112417e97994d64ad061e99.jpg','E'),(11,'seller','생일','친구/지인,감사,10대이하,남성','2가지 불빛 미니조명 렉슨미나 S사이즈',37600,'아크릴 소재로 가볍고 깨끗한 빛을 전달해주는 무드등',100,100,1,0,'2022-10-06 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210806134750_2c04cabccf46404381d5e82c89bcac4f.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211216105646_b440fde9ed4b42678be9c7047f0641d8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210909164239_30d3ef3726224667b22cdd7692b6a67d.jpg','E'),(12,'seller','기념일','연인,백일,20대,남성','네스카페 돌체구스토 캡슐 커피머신 인피니시마 + 스벅 캡슐1BOX + 스벅 머그컵',89900,'우리집 안에 스타벅스',100,100,1,0,'2022-10-07 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220812173150_68a624f0fdd3431b870c71f563302799.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220420095231_86fdde641c4e4902b43d88af884cc3f3.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220420095231_86fdde641c4e4902b43d88af884cc3f3.jpg','I'),(13,'seller','기념일','연인,백일,20대,남성','\"레트로 감성 폭발\" 인사이디 블루투스 LP 턴테이블',69900,'모든사이즈의 LP재생을 가능하게 해주는 오디오 플레이어',100,100,1,0,'2022-10-08 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220726162534_f013a8e8a75548be88025497af10a20a.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220726162828_714952d93eff4b23a366eaddb0412d25.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220726162828_714952d93eff4b23a366eaddb0412d25.jpg','I'),(14,'seller','기념일','연인,백일,20대,남성','크리넥스&스카트 실속있는 7종 선물세트 (톡별)',29900,'닦을 때 다른느낌을 주는 최고급 휴지입니다.',100,100,1,0,'2022-10-09 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220720154020_8df8e7ee27ef4a8a98af15ca5e7d291d.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220720154022_83bb46ee638c420ebbe1508cad9b1b0b.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220720154022_83bb46ee638c420ebbe1508cad9b1b0b.jpg','I'),(15,'seller','기념일','연인,백일,20대,남성','우주비행사 오로라 은하수 무드등 LED조명',33900,'수면에 도움을 주는 힐링조명',100,100,1,0,'2022-10-10 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211224125016_7be9ff8b61af478b8d80bb5b3dc6fe5c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211224125030_a6fd3cd6514242d2b6d8c18710d003ac.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211224125042_16a00e965adb40b182ae394b82f7156b.jpg','I'),(16,'seller','기념일','연인,백일,20대,남성','홈카페컵 유리컵 2인조 선물세트(유리컵2+우드소서2+스푼2+엽서)',33900,'방구석 바리스타를 위한 최고의 선물',100,100,1,0,'2022-10-11 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210218143616_0e91f8a1ee3f41f1b234a8eaa5878d0e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210218143619_2d50be388d20479d9edda4246dfd8311.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210218143624_f634b438d4fa47f7844a59e3a76767af.jpg','I'),(17,'seller','기념일','연인,백일,20대,여성','패브릭 10W QI 고속 무선충전 무드등 알람시계',47900,'충전, 무드, 시계 다방면으로 쓸 수 있는 합리적인 아이템',100,100,1,0,'2022-10-12 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210601102158_d91eb16e2be24d66abec414ac9b32979.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210601102201_a11904ea243a44d290e561e8c34b64d9.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210601102204_ca1d6e3d70cf460b9a84ebc15ef6866e.jpg','I'),(18,'seller','기념일','연인,백일,20대,여성','스누피 리버 10장',39000,'고급 면을 사용한 명품 송월타올',100,100,1,0,'2022-10-13 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210121175410_79ddf82e75fa481ba9fa828c4fe52e40.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210121175414_90d8e6ffde7a476bbded0d6fb8b9d4dd.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210121175414_90d8e6ffde7a476bbded0d6fb8b9d4dd.jpg','E'),(19,'seller','기념일','연인,백일,20대,여성','\"귀엽게 완성되는 브런치 한상\" 스누피 레트로 토스터기',44900,'바쁜 아침을 위한 최고의 선택',100,100,1,0,'2022-10-14 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220818150949_c0283938baea4e3e9ec283d716652956.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210309112955_4864f5cc7d7549478b1cb48710c11ce3.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210309112936_2dc5870c87524c8b9c4b7c0d1385e23a.jpg','E'),(20,'seller','기념일','연인,백일,20대,여성','코코도르 프리즘 워머 + 프리미엄자 캔들 향초 세트 (미세 빛조절 가능)',25900,'저녁에 은은한 불빛을 내어 무드를 형성합니다',100,100,1,0,'2022-10-15 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220221144442_b2a9e6ac135f48f08a9c56f9e6c38026.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220221144447_d42b65ec384340cb8b7844fc90225ece.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220221144453_3e4444c413e941f99436ea8e9548ea21.jpg','E'),(21,'seller','기념일','연인,백일,20대,여성','홈카페 선물세트 플리츠 내열 유리컵 2인조(유리컵2+코스터2+머들러2+엽서) 외 5종',24900,'카페에 온듯한 느낌을 낼 수 있는 취미용 홈카페웨어 입니다.',100,100,1,0,'2022-10-16 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220525144751_0d9c1b56ca9f4861a1c47b4370f18f79.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220317104849_9c3d2d433afb4e5fa0f562d4e3d34a39.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220406140721_b7a61f0f238040c49ae6f8cb0247b29d.jpg','E'),(22,'seller','기념일','연인,백일,20대,여성','휘릭 맥주거품기 맥주서버 가정용 생맥주기계 술 디스펜서 (스탠드 블랙)',49000,'우리집 분위기를 호프처럼 휘릭휘릭',100,100,1,0,'2022-10-17 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220125125302_cc5304637403433f9824d7ec7f59947e.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220125125306_3293d2d9698045389f2d71e73da38483.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220125125323_9327c1913bd44ace9663c6209357339b.jpg','E'),(23,'seller','명절','가족/친척,감사,60대이상,남성','1+등급 횡성한우 선물세트 구이 1.15kg (등심+안심+채끝+특수부위)',227000,'최고급 한우를 집에서 받아보세요!',100,100,1,0,'2022-10-18 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517110133_2986d28d79204a23a795351cef3eef68.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517110155_9497d9473589407685b6554ca1c31636.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517110201_bc41495191e0402ea9df91c651cfee70.jpg','I'),(24,'seller','명절','가족/친척,감사,60대이상,남성','클럭 스트레칭 마사지기 | 전신 마사지기 부모님 효도 선물',305000,'몸이 뻐근하신 직장인들에게 강추!',100,100,1,0,'2022-10-19 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220704180834_c28687c95ac842c5b366ad2ee0e00cfa.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220704180839_f2db8ca4008a4f2fbf0918fe65dac619.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220704180843_33b03d0c869044ca9ec2ffe36bcf088b.jpg','I'),(25,'seller','명절','가족/친척,감사,60대이상,남성','\"에너지 선물\" 정관장 활기력 에너지박스(20ml*20병) 특별한 선물 스탠드형',42350,'부모님들을 위한 보양 선물',100,100,1,0,'2022-10-20 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210914165131_70edddb11adf42b9990c00dbc256e159.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210915151417_0a7f390a91c44b1eab7199e17e6d34a1.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210915151428_26d08d6429df4f899c32a6440ffaabe8.jpg','I'),(26,'seller','명절','가족/친척,감사,60대이상,남성','60일간 정성껏 말린 상주 명품곶감',37900,'직접 재배한 감으로 전통방식을 이용해 만든 고급선물',100,100,1,0,'2022-10-21 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220103140225_d9795bcd1a254b19afb775a418496e4e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211228172618_2d006c65b31740759e62a1cbc24b426f.jpg','','I'),(27,'seller','명절','가족/친척,감사,60대이상,남성','[웨지우드 단독] 르네상스골드 4피스 브런치세트',287000,'웨지우드 단독 럭셔리 테이블웨어',100,100,1,0,'2022-10-22 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210224125145_7d3b8d3626c34af1be2beedc08585983.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210224125151_a11af2d630f3459fb1d4d4b963b6e6d7.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210224125159_fc64617326a74c91bd0a450b2ad0dd03.jpg','I'),(28,'seller','명절','가족/친척,감사,60대이상,여성','알로코리아 저주파 목 어깨 마사지기 전기 전신 안마기',39900,'누워만 있어도 몸을 가볍게 만들어 줍니다.',100,100,1,0,'2022-10-23 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220822153707_6ab779237bfa423aba64e7a671dc3a1f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210325180505_31b652473e194f15b6244aae8ba541c3.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210325180513_2b5cdb0ab829447ca3396f4d8957ac03.jpg','E'),(29,'seller','명절','가족/친척,감사,60대이상,여성','6년근 고려홍삼정 투데이골드스틱 100포/쇼핑백 증정',39900,'체력이 부족한 당신을 위해',100,100,1,0,'2022-10-24 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220713133832_0f3c3ddb581e4037bf7b53f778263b4e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220114130331_c6c14ad3a56e4c3f88902167ea74a1a0.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220114130336_9d1e38bf3ec5448b98cd36f1102d7778.jpg','E'),(30,'seller','명절','가족/친척,감사,60대이상,여성','농협안심한우 1등급 \"갈비의 정석\" 구이세트',49900,'한우를 합리적인 가격에 만나보세요!',100,100,2,0,'2022-10-25 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220628200327_1e779d3c3f204cc4a4c1a26cc7b87ba8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220628201213_f5dd99b77461451081626ea9bc1be299.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517100533_31cd8a6a183e4c87829446f60f1e24b7.jpg','E'),(31,'seller','명절','가족/친척,감사,60대이상,여성','\"명품 비타민\" 오쏘몰 이뮨 멀티비타민&미네랄 7입 (동아제약 공식 직수입) + 쇼핑백',38000,'즐거운 하루를 보내는 연료입니다',100,100,1,0,'2022-10-26 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220829102049_4dbb14775a4140bc9931f69e3bccf22d.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220829102103_1173156381fd4425ab689c2461771970.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220829102103_1173156381fd4425ab689c2461771970.jpg','E'),(32,'seller','명절','가족/친척,감사,60대이상,여성','삼성 갤럭시 워치5 Small 40mm',278070,'당신의 페이스대로 꾸미는 워치페이스!',100,100,1,0,'2022-10-27 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220823131801_1be8f22adbe04b12abea9e42b83906af.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220812180427_94c6873ad162405cb24f37901df9f298.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220812180430_f88d68a283f1439880cb0d0c98097b28.jpg','E'),(33,'seller','집들이','회사동료,출산,30대,남성','불멍 미니화로 에탄올램프',23900,'집콕도 즐거워지는 나만의 작은 불멍 즐기기',100,100,1,0,'2022-10-28 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220215101816_0731944993bf43a78e5ca4e4f38cab73.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220114170744_28722845487e413f9e7632c709cbad9e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211220172756_dcc84a0f8a3a4995bf7f19efcd9e2084.jpg','I'),(34,'seller','집들이','회사동료,출산,30대,남성','오둥이 모찌 바디필로우',29800,'부드럽고 쫀득한 쿠션감 최고 바디필로우',100,100,1,0,'2022-10-29 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211105165653_b0c71262ca5a444c86672e9b5c7c3240.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211105170845_fbf124ceeab14a5b9183b0d48e53e8c4.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211105170848_a4ca74bd3186453d8f31b8e2a43a17c5.jpg','I'),(35,'seller','집들이','회사동료,출산,30대,남성','감성 머그잔',26900,'모던함과 고급스러움을 담은 감성 머그잔',100,100,13,0,'2022-10-30 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220808080031_77bbf738ae9643b8bb2a1bac76286701.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220808080031_77bbf738ae9643b8bb2a1bac76286701.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220427154620_f555f6d173d845219146cad5f284ccbc.jpg','I'),(36,'seller','집들이','회사동료,출산,30대,남성','초승달 무드등',31900,'밤하늘의 초승달이 내 공간으로',100,100,6,0,'2022-10-31 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220615091417_4f7483ec7b104d01a58285bf7996a321.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220615091424_73fd8dfb67dd455a892f394c6ba4b245.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220701162800_ae0c719fe1ca4eca81dbd55d02e8df84.jpg','I'),(37,'seller','집들이','회사동료,출산,30대,남성','턴테이블 전자 디퓨저세트',45600,'감각적인 인테리어와 놀라운 발향력',100,100,1,0,'2022-11-01 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220518101855_b7d00d98d08341bb86947e3f54563bab.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220518101912_ed5d1a6524754b3f8d809db09418fa41.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220518101921_820d368d4ad04c78bbf1dfcc6e664eb8.jpg','I'),(38,'seller','집들이','회사동료,출산,30대,여성','플렌테리어 식물 무드등',57900,'자연친화적인 식물 인테리어 조명',100,100,1,0,'2022-11-02 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220314093540_c35b3f64d72c4fcea50adddc4a6fa64d.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220113103527_15816361672c433da53e238a6474b42f.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220113103743_d44cb33178d944d2804b9a58b07400dc.png','E'),(39,'seller','집들이','회사동료,출산,30대,여성','플렌테리어 식물 무드등',11900,'귀여운 비숑 러그로 공간에 포근함을 더하기',100,100,1,0,'2022-11-03 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220322111746_3b95e11b546e434a975172bf42cd2185.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220322111752_69bd5469399f49d982ec8641589ae1db.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220322111759_3078cf5f636a419899d60283fbc19b05.jpg','E'),(40,'seller','집들이','회사동료,출산,30대,여성','플렌테리어 식물 무드등',166000,'작아진 크기, 그 이상의 커피 경험',100,100,1,0,'2022-11-04 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220802094240_313d218cf84a4625ab8bd928b7ea0c7c.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FGOAEJdjnB-tnxjgwcS3SLQ%2FiTGmL8BwVQfGab6_m3o-HNoi2I_DEnlJCpyI4MJ-3TM.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FGOAEJdjnB-tnxjgwcS3SLQ%2Fneh_tJoGYNHIuPFXUmrbHgiJo5LtG6PCkpWEkIWsikc.jpg','E'),(41,'seller','집들이','회사동료,출산,30대,여성','플렌테리어 식물 무드등',30000,'바른 양치 습관 도우미',100,100,1,0,'2022-11-05 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211021174316_f975185efd5c4714820bfe7f962f9b2c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211021174320_6eac9a81056a4be39e53407bc91bc619.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211021170550_5a1a4aa6fbd343f095435e11575d744d.jpg','E'),(42,'seller','집들이','회사동료,출산,30대,여성','플렌테리어 식물 무드등',18500,'귀엽고 트렌디한 스타일의 테디베어 트레이',100,100,1,0,'2022-11-06 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210611141253_3aa9602d7f8449479c65e13256f0dbfe.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210611141257_e838a058670c426caabe758e58945d91.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210611141302_71bf0228b9174eed9a2c2840aeb7721a.jpg','E'),(43,'seller','서프라이즈','스승/멘토,임신,50대,남성','\"NEW 소주메이트\" 수고한 당신을 위한 혼술, 로이체 자동 소주 디스펜서+소주잔 (톡별)',25900,'재미와 편리함, 실용성까지 갖춘 술자리 인싸템',100,100,1,0,'2022-11-07 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913132106_792204986f9c47628ef4860aa20dadbb.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220718161539_7c60444eeb7e45fdaf086b0d186398b9.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220718161551_6bc66e2d89054019973a92f568926c1a.jpg','I'),(44,'seller','서프라이즈','스승/멘토,임신,50대,남성','알럽하우스 대형소주잔 한방울잔 2P (+오광엽서1장)',9800,'sns업로드 인기템',100,100,1,0,'2022-11-08 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220823111324_cd9ca4cc39fa48b5895d9e3a9ecf3fef.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200404080838_c22f86f459c44aa1ae1954a342b966f9','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200404080839_20e93a35e77f487784f9d70103f58c93','I'),(45,'seller','서프라이즈','스승/멘토,임신,50대,남성','순천참한우 1등급',119000,'한우 1등급 신선하고 품질 좋은 순천 참한우1.2kg (등심600g+안심300g+채끝300g)',100,100,1,0,'2022-11-09 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220516161136_59f54b001cc04f82beab685a41b29c41.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220105105207_973bb2732bad4c32abe12fece8bfe31c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220112141743_72f9bdb34f8b485c932bca0ba5724a6b.jpg','I'),(46,'seller','서프라이즈','스승/멘토,임신,50대,남성','[1+1/총2개] 아이르 5mm 고밀도 극세사 밍크담요 2개 (19종택1)',38000,'보들보들 밍크 극세사 담요 소형/대형/케이프담요 2장씩 한정수량특가',100,100,1,0,'2022-11-10 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220831122015_944c1df145d44cab88a6303c636bb181.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220831122104_8b2eb4816fcb4eeeb6196872e69e173f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220831122037_44c9272110584ccc8055ce7895461289.jpg','I'),(47,'seller','서프라이즈','스승/멘토,임신,50대,남성','바디워시',43000,'4가지 비의 이야기를 담고있는 바디워시',100,100,2,0,'2022-11-11 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913075524_c984348ae5a4461fa2b6059088ed33c6.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913075528_293db9a29f254e3e83424b982d88f456.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913075546_d11b9a5070fb4fe085ff34e4eef72ba9.jpg','I'),(48,'seller','서프라이즈','스승/멘토,임신,50대,여성','농협안심한우 소한마리 한우선물세트 1등급 1.4kg',119000,'농협 안심한우로 그 이상의 가치를 전하세요',100,100,1,0,'2022-11-12 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517095030_3f2729417cae4279be3a27a52ae1919c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517095557_bf5cebdf99104ffd8dd6d42a0f9d198f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220517095600_b3ff5f7a55074c47a02666e6b0501cf2.jpg','E'),(49,'seller','서프라이즈','스승/멘토,임신,50대,여성','갈비살 300g+부채살 300g 외 3종',29900,'넉넉하게 소고기를 선물하세요. 2팩구서응로 넉넉하게 소고기를 드실 수 있습니다.',100,100,1,0,'2022-11-13 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220804095158_f8ff9f54afb743fb86229c3043f93ff2.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200402150346_9cdba64a9cb04f6c8f353d65a70db62f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200402150356_33b00b99637842a38b8654f5e371f406.jpg','E'),(50,'seller','서프라이즈','스승/멘토,임신,50대,여성','(손가락+손바닥+손등+팔목) 제스파 에어블레스 공기압 손마사지기 온열 안마기 (ZP1910/ZP1911)',59900,'부위별 맞춤 안마기 전문 브랜드 제스파로 건강선물 하세요!',100,100,1,0,'2022-11-14 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220811162040_2d622c49668f406da0f410d269790b4f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210127090437_57db3761cb9c422396ad09727feaad13.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210127090445_b371613dd2394e26beb1b0bbeb8c085b.jpg','E'),(51,'seller','서프라이즈','스승/멘토,임신,50대,여성','\"쓴산필\" 쓴술 산소호흡이 필요할때, 크리비 브리딩 소주 에어레이터(톡별)',34900,'오늘따라 더 쓴 술, 술폐소생 시키는 쓴산필 브리딩 에어레이터',100,100,1,0,'2022-11-15 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210608162300_b92c62bdb325418ba788746b8deb2b68.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007175703_6b356fce684649ba9c41a00cb2f6788b.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007175706_d0d1fd660f924c1b94fc3902c0699144.jpg','E'),(52,'seller','서프라이즈','스승/멘토,임신,50대,여성','[선물추천/리뷰 이벤트] 알로코리아 저주파 목 어깨 마사지기 전기 전신 안마기',39900,'단, 15분으로 하루의 피로를 시원하게!',100,100,1,0,'2022-11-16 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913134132_31e79957613d43048d02c456f158c949.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210325180505_31b652473e194f15b6244aae8ba541c3.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210325180510_db5ab72b2dac4120aab805005b440f55.jpg','E'),(53,'seller','응원','친구/지인,위로,10대이하,남성','[기분 좋은하루] 해-삐! 상큼한 딸기가 그대로 쏙! 잔망루피 딸기크림떡',16400,'딸기과즙 팡팡! 맛있는 선물 잔망루피 딸기크림떡',100,100,2,0,'2022-11-17 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220512103156_4b57bf5bc8c342c2b53c51ec3011bcb8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220512103201_ad0acb2d0cad4b68beea9312cde6f5b7.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220503112147_c259ead731a7461ebb3abd6aaec18900.jpg','I'),(54,'seller','응원','친구/지인,위로,10대이하,남성','\"너만을 위한 미니편의점\" 27종 종합과자선물세트 [간식대장 mini]',29900,'바삭함도 든든함도 상큼함과 달콤함까지 뭘 좋아할지 몰라 다 - 준비했어요',100,100,1,0,'2022-11-18 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20221005093319_4cc03d350a5c46c0af17d0b798e9ebe6.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220915113714_3dec5d4acd3a41d7bb64463205a50705.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220915113718_b1cdb1d8f4f44bb7b20908445cd2c365.jpg','I'),(55,'seller','응원','친구/지인,위로,10대이하,남성','레모나프렌즈 카카오 레모나산 하트캔 (2g x 70포)/닥터유 구미&선물용 쇼핑백증정!',16900,'레모나로 감사의 마음을 전하세요 피로회복에 효능, 기미,주근깨 완화, 병중,병후에 섭취 시 건강 회복에 도움',100,100,1,0,'2022-11-19 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20221005083753_ec69f09743654bd088c3e12b0d0f1b30.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210715125050_0086649b37204e4f9090ac85fd213406.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210715125053_bfb67c74ea394978834d52f3fe09e1c5.jpg','I'),(56,'seller','응원','친구/지인,위로,10대이하,남성','디디얌 수제 뚱카롱(마카롱) 12구 세트',23900,'디디얌 인기 뚱카롱 12가지를 선정하여 만든 세트',100,100,1,0,'2022-11-20 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220322003507_c371ba8f5f50440f9f10f3bf05003dff.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201020202136_98f004cf9a83446ba62b5fe24f79e217.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201020202648_ea9a3070b6e84f37b940564e9b5ee717.jpg','I'),(57,'seller','응원','친구/지인,위로,10대이하,남성','힘내라 홍삼정 For You 10mlx30포 (리뉴얼ver)',15900,'국내산 6년근 100% 홍삼과 안심하고 먹을 수 있는 부원료',100,100,1,0,'2022-11-21 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220704112235_ef39e34997604b399b2ad297e21c78db.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210421134108_d260096c578241c8a74c0d24d3d3bbeb.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210421134111_72272a3979834c45b5e186c92f224616.png','I'),(58,'seller','응원','친구/지인,위로,10대이하,여성','영원히 기억될 시간\' 로즈골드 메쉬시계 + 데이지 팔찌세트 (톡별) (LL2G20332IGG)',49900,'당신의 소중하고 행복한 시간을 담길 바라는 마음을 메시지에 담았어요. 항상 행복하고 좋은 일만 당신 곁에 있길 바라는 메시지를 담은 시계가 당신의 소중한 시간을 영원히 간직해 줄거에요.',100,100,1,0,'2022-11-22 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220218094416_b93aaf1f46e04c47a6686ee9bbe39eae.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220218094420_25eeec2c70824a9fa6632e28c36bb487.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220218094424_ade89ae303dd43458f83ae75766b70b7.jpg','E'),(59,'seller','응원','친구/지인,위로,10대이하,여성','파베 수제 생초콜릿 (밀크/다크)',15900,'애니베이크의 파베 초콜릿은 달콤쌉싸름함과 부드러움이 한껏 살아있는 생 초콜릿입니다.',100,100,1,0,'2022-11-23 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210629162439_9a5a67a2cf7a43a598ebd2976d4de981.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210629162447_120d4467faac4609a9cca19ecaba78e0.png','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210629162523_25238b61360349a484b32269812f0748.png','E'),(60,'seller','응원','친구/지인,위로,10대이하,여성','시그니쳐 수제초콜렛 선물세트 20입',26500,'꼬모쏌쁘레 시그니쳐 초콜릿은 초콜릿마스터의 특별한 레시피로 만들어진 프랄린 초콜렛으로 초콜릿 애호가들에게 꾸준히 사랑받고 있습니다. 특별한 날 ,특별한 이에게 달콤함을 더해줄 초콜릿으로 여러분의 품격을 선물하세요.',100,100,1,0,'2022-11-24 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210310085444_59d4a7b508724270ae130a877ccabc8f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210310085451_1b710e83d5e74b0aafb5f926e28b9f2d.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210310085500_2c2c13174ff344388eb95f7ad4cc825b.jpg','E'),(61,'seller','응원','친구/지인,위로,10대이하,여성','비타500데일리스틱 70포 + 10포 추가 + 선물엽서 + 쇼핑백 + 뚱랑이 러그 추첨증정',14900,'뚱랑이가 대신 전해드려요 당신을 위한 나의 마음',100,100,1,0,'2022-11-25 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220913115345_d757f19c39784e7491e82acbe0b8fc9c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220714094654_1130b8e655d94701a04953b3b5e1a47e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220714094701_5e61898aa3cf42929e49ed4f217b2253.jpg','E'),(62,'seller','응원','친구/지인,위로,10대이하,여성','[합격선물]\"합격을 외쳐봐\" 복돼지 8형제 앙금볼세트(24입)',23900,'건강하게 아름답게 맛있다. 건강함을 챙긴 달콤한 디저트와 고급스러운 포장까지! 합격응원,축하,고백 등 특별한 날을 더 특별하게 만드는 이 맛!',100,100,1,0,'2022-11-26 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200403204106_8575e13c49e04e86a7d9d7b527c241e5','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200403204106_072b87d1cd7b4ea384ffb737f25ea4ff','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211109112724_b2fdd1f88a014f3db8925baf45e8baeb.jpg','E'),(63,'seller','캠핑','배우자,결혼,30대,남성','클래식6 나이프',23000,'날카로운 칼',100,100,1,0,'2022-12-07 11:35:00','https://img.netpx.co.kr/images/goods_img/20220718/128255/128255_a_500.jpg?22062001','https://static.netpx.co.kr/images/goods_cont/img_f0a94d045322add63ffa0a283791c310.jpg','https://img.netpx.co.kr/images/goods_img/20220718/128255/128255_a_500.jpg?22062001','I'),(64,'seller','캠핑','배우자,결혼,30대,남성','체어원 라지 블랙',155000,'편안한 의자',100,100,1,0,'2022-12-08 11:35:00','http://www.helinoxstore.co.kr/shopimages/helinox/0010050000363.jpg?1524462721','http://helinox.img46.makeshop.info/hs/data/cheditor4/1703/707d23bbc7a81b5b56a39ed77883329f_7iNlAyVvKSmRCpCo9Wafs2pfA.jpg','http://helinox.img46.makeshop.info/hs/data/cheditor4/1703/707d23bbc7a81b5b56a39ed77883329f_7iNlAyVvKSmRCpCo9Wafs3pfA.jpg','I'),(65,'seller','캠핑','배우자,결혼,30대,남성','스태킹 카고박스 50L',60000,'많은걸 담을 수 있는 박스',100,100,1,0,'2022-12-09 11:35:00','https://contents.lotteon.com/itemimage/_v230914/LO/19/51/76/45/75/_1/95/17/64/57/6/LO1951764575_1951764576_1.jpg/dims/resizef/554X554','http://huppiness.speedgabia.com/GordonMiller/GORDON-MILLER-STACKING-TRUNK-CARGO-2.jpg','http://huppiness.speedgabia.com/GordonMiller/GORDON-MILLER-STACKING-TRUNK-CARGO-3.jpg','I'),(66,'seller','캠핑','배우자,결혼,30대,남성','서큘레이터 V600+',49900,'시원한 가전제품',100,100,1,0,'2022-12-10 11:35:00','https://mgear.kr/web/product/big/202106/bacdc73f54832e476bf067d51a80ac40.jpg','https://mgear.speedgabia.com/CLAYMORE/WIRELESS_FAN/V600/v600_860_01.jpg','https://mgear.speedgabia.com/CLAYMORE/WIRELESS_FAN/V600/v600_860_02.jpg','I'),(67,'seller','캠핑','배우자,결혼,30대,남성','구이바다 미니 레트로',120000,'작고 귀여운 레트로제품',100,100,1,0,'2022-12-11 11:35:00','https://img-cf.kurly.com/shop/data/goodsview/20210525/gv00000186733_1.jpg','https://img-cf.kurly.com/shop/data/goodsview/20210525/gv20000186735_1.jpg','https://img-cf.kurly.com/shop/data/goodsview/20210525/gv10000186745_1.jpg','I'),(68,'seller','캠핑','배우자,결혼,30대,여성','티타늄 머그',55000,'티타늄으로 만들어진 머그컵',100,100,1,0,'2022-12-12 11:35:00','http://m.9patch.co.kr/web/product/big/202102/9955fe12ebbeb369e31362cf0aee1025.jpg','http://m.9patch.co.kr/web/upload/NNEditor/20210220/ED8BB0ED8380EB8A8420EBA8B8EAB7B8-1.jpg','http://m.9patch.co.kr/web/upload/NNEditor/20210220/ED8BB0ED8380EB8A8420EBA8B8EAB7B8-2.jpg','E'),(69,'seller','캠핑','배우자,결혼,30대,여성','클래식 보온병 750ml',38000,'식지않는 보온병',100,100,1,0,'2022-12-13 11:35:00','https://cdn.shopify.com/s/files/1/0516/8421/2928/products/B2B_Large_PNG-Classic-Vac-Bottle-16oz-Hmrtne-Grn_front_1800x1800_e0872c50-0cad-4994-9480-0d5014f330ca_720x.png?v=1612220464','https://img.ithaca.co.kr/bizimall/stanley/2021/classicbottle470.jpg','https://img.ithaca.co.kr/bizimall/stanley/2021/classicbottle471.jpg','E'),(70,'seller','캠핑','배우자,결혼,30대,여성','파이어사이드 폴딩체어',130000,'누운듯한 느낌을 주는 편안한 의자',100,100,1,0,'2022-12-14 11:35:00','https://photo.akmall.com/image0/goods/99/46/45/60/99464560_M_350.jpg','https://www.akmall.com/picgate/?purl=http://outdoorlm1.cafe24.com/etc/20210316_coleman_2000034675.jpg','https://www.akmall.com/picgate/?purl=http://outdoorlm1.cafe24.com/etc/20210316_coleman_2000034676.jpg','E'),(71,'seller','캠핑','배우자,결혼,30대,여성','아이언 그리들 중형 세트',99000,'작은 그리들을 대체하는 중형 그리들세트',100,100,1,0,'2022-12-15 11:35:00','http://image.auction.co.kr/itemimage/26/bf/a2/26bfa27936.jpg','https://image1.coupangcdn.com/image/vendor_inventory/0e62/ccf712e140e17cf905d6c4fd9a2eb7b4a729003b293f068d03bef7a8393d.jpg','https://image1.coupangcdn.com/image/vendor_inventory/0e62/ccf712e140e17cf905d6c4fd9a2eb7b4a729003b293f068d03bef7a8394d.jpg','E'),(72,'seller','캠핑','배우자,결혼,30대,여성','레드와일드 LED 랜턴',16900,'어두운 밤을 밝혀줄 랜턴',100,100,1,0,'2022-12-16 11:35:00','https://contents.lotteon.com/itemimage/_v144652/LO/15/17/04/55/23/_1/51/70/45/52/5/LO1517045523_1517045525_1.jpg/dims/resizef/554X554','https://ai.esmplus.com/mayton2/%EB%A0%88%EB%93%9C%EC%99%80%EC%9D%BC%EB%93%9C%20%EC%BA%A0%ED%95%91%20%EA%B0%90%EC%84%B1%EB%9E%9C%ED%84%B4/camping%20Lantern.jpg','https://ai.esmplus.com/mayton2/%EB%A0%88%EB%93%9C%EC%99%80%EC%9D%BC%EB%93%9C%20%EC%BA%A0%ED%95%91%20%EA%B0%90%EC%84%B1%EB%9E%9C%ED%84%B4/camping%21Lantern.jpg','E'),(73,'seller','반려동물','부모님,위로,50대,남성','뉴트리나 건강백서 비숑 2kg',19000,'우리 집 비숑 건강 관리는 견종 전용 포물러가 적용된 건강볍스 입니다.',100,100,1,0,'2022-10-28 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/A02/590/A021590.jpg','http://www.queenpuppy.co.kr/shop/pd_img/A02/590/A021590_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/A02/590/A021590.jpg','I'),(74,'seller','반려동물','부모님,위로,50대,남성','쥬쥬베 펫텀블러',9900,'쥬쥬베 펫텀블러는 휴대용 반려동물용 물통을 접을 수 있는 소형, 중형견용 물통입니다.',100,100,2,0,'2022-10-29 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/C04/092/C040092.jpg','http://www.queenpuppy.co.kr/shop/pd_img/C04/092/C040092_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/C04/092/C040092_compare3.jpg','I'),(75,'seller','반려동물','부모님,위로,50대,남성','샤코 이노픽 반려동물 칫솔',6000,'사람도 동물도 세상 편리한 칫솔 - 반려동물 칫솔의 정석',100,100,1,0,'2022-10-30 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/E01/177/E010177.jpg','http://www.queenpuppy.co.kr/shop/pd_img/E01/177/E010177_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/E01/177/E010177_compare1.jpg','I'),(76,'seller','반려동물','부모님,위로,50대,남성','ANF 양고기 홀리스틱 중간입자',78400,'ANF 램홀리스틱 올라이프 스테이지는 제 1원료인 청정 호주산 양고기와 ANF의 검증된 포뮬러가 반려견의 건강한 피부, 피모를 지원합니다.',100,100,1,0,'2022-10-31 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/A02/345/A020345.jpg','http://www.queenpuppy.co.kr/shop/pd_img/A02/345/A020345_compare1_s.jpg','http://www.queenpuppy.co.kr/shop/pd_img/A02/345/A020345_compare1_s.jpg','I'),(77,'seller','반려동물','부모님,위로,50대,남성','쏘아베 라텍스 동물농장 장난감',1760,'라텍스 동물농장은 강아지들의 운동과 여가시간을 즐겁게 보내는 최고의 장난감 입니다. 피리가 장난감안에 들어있어 피리소리가 날때 흥미를 유발시켜 강아지의 움직임을 극대화해 비만예방에 좋습니다.',100,100,1,0,'2022-11-01 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/K04/040/K040040.jpg','http://www.queenpuppy.co.kr/shop/pd_img/K04/040/K040040.jpg','http://www.queenpuppy.co.kr/shop/pd_img/K04/040/K040040.jpg','I'),(78,'seller','반려동물','부모님,위로,50대,여성','조이프렌드 목줄',3000,'펫스컴퍼니 조이프렌드 패션줄의 자매품으로, Medium(폭 15mm) 사이즈에 연결하여 사용하시면 됩니다. 모양이 차이가 나는 것에 민감하시지 않다면 다른 브랜드의 줄에도 연결하여 사용하실 수 있습니다.',100,100,1,0,'2022-11-02 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/J02/075/J020075.jpg','http://www.queenpuppy.co.kr/shop/pd_img/J02/075/J020075_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/J02/075/J020075_compare2.jpg','E'),(79,'seller','반려동물','부모님,위로,50대,여성','또자의 눈물지우개 120ml',2750,'눈 밑 부분의 변색 방지, 눈무 얼룩제거/점액분비물 제거',100,100,1,0,'2022-11-03 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/F05/015/F050015.jpg','http://www.queenpuppy.co.kr/shop/pd_img/F05/015/F050015_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/F05/015/F050015.jpg','E'),(80,'seller','반려동물','부모님,위로,50대,여성','빅스비 버섯영양제 이뮤니티 체력증진 면역력 파우더',43000,'빅스비 영양제는 전반적으로 메디컬 버섯으로 하는 천연 홀리스틱입니다. 의학분양에서 뛰어난 효능을 인정받고 빅스비 자체도 워낙 유명해서 신뢰감 100%에요.',100,100,1,0,'2022-11-04 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/F01/850/F010850.jpg','http://www.queenpuppy.co.kr/shop/pd_img/F01/850/F010850.jpg','http://www.queenpuppy.co.kr/shop/pd_img/F01/850/F010850.jpg','E'),(81,'seller','반려동물','부모님,위로,50대,여성','스마트본 카밍 스틱',7100,'스마트본은 로하이드(소가죽)의 장점을 갖고 있지만 실제로는 로하이드(소가죽)을 사용하지 않은 차세대 반려견용 간식입니다.',100,100,1,0,'2022-11-05 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/B05/700/B050700.jpg','http://www.queenpuppy.co.kr/shop/pd_img/B05/700/B050700_compare1.jpg','http://www.queenpuppy.co.kr/shop/pd_img/B05/700/B050700.jpg','E'),(82,'seller','반려동물','부모님,위로,50대,여성','페로가토 구름방석 핑크',20800,'반려동물의 편안한 잠자리를 위해 이전보다 더 풍성하게 충전재를 넣어 쿠션감과 복원력이 뛰어난 구름방석을 제작했습니다.',100,100,1,0,'2022-11-06 11:35:00','http://www.queenpuppy.co.kr/shop/pd_img/L01/781/L010781.jpg','http://www.queenpuppy.co.kr/shop/pd_img/L01/781/L010781_compare2.jpg','http://www.queenpuppy.co.kr/shop/pd_img/L01/781/L010781.jpg','E'),(83,'seller','운동','배우자,백일,30대,남성','\"오늘도 득근득근\" 하빈져 헬스 스트랩 (톡별)',14900,'웨이트 트레이닝의 기본, 헬스 스트랩 선물 패키지입니다. 트레이닝의 효과를 더욱 up 시켜주는 하빈져의 그립력을 확인해보세요!',100,100,2,0,'2022-12-17 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210128160644_3d2767667cb54fa187a8cb4ddcc72b43.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210128160650_6aa9e9384bf647a99bea601d3b8b5b41.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210128160655_298af0141a8b4171a4c8e633151e1613.jpg','I'),(84,'seller','운동','배우자,백일,30대,남성','미주Pick 발란스핏 기프트세트 - 의료용 압박스타킹 (톡별)',29800,'다리붓기 개선 & 혈액순환을 돕는 의료기기 발란스핏 압박스타킹',100,100,1,0,'2022-12-18 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220610175210_b984aaa53d184cb183c0816f43ad58da.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220610175214_662d78cff9a24e6888396f859d7b7009.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220610175159_62bb564de1dd4f8e875bd3cfdccf7ed8.jpg','I'),(85,'seller','운동','배우자,백일,30대,남성','헬스 소가죽 리프팅 스트랩 데드리프트 그립',25900,'중량 운동 시, 악력과 전완근을 보조해줘서 자세가 무너지는 것을 방지해주고, 운동하고자 하는 부위에 집중할 수 있도록 도와줍니다.',100,100,6,0,'2022-12-19 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201222134735_b6027dfff29f4762ba78b3fc8889146a.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201222134738_8e536a6209ba4aea8ba4818a8d7a7bb8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201222134742_dea329ccee904fa7886a96b2cd19ce43.jpg','I'),(86,'seller','운동','배우자,백일,30대,남성','퍼펙트파워 BCAA 6000 1통/ 포도맛/ 운동에 필요한 아미노산 보충제',23900,'포도농축분말을 사용하여 더욱 진하고 풍부한 리얼 포도맛의 영양제',100,100,1,0,'2022-12-20 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210118141401_164c45e4961a4fa5a3d7fe521445e8df.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210118141605_e21a20a549184554aef0012119a8adb7.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210118141401_164c45e4961a4fa5a3d7fe521445e8df.jpg','I'),(87,'seller','운동','배우자,백일,30대,남성','심으뜸 홈트밴드세트',32900,'홈트밴드세트는 전세계적으로 가장 많이 쓰이는 홈트레이닝 도구입니다. 집에서 거의 모든 운동을 할 수 있습니다.',100,100,1,0,'2022-11-04 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506180034_4aba5b09a20d47c3905e951f19cfd5f8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506180133_ea0de1c029d74e6c8f9a05d08286f8e8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506180150_2d1ca33c95e1486cad6aa5b32748ca4f.jpg','I'),(88,'seller','운동','배우자,백일,30대,여성','리프팅 핸드 그립 일자형 스트랩 장갑 풀업 아대 턱걸이 리프팅 철봉 운동 밴드',14100,'2개의 루프스트랩으로 손가락을 넣어 손을 보호하고 편안한 그립감을 줍니다.',100,100,1,0,'2022-11-05 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825153632_24379214345347fdb3464135774ab611.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825153635_b5a696b7eb2b4ed28b0afc5246e23806.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220825153641_164515cb9ddd4110aa29f399b68b100c.jpg','E'),(89,'seller','운동','배우자,백일,30대,여성','스컬피그 요가웨어 풀패키지 (톡별)',39800,'일상에서 부담없고, 자연스럽게 활동할 수 있는 레깅스 브라탑 그리고, 홈트레이닝 용품과 양말까지!',100,100,1,0,'2022-11-06 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810140218_6567298226ee41acb02dbf238cc461d7.JPG','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810140231_0f0ebfd1c85540f7812f536fd7552991.JPG','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220810140235_0ceb6a945ef74b46a32f3e3cd5f04125.JPG','E'),(90,'seller','운동','배우자,백일,30대,여성','멜킨 밸런스보드 코어 근육 운동 균형 감각 홈트레이닝 기구',25100,'코어근육 운동과 간편한 홈트기구를 찾는 당신, 멜킨 밸런스 보드가 필요합니다.',100,100,1,0,'2022-12-17 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220406205957_47e07156794b45119a21536a6ef35e80.PNG','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220406205959_a4553893a51444a28e88151c9736d91c.PNG','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220406210000_ca055c2c972945599ee04f45cbfea037.PNG','E'),(91,'seller','운동','배우자,백일,30대,여성','슬림미_하트 스마트훌라후프',27900,'운동효과는 늘리고! 공간제약은 줄이고! 사이즈 조절 가능한 훌라우프',100,100,1,0,'2022-12-18 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210809105901_77c408929a9a478ab0e86f854658b311.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210809105913_faa9e2e213714091bd0c53cc9fcc4aed.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210809105920_0680443961104cbeb6b4149960a39fb2.jpg','E'),(92,'seller','운동','배우자,백일,30대,여성','카르빈 요가 마사지 하드 필라테스 폼롤러 EVA 90',25000,'요가나 필라테스 또는 운동 전 후 뭉친 근육을 풀어주고 혈액순환에도 도움을 줍니다.',100,100,1,0,'2022-12-19 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220124101640_c434f0b1112e47ed92b0f2cc8b26998b.JPG','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220124101704_87ed398f7fd74d2299d1057b7af4c98e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220124101742_5fd957ebbee545f686dfe8182a3821df.jpg','E'),(93,'seller','키덜트','회사동료,개업,40대,남성','가필드 피규어',838006,'아이코닉한 가필드를 한정판 메탈릭 피규어로 만나보세요!',100,100,1,0,'2022-11-07 11:35:00','https://cache.mrporter.com/variants/images/25185454456713354/in/w1200_q60.jpg','https://cache.mrporter.com/variants/images/25185454456713354/bk/w1200_q60.jpg','https://cache.mrporter.com/variants/images/25185454456713354/cu/w1200_q60.jpg','I'),(94,'seller','키덜트','회사동료,개업,40대,남성','스페이스잼 피규어',172313,'잼스페이스의 타스매니안 데빌 캐릭터를 본따 만든 PVC 피규어 세트',100,100,1,0,'2022-11-08 11:35:00','https://cache.mrporter.com/variants/images/1647597280598583/in/w1200_q60.jpg','https://cache.mrporter.com/variants/images/1647597280598583/bk/w1200_q60.jpg','https://cache.mrporter.com/variants/images/1647597280598583/e1/w1200_q60.jpg','I'),(95,'seller','키덜트','회사동료,개업,40대,남성','미녀와 야수 루미에르 케이크 스탠드',54000,'미녀와 야수의 루미에르와 함께하는 부엌! 루미에르가 불을 밝혀줄거예요',100,100,1,0,'2022-11-09 11:35:00','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6401044136024?fmt=webp&qlt=70&wid=932&hei=932','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6401044136024-1?fmt=webp&qlt=70&wid=932&hei=932','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6401044136024-1?fmt=webp&qlt=70&wid=932&hei=932','I'),(96,'seller','키덜트','회사동료,개업,40대,남성','스타워즈 토스터',32000,'스타버드 로고가 찍히는 스타워즈 토스터',100,100,1,0,'2022-11-10 11:35:00','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6804057352358?fmt=webp&qlt=70&wid=932&hei=932','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6804057352358-1?fmt=webp&qlt=70&wid=932&hei=932','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6804057352358-1?fmt=webp&qlt=70&wid=932&hei=932','I'),(97,'seller','키덜트','회사동료,개업,40대,남성','토이스토리 햄 화분',30000,'토이스토리 햄 저금통이 화분이 된다면?!',100,100,1,0,'2022-11-11 11:35:00','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6504056726834?fmt=jpeg&amp;qlt=90&amp;wid=1116&amp','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6504056726834-1?fmt=webp&amp;qlt=70&amp;wid=558&amp;hei=558%201x','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/6504056726834-1?fmt=webp&amp;qlt=70&amp;wid=558&amp;hei=558%201x','I'),(98,'seller','키덜트','회사동료,개업,40대,여성','토이스토리 렉스 커스튬',130000,'렉스가 되고싶은 어른이들 모여라!',100,100,1,0,'2022-11-12 11:35:00','https://cdn-ssl.s7.disneystore.com/is/image/DisneyShopping/2840055639184?fmt=webp&qlt=70&wid=1564&hei=1564','','','E'),(99,'seller','키덜트','회사동료,개업,40대,여성','롤링스톤 레고 퍼즐',180000,'롤링스톤의 아이코닉한 로고를 레고로!',100,100,1,0,'2022-11-13 11:35:00','https://www.lego.com/cdn/cs/set/assets/bltf9fb3cc7e0eb9f0b/31206.png?fit=bounds&format=webply&quality=80&width=800&height=800&dpr=2','https://www.lego.com/cdn/cs/set/assets/bltb7d14da825abb54b/31206_alt1.png?fit=bounds&format=webply&quality=80&width=528&height=528&dpr=2','https://www.lego.com/cdn/cs/set/assets/bltb7d14da825abb54b/31206_alt1.png?fit=bounds&format=webply&quality=80&width=528&height=528&dpr=2','E'),(100,'seller','키덜트','회사동료,개업,40대,여성','케이크 레고',17000,'레고로 만든 특별한 미니케이크로 기념일을 축하해보세요',100,100,1,0,'2022-11-14 11:35:00','https://www.lego.com/cdn/cs/set/assets/blt8bbecdad248249ed/40382.jpg?fit=bounds&format=webply&quality=80&width=528&height=528&dpr=2','https://www.lego.com/cdn/cs/set/assets/blt1fb912453dc1c079/40382_alt1.jpg?fit=bounds&format=webply&quality=80&width=528&height=528&dpr=2','https://www.lego.com/cdn/cs/set/assets/blt1fb912453dc1c079/40382_alt1.jpg?fit=bounds&format=webply&quality=80&width=528&height=528&dpr=2','E'),(101,'seller','키덜트','회사동료,개업,40대,여성','인스탁스 미니 40',148000,'소중한 순간들을 모아보세요',100,100,1,0,'2022-11-15 11:35:00','https://i.localised.com/img/uo/product/cd45e07a-df22-4cff-938a-1995bd1605ed_LARGE.jpg','https://i.localised.com/img/uo/product/8f097219-db2b-40e3-a64b-bfcf59de9a0e_LARGE.jpg','https://i.localised.com/img/uo/product/8f097219-db2b-40e3-a64b-bfcf59de9a0e_LARGE.jpg','E'),(102,'seller','키덜트','회사동료,개업,40대,여성','뉴욕 시티 에디션 체스',200000,'아크릴과 나무로 크래프트된 스카이라인 체스 컬렉션',100,100,1,0,'2022-11-16 11:35:00','https://cache.mrporter.com/variants/images/1647597284318706/in/w960_q60.jpg','https://cache.mrporter.com/variants/images/1647597284318706/cu/w960_q60.jpg','https://cache.mrporter.com/variants/images/1647597284318706/cu/w960_q60.jpg','E'),(103,'seller','요리','연인,출산,30대,남성','마이셰프 좋은 날 당신에게 For U 밀키트 세트',36800,'좋은 날 당신에게 밀키트 세트',100,100,1,0,'2022-11-17 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200306123008_899deea4eb61446592892a873765dc55','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007091619_8d72c4a57bef4cd0a6ca4fc09ab51054.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007091630_0c69833adfd846f1bb34f6325c8854ef.jpg','I'),(104,'seller','요리','연인,출산,30대,남성','밀키트 세트',38800,'누구나 셰프가 될 수 있다! 평균조리시간 10분, 요리초보도 손쉽게 완성!',100,100,1,0,'2022-11-18 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FOdvEx-Brktt4AcYj6OJWJXEQ_JYGpk3EmgRrrduIld0.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FAdtaW-Cug1JNlfI6MK8GJ04b4iWcKQYZ4cIV4sLVCec.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220616101829_a79504124ab04784adfc6bc01faf5762.jpg','I'),(105,'seller','요리','연인,출산,30대,남성','밀푀유나베(2인)',16900,'잊을 수 없는 맛과 비주얼 압도적인 요리. 짧은 조리시간, 간편한 레시피로 화려하고 보기 좋은 요리를 완성할 수 있어요',100,100,1,0,'2022-11-19 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211206171915_834c43176d9c469499f90dfb8073994f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211206171919_f7b95b3a8ea14fb1b9537777e22050dc.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211206171923_47fc2909e9ec42ba997a6ea6d10c3346.jpg','I'),(106,'seller','요리','연인,출산,30대,남성','신라호텔 시트러스 소스의 프리미엄 메로 스테이크 (총 2인)',49000,'소중한 순간을 만드는 특별한 차림. 쉽게 접할 수 없는 식재료의 맛과 식감을 호텔신라와 마이셰프의 콜라보로 품격있게 선보입니다.',100,100,1,0,'2022-11-20 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220125174035_1ddb113d96d54d4eb8420049983fb0c2.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211215140744_ff86aef6c9f3493c9743932e6d2cd511.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211215140747_745efe625fb0418db4c13d8f6a6b414f.jpg','I'),(107,'seller','요리','연인,출산,30대,남성','블랙페퍼 크랩&씨푸드(2인)',16900,'싱가포르로 떠나는 미식여행 싱가포르의 특별한 맛을 지금 만나보세요.',100,100,1,0,'2022-11-21 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FiMGY6wb9Z7afSclSoRQIhA9vxKbN_VND4Vc0zQnB7-E.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2F-gvD5o6FZGPLPF6yaDdyMyPuv5VUJkYvMkahTLZljf4.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FC4VctEQ5VNWV7k-Xx2kxvSbAA_dim6LVV8omL2Xg-5o.jpg','I'),(108,'seller','요리','연인,출산,30대,여성','[경복궁] 불고기 갈비 혼합 선물세트 (양념불고기600g+칼집LA갈비600g)',45000,'경복궁의 수제 생과일소스와 초이스등급의 최고급 우목심',100,100,1,0,'2022-11-22 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220428161320_b2f9154a62f949b8ba6952c1fd3618d4.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220428161326_36338b1284b94dc98bf4c96dfcef0c0f.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220428161330_6cf825214c0a46039101037cc36d6c19.jpg','E'),(109,'seller','요리','연인,출산,30대,여성','맛있게 매운 맛 호로록 불 주꾸미(2인)',12900,'쫄깃하고 탱글한 쭈꾸미에 화끈한 매운 양념으로 볶은 호로록 불 쭈꾸미',100,100,1,0,'2022-11-23 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210514111025_bc05ec08ce8949bf9f756901b46adbac.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210514111029_490c827a37014ead81a14f9cb09bf88b.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210514111033_b146b0c45cbe4f8fa944fe9e1c73ab55.jpg','E'),(110,'seller','요리','연인,출산,30대,여성','양식세트',38700,'국내산 한우와 초고급 미역이 들어가있는 미역국과 부드럽고 쫄깃한 식감이 일품인 르네 프렌치스테이크',100,100,1,0,'2022-11-24 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210405160519_b75c7a1523bc474c8053cf3410754878.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211206121651_08b06c46dfb744d1916c9bbfbc7760bb.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211206121710_8b1e8ea8e0ba4e8dab0c9018520f3a25.jpg','E'),(111,'seller','요리','연인,출산,30대,여성','고마운 당신에게, 랍스터&비프스테이크',32900,'든든한 한끼가 필요한 자취생에게, 마음을 전할 특별한 선물이 필요한 당신에게, 맛있는 한 끼로 하루를 마무리하고 싶은 직장인에게',100,100,1,0,'2022-11-25 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211112100623_b2d1ea0363e74a34af45afe08bcf396d.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211112100627_add3d9878c27497b85ea977c8d9fb2b9.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211112100631_45c28e94688b4a919ffe7700619719e6.jpg','E'),(112,'seller','요리','연인,출산,30대,여성','우정분식 아찔 떡볶잉(2인)',15900,'3단계로 도전하는 매운맛 떡볶이',100,100,1,0,'2022-11-26 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FlRzdPkG4YegvOlWL07GZbOL9H2dQzo2qZN4Gjk9GIh8.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FNsNs-qOIRJ17qzbhhfF7E9QRyV0XHdAcdIMzTyAq9_o.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2Feej6ShQybrb2vSqSfHNbjA%2FaMdER6152e8mcL5jD66vXdGfOThb2KiGzoKD5DRzOuQ.jpg','E'),(113,'seller','홈파티','친구/지인,임신,20대,남성','뷰포인트 미니 빔프로젝터',7900,'다양한 뷰포인트를 내 방으로',100,100,1,0,'2022-11-27 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220721162019_ec6530d971ea422c8e9e1dfe25c66f32.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220721162028_4efde8eeac504538a47657a4607d41fe.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220721162030_bbda775f99c24000ad2dfbc0e3568151.jpg','I'),(114,'seller','홈파티','친구/지인,임신,20대,남성','홈파티 낙서 와인잔',26800,'평범한 날을 특별하게 만들어줄 낙서 와인잔',100,100,1,0,'2022-11-28 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210805172750_9495879b2716421fa90b7ee4ad63b2e1.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210805172759_80a0fc9fe20f45a4b293f5e1e7c3c477.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210805172804_64a6848ac4b448cdbf6d09d5dffa7668.jpg','I'),(115,'seller','홈파티','친구/지인,임신,20대,남성','크로플 와플 메이커',39900,'간편하게 시작하는 든든한 하루',100,100,1,0,'2022-11-29 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210726174002_02a7283ccf174e67918fd62221161a71.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220405105103_8bc7cd4f042c4e4ea658a5dab301e6e2.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211209160429_607d168c6a2d402c89f94e35d26e6fa7.jpg','I'),(116,'seller','홈파티','친구/지인,임신,20대,남성','치즈보드 와인잔 세트',53900,'당신의 삶에 낭만을 더해 줄 테이블웨어',100,100,1,0,'2022-11-30 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220826092030_884af0d9c7cc4e8e9129958cbe9545ba.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F-Q3SHg4SiR6oU-v_PzzsLA%2FANVFFXt-EE5CurTHZArP1TLiJIKG0LQVFarpx-SAeYY.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F-Q3SHg4SiR6oU-v_PzzsLA%2FgFUQ5hb5_l0qHDROgdaRIj-zYI4fb5mo0KlTIt5R_GM.jpg','I'),(117,'seller','홈파티','친구/지인,임신,20대,남성','소주 디스펜서',11900,'홈파티를 더 즐겁게하는 주류 디스펜서',100,100,1,0,'2022-12-01 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220607090136_c36e1e3b073c44428ce427fe3e69be10.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220718161539_7c60444eeb7e45fdaf086b0d186398b9.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220718161551_6bc66e2d89054019973a92f568926c1a.jpg','I'),(118,'seller','홈파티','친구/지인,임신,20대,여성','와인 디스펜서',34900,'와인의 맛을 마법같이 바꾸는 브리딩',100,100,1,0,'2022-12-02 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007173354_92d39dbb141a44629c165d7ccd682d6c.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007173349_2e0f715c5c16433cae039a18c1a0dd02.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211007173406_7dfa5bfed34446efb84abd28d6fdbf38.jpg','E'),(119,'seller','홈파티','친구/지인,임신,20대,여성','파티 올인원 세트',17800,'고민없이 간단하게 풍성한 파티 준비',100,100,1,0,'2022-12-03 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220817155352_023e9ee8282a41b48d8083de6cce3669.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220722163306_cf3426b814834fd68673cb60d92b937e.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220722163309_2cca51ea42f94dbc9fff3c9e6ca43195.jpg','E'),(120,'seller','홈파티','친구/지인,임신,20대,여성','홀로그램 소주잔 세트',14500,'감성과 분위기, 달콤함까지 잡은 오로라 소주잔',100,100,1,0,'2022-12-04 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211015095334_62c43f96dfe74ca29c57f9b0be7a9639.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211015095347_0fb885693256461e950ccc4508e72903.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211015095351_9fd8d86a72264feba9511d8f3c8464a4.jpg','E'),(121,'seller','홈파티','친구/지인,임신,20대,여성','클래식 홈파티 2인 세트',29000,'클래식한 파스타볼과 샴페인 잔으로 분위기 있는 플레이팅 연출',100,100,4,0,'2022-12-05 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506101146_3e46681ab94f4574a5dc47edb4ff31f0.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506101148_c96f1fda98d14abdbe6e0042949bd3e0.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220506101151_04ad4b8e42d6461480c985c7127639a1.jpg','E'),(122,'seller','홈파티','친구/지인,임신,20대,여성','별빛 조명램프',18000,'밤하늘의 별빛을 실내에 수놓을 수 있는 조명램프',100,100,2,0,'2022-12-06 11:35:00','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FF964HOT84_ljUZ5rxTWoDw%2FZ0Z-p-RK_4HrCc-k82BYV6tw9JxqxfIE_bw5NElXj3I.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FF964HOT84_ljUZ5rxTWoDw%2FyyMqkZmFw-JzRiRRh80dXMpKpo_pCc6F1qXkmPzoSrc.jpg','https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2FF964HOT84_ljUZ5rxTWoDw%2F0y5l729iisB5R64_1jEaXgez-k_d7oteAutM0QnL7iY.jpg','E');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_connect`
--

DROP TABLE IF EXISTS `product_category_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_connect` (
  `product_id` int NOT NULL,
  `category_id` varchar(45) NOT NULL,
  KEY `fk_pro_cate_category1_idx` (`category_id`),
  CONSTRAINT `fk_pro_cate_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_connect`
--

LOCK TABLES `product_category_connect` WRITE;
/*!40000 ALTER TABLE `product_category_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_like`
--

DROP TABLE IF EXISTS `product_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_like` (
  `genie_id` varchar(45) NOT NULL,
  `product_id` int NOT NULL,
  `like_num` int NOT NULL,
  KEY `fk_product_like_product1_idx` (`product_id`),
  KEY `fk_product_like_user1` (`genie_id`),
  CONSTRAINT `fk_product_like_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_product_like_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_like`
--

LOCK TABLES `product_like` WRITE;
/*!40000 ALTER TABLE `product_like` DISABLE KEYS */;
INSERT INTO `product_like` VALUES ('user',84,1),('user',94,1),('user_kim',84,1);
/*!40000 ALTER TABLE `product_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag_connect`
--

DROP TABLE IF EXISTS `product_tag_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tag_connect` (
  `product_id` int NOT NULL,
  `product_tag_id` varchar(45) NOT NULL,
  KEY `fk_product_tag_connect_tag1_idx` (`product_tag_id`),
  CONSTRAINT `fk_product_tag_connect_tag1` FOREIGN KEY (`product_tag_id`) REFERENCES `tag` (`product_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag_connect`
--

LOCK TABLES `product_tag_connect` WRITE;
/*!40000 ALTER TABLE `product_tag_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_product`
--

DROP TABLE IF EXISTS `reply_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply_product` (
  `genie_id` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) NOT NULL,
  `rating` int NOT NULL,
  `writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `reply_no_UNIQUE` (`reply_no`),
  KEY `fk_reply_product_user1_idx` (`genie_id`),
  KEY `fk_reply_product_product1_idx` (`product_id`),
  CONSTRAINT `fk_reply_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_reply_product_user1` FOREIGN KEY (`genie_id`) REFERENCES `user` (`genie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_product`
--

LOCK TABLES `reply_product` WRITE;
/*!40000 ALTER TABLE `reply_product` DISABLE KEYS */;
INSERT INTO `reply_product` VALUES ('user',85,8,'',5,'2022-10-05 13:13:43'),('user',85,9,'',0,'2022-10-05 13:13:43'),('user',85,10,'ㄹㅇㄴㄹㄴㅁㄹㄴㅁㄹㄹ으날;먼ㄹㅇ누마ㅓ풏타파ㅣㅓㅋㅊ투ㅏ푸ㅏㅣㄴ어마ㅣㅜ눞ㄴㄹㅇㄴㄻㅇㄴㅁ릉ㄴ마ㅓㄹ;ㅇㄴㅁ라ㅣㅇ누리ㅏㅁ너ㅟㅋ퉃파ㅣㅓㅜㅋ타링ㄴㅁㄹㅇㄴㅍㅇㅋㅍㅊㅌㅋㅍㅊ',0,'2022-10-05 13:13:44'),('user',85,11,'',0,'2022-10-05 13:13:44'),('user',85,12,'',0,'2022-10-05 13:13:44'),('user',85,13,'ㄹㅇㄴㅁ',0,'2022-10-05 13:16:17'),('user',85,14,'ㄹㅇㄴㄻㅇㄴㅁ',0,'2022-10-05 13:16:19'),('user',85,15,'ㄹㅇㄴㄹㅇㄴㅁ',5,'2022-10-05 13:16:21'),('user',85,16,'ㄹㅇㄴㅁㄹㅇㄴ',0,'2022-10-05 13:16:37'),('user',85,17,'ㄹㅇㄴㅁㄹㅇㄴㅁ',0,'2022-10-05 13:16:39'),('user',85,24,'ㅇㄹㅇㅁㄴㄹㅇㄴㅁ',5,'2022-10-05 13:51:47'),('user',83,25,'오오오 리뷰기능 별이 5개입니다~~~!!! ',5,'2022-10-05 14:00:53'),('user',85,26,'',5,'2022-10-05 14:05:00'),('user',85,27,'ㅇㅎㅇㅁㄴㄹㅇㄴㅁ',5,'2022-10-05 14:05:04'),('user',85,28,'ㅇㄹ',56,'2022-10-05 14:05:41'),('user',85,29,'ㄹㅇㄴㅁㄹㅇㄴ',5,'2022-10-05 14:28:41'),('user',85,30,'',5,'2022-10-05 14:29:52'),('user',83,32,'ㅎㅎㅎㅎㅎㅎㅎ',5,'2022-10-05 14:34:46'),('user',83,33,'ㄹㅇㄴㅁㄹㅇ',5,'2022-10-05 14:40:00'),('user',83,34,'fdsfdsaf',5,'2022-10-05 14:40:43'),('user',83,37,'별 네개입니다.',4,'2022-10-05 16:55:55'),('user',83,38,'별다섯개입니다.',5,'2022-10-05 16:56:43'),('user',83,39,'별세개입니다.',3,'2022-10-05 16:56:48'),('user',83,40,'별두개입니다.',2,'2022-10-05 17:00:09'),('user',83,41,'별 한개입니다.',1,'2022-10-05 17:00:15'),('user_kim',83,42,'kol',0,'2022-10-05 17:27:10'),('user_kim',83,43,'',5,'2022-10-05 17:27:19'),('user',83,45,'언제 쓴 글인가요?',5,'2022-10-06 15:48:14'),('user',2,46,'12323144',5,'2022-10-07 15:10:07'),('user',2,47,'12315',5,'2022-10-11 11:08:50'),('user',2,48,'11114',3,'2022-10-11 16:35:04');
/*!40000 ALTER TABLE `reply_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `genie_id` varchar(100) NOT NULL,
  `seller_tel` varchar(100) NOT NULL,
  `seller_email` varchar(150) NOT NULL,
  `seller_reg_no` varchar(150) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `ceo_name` varchar(100) NOT NULL,
  `seller_address` varchar(500) NOT NULL,
  `seller_website` varchar(100) NOT NULL,
  `writedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seller_status` varchar(15) NOT NULL,
  `approval_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`genie_id`),
  UNIQUE KEY `seller_email_UNIQUE` (`seller_email`),
  CONSTRAINT `fk_seller_account1` FOREIGN KEY (`genie_id`) REFERENCES `account` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('seller','02-1243-1234','ghdtpgh8913@naver.com','genie_0930.mwb',' 회사명','대표자명','서울 강남구 밤고개로 120,123','homepage.com','2022-09-30 10:25:20','Y','2022-09-30 10:25:20'),('seller_bearbrick','010-1111-1111','bearbrick@gmail.com','bearbrick.jpg','bearbrick co','곰도리','서울 용산구, 123','bearbrick.com','2022-09-30 10:11:05','Y','2022-09-30 10:11:05'),('seller_lego','010-1211-1111','lego@gmail.com','lego.jpg','Lego','이레고','서울,123','lego.com','2022-09-30 00:00:00','Y','2022-09-30 00:00:00');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `product_tag_id` varchar(45) NOT NULL,
  `product_tag` varchar(200) NOT NULL,
  `product_tag_eng` varchar(200) NOT NULL,
  PRIMARY KEY (`product_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('1','부모님','parent'),('10','백일','hday'),('11','집들이','housewarming'),('12','서프라이즈','surprise'),('13','응원','cheer'),('2','배우자','spouse'),('3','연인','couple'),('4','가족/친척','family'),('5','친구/지인','friend'),('6','회사동료','coworker'),('7','스승/멘토','mentor'),('8','생일','birth'),('9','기념일','anni');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `genie_id` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_tel` varchar(100) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_gender` char(1) DEFAULT NULL,
  `sign_in_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genie_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  CONSTRAINT `fk_user_account1` FOREIGN KEY (`genie_id`) REFERENCES `account` (`genie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user','김유저','010-1111-9999','ghdtpgh8913@gmail.com','1','2022-09-30 12:40:12',NULL),('user_kim','김유저','010-1234-1234','ghdtpgh8913@naver.com','1','2022-09-30 10:09:48',NULL),('user_lee','김유저','010-1234-1234','leelee@gmail.com','0','2022-09-30 10:16:17',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'genie'
--

--
-- Dumping routines for database 'genie'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-12 18:13:27
