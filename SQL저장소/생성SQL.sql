
-- 데이터베이스 생성
CREATE DATABASE `jh_store` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- 데이터베이스 권한 추가

GRANT Alter ON jh_store.* TO 'myself'@'localhost';
GRANT Create ON jh_store.* TO 'myself'@'localhost';
GRANT Create view ON jh_store.* TO 'myself'@'localhost';
GRANT Delete ON jh_store.* TO 'myself'@'localhost';
GRANT Delete history ON jh_store.* TO 'myself'@'localhost';
GRANT Drop ON jh_store.* TO 'myself'@'localhost';
GRANT Grant option ON jh_store.* TO 'myself'@'localhost';
GRANT Index ON jh_store.* TO 'myself'@'localhost';
GRANT Insert ON jh_store.* TO 'myself'@'localhost';
GRANT References ON jh_store.* TO 'myself'@'localhost';
GRANT Select ON jh_store.* TO 'myself'@'localhost';
GRANT Show view ON jh_store.* TO 'myself'@'localhost';
GRANT Trigger ON jh_store.* TO 'myself'@'localhost';
GRANT Update ON jh_store.* TO 'myself'@'localhost';


-- 테이블 생성
-- jh_store.도로명주소 definition

CREATE TABLE `도로명주소` (
  `관리번호` decimal(25,0) NOT NULL,
  `도로명코드` decimal(12,0) NOT NULL COMMENT '413904397016',
  `읍면동일련번호` tinyint(2) NOT NULL COMMENT '00',
  `지하여부` tinyint(1) DEFAULT NULL COMMENT '0:지상, 1:지하',
  `건물본번` int(5) unsigned DEFAULT NULL,
  `건물부번` int(5) unsigned DEFAULT NULL,
  `기초구역번호` int(5) unsigned DEFAULT NULL COMMENT '우편번호',
  PRIMARY KEY (`관리번호`),
  KEY `도로명주소_FK3` (`도로명코드`,`읍면동일련번호`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- jh_store.도로명코드 definition

CREATE TABLE `도로명코드` (
  `도로명코드` decimal(12,0) NOT NULL COMMENT '413904397016',
  `읍면동일련번호` tinyint(2) NOT NULL COMMENT '00',
  `시도명` varchar(20) DEFAULT NULL,
  `시군구` varchar(20) DEFAULT NULL,
  `읍면동구분` tinyint(1) DEFAULT NULL COMMENT '0: 읍면, 1:동, 2:미부여',
  `도로명` varchar(80) DEFAULT NULL,
  `읍면동` varchar(20) DEFAULT NULL,
  `읍면동코드` smallint(6) DEFAULT NULL COMMENT '132',
  PRIMARY KEY (`도로명코드`,`읍면동일련번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- jh_store.부가정보 definition

CREATE TABLE `부가정보` (
  `관리번호` decimal(25,0) NOT NULL,
  `시군구건물명` varchar(40) DEFAULT NULL,
  `공동주택여부` tinyint(4) DEFAULT NULL COMMENT '0:비공동주택, 1:공동주택',
  PRIMARY KEY (`관리번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


