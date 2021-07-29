-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: jh_store
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

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
-- Table structure for table `게시판`
--

DROP TABLE IF EXISTS `게시판`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `게시판` (
  `회원ID` int(11) NOT NULL AUTO_INCREMENT,
  `회원닉네임` varchar(100) NOT NULL,
  `회원email` varchar(40) NOT NULL,
  `타이틀` varchar(70) NOT NULL,
  `내용` text DEFAULT NULL,
  `등록시간` datetime NOT NULL,
  `IP주소` varchar(50) NOT NULL,
  `게시글열람` int(11) NOT NULL,
  PRIMARY KEY (`회원ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `게시판`
--

LOCK TABLES `게시판` WRITE;
/*!40000 ALTER TABLE `게시판` DISABLE KEYS */;
/*!40000 ALTER TABLE `게시판` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `구매내역`
--

DROP TABLE IF EXISTS `구매내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `구매내역` (
  `구매내역ID` int(11) NOT NULL AUTO_INCREMENT,
  `회원ID` int(11) DEFAULT NULL,
  `주소ID` int(11) DEFAULT NULL,
  `구매자이름` varchar(40) DEFAULT NULL,
  `구매일자` datetime DEFAULT NULL,
  PRIMARY KEY (`구매내역ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `구매내역`
--

LOCK TABLES `구매내역` WRITE;
/*!40000 ALTER TABLE `구매내역` DISABLE KEYS */;
/*!40000 ALTER TABLE `구매내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제품재고`
--

DROP TABLE IF EXISTS `제품재고`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `제품재고` (
  `상품ID` int(11) DEFAULT NULL,
  `제품ID` decimal(25,0) DEFAULT NULL,
  `브랜드명` varchar(30) DEFAULT NULL COMMENT '예:삼성전자',
  `제품용량` varchar(20) DEFAULT NULL COMMENT '250GB,500GB,1TB등',
  `제품종류` varchar(10) DEFAULT NULL COMMENT 'SSD,HDD 등의 종류',
  `재고량` smallint(6) DEFAULT NULL,
  `제품입고일` datetime DEFAULT NULL,
  `제품설명` varchar(100) DEFAULT NULL COMMENT '등록한 제품의 상세내역'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제품재고`
--

LOCK TABLES `제품재고` WRITE;
/*!40000 ALTER TABLE `제품재고` DISABLE KEYS */;
/*!40000 ALTER TABLE `제품재고` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제품주문`
--

DROP TABLE IF EXISTS `제품주문`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `제품주문` (
  `상품ID` int(11) DEFAULT NULL,
  `브랜드명` varchar(30) DEFAULT NULL,
  `제품용량` varchar(20) DEFAULT NULL,
  `제품종류` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제품주문`
--

LOCK TABLES `제품주문` WRITE;
/*!40000 ALTER TABLE `제품주문` DISABLE KEYS */;
/*!40000 ALTER TABLE `제품주문` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원명의`
--

DROP TABLE IF EXISTS `회원명의`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `회원명의` (
  `회원ID` int(11) NOT NULL AUTO_INCREMENT,
  `회원이름` varchar(50) DEFAULT NULL,
  `회원핸드폰번호` varchar(40) DEFAULT NULL COMMENT '010-0000-0000 으로 입력',
  PRIMARY KEY (`회원ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원명의`
--

LOCK TABLES `회원명의` WRITE;
/*!40000 ALTER TABLE `회원명의` DISABLE KEYS */;
/*!40000 ALTER TABLE `회원명의` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원주소`
--

DROP TABLE IF EXISTS `회원주소`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `회원주소` (
  `주소ID` int(11) NOT NULL AUTO_INCREMENT,
  `회원ID` int(11) DEFAULT NULL,
  `기본주소` varchar(100) DEFAULT NULL COMMENT '주소를 가져오는 곳에서 주소를 가져온다.',
  `상세주소` varchar(100) DEFAULT NULL COMMENT '아파트 이름과 동/호수를 입력',
  PRIMARY KEY (`주소ID`),
  KEY `회원주소_FK` (`회원ID`),
  CONSTRAINT `회원주소_FK` FOREIGN KEY (`회원ID`) REFERENCES `회원명의` (`회원ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원주소`
--

LOCK TABLES `회원주소` WRITE;
/*!40000 ALTER TABLE `회원주소` DISABLE KEYS */;
/*!40000 ALTER TABLE `회원주소` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jh_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 18:07:15
