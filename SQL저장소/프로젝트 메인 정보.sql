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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `accsr` int(11) NOT NULL AUTO_INCREMENT,
  `accid` varchar(12) NOT NULL COMMENT '영어와 숫자를 섞어이용',
  `accpassword` varchar(20) NOT NULL COMMENT '영어,숫자,특수문자를 이용하여 8-16글자로 생성',
  `accname` varchar(20) NOT NULL COMMENT '사용자의 이름을 입력',
  `accmail` varchar(50) DEFAULT NULL COMMENT '메일주소를 아이디로 입력하고 (네이버,다음 등)은 선택문으로 입력',
  `danaddr` varchar(100) NOT NULL COMMENT '선택으로 기본 주소를 입력',
  `detailaddr` varchar(50) NOT NULL COMMENT '아파트명 호실 등을 입력',
  `sellsr` int(11) NOT NULL,
  PRIMARY KEY (`accsr`),
  KEY `account_FK` (`sellsr`),
  CONSTRAINT `account_FK` FOREIGN KEY (`sellsr`) REFERENCES `selllist` (`sellsr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellacc`
--

DROP TABLE IF EXISTS `sellacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellacc` (
  `sellusr` int(11) NOT NULL AUTO_INCREMENT,
  `sellaccid` varchar(30) NOT NULL COMMENT '(필)영어와 숫자를 섞어이용',
  `sellaccpassword` varchar(16) NOT NULL COMMENT '영어,숫자,특수문자를 이용하여 8-16글자로 생성',
  `sellaccname` varchar(40) NOT NULL,
  `sellaccaddr` varchar(100) NOT NULL COMMENT '기본주소 입력',
  `selldetailaddr` varchar(40) NOT NULL COMMENT '상세주소 입력',
  `sellphone` varchar(20) NOT NULL COMMENT '예)01011112222',
  PRIMARY KEY (`sellusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellacc`
--

LOCK TABLES `sellacc` WRITE;
/*!40000 ALTER TABLE `sellacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellinfo`
--

DROP TABLE IF EXISTS `sellinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellinfo` (
  `accsr` int(11) NOT NULL,
  `accid` varchar(12) NOT NULL COMMENT '회원 아이디',
  `accname` varchar(20) NOT NULL COMMENT '회원 이름',
  `danaddr` varchar(100) NOT NULL COMMENT '회원 기본 주소 연결',
  `detailaddr` varchar(50) NOT NULL COMMENT '회원 상세 주소 연결',
  `sellbrand` varchar(30) NOT NULL COMMENT '구매 상품 브랜드명',
  `sellkinds` varchar(15) NOT NULL COMMENT '구매 상품 종류{250GB,500GB,1TB,2TB}',
  `selldata` varchar(20) NOT NULL COMMENT '구매 상품의 용량',
  `sellprice` smallint(6) NOT NULL COMMENT '구매 상품의 가격',
  `sellcount` smallint(6) NOT NULL COMMENT '구매 상품 개수',
  `sellsr` int(11) NOT NULL,
  KEY `sellinfo_FK` (`accsr`),
  KEY `sellinfo_FK_1` (`sellsr`),
  CONSTRAINT `sellinfo_FK` FOREIGN KEY (`accsr`) REFERENCES `account` (`accsr`),
  CONSTRAINT `sellinfo_FK_1` FOREIGN KEY (`sellsr`) REFERENCES `selllist` (`sellsr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellinfo`
--

LOCK TABLES `sellinfo` WRITE;
/*!40000 ALTER TABLE `sellinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selllist`
--

DROP TABLE IF EXISTS `selllist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selllist` (
  `sellsr` int(11) NOT NULL AUTO_INCREMENT,
  `sellbrand` varchar(30) NOT NULL COMMENT '판매상품 브랜드명',
  `sellkinds` varchar(15) NOT NULL COMMENT '판매상품 종류{250GB,500GB,1TB,2TB}',
  `selldata` varchar(20) NOT NULL COMMENT '판매상품의 용량',
  `sellinven` smallint(6) NOT NULL COMMENT '판매상품의 재고량 ',
  `sellprice` smallint(6) NOT NULL COMMENT '판매상품의 가격',
  `sellinfo` blob DEFAULT NULL COMMENT '상품 설명 등록',
  `sellimage` blob DEFAULT NULL COMMENT '상품 이미지 등록',
  `sellcreate` datetime NOT NULL COMMENT '상품 등록 시간 저장',
  `bksr` int(11) NOT NULL,
  `sellusr` int(11) NOT NULL,
  PRIMARY KEY (`sellsr`),
  KEY `selllist_FK` (`sellusr`),
  KEY `selllist_FK_1` (`bksr`),
  CONSTRAINT `selllist_FK` FOREIGN KEY (`sellusr`) REFERENCES `sellacc` (`sellusr`),
  CONSTRAINT `selllist_FK_1` FOREIGN KEY (`bksr`) REFERENCES `shopbasket` (`bksr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selllist`
--

LOCK TABLES `selllist` WRITE;
/*!40000 ALTER TABLE `selllist` DISABLE KEYS */;
/*!40000 ALTER TABLE `selllist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopbasket`
--

DROP TABLE IF EXISTS `shopbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopbasket` (
  `bksr` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원이 담을 숫자',
  `accsr` int(11) NOT NULL COMMENT '회원 정보를 연계하기 위한 숫자',
  `sellbrand` varchar(30) NOT NULL COMMENT '판매상품 브랜드명',
  `sellkinds` varchar(15) NOT NULL COMMENT '판매상품 종류{250GB,500GB,1TB,2TB}',
  `sellprice` smallint(6) NOT NULL COMMENT '판매상품 가격',
  `bkcount` smallint(6) NOT NULL COMMENT '장바구니 담은 개수',
  PRIMARY KEY (`bksr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopbasket`
--

LOCK TABLES `shopbasket` WRITE;
/*!40000 ALTER TABLE `shopbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopbasket` ENABLE KEYS */;
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

-- Dump completed on 2021-08-26 12:53:12
