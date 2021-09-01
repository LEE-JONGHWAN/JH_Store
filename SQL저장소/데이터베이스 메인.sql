/* 이곳은 현재 생성한 테이블에 대한 DDL문이며 
   데이터베이스 사용자 지정과 권한 설정 및 각 테이블의 정보가 들어와 있다.
   그 외에 추가 되는 것은 추후 추가할 예정이다.
*/

-- 데이터 베이스를 root에서 생성..
CREATE DATABASE `jh_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

-- 데이터 베이스를 사용할 유저를 생성한다..
-- *유저명 설정...
CREATE USER 'test'@'localhost';

-- *비밀번호 설정...
ALTER USER 'test'@'localhost' IDENTIFIED BY '1234';


-- 수동 입력 할때에는 이하의 문장을 입력하면 된다.
/* User Name : test
   Host : localhost
   Password : 1234
   Confirm : 1234 	*/

-- 데이터 베이스에 권한을 부여한다...
GRANT Alter ON jh_store.* TO 'test'@'localhost';
GRANT Create ON jh_store.* TO 'test'@'localhost';
GRANT Create view ON jh_store.* TO 'test'@'localhost';
GRANT Delete ON jh_store.* TO 'test'@'localhost';
GRANT Delete history ON jh_store.* TO 'test'@'localhost';
GRANT Drop ON jh_store.* TO 'test'@'localhost';
GRANT Grant option ON jh_store.* TO 'test'@'localhost';
GRANT Index ON jh_store.* TO 'test'@'localhost';
GRANT Insert ON jh_store.* TO 'test'@'localhost';
GRANT References ON jh_store.* TO 'test'@'localhost';
GRANT Select ON jh_store.* TO 'test'@'localhost';
GRANT Show view ON jh_store.* TO 'test'@'localhost';
GRANT Trigger ON jh_store.* TO 'test'@'localhost';
GRANT Update ON jh_store.* TO 'test'@'localhost';
GRANT Alter routine ON jh_store.* TO 'test'@'localhost';
GRANT Create routine ON jh_store.* TO 'test'@'localhost';
GRANT Execute ON jh_store.* TO 'test'@'localhost';


-- 각 테이블을 생성한다.

-- *account 테이블
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


-- *sellacc 테이블
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

-- *sellinfo 테이블
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

-- *selllist 테이블
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

-- *shopbasket 테이블
CREATE TABLE `shopbasket` (
  `bksr` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원이 담을 숫자',
  `accsr` int(11) NOT NULL COMMENT '회원 정보를 연계하기 위한 숫자',
  `sellbrand` varchar(30) NOT NULL COMMENT '판매상품 브랜드명',
  `sellkinds` varchar(15) NOT NULL COMMENT '판매상품 종류{250GB,500GB,1TB,2TB}',
  `sellprice` smallint(6) NOT NULL COMMENT '판매상품 가격',
  `bkcount` smallint(6) NOT NULL COMMENT '장바구니 담은 개수',
  PRIMARY KEY (`bksr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


