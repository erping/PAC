CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daisuifang`
--

DROP TABLE IF EXISTS `daisuifang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daisuifang` (
  `liudate` varchar(30) DEFAULT NULL,
  `luoshi` enum('1','0') DEFAULT '0',
  `shuming` varchar(30) DEFAULT NULL,
  `gaowei` varchar(10) DEFAULT '0',
  `tel` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `complete` varchar(15) NOT NULL,
  `end` varchar(30) NOT NULL,
  `begin` varchar(30) NOT NULL,
  `time` enum('12','6','3','1') NOT NULL,
  `num` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daisuifang`
--

LOCK TABLES `daisuifang` WRITE;
/*!40000 ALTER TABLE `daisuifang` DISABLE KEYS */;
/*!40000 ALTER TABLE `daisuifang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `password` varchar(50) NOT NULL,
  `shuming` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('123456','管理员','admin'),('123456','super','admin2');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_list`
--

DROP TABLE IF EXISTS `doctor_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_list` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_list`
--

LOCK TABLES `doctor_list` WRITE;
/*!40000 ALTER TABLE `doctor_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_name`
--

DROP TABLE IF EXISTS `doctor_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_name` (
  `name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_name`
--

LOCK TABLES `doctor_name` WRITE;
/*!40000 ALTER TABLE `doctor_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_suifang`
--

DROP TABLE IF EXISTS `first_suifang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_suifang` (
  `person` varchar(100) NOT NULL,
  `other` varchar(100) DEFAULT NULL,
  `qitafeigaoxiao` varchar(100) DEFAULT NULL,
  `feigaoxiao` varchar(10) DEFAULT NULL,
  `gaoxiaofangzhi` varchar(10) DEFAULT NULL,
  `gaoxiaochufang` varchar(10) DEFAULT NULL,
  `gaoxiaoshijian` varchar(10) DEFAULT NULL,
  `gaoxiaozhonglei` varchar(10) DEFAULT NULL,
  `gaoxiaobiyun` varchar(10) DEFAULT NULL,
  `yuanyigaoxiao` varchar(10) DEFAULT NULL,
  `huanyongCOCchufang` varchar(10) DEFAULT NULL,
  `huanyongIUD` varchar(30) DEFAULT NULL,
  `huanyongCOC` varchar(30) DEFAULT NULL,
  `huanyongbiyun` varchar(10) DEFAULT NULL,
  `qitaIUDyuanyin` varchar(30) DEFAULT NULL,
  `IUDyuanyin` varchar(10) DEFAULT NULL,
  `riqi` varchar(30) DEFAULT NULL,
  `IUDfangzhi2` varchar(30) DEFAULT NULL,
  `IUDjianchi` varchar(10) DEFAULT NULL,
  `IUDfangzhi` varchar(30) DEFAULT NULL,
  `COCchufangshu` varchar(10) DEFAULT '0',
  `COCjixuchufang` varchar(10) DEFAULT NULL,
  `qitaCOCyuanyin` varchar(100) DEFAULT NULL,
  `COCyuanyin` varchar(10) DEFAULT '0',
  `COCjianchi` varchar(10) DEFAULT '0',
  `COCzhonglei` varchar(10) DEFAULT NULL,
  `COCchufang` varchar(100) DEFAULT NULL,
  `COCshijian` varchar(100) DEFAULT NULL,
  `liuchanbiyun` varchar(100) DEFAULT NULL,
  `xinghuifu` varchar(10) DEFAULT NULL,
  `yuejingxueliang` varchar(10) DEFAULT NULL,
  `huifushijian` varchar(10) DEFAULT NULL,
  `yuejinghuifu` varchar(10) DEFAULT NULL,
  `qitabushi` varchar(100) DEFAULT NULL,
  `bushi` varchar(10) DEFAULT NULL,
  `youwubushi` varchar(10) DEFAULT NULL,
  `chuxue` varchar(10) DEFAULT NULL,
  `qitabingfa` varchar(100) DEFAULT NULL,
  `bingfa` varchar(10) DEFAULT NULL,
  `youwubingfa` varchar(10) DEFAULT NULL,
  `chuxuetianshu` varchar(10) DEFAULT NULL,
  `neimo` varchar(10) DEFAULT NULL,
  `canliu` varchar(10) DEFAULT NULL,
  `Bchao` varchar(10) NOT NULL,
  `fangshi` varchar(10) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `num` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_suifang`
--

LOCK TABLES `first_suifang` WRITE;
/*!40000 ALTER TABLE `first_suifang` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_suifang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_info`
--

DROP TABLE IF EXISTS `patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_info` (
  `luoshi` varchar(10) DEFAULT '0',
  `gaowei` varchar(10) DEFAULT '0',
  `COCjianyichufang` varchar(10) DEFAULT NULL,
  `IUDshijifangzhi` varchar(10) DEFAULT NULL,
  `COCshijishijian` varchar(10) DEFAULT NULL,
  `COCzhonglei` varchar(10) DEFAULT '0',
  `shijibiyun` varchar(10) DEFAULT NULL,
  `yisheng` varchar(30) DEFAULT NULL,
  `person` varchar(10) DEFAULT NULL,
  `otherzixun` varchar(100) DEFAULT NULL,
  `zhidao` varchar(10) DEFAULT NULL,
  `buliang` varchar(10) DEFAULT NULL,
  `COCchufang` varchar(10) DEFAULT NULL,
  `weiliji` varchar(100) DEFAULT NULL,
  `IUDfangzhi` varchar(10) DEFAULT NULL,
  `COCshijian` varchar(10) DEFAULT NULL,
  `othernibiyun` varchar(30) DEFAULT NULL,
  `nibiyun` varchar(10) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  `pinlv` varchar(10) DEFAULT NULL,
  `plan` varchar(10) DEFAULT NULL,
  `otherbiyun` varchar(30) DEFAULT NULL,
  `biyun` varchar(100) DEFAULT NULL,
  `renshen` varchar(10) DEFAULT NULL,
  `otherhistory` varchar(100) DEFAULT NULL,
  `history` varchar(100) DEFAULT NULL,
  `qitagaowei` varchar(10) DEFAULT NULL,
  `lieshang` varchar(10) DEFAULT '0',
  `zhanlian` varchar(10) DEFAULT NULL,
  `zigong` varchar(10) DEFAULT NULL,
  `liu2` varchar(10) DEFAULT NULL,
  `liutonow` varchar(10) DEFAULT NULL,
  `liulater` varchar(15) DEFAULT NULL,
  `moci` varchar(10) DEFAULT NULL,
  `liutime` varchar(10) DEFAULT NULL,
  `zhiru` varchar(10) DEFAULT NULL,
  `buru` varchar(10) DEFAULT NULL,
  `poutime` varchar(10) DEFAULT '0',
  `birth` varchar(10) DEFAULT NULL,
  `chantonow` varchar(10) DEFAULT NULL,
  `chanlater` varchar(15) DEFAULT NULL,
  `chantime` varchar(10) DEFAULT NULL,
  `yuntime` varchar(10) DEFAULT NULL,
  `liudate` varchar(15) DEFAULT NULL,
  `niliuchan` varchar(10) DEFAULT NULL,
  `Bchao` varchar(10) DEFAULT NULL,
  `tingjing` varchar(10) DEFAULT NULL,
  `yuanyin` varchar(10) DEFAULT '0',
  `zhiye` varchar(10) DEFAULT NULL,
  `huji` varchar(10) DEFAULT NULL,
  `hun` varchar(10) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `num` varchar(30) NOT NULL,
  `date` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_info`
--

LOCK TABLES `patient_info` WRITE;
/*!40000 ALTER TABLE `patient_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `only` enum('1') NOT NULL DEFAULT '1',
  `twelveend` int(11) DEFAULT NULL,
  `twelvebegin` int(11) DEFAULT NULL,
  `sixend` int(11) DEFAULT NULL,
  `sixbegin` int(11) DEFAULT NULL,
  `threeend` int(11) DEFAULT NULL,
  `threebegin` int(11) DEFAULT NULL,
  `firstend` int(11) DEFAULT NULL,
  `firstbegin` int(11) DEFAULT NULL,
  PRIMARY KEY (`only`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('1',390,360,210,180,90,60,30,15);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhongyuan`
--

DROP TABLE IF EXISTS `zhongyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhongyuan` (
  `person` varchar(15) DEFAULT NULL,
  `zhongzhi` varchar(10) DEFAULT NULL,
  `renshen` varchar(10) DEFAULT NULL,
  `yiwai` varchar(10) DEFAULT '0',
  `huanjie` varchar(10) DEFAULT '0',
  `qitafeigaoxiao` varchar(30) DEFAULT NULL,
  `feigaoxiao` varchar(10) DEFAULT NULL,
  `gaoxiaofangzhi` varchar(10) DEFAULT NULL,
  `gaoxiaochufang` varchar(10) DEFAULT NULL,
  `gaoxiaoshijian` varchar(10) DEFAULT NULL,
  `gaoxiaobiyun` varchar(10) DEFAULT NULL,
  `yuanyigaoxiao` varchar(10) DEFAULT NULL,
  `huanyongCOCchufang` varchar(10) DEFAULT NULL,
  `huanyongIUD` varchar(30) DEFAULT NULL,
  `huanyongCOC` varchar(30) DEFAULT NULL,
  `huanyongbiyun` varchar(10) DEFAULT NULL,
  `qitaIUDyuanyin` varchar(100) DEFAULT NULL,
  `IUDyuanyin` varchar(10) DEFAULT NULL,
  `riqi2` varchar(30) DEFAULT NULL,
  `riqi` varchar(30) DEFAULT NULL,
  `IUDfangzhi2` varchar(10) DEFAULT NULL,
  `IUDjianchi` varchar(10) DEFAULT NULL,
  `IUDfangzhi` varchar(30) DEFAULT NULL,
  `COCchufangshu` varchar(10) DEFAULT NULL,
  `COCjixuchufang` varchar(10) DEFAULT NULL,
  `qitaCOCyuanyin` varchar(100) DEFAULT NULL,
  `COCyuanyin` varchar(10) DEFAULT NULL,
  `COCjixu` varchar(10) DEFAULT NULL,
  `COCjianchi` varchar(10) DEFAULT NULL,
  `COCchufang` varchar(10) DEFAULT NULL,
  `COCshijian` varchar(30) DEFAULT NULL,
  `liuchanbiyun` varchar(30) DEFAULT NULL,
  `xinghuifu` varchar(10) DEFAULT NULL,
  `xiangbi` varchar(10) DEFAULT NULL,
  `huifushijian` varchar(10) DEFAULT NULL,
  `huifu` varchar(10) DEFAULT '0',
  `qitabushi` varchar(100) DEFAULT NULL,
  `bushi` varchar(10) DEFAULT NULL,
  `youwubushi` varchar(10) DEFAULT NULL,
  `chuxue` varchar(10) DEFAULT NULL,
  `qitabingfa` varchar(30) DEFAULT '0',
  `bingfa` varchar(10) DEFAULT NULL,
  `youwubingfa` varchar(10) DEFAULT NULL,
  `chuxuetianshu` varchar(5) NOT NULL DEFAULT '1',
  `fangshi` varchar(10) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `num` varchar(30) NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhongyuan`
--

LOCK TABLES `zhongyuan` WRITE;
/*!40000 ALTER TABLE `zhongyuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhongyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhongyuan12`
--

DROP TABLE IF EXISTS `zhongyuan12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhongyuan12` (
  `person` varchar(15) DEFAULT NULL,
  `zhongzhi` varchar(10) DEFAULT NULL,
  `yiyuanrenshen` varchar(10) DEFAULT NULL,
  `renshen` varchar(10) DEFAULT NULL,
  `yiwai` varchar(10) DEFAULT NULL,
  `qitafeigaoxiao` varchar(30) DEFAULT NULL,
  `feigaoxiao` varchar(10) DEFAULT NULL,
  `gaoxiaofangzhi` varchar(10) DEFAULT NULL,
  `gaoxiaochufang` varchar(10) DEFAULT NULL,
  `gaoxiaoshijian` varchar(10) DEFAULT NULL,
  `gaoxiaobiyun` varchar(10) DEFAULT NULL,
  `yuanyigaoxiao` varchar(10) DEFAULT NULL,
  `qitaIUDyuanyin` varchar(30) DEFAULT NULL,
  `IUDyuanyin` varchar(10) DEFAULT NULL,
  `IUDjianchi` varchar(10) DEFAULT NULL,
  `IUDfangzhi` varchar(30) DEFAULT NULL,
  `qitaCOCyuanyin` varchar(30) DEFAULT NULL,
  `COCyuanyin` varchar(10) DEFAULT NULL,
  `COCjixu` varchar(10) DEFAULT NULL,
  `COCqudao` varchar(10) DEFAULT NULL,
  `COCjianchi` varchar(10) DEFAULT NULL,
  `COCchufang` varchar(4) DEFAULT NULL,
  `COCshijian` varchar(20) DEFAULT NULL,
  `liuchanbiyun` varchar(20) DEFAULT NULL,
  `fangshi` varchar(10) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `num` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(15) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhongyuan12`
--

LOCK TABLES `zhongyuan12` WRITE;
/*!40000 ALTER TABLE `zhongyuan12` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhongyuan12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhongyuan6`
--

DROP TABLE IF EXISTS `zhongyuan6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhongyuan6` (
  `person` varchar(15) DEFAULT NULL,
  `zhongzhi` varchar(10) DEFAULT NULL,
  `yiyuanrenshen` varchar(10) DEFAULT NULL,
  `renshen` varchar(10) DEFAULT NULL,
  `yiwai` varchar(10) DEFAULT NULL,
  `qitafeigaoxiao` varchar(30) DEFAULT NULL,
  `feigaoxiao` varchar(10) DEFAULT NULL,
  `gaoxiaofangzhi` varchar(10) DEFAULT NULL,
  `gaoxiaochufang` varchar(10) DEFAULT NULL,
  `gaoxiaoshijian` varchar(10) DEFAULT NULL,
  `gaoxiaozhonglei` varchar(10) DEFAULT '0',
  `gaoxiaobiyun` varchar(10) DEFAULT NULL,
  `yuanyigaoxiao` varchar(10) DEFAULT NULL,
  `huanyongCOCchufang` varchar(10) DEFAULT NULL,
  `huanyongIUD` varchar(10) DEFAULT NULL,
  `huanyongCOC` varchar(10) DEFAULT NULL,
  `huanyongbiyun` varchar(15) DEFAULT NULL,
  `qitaIUDyuanyin` varchar(30) DEFAULT NULL,
  `IUDyuanyin` varchar(10) DEFAULT NULL,
  `IUDjianchi` varchar(10) DEFAULT NULL,
  `IUDfangzhi` varchar(30) DEFAULT NULL,
  `qitaCOCyuanyin` varchar(30) DEFAULT NULL,
  `COCyuanyin` varchar(10) DEFAULT NULL,
  `COCjixu` varchar(10) DEFAULT NULL,
  `COCqudao` varchar(10) DEFAULT NULL,
  `COCjianchi` varchar(10) DEFAULT NULL,
  `COCchufang` varchar(4) DEFAULT NULL,
  `COCshijian` varchar(20) DEFAULT NULL,
  `liuchanbiyun` varchar(20) DEFAULT NULL,
  `fangshi` varchar(10) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `num` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(15) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhongyuan6`
--

LOCK TABLES `zhongyuan6` WRITE;
/*!40000 ALTER TABLE `zhongyuan6` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhongyuan6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-17 17:04:33
