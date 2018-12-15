/*
SQLyog Professional v12.09 (64 bit)
MySQL - 10.1.32-MariaDB : Database - django
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`django` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `django`;

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id_area` smallint(6) NOT NULL,
  `tare_id` smallint(6) DEFAULT NULL,
  `area_nombre` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_sigla` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `areas` */

LOCK TABLES `areas` WRITE;

UNLOCK TABLES;

/*Table structure for table `cargos` */

DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `id_cargo` smallint(6) NOT NULL,
  `car_nombre` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_sigla` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cargos` */

LOCK TABLES `cargos` WRITE;

UNLOCK TABLES;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `cli_id` int(11) NOT NULL,
  `cli_empresa` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_email_p` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_email_t` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_fecha` date DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cliente` */

LOCK TABLES `cliente` WRITE;

UNLOCK TABLES;

/*Table structure for table `contratos` */

DROP TABLE IF EXISTS `contratos`;

CREATE TABLE `contratos` (
  `cod_contrato` smallint(6) NOT NULL AUTO_INCREMENT,
  `pro_descri` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ing` date DEFAULT NULL,
  `fecha_act` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  PRIMARY KEY (`cod_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contratos` */

LOCK TABLES `contratos` WRITE;

insert  into `contratos`(`cod_contrato`,`pro_descri`,`fecha_ing`,`fecha_act`,`id_user`,`estado`) values (1,'RRHH','2018-12-14',NULL,1,'A'),(2,'ADMIN','2018-12-14',NULL,1,'A'),(3,'RRHH','2018-12-14',NULL,1,'A'),(4,'ADMIN','2018-12-14',NULL,1,'A');

UNLOCK TABLES;

/*Table structure for table `dataperfil` */

DROP TABLE IF EXISTS `dataperfil`;

CREATE TABLE `dataperfil` (
  `code` int(1) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dataperfil` */

LOCK TABLES `dataperfil` WRITE;

insert  into `dataperfil`(`code`,`name`) values (1,'Básico'),(4,'Supervisor'),(5,'Administrador');

UNLOCK TABLES;

/*Table structure for table `devoluciones` */

DROP TABLE IF EXISTS `devoluciones`;

CREATE TABLE `devoluciones` (
  `id_dev` int(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` smallint(6) NOT NULL,
  `fac_cliente` smallint(6) NOT NULL,
  `motivo` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `responsable` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `documento` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tot_lotes` smallint(6) NOT NULL DEFAULT '0',
  `tot_folders` smallint(6) NOT NULL DEFAULT '0',
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_user` smallint(6) NOT NULL,
  PRIMARY KEY (`id_dev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `devoluciones` */

LOCK TABLES `devoluciones` WRITE;

UNLOCK TABLES;

/*Table structure for table `devoluciones_detalle` */

DROP TABLE IF EXISTS `devoluciones_detalle`;

CREATE TABLE `devoluciones_detalle` (
  `id_dev_det` int(11) NOT NULL AUTO_INCREMENT,
  `id_dev` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_det` int(11) NOT NULL,
  `lote_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_pag` smallint(6) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_user` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_dev_det`,`id_dev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `devoluciones_detalle` */

LOCK TABLES `devoluciones_detalle` WRITE;

UNLOCK TABLES;

/*Table structure for table `devoluciones_estado` */

DROP TABLE IF EXISTS `devoluciones_estado`;

CREATE TABLE `devoluciones_estado` (
  `id_dev_st` int(11) NOT NULL AUTO_INCREMENT,
  `id_dev` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user` smallint(6) NOT NULL,
  PRIMARY KEY (`id_dev_st`,`id_dev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `devoluciones_estado` */

LOCK TABLES `devoluciones_estado` WRITE;

UNLOCK TABLES;

/*Table structure for table `direcciones` */

DROP TABLE IF EXISTS `direcciones`;

CREATE TABLE `direcciones` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_geo` int(11) DEFAULT NULL,
  `ciu_id` smallint(6) DEFAULT NULL,
  `id_urb` int(11) DEFAULT NULL,
  `id_mz` int(11) DEFAULT NULL,
  `id_calle` int(11) DEFAULT NULL,
  `dir_num_via` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir_num_lote` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir_px` float(10,6) NOT NULL,
  `dir_py` float(10,6) NOT NULL,
  `dir_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `direcciones` */

LOCK TABLES `direcciones` WRITE;

UNLOCK TABLES;

/*Table structure for table `fac_cliente` */

DROP TABLE IF EXISTS `fac_cliente`;

CREATE TABLE `fac_cliente` (
  `fac_cliente` smallint(6) NOT NULL AUTO_INCREMENT,
  `shi_codigo` smallint(6) DEFAULT NULL,
  `cod_contrato` smallint(6) DEFAULT NULL,
  `fac_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fac_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fac_cliente` */

LOCK TABLES `fac_cliente` WRITE;

insert  into `fac_cliente`(`fac_cliente`,`shi_codigo`,`cod_contrato`,`fac_estado`) values (1,1,1,'A'),(2,1,2,'A'),(3,2,3,'A'),(4,2,4,'A');

UNLOCK TABLES;

/*Table structure for table `formatos` */

DROP TABLE IF EXISTS `formatos`;

CREATE TABLE `formatos` (
  `cod_formato` smallint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `width` smallint(4) NOT NULL,
  `height` smallint(4) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cod_formato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `formatos` */

LOCK TABLES `formatos` WRITE;

insert  into `formatos`(`cod_formato`,`nombre`,`width`,`height`,`estado`) values (1,'A4',3508,2480,'A');

UNLOCK TABLES;

/*Table structure for table `key_user` */

DROP TABLE IF EXISTS `key_user`;

CREATE TABLE `key_user` (
  `id_user` int(11) NOT NULL,
  `usr_clave` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_cambio` datetime DEFAULT NULL,
  `fec_hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_vence` date DEFAULT NULL,
  `tim_sesion` smallint(6) DEFAULT NULL,
  `key_anterior` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `key_user` */

LOCK TABLES `key_user` WRITE;

insert  into `key_user`(`id_user`,`usr_clave`,`fec_cambio`,`fec_hora`,`fec_vence`,`tim_sesion`,`key_anterior`) values (1,'40bd001563085fc35165329ea1ff5c5ecbdbbeef','2017-01-02 00:00:00','201701','2050-01-02',60,'40bd001563085fc35165329ea1ff5c5ecbdbbeef'),(2,'5634cccd21da310ff232c91b3e76b0fa6a227427','2018-12-14 12:24:51','12','2050-01-01',60,''),(3,'beffa320ef0a9818b25d807174c4ce57f1251609','2018-12-14 12:25:18','12','2050-01-01',60,''),(4,'2b3f2f1cdeebfecb6cfee04a7685a69cb5f3a2ae','2018-12-14 12:26:09','12','2050-01-01',60,''),(5,'9a0a6b5e2d29bde1f242a8eef840cef70bff1987','2018-12-14 12:26:39','12','2050-01-01',60,''),(6,'48b7560fffefc4231876e914d67d2ddb3db9e62e','2018-12-14 14:51:01','14','2050-01-01',60,'');

UNLOCK TABLES;

/*Table structure for table `log_accesos` */

DROP TABLE IF EXISTS `log_accesos`;

CREATE TABLE `log_accesos` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `sis_id` smallint(6) DEFAULT NULL,
  `fec_ingreso` date DEFAULT NULL,
  `fec_ing_hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_salida` date DEFAULT NULL,
  `fec_salhora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_ip` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=2868 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `log_accesos` */

LOCK TABLES `log_accesos` WRITE;

insert  into `log_accesos`(`id_log`,`id_user`,`sis_id`,`fec_ingreso`,`fec_ing_hora`,`fec_salida`,`fec_salhora`,`log_ip`,`log_estado`) values (1,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(2,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(3,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(4,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(5,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(6,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'192.168.0.2','1'),(7,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(8,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(9,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(10,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'192.168.0.2','1'),(11,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(12,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(13,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(14,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(15,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(16,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(17,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(18,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(19,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(20,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(21,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(22,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(23,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(24,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(25,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(26,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(27,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(28,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(29,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(30,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(31,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(32,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(33,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(34,1,1,'2017-07-26',NULL,'2017-07-26',NULL,'acceso','1'),(35,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(36,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(37,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(38,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(39,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(40,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(41,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(42,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(43,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(44,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(45,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'::1','1'),(46,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(47,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(48,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(49,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(50,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(51,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(52,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(53,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(54,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(55,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(56,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(57,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(58,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(59,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(60,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(61,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(62,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(63,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(64,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(65,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(66,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(67,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(68,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(69,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(70,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(71,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(72,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(73,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(74,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(75,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(76,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(77,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(78,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(79,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(80,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(81,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(82,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(83,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(84,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(85,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(86,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(87,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(88,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'::1','1'),(89,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(90,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(91,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(92,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(93,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(94,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(95,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(96,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(97,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(98,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(99,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(100,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(101,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(102,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(103,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(104,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(105,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(106,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(107,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(108,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(109,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(110,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(111,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(112,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(113,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(114,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(115,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(116,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(117,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(118,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(119,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(120,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(121,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(122,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(123,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(124,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(125,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(126,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(127,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(128,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(129,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(130,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(131,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(132,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(133,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(134,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(135,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(136,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(137,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(138,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(139,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(140,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(141,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(142,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(143,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(144,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(145,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(146,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(147,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(148,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(149,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(150,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(151,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(152,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(153,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(154,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(155,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(156,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(157,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(158,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(159,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(160,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(161,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(162,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(163,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(164,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(165,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(166,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(167,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(168,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(169,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(170,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(171,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(172,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(173,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(174,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(175,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(176,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(177,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(178,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(179,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(180,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(181,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(182,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(183,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(184,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(185,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(186,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(187,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(188,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(189,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(190,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(191,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(192,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(193,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(194,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(195,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(196,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(197,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(198,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(199,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(200,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(201,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(202,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(203,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(204,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(205,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(206,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(207,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(208,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(209,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(210,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(211,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(212,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(213,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(214,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(215,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(216,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(217,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(218,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(219,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(220,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(221,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(222,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(223,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(224,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(225,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(226,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(227,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(228,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(229,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(230,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(231,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(232,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(233,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(234,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(235,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(236,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(237,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(238,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(239,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(240,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(241,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(242,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(243,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(244,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(245,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(246,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(247,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(248,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(249,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(250,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(251,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(252,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(253,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(254,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(255,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(256,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(257,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(258,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(259,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(260,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(261,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(262,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(263,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(264,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(265,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(266,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(267,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(268,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(269,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(270,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(271,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(272,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(273,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(274,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(275,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(276,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(277,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(278,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(279,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(280,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(281,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(282,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(283,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(284,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'::1','1'),(285,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(286,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(287,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(288,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(289,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(290,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(291,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(292,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(293,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(294,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(295,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(296,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(297,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(298,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(299,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(300,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(301,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(302,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(303,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(304,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(305,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(306,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(307,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(308,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(309,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(310,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(311,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(312,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(313,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'::1','1'),(314,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(315,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(316,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(317,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(318,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(319,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(320,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(321,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(322,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(323,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(324,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(325,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(326,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(327,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(328,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(329,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(330,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(331,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(332,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(333,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(334,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(335,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(336,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(337,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(338,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(339,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(340,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(341,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(342,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(343,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(344,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(345,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(346,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(347,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(348,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(349,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(350,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(351,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(352,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(353,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(354,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(355,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(356,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(357,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(358,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(359,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(360,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(361,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(362,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(363,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(364,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(365,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(366,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(367,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(368,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(369,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(370,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(371,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(372,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(373,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(374,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(375,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(376,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(377,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(378,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(379,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(380,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(381,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(382,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(383,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(384,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(385,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(386,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(387,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(388,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(389,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(390,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(391,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(392,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(393,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(394,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(395,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(396,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(397,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(398,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(399,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(400,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(401,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(402,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(403,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(404,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(405,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(406,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(407,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(408,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(409,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(410,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(411,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(412,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(413,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(414,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(415,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(416,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(417,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(418,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(419,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(420,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(421,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(422,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(423,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(424,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(425,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(426,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(427,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(428,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(429,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(430,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(431,1,1,'2017-07-27',NULL,'2017-07-27',NULL,'acceso','1'),(432,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(433,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(434,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(435,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(436,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(437,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(438,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(439,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(440,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(441,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(442,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(443,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(444,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(445,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(446,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(447,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(448,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(449,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(450,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(451,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(452,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(453,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(454,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(455,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(456,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(457,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(458,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(459,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(460,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(461,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(462,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(463,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(464,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(465,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(466,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(467,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(468,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(469,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(470,1,1,'2017-07-28',NULL,'2017-07-28',NULL,'acceso','1'),(471,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(472,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(473,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(474,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(475,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(476,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(477,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(478,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(479,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(480,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(481,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(482,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(483,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(484,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(485,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(486,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(487,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(488,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(489,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(490,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(491,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(492,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(493,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(494,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'::1','1'),(495,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(496,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'::1','1'),(497,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(498,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(499,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(500,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(501,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(502,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(503,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(504,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(505,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(506,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(507,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(508,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(509,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(510,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(511,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(512,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(513,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(514,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(515,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(516,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(517,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(518,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(519,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(520,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(521,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(522,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(523,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(524,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(525,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(526,1,1,'2017-07-29',NULL,'2017-07-29',NULL,'acceso','1'),(527,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(528,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(529,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(530,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(531,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(532,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(533,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(534,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(535,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'::1','1'),(536,1,1,'2017-07-30',NULL,'2017-07-30',NULL,'acceso','1'),(537,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'::1','1'),(538,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(539,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(540,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(541,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(542,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(543,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(544,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(545,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(546,1,1,'2017-07-31',NULL,'2017-07-31',NULL,'acceso','1'),(547,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(548,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(549,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(550,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(551,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(552,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(553,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(554,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(555,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(556,1,1,'2017-08-01',NULL,'2017-08-01',NULL,'acceso','1'),(557,1,1,'2017-08-03',NULL,'2017-08-03',NULL,'::1','1'),(558,1,1,'2017-08-03',NULL,'2017-08-03',NULL,'acceso','1'),(559,1,1,'2017-08-03',NULL,'2017-08-03',NULL,'acceso','1'),(560,1,1,'2017-08-03',NULL,'2017-08-03',NULL,'::1','1'),(561,1,1,'2017-08-03',NULL,'2017-08-03',NULL,'acceso','1'),(562,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(563,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(564,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(565,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(566,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(567,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(568,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(569,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(570,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(571,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(572,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(573,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(574,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(575,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(576,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(577,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(578,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(579,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(580,1,1,'2017-08-04',NULL,'2017-08-04',NULL,'acceso','1'),(581,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'::1','1'),(582,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(583,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(584,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(585,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(586,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(587,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(588,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(589,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(590,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(591,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'::1','1'),(592,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(593,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(594,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(595,1,1,'2017-08-05',NULL,'2017-08-05',NULL,'acceso','1'),(596,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'acceso','1'),(597,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'::1','1'),(598,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'acceso','1'),(599,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'::1','1'),(600,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'acceso','1'),(601,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'::1','1'),(602,1,1,'2017-08-06',NULL,'2017-08-06',NULL,'acceso','1'),(603,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(604,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(605,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(606,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(607,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(608,1,1,'2017-08-08',NULL,'2017-08-08',NULL,'acceso','1'),(609,1,1,'2017-10-21',NULL,'2017-10-21',NULL,'::1','1'),(610,1,1,'2017-10-21',NULL,'2017-10-21',NULL,'acceso','1'),(611,1,1,'2017-10-26',NULL,'2017-10-26',NULL,'::1','1'),(612,1,1,'2017-10-26',NULL,'2017-10-26',NULL,'acceso','1'),(613,1,1,'2017-10-27',NULL,'2017-10-27',NULL,'::1','1'),(614,1,1,'2017-10-27',NULL,'2017-10-27',NULL,'acceso','1'),(615,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'::1','1'),(616,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(617,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(618,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'::1','1'),(619,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(620,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(621,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(622,1,1,'2018-05-26',NULL,'2018-05-26',NULL,'acceso','1'),(623,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(624,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(625,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(626,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(627,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(628,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(629,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(630,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(631,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(632,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(633,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(634,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(635,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(636,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(637,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(638,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(639,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(640,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(641,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(642,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(643,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(644,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(645,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(646,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(647,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(648,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(649,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(650,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(651,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(652,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(653,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(654,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(655,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(656,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(657,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(658,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(659,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(660,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(661,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(662,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(663,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(664,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(665,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(666,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'::1','1'),(667,1,1,'2018-07-11',NULL,'2018-07-11',NULL,'acceso','1'),(668,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(669,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(670,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(671,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(672,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(673,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(674,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(675,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(676,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(677,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(678,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(679,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(680,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(681,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(682,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(683,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(684,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(685,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(686,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(687,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(688,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(689,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(690,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(691,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(692,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(693,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(694,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(695,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(696,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(697,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(698,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(699,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(700,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(701,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(702,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(703,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'::1','1'),(704,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(705,1,1,'2018-07-12',NULL,'2018-07-12',NULL,'acceso','1'),(706,1,1,'2018-07-13',NULL,'2018-07-13',NULL,'::1','1'),(707,1,1,'2018-07-13',NULL,'2018-07-13',NULL,'::1','1'),(708,1,1,'2018-07-13',NULL,'2018-07-13',NULL,'acceso','1'),(709,1,1,'2018-07-13',NULL,'2018-07-13',NULL,'::1','1'),(710,1,1,'2018-07-13',NULL,'2018-07-13',NULL,'acceso','1'),(711,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'::1','1'),(712,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'acceso','1'),(713,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'::1','1'),(714,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'acceso','1'),(715,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'::1','1'),(716,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'acceso','1'),(717,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'acceso','1'),(718,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'::1','1'),(719,1,1,'2018-07-14',NULL,'2018-07-14',NULL,'acceso','1'),(720,1,1,'2018-07-15',NULL,'2018-07-15',NULL,'::1','1'),(721,1,1,'2018-07-15',NULL,'2018-07-15',NULL,'acceso','1'),(722,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'::1','1'),(723,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(724,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'::1','1'),(725,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(726,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'::1','1'),(727,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(728,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(729,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(730,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(731,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'::1','1'),(732,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(733,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(734,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(735,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(736,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(737,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(738,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(739,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(740,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(741,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(742,1,1,'2018-07-16',NULL,'2018-07-16',NULL,'acceso','1'),(743,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(744,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(745,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(746,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(747,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(748,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(749,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(750,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(751,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(752,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(753,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(754,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(755,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(756,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(757,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(758,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(759,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(760,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(761,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(762,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(763,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(764,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(765,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(766,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(767,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(768,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(769,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(770,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(771,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(772,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(773,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(774,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(775,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(776,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(777,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(778,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(779,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(780,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(781,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(782,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(783,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(784,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(785,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(786,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(787,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(788,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(789,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(790,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(791,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'::1','1'),(792,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(793,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(794,1,1,'2018-07-17',NULL,'2018-07-17',NULL,'acceso','1'),(795,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(796,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(797,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(798,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(799,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(800,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(801,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(802,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(803,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(804,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(805,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(806,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(807,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(808,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(809,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(810,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(811,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(812,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(813,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(814,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(815,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(816,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(817,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(818,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(819,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(820,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(821,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(822,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(823,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(824,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(825,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(826,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(827,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(828,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(829,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(830,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(831,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(832,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(833,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(834,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(835,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(836,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(837,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(838,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(839,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(840,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(841,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(842,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(843,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(844,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(845,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(846,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(847,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(848,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(849,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(850,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(851,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(852,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(853,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'::1','1'),(854,1,1,'2018-07-18',NULL,'2018-07-18',NULL,'acceso','1'),(855,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'::1','1'),(856,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(857,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(858,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(859,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(860,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(861,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(862,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(863,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(864,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(865,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(866,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(867,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(868,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(869,1,1,'2018-07-23',NULL,'2018-07-23',NULL,'acceso','1'),(870,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'::1','1'),(871,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(872,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(873,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(874,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(875,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(876,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(877,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(878,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(879,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(880,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(881,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(882,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(883,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(884,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(885,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(886,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(887,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(888,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(889,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(890,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(891,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(892,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(893,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(894,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(895,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'::1','1'),(896,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(897,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(898,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(899,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(900,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(901,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(902,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(903,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(904,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(905,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(906,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(907,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(908,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(909,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(910,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(911,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(912,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(913,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'::1','1'),(914,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(915,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(916,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(917,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(918,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(919,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(920,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(921,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(922,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(923,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(924,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(925,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(926,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(927,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(928,1,1,'2018-07-24',NULL,'2018-07-24',NULL,'acceso','1'),(929,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'::1','1'),(930,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(931,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(932,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'::1','1'),(933,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'::1','1'),(934,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(935,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(936,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(937,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(938,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(939,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(940,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(941,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(942,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(943,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(944,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(945,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(946,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(947,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(948,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(949,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(950,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(951,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(952,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(953,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(954,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(955,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(956,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(957,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(958,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'::1','1'),(959,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(960,1,1,'2018-07-25',NULL,'2018-07-25',NULL,'acceso','1'),(961,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(962,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(963,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(964,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(965,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(966,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(967,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(968,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(969,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(970,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(971,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(972,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(973,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(974,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'::1','1'),(975,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(976,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(977,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(978,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(979,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(980,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(981,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(982,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(983,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(984,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(985,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(986,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(987,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(988,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(989,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(990,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(991,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(992,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(993,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(994,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(995,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(996,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(997,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(998,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(999,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(1000,1,1,'2018-07-26',NULL,'2018-07-26',NULL,'acceso','1'),(1001,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'::1','1'),(1002,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1003,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'::1','1'),(1004,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1005,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'::1','1'),(1006,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1007,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1008,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1009,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1010,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1011,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1012,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1013,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1014,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1015,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1016,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1017,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1018,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1019,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1020,1,1,'2018-07-27',NULL,'2018-07-27',NULL,'acceso','1'),(1021,1,1,'2018-07-31',NULL,'2018-07-31',NULL,'::1','1'),(1022,1,1,'2018-07-31',NULL,'2018-07-31',NULL,'acceso','1'),(1023,1,1,'2018-07-31',NULL,'2018-07-31',NULL,'::1','1'),(1024,1,1,'2018-07-31',NULL,'2018-07-31',NULL,'acceso','1'),(1025,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'::1','1'),(1026,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1027,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'::1','1'),(1028,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1029,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1030,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1031,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1032,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1033,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1034,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1035,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1036,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1037,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1038,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1039,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1040,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1041,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1042,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1043,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1044,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1045,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1046,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1047,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1048,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'::1','1'),(1049,1,1,'2018-08-01',NULL,'2018-08-01',NULL,'acceso','1'),(1050,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'::1','1'),(1051,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1052,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'::1','1'),(1053,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1054,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1055,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'::1','1'),(1056,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1057,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'::1','1'),(1058,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1059,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1060,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'::1','1'),(1061,1,1,'2018-08-02',NULL,'2018-08-02',NULL,'acceso','1'),(1062,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1063,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1064,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1065,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1066,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1067,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1068,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1069,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1070,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1071,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1072,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1073,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1074,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1075,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1076,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1077,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1078,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1079,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1080,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1081,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1082,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1083,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'acceso','1'),(1084,1,1,'2018-08-03',NULL,'2018-08-03',NULL,'::1','1'),(1085,1,1,'2018-08-04',NULL,'2018-08-04',NULL,'acceso','1'),(1086,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1087,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1088,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1089,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1090,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1091,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1092,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1093,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1094,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1095,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1096,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1097,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1098,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1099,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1100,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1101,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1102,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'::1','1'),(1103,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1104,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1105,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1106,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1107,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1108,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1109,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1110,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1111,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1112,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1113,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1114,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1115,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1116,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1117,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1118,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1119,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1120,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1121,1,1,'2018-08-06',NULL,'2018-08-06',NULL,'acceso','1'),(1122,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1123,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1124,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'::1','1'),(1125,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1126,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'::1','1'),(1127,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1128,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'::1','1'),(1129,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1130,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1131,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1132,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'::1','1'),(1133,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1134,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1135,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1136,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1137,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1138,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1139,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1140,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1141,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1142,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1143,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1144,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1145,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1146,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1147,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1148,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1149,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1150,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1151,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1152,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1153,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1154,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1155,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1156,1,1,'2018-08-07',NULL,'2018-08-07',NULL,'acceso','1'),(1157,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1158,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1159,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1160,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1161,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1162,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1163,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1164,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1165,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1166,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1167,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1168,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1169,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1170,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1171,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1172,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1173,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1174,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1175,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1176,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1177,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1178,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1179,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1180,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1181,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1182,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1183,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1184,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1185,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1186,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1187,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1188,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1189,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1190,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1191,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1192,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1193,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1194,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1195,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1196,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1197,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1198,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1199,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1200,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1201,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1202,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1203,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'::1','1'),(1204,1,1,'2018-08-08',NULL,'2018-08-08',NULL,'acceso','1'),(1205,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1206,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1207,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1208,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1209,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1210,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1211,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1212,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1213,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1214,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1215,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1216,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1217,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1218,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1219,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1220,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1221,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1222,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1223,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1224,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1225,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1226,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1227,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1228,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1229,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1230,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1231,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1232,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1233,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1234,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1235,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1236,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1237,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1238,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1239,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1240,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1241,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1242,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1243,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1244,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1245,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1246,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1247,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1248,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1249,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1250,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1251,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1252,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1253,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1254,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1255,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1256,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1257,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1258,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1259,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1260,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1261,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1262,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1263,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1264,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1265,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1266,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1267,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1268,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1269,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1270,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1271,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1272,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'::1','1'),(1273,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1274,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1275,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1276,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1277,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1278,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1279,1,1,'2018-08-09',NULL,'2018-08-09',NULL,'acceso','1'),(1280,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1281,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1282,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1283,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1284,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1285,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1286,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1287,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1288,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1289,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1290,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'::1','1'),(1291,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1292,1,1,'2018-08-10',NULL,'2018-08-10',NULL,'acceso','1'),(1293,1,1,'2018-08-11',NULL,'2018-08-11',NULL,'::1','1'),(1294,1,1,'2018-08-11',NULL,'2018-08-11',NULL,'acceso','1'),(1295,1,1,'2018-08-12',NULL,'2018-08-12',NULL,'::1','1'),(1296,1,1,'2018-08-12',NULL,'2018-08-12',NULL,'acceso','1'),(1297,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'::1','1'),(1298,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'acceso','1'),(1299,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'::1','1'),(1300,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'::1','1'),(1301,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'acceso','1'),(1302,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'::1','1'),(1303,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'acceso','1'),(1304,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'acceso','1'),(1305,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'::1','1'),(1306,1,1,'2018-08-13',NULL,'2018-08-13',NULL,'acceso','1'),(1307,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1308,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1309,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1310,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1311,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1312,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1313,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1314,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1315,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1316,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1317,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1318,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1319,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1320,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1321,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1322,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1323,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1324,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1325,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1326,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1327,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1328,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1329,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1330,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'::1','1'),(1331,1,1,'2018-08-14',NULL,'2018-08-14',NULL,'acceso','1'),(1332,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'::1','1'),(1333,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1334,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'::1','1'),(1335,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1336,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1337,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1338,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1339,1,1,'2018-08-15',NULL,'2018-08-15',NULL,'acceso','1'),(1340,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'::1','1'),(1341,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1342,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'::1','1'),(1343,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1344,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1345,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1346,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'::1','1'),(1347,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1348,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1349,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1350,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1351,1,1,'2018-08-16',NULL,'2018-08-16',NULL,'acceso','1'),(1352,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'::1','1'),(1353,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1354,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1355,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1356,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1357,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1358,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1359,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'::1','1'),(1360,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1361,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1362,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'::1','1'),(1363,1,1,'2018-08-17',NULL,'2018-08-17',NULL,'acceso','1'),(1364,1,1,'2018-08-21',NULL,'2018-08-21',NULL,'::1','1'),(1365,1,1,'2018-08-21',NULL,'2018-08-21',NULL,'acceso','1'),(1366,1,1,'2018-08-21',NULL,'2018-08-21',NULL,'::1','1'),(1367,1,1,'2018-08-21',NULL,'2018-08-21',NULL,'acceso','1'),(1368,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'::1','1'),(1369,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'acceso','1'),(1370,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'::1','1'),(1371,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'acceso','1'),(1372,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'::1','1'),(1373,1,1,'2018-08-22',NULL,'2018-08-22',NULL,'acceso','1'),(1374,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'::1','1'),(1375,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'acceso','1'),(1376,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'::1','1'),(1377,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'acceso','1'),(1378,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'::1','1'),(1379,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'::1','1'),(1380,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'acceso','1'),(1381,1,1,'2018-08-23',NULL,'2018-08-23',NULL,'acceso','1'),(1382,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'::1','1'),(1383,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'acceso','1'),(1384,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'::1','1'),(1385,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'acceso','1'),(1386,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'acceso','1'),(1387,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'acceso','1'),(1388,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'::1','1'),(1389,1,1,'2018-08-24',NULL,'2018-08-24',NULL,'acceso','1'),(1390,1,1,'2018-08-25',NULL,'2018-08-25',NULL,'::1','1'),(1391,1,1,'2018-08-25',NULL,'2018-08-25',NULL,'acceso','1'),(1392,1,1,'2018-08-26',NULL,'2018-08-26',NULL,'::1','1'),(1393,1,1,'2018-08-26',NULL,'2018-08-26',NULL,'acceso','1'),(1394,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'::1','1'),(1395,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1396,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1397,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1398,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1399,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1400,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1401,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1402,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1403,1,1,'2018-08-27',NULL,'2018-08-27',NULL,'acceso','1'),(1404,1,1,'2018-08-28',NULL,'2018-08-28',NULL,'::1','1'),(1405,1,1,'2018-08-28',NULL,'2018-08-28',NULL,'acceso','1'),(1406,1,1,'2018-08-28',NULL,'2018-08-28',NULL,'::1','1'),(1407,1,1,'2018-08-28',NULL,'2018-08-28',NULL,'acceso','1'),(1408,1,1,'2018-08-30',NULL,'2018-08-30',NULL,'::1','1'),(1409,1,1,'2018-08-30',NULL,'2018-08-30',NULL,'acceso','1'),(1410,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'::1','1'),(1411,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1412,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1413,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'::1','1'),(1414,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1415,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1416,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1417,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1418,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1419,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1420,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1421,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1422,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1423,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'::1','1'),(1424,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1425,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'::1','1'),(1426,1,1,'2018-08-31',NULL,'2018-08-31',NULL,'acceso','1'),(1427,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'::1','1'),(1428,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'::1','1'),(1429,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1430,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1431,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1432,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1433,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1434,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'::1','1'),(1435,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1436,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1437,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1438,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1439,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1440,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1441,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1442,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1443,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1444,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1445,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1446,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1447,1,1,'2018-09-01',NULL,'2018-09-01',NULL,'acceso','1'),(1448,1,1,'2018-09-02',NULL,'2018-09-02',NULL,'::1','1'),(1449,1,1,'2018-09-02',NULL,'2018-09-02',NULL,'acceso','1'),(1450,1,1,'2018-09-02',NULL,'2018-09-02',NULL,'::1','1'),(1451,1,1,'2018-09-02',NULL,'2018-09-02',NULL,'acceso','1'),(1452,1,1,'2018-09-04',NULL,'2018-09-04',NULL,'::1','1'),(1453,1,1,'2018-09-04',NULL,'2018-09-04',NULL,'acceso','1'),(1454,1,1,'2018-09-04',NULL,'2018-09-04',NULL,'acceso','1'),(1455,1,1,'2018-09-04',NULL,'2018-09-04',NULL,'::1','1'),(1456,1,1,'2018-09-04',NULL,'2018-09-04',NULL,'acceso','1'),(1457,1,1,'2018-09-05',NULL,'2018-09-05',NULL,'::1','1'),(1458,1,1,'2018-09-05',NULL,'2018-09-05',NULL,'acceso','1'),(1459,1,1,'2018-09-05',NULL,'2018-09-05',NULL,'::1','1'),(1460,1,1,'2018-09-05',NULL,'2018-09-05',NULL,'acceso','1'),(1461,1,1,'2018-09-05',NULL,'2018-09-05',NULL,'acceso','1'),(1462,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'::1','1'),(1463,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1464,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1465,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1466,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1467,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1468,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'::1','1'),(1469,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1470,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1471,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1472,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1473,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1474,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'::1','1'),(1475,1,1,'2018-09-06',NULL,'2018-09-06',NULL,'acceso','1'),(1476,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1477,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1478,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1479,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'::1','1'),(1480,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1481,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1482,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1483,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1484,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1485,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'::1','1'),(1486,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1487,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1488,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1489,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1490,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1491,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1492,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1493,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1494,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1495,1,1,'2018-09-07',NULL,'2018-09-07',NULL,'acceso','1'),(1496,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'::1','1'),(1497,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'acceso','1'),(1498,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'acceso','1'),(1499,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'acceso','1'),(1500,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'acceso','1'),(1501,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'::1','1'),(1502,1,1,'2018-09-08',NULL,'2018-09-08',NULL,'acceso','1'),(1503,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'::1','1'),(1504,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'acceso','1'),(1505,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'::1','1'),(1506,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'acceso','1'),(1507,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'::1','1'),(1508,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'acceso','1'),(1509,1,1,'2018-09-09',NULL,'2018-09-09',NULL,'acceso','1'),(1510,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1511,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1512,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1513,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1514,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1515,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1516,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1517,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1518,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1519,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1520,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1521,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1522,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1523,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1524,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1525,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1526,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1527,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1528,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1529,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1530,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1531,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1532,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1533,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1534,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1535,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1536,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1537,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1538,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1539,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1540,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1541,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1542,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1543,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1544,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1545,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1546,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1547,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1548,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1549,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1550,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1551,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1552,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1553,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1554,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1555,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1556,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1557,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1558,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1559,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1560,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1561,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1562,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1563,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1564,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1565,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1566,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1567,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1568,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1569,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1570,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1571,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1572,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1573,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1574,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1575,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1576,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1577,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1578,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1579,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1580,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1581,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1582,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'::1','1'),(1583,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1584,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1585,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1586,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1587,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1588,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1589,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1590,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1591,1,1,'2018-09-10',NULL,'2018-09-10',NULL,'acceso','1'),(1592,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1593,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1594,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1595,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1596,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1597,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1598,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1599,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1600,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1601,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1602,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1603,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1604,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1605,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1606,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1607,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1608,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1609,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1610,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1611,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1612,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1613,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1614,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1615,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1616,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1617,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1618,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'::1','1'),(1619,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1620,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1621,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1622,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1623,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1624,1,1,'2018-09-11',NULL,'2018-09-11',NULL,'acceso','1'),(1625,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1626,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1627,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1628,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1629,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1630,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'::1','1'),(1631,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1632,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1633,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1634,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1635,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'::1','1'),(1636,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1637,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'::1','1'),(1638,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1639,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'::1','1'),(1640,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1641,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'::1','1'),(1642,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1643,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1644,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1645,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1646,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1647,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1648,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1649,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1650,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1651,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1652,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1653,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1654,1,1,'2018-09-12',NULL,'2018-09-12',NULL,'acceso','1'),(1655,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'acceso','1'),(1656,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'::1','1'),(1657,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'acceso','1'),(1658,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'acceso','1'),(1659,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'::1','1'),(1660,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'::1','1'),(1661,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'acceso','1'),(1662,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'::1','1'),(1663,1,1,'2018-09-13',NULL,'2018-09-13',NULL,'acceso','1'),(1664,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'::1','1'),(1665,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1666,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1667,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1668,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1669,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1670,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1671,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1672,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1673,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1674,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1675,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1676,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1677,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1678,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1679,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1680,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1681,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1682,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1683,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1684,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1685,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1686,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1687,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1688,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1689,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1690,1,1,'2018-09-14',NULL,'2018-09-14',NULL,'acceso','1'),(1691,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'::1','1'),(1692,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1693,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1694,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1695,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1696,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1697,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1698,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1699,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1700,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1701,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1702,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1703,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1704,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1705,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1706,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1707,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1708,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1709,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1710,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1711,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1712,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'::1','1'),(1713,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1714,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1715,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1716,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1717,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1718,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1719,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1720,1,1,'2018-09-15',NULL,'2018-09-15',NULL,'acceso','1'),(1721,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'::1','1'),(1722,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1723,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1724,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1725,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1726,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1727,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1728,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1729,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1730,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1731,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1732,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1733,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1734,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'::1','1'),(1735,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1736,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1737,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'::1','1'),(1738,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'::1','1'),(1739,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1740,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'::1','1'),(1741,1,1,'2018-09-16',NULL,'2018-09-16',NULL,'acceso','1'),(1742,1,1,'2018-09-17',NULL,'2018-09-17',NULL,'::1','1'),(1743,1,1,'2018-09-17',NULL,'2018-09-17',NULL,'acceso','1'),(1744,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'::1','1'),(1745,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1746,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'::1','1'),(1747,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1748,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'::1','1'),(1749,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1750,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1751,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1752,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1753,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'::1','1'),(1754,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1755,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1756,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1757,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1758,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'::1','1'),(1759,1,1,'2018-09-18',NULL,'2018-09-18',NULL,'acceso','1'),(1760,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1761,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1762,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1763,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1764,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1765,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1766,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1767,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1768,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1769,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1770,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1771,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1772,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1773,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1774,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1775,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1776,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1777,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1778,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1779,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1780,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1781,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1782,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1783,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1784,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1785,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1786,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1787,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1788,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1789,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1790,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1791,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1792,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1793,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1794,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1795,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1796,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1797,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1798,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1799,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1800,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1801,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1802,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1803,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1804,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1805,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1806,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1807,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1808,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1809,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1810,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1811,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'127.0.0.1','1'),(1812,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'::1','1'),(1813,1,1,'2018-09-19',NULL,'2018-09-19',NULL,'acceso','1'),(1814,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'::1','1'),(1815,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'acceso','1'),(1816,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'acceso','1'),(1817,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'::1','1'),(1818,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'acceso','1'),(1819,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'::1','1'),(1820,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'acceso','1'),(1821,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'127.0.0.1','1'),(1822,1,1,'2018-09-20',NULL,'2018-09-20',NULL,'::1','1'),(1823,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'::1','1'),(1824,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'acceso','1'),(1825,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1826,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1827,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1828,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1829,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'::1','1'),(1830,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'acceso','1'),(1831,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'::1','1'),(1832,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1833,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1834,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1835,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1836,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1837,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1838,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1839,1,1,'2018-09-21',NULL,'2018-09-21',NULL,'127.0.0.1','1'),(1840,1,1,'2018-09-23',NULL,'2018-09-23',NULL,'127.0.0.1','1'),(1841,1,1,'2018-09-23',NULL,'2018-09-23',NULL,'127.0.0.1','1'),(1842,1,1,'2018-09-23',NULL,'2018-09-23',NULL,'127.0.0.1','1'),(1843,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1844,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1845,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1846,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1847,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1848,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1849,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1850,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1851,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1852,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1853,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1854,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1855,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'127.0.0.1','1'),(1856,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'::1','1'),(1857,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'acceso','1'),(1858,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'::1','1'),(1859,1,1,'2018-09-24',NULL,'2018-09-24',NULL,'acceso','1'),(1860,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'::1','1'),(1861,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1862,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'::1','1'),(1863,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1864,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'::1','1'),(1865,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1866,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'::1','1'),(1867,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1868,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'::1','1'),(1869,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1870,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1871,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1872,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1873,1,1,'2018-09-25',NULL,'2018-09-25',NULL,'acceso','1'),(1874,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'::1','1'),(1875,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1876,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'::1','1'),(1877,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1878,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1879,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1880,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1881,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1882,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1883,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'::1','1'),(1884,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1885,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1886,1,1,'2018-09-26',NULL,'2018-09-26',NULL,'acceso','1'),(1887,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1888,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1889,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1890,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1891,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1892,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1893,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1894,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1895,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1896,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1897,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1898,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1899,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1900,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'::1','1'),(1901,1,1,'2018-09-27',NULL,'2018-09-27',NULL,'acceso','1'),(1902,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1903,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1904,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1905,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'::1','1'),(1906,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1907,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1908,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1909,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1910,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1911,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'::1','1'),(1912,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1913,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1914,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1915,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'::1','1'),(1916,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1917,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1918,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1919,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1920,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1921,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1922,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1923,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1924,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1925,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1926,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1927,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1928,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1929,1,1,'2018-09-28',NULL,'2018-09-28',NULL,'acceso','1'),(1930,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1931,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1932,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1933,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1934,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1935,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1936,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'::1','1'),(1937,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1938,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'::1','1'),(1939,1,1,'2018-09-29',NULL,'2018-09-29',NULL,'acceso','1'),(1940,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'::1','1'),(1941,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1942,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1943,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1944,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1945,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1946,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1947,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1948,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1949,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1950,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1951,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1952,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1953,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'::1','1'),(1954,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1955,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1956,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1957,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1958,1,1,'2018-10-01',NULL,'2018-10-01',NULL,'acceso','1'),(1959,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1960,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1961,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1962,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1963,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1964,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1965,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1966,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1967,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1968,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1969,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1970,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'::1','1'),(1971,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1972,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1973,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1974,1,1,'2018-10-02',NULL,'2018-10-02',NULL,'acceso','1'),(1975,1,1,'2018-10-03',NULL,'2018-10-03',NULL,'::1','1'),(1976,1,1,'2018-10-03',NULL,'2018-10-03',NULL,'acceso','1'),(1977,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'::1','1'),(1978,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1979,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1980,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1981,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1982,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1983,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'::1','1'),(1984,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1985,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1986,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'::1','1'),(1987,1,1,'2018-10-04',NULL,'2018-10-04',NULL,'acceso','1'),(1988,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'::1','1'),(1989,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'acceso','1'),(1990,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'::1','1'),(1991,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'acceso','1'),(1992,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'::1','1'),(1993,1,1,'2018-10-05',NULL,'2018-10-05',NULL,'acceso','1'),(1994,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'::1','1'),(1995,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'acceso','1'),(1996,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'acceso','1'),(1997,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'acceso','1'),(1998,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'::1','1'),(1999,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'acceso','1'),(2000,1,1,'2018-10-10',NULL,'2018-10-10',NULL,'acceso','1'),(2001,1,1,'2018-10-11',NULL,'2018-10-11',NULL,'::1','1'),(2002,1,1,'2018-10-11',NULL,'2018-10-11',NULL,'acceso','1'),(2003,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2004,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2005,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2006,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'::1','1'),(2007,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2008,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2009,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2010,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2011,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2012,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2013,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'::1','1'),(2014,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2015,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2016,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2017,1,1,'2018-10-22',NULL,'2018-10-22',NULL,'acceso','1'),(2018,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'::1','1'),(2019,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2020,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2021,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'::1','1'),(2022,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2023,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2024,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2025,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2026,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'::1','1'),(2027,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2028,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2029,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2030,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2031,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2032,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2033,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2034,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2035,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2036,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2037,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2038,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2039,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2040,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2041,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2042,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2043,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2044,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2045,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2046,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2047,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'::1','1'),(2048,1,1,'2018-10-23',NULL,'2018-10-23',NULL,'acceso','1'),(2049,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'::1','1'),(2050,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2051,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2052,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'::1','1'),(2053,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2054,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2055,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2056,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2057,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2058,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2059,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2060,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2061,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2062,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2063,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2064,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2065,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'::1','1'),(2066,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2067,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2068,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2069,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'::1','1'),(2070,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2071,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'::1','1'),(2072,1,1,'2018-10-24',NULL,'2018-10-24',NULL,'acceso','1'),(2073,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'::1','1'),(2074,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2075,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'::1','1'),(2076,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2077,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2078,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'::1','1'),(2079,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2080,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2081,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'::1','1'),(2082,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2083,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2084,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2085,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2086,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2087,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2088,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2089,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2090,1,1,'2018-10-25',NULL,'2018-10-25',NULL,'acceso','1'),(2091,1,1,'2018-10-26',NULL,'2018-10-26',NULL,'::1','1'),(2092,1,1,'2018-10-26',NULL,'2018-10-26',NULL,'acceso','1'),(2093,1,1,'2018-10-26',NULL,'2018-10-26',NULL,'::1','1'),(2094,1,1,'2018-10-26',NULL,'2018-10-26',NULL,'acceso','1'),(2095,1,1,'2018-10-29',NULL,'2018-10-29',NULL,'::1','1'),(2096,1,1,'2018-10-29',NULL,'2018-10-29',NULL,'acceso','1'),(2097,1,1,'2018-10-29',NULL,'2018-10-29',NULL,'acceso','1'),(2098,1,1,'2018-10-29',NULL,'2018-10-29',NULL,'acceso','1'),(2099,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'::1','1'),(2100,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2101,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'::1','1'),(2102,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2103,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2104,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'::1','1'),(2105,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2106,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'::1','1'),(2107,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2108,1,1,'2018-10-30',NULL,'2018-10-30',NULL,'acceso','1'),(2109,1,1,'2018-10-31',NULL,'2018-10-31',NULL,'::1','1'),(2110,1,1,'2018-10-31',NULL,'2018-10-31',NULL,'acceso','1'),(2111,1,1,'2018-10-31',NULL,'2018-10-31',NULL,'acceso','1'),(2112,1,1,'2018-10-31',NULL,'2018-10-31',NULL,'::1','1'),(2113,1,1,'2018-10-31',NULL,'2018-10-31',NULL,'acceso','1'),(2114,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2115,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2116,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2117,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2118,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2119,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2120,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2121,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2122,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2123,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2124,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2125,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2126,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2127,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2128,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2129,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2130,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2131,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2132,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'::1','1'),(2133,1,1,'2018-11-02',NULL,'2018-11-02',NULL,'acceso','1'),(2134,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'::1','1'),(2135,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2136,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'::1','1'),(2137,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2138,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2139,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'::1','1'),(2140,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2141,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2142,2,1,'2018-11-06',NULL,'2018-11-06',NULL,'::1','1'),(2143,1,1,'2018-11-06',NULL,'2018-11-06',NULL,'acceso','1'),(2144,2,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2145,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2146,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2147,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2148,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2149,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2150,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2151,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2152,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2153,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2154,2,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2155,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2156,2,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2157,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2158,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2159,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2160,2,1,'2018-11-07',NULL,'2018-11-07',NULL,'::1','1'),(2161,1,1,'2018-11-07',NULL,'2018-11-07',NULL,'acceso','1'),(2162,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2163,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2164,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2165,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2166,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2167,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2168,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2169,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2170,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2171,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2172,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2173,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2174,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2175,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2176,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2177,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2178,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2179,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2180,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2181,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2182,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2183,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2184,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2185,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2186,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2187,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2188,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2189,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2190,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2191,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2192,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2193,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2194,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2195,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2196,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2197,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2198,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2199,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2200,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2201,2,1,'2018-11-08',NULL,'2018-11-08',NULL,'::1','1'),(2202,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2203,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2204,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2205,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2206,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2207,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2208,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2209,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2210,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2211,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2212,1,1,'2018-11-08',NULL,'2018-11-08',NULL,'acceso','1'),(2213,2,1,'2018-11-09',NULL,'2018-11-09',NULL,'::1','1'),(2214,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2215,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2216,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2217,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2218,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2219,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2220,2,1,'2018-11-09',NULL,'2018-11-09',NULL,'::1','1'),(2221,1,1,'2018-11-09',NULL,'2018-11-09',NULL,'acceso','1'),(2222,2,1,'2018-11-13',NULL,'2018-11-13',NULL,'::1','1'),(2223,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2224,2,1,'2018-11-13',NULL,'2018-11-13',NULL,'::1','1'),(2225,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2226,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2227,2,1,'2018-11-13',NULL,'2018-11-13',NULL,'::1','1'),(2228,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2229,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2230,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2231,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2232,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2233,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'::1','1'),(2234,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2235,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2236,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2237,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2238,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2239,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2240,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2241,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2242,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2243,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2244,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2245,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2246,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2247,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2248,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2249,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'::1','1'),(2250,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2251,1,1,'2018-11-13',NULL,'2018-11-13',NULL,'acceso','1'),(2252,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2253,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2254,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2255,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2256,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2257,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2258,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2259,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2260,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2261,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2262,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2263,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2264,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2265,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2266,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2267,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2268,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2269,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2270,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2271,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2272,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2273,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2274,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2275,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2276,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2277,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2278,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2279,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2280,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2281,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2282,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2283,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2284,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2285,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2286,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2287,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2288,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2289,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2290,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2291,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2292,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2293,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2294,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2295,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2296,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2297,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2298,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2299,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2300,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2301,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2302,3,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2303,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2304,4,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2305,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2306,5,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2307,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2308,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2309,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2310,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2311,3,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2312,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2313,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2314,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2315,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2316,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2317,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2318,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2319,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2320,3,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2321,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2322,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2323,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2324,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2325,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2326,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2327,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2328,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2329,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2330,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2331,2,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2332,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2333,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'::1','1'),(2334,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2335,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2336,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2337,1,1,'2018-11-14',NULL,'2018-11-14',NULL,'acceso','1'),(2338,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'::1','1'),(2339,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2340,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2341,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2342,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2343,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2344,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2345,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2346,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2347,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2348,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2349,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2350,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2351,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2352,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2353,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2354,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2355,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2356,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2357,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2358,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2359,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2360,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2361,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2362,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2363,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2364,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2365,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2366,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2367,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2368,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2369,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2370,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2371,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2372,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2373,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2374,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2375,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2376,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2377,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2378,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2379,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2380,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2381,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2382,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2383,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2384,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2385,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2386,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2387,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2388,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2389,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2390,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2391,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2392,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'::1','1'),(2393,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2394,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2395,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2396,2,1,'2018-11-15',NULL,'2018-11-15',NULL,'::1','1'),(2397,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2398,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2399,1,1,'2018-11-15',NULL,'2018-11-15',NULL,'acceso','1'),(2400,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'::1','1'),(2401,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2402,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2403,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2404,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2405,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2406,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2407,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2408,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2409,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2410,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2411,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2412,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2413,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2414,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2415,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2416,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'::1','1'),(2417,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2418,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2419,1,1,'2018-11-16',NULL,'2018-11-16',NULL,'acceso','1'),(2420,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2421,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2422,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2423,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2424,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2425,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2426,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2427,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2428,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2429,3,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2430,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2431,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2432,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2433,3,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2434,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2435,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2436,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2437,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2438,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2439,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2440,3,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2441,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2442,2,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2443,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2444,3,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2445,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2446,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2447,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2448,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2449,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2450,4,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2451,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2452,5,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2453,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2454,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'::1','1'),(2455,1,1,'2018-11-19',NULL,'2018-11-19',NULL,'acceso','1'),(2456,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'::1','1'),(2457,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2458,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'::1','1'),(2459,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2460,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2461,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2462,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2463,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2464,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2465,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2466,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2467,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2468,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'::1','1'),(2469,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2470,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2471,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2472,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2473,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2474,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2475,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2476,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'::1','1'),(2477,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2478,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2479,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2480,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2481,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2482,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2483,1,1,'2018-11-20',NULL,'2018-11-20',NULL,'acceso','1'),(2484,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'::1','1'),(2485,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2486,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2487,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2488,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2489,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2490,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2491,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2492,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2493,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2494,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'::1','1'),(2495,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2496,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2497,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2498,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2499,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2500,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2501,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2502,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2503,1,1,'2018-11-23',NULL,'2018-11-23',NULL,'acceso','1'),(2504,1,1,'2018-12-04',NULL,'2018-12-04',NULL,'::1','1'),(2505,1,1,'2018-12-04',NULL,'2018-12-04',NULL,'acceso','1'),(2506,1,1,'2018-12-04',NULL,'2018-12-04',NULL,'::1','1'),(2507,1,1,'2018-12-04',NULL,'2018-12-04',NULL,'acceso','1'),(2508,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2509,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2510,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2511,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2512,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2513,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2514,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2515,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2516,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2517,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2518,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2519,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2520,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2521,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2522,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2523,3,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2524,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2525,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2526,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2527,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2528,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2529,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2530,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2531,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2532,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2533,3,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2534,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2535,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2536,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2537,5,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2538,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2539,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2540,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2541,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2542,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2543,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2544,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2545,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2546,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2547,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2548,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2549,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2550,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2551,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2552,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2553,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2554,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2555,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2556,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2557,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2558,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2559,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2560,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2561,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2562,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2563,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2564,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2565,3,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2566,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2567,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2568,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2569,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2570,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2571,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2572,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2573,4,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2574,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2575,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2576,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2577,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2578,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2579,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2580,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2581,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2582,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2583,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2584,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2585,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2586,2,1,'2018-12-06',NULL,'2018-12-06',NULL,'::1','1'),(2587,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2588,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2589,1,1,'2018-12-06',NULL,'2018-12-06',NULL,'acceso','1'),(2590,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'::1','1'),(2591,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2592,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2593,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2594,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2595,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2596,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2597,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2598,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2599,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2600,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2601,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2602,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2603,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2604,1,1,'2018-12-07',NULL,'2018-12-07',NULL,'acceso','1'),(2605,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'::1','1'),(2606,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2607,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'::1','1'),(2608,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2609,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'::1','1'),(2610,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2611,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2612,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2613,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2614,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'::1','1'),(2615,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2616,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2617,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2618,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2619,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2620,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2621,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2622,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2623,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2624,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2625,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2626,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2627,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2628,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2629,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2630,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2631,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2632,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2633,1,1,'2018-12-10',NULL,'2018-12-10',NULL,'acceso','1'),(2634,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'::1','1'),(2635,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2636,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2637,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2638,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2639,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2640,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2641,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2642,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2643,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2644,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2645,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2646,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2647,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2648,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2649,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2650,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2651,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2652,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2653,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2654,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2655,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2656,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2657,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2658,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2659,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2660,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2661,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2662,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2663,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2664,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2665,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2666,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2667,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'::1','1'),(2668,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2669,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2670,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2671,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2672,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2673,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2674,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2675,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2676,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2677,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2678,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2679,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2680,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2681,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2682,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2683,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2684,2,1,'2018-12-11',NULL,'2018-12-11',NULL,'::1','1'),(2685,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2686,2,1,'2018-12-11',NULL,'2018-12-11',NULL,'::1','1'),(2687,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2688,2,1,'2018-12-11',NULL,'2018-12-11',NULL,'::1','1'),(2689,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2690,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2691,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2692,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2693,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2694,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2695,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2696,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2697,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2698,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2699,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2700,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2701,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2702,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2703,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2704,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2705,1,1,'2018-12-11',NULL,'2018-12-11',NULL,'acceso','1'),(2706,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'::1','1'),(2707,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2708,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2709,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2710,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2711,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2712,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2713,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2714,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2715,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2716,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2717,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2718,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2719,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2720,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2721,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2722,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2723,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2724,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2725,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2726,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2727,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2728,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2729,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2730,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2731,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2732,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2733,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2734,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2735,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2736,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'::1','1'),(2737,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2738,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2739,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2740,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2741,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2742,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2743,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2744,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2745,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2746,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2747,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2748,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2749,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2750,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2751,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2752,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2753,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2754,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2755,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2756,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2757,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2758,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2759,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2760,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2761,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2762,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2763,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2764,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2765,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2766,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2767,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2768,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2769,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2770,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2771,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2772,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2773,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2774,1,1,'2018-12-12',NULL,'2018-12-12',NULL,'acceso','1'),(2775,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2776,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2777,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2778,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2779,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2780,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2781,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2782,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2783,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2784,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2785,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2786,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2787,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2788,2,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2789,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2790,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2791,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2792,2,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2793,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2794,2,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2795,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2796,3,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2797,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2798,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2799,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2800,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2801,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2802,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2803,2,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2804,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2805,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2806,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2807,2,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2808,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2809,3,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2810,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2811,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2812,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2813,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2814,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2815,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2816,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2817,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2818,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2819,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2820,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2821,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2822,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2823,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2824,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2825,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2826,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2827,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2828,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'::1','1'),(2829,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2830,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2831,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2832,1,1,'2018-12-13',NULL,'2018-12-13',NULL,'acceso','1'),(2833,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2834,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2835,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2836,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2837,2,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2838,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2839,4,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2840,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2841,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2842,4,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2843,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2844,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2845,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2846,5,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2847,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2848,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2849,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2850,3,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2851,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2852,6,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2853,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2854,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2855,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2856,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2857,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2858,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2859,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2860,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2861,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2862,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2863,4,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2864,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2865,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'::1','1'),(2866,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1'),(2867,1,1,'2018-12-14',NULL,'2018-12-14',NULL,'acceso','1');

UNLOCK TABLES;

/*Table structure for table `lote` */

DROP TABLE IF EXISTS `lote`;

CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` smallint(6) NOT NULL,
  `fac_cliente` smallint(6) NOT NULL,
  `lot_estado` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `proceso` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `tipdoc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `tot_folder` int(5) NOT NULL,
  `tot_pag` int(5) NOT NULL,
  `tot_errpag` int(5) NOT NULL,
  `id_user` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_update` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_update` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_lote`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lote` */

LOCK TABLES `lote` WRITE;

insert  into `lote`(`id_lote`,`shi_codigo`,`fac_cliente`,`lot_estado`,`proceso`,`tipdoc`,`nombre`,`descripcion`,`fecha`,`tot_folder`,`tot_pag`,`tot_errpag`,`id_user`,`usr_update`,`fec_update`,`estado`) values (1,1,1,'LT','P','','DOCS','','2018-12-14 00:00:00',5,5,0,'4','4','2018-12-14 12:27:54','A'),(2,2,3,'LT','P','','RRHH','','2018-12-14 00:00:00',1,2,0,'6','6','2018-12-14 14:52:11','A'),(3,2,3,'LT','P','','FORMATOS','','2018-12-14 00:00:00',1,4,0,'6','6','2018-12-14 14:54:04','A'),(4,2,3,'LT','P','','OTROS','','2018-12-14 00:00:00',4,4,0,'6','6','2018-12-14 15:02:09','A'),(5,1,1,'LT','P','','RRHH','','2018-12-14 00:00:00',5,1,0,'4','4','2018-12-14 16:13:57','A');

UNLOCK TABLES;

/*Table structure for table `lote_detalle` */

DROP TABLE IF EXISTS `lote_detalle`;

CREATE TABLE `lote_detalle` (
  `id_det` int(11) NOT NULL AUTO_INCREMENT,
  `id_lote` int(11) NOT NULL,
  `shi_codigo` smallint(6) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `det_estado` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `tot_pag` int(5) NOT NULL,
  `tot_pag_err` int(5) DEFAULT NULL,
  `usr_regis` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_regis` date DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_det`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lote_detalle` */

LOCK TABLES `lote_detalle` WRITE;

insert  into `lote_detalle`(`id_det`,`id_lote`,`shi_codigo`,`nombre`,`det_estado`,`fecha`,`tot_pag`,`tot_pag_err`,`usr_regis`,`fec_regis`,`estado`,`orden`) values (1,1,1,'DOCS-1','','2018-12-14 00:00:00',1,0,'4','2018-12-14','A',1),(2,1,1,'DOCS-2','','2018-12-14 00:00:00',2,0,'4','2018-12-14','A',2),(3,1,1,'DOCS-3','','2018-12-14 00:00:00',1,0,'4','2018-12-14','A',3),(4,1,1,'DOCS-4','','2018-12-14 00:00:00',1,0,'4','2018-12-14','A',4),(5,1,1,'DOCS-5','','2018-12-14 00:00:00',0,0,'4','2018-12-14','A',5),(6,2,2,'RRHH-1','','2018-12-14 00:00:00',2,0,'6','2018-12-14','A',1),(7,3,2,'FORMATOS-1','','2018-12-14 00:00:00',4,0,'6','2018-12-14','A',1),(8,4,2,'OTROS-1','','2018-12-14 00:00:00',1,0,'6','2018-12-14','A',1),(9,4,2,'OTROS-2','','2018-12-14 00:00:00',1,0,'6','2018-12-14','A',2),(10,4,2,'OTROS-3','','2018-12-14 00:00:00',2,0,'6','2018-12-14','A',3),(11,4,2,'OTROS-4','','2018-12-14 00:00:00',0,0,'6','2018-12-14','A',4),(12,5,1,'RRHH-1','','2018-12-14 00:00:00',1,0,'4','2018-12-14','A',1),(13,5,1,'RRHH-2','','2018-12-14 00:00:00',0,0,'4','2018-12-14','A',2),(14,5,1,'RRHH-3','','2018-12-14 00:00:00',0,0,'4','2018-12-14','A',3),(15,5,1,'RRHH-4','','2018-12-14 00:00:00',0,0,'4','2018-12-14','A',4),(16,5,1,'RRHH-5','','2018-12-14 00:00:00',0,0,'4','2018-12-14','A',5);

UNLOCK TABLES;

/*Table structure for table `lote_estado` */

DROP TABLE IF EXISTS `lote_estado`;

CREATE TABLE `lote_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_lote` int(11) NOT NULL,
  `shi_codigo` smallint(6) NOT NULL,
  `lot_estado` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecact` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lote_estado` */

LOCK TABLES `lote_estado` WRITE;

insert  into `lote_estado`(`id_estado`,`id_lote`,`shi_codigo`,`lot_estado`,`id_user`,`fecact`) values (1,1,1,'LT',4,'2018-12-14 12:27:54'),(2,2,2,'LT',6,'2018-12-14 14:52:11'),(3,3,2,'LT',6,'2018-12-14 14:54:04'),(4,4,2,'LT',6,'2018-12-14 15:02:09'),(5,5,1,'LT',4,'2018-12-14 16:13:57');

UNLOCK TABLES;

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `menu_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `mod_id` smallint(6) DEFAULT NULL,
  `menu_orden` smallint(6) DEFAULT NULL,
  `menu_nombre` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_descri` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_icono` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_class` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `menus` */

LOCK TABLES `menus` WRITE;

insert  into `menus`(`menu_id`,`mod_id`,`menu_orden`,`menu_nombre`,`menu_descri`,`menu_url`,`menu_icono`,`menu_class`,`menu_estado`) values (1,1,1,'AREAS','','/gestion/lotizer/vista_lotizador/','if_ark_17840.png',' ','1'),(2,1,3,'ARCHIVOS','','/gestion/scanning/','if_General_Office_21_2530827.png','','1'),(3,1,4,'CLIENTES','Gestor de Campañas','/gestion/client2/vista_client2','if_tools_1287509.png','gestorcampanas','1'),(4,1,5,'REPROCESOS','Mapa Gestión','/gestion/reprocessing/','if_Sketching_1562692.png','mapagestion','1'),(5,1,6,'DIGITALIZADOS','Relación Campaña Formulario','/gestion/closing/','if_Logo_Design_1562698.png','campanaFormulario','1'),(6,1,2,'OCR','Control OCR','/gestion/OCR/','if_file-excel-alt_285691.png',' ','1'),(7,1,7,'DEVOLUCIONES','DOCUMENT OUTPUT','/gestion/return/vista_return','if_business-work_4_2377643.png','gestorcampanas','1'),(8,1,8,'SEGUIMIENTO','TRACKING LOTE & DOCUMENT','/gestion/tracking/','if_human-folder-saved-search_25169.png','tracking','1'),(9,1,9,'CLIENTES','CLIENT','/gestion/client/vista_client','if_Client_Male_Light_80824.png','client','1'),(10,1,10,'USUARIOS','Mantenimiento de Usuarios','/gestion/user/','if_user-id_285641.png','usuarios','1');

UNLOCK TABLES;

/*Table structure for table `modulos` */

DROP TABLE IF EXISTS `modulos`;

CREATE TABLE `modulos` (
  `mod_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sis_id` smallint(6) NOT NULL,
  `mod_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mod_icono` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mod_orden` smallint(6) DEFAULT NULL,
  `mod_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `modulos` */

LOCK TABLES `modulos` WRITE;

insert  into `modulos`(`mod_id`,`sis_id`,`mod_nombre`,`mod_icono`,`mod_orden`,`mod_estado`) values (1,1,'Recolección de Datos','',1,'1'),(2,2,'Recolección de Datos','',1,'1');

UNLOCK TABLES;

/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

CREATE TABLE `paginas` (
  `id_pag` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_det` int(11) DEFAULT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `path` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `imgorigen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `orden` smallint(6) DEFAULT NULL,
  `lado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `w` decimal(9,4) NOT NULL DEFAULT '0.0000',
  `h` decimal(9,4) NOT NULL DEFAULT '0.0000',
  `ocr` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `texto` text COLLATE utf8_unicode_ci,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecact` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pag`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `paginas` */

LOCK TABLES `paginas` WRITE;

insert  into `paginas`(`id_pag`,`id_det`,`id_lote`,`path`,`img`,`imgorigen`,`orden`,`lado`,`w`,`h`,`ocr`,`texto`,`estado`,`id_user`,`fecact`) values (1,1,1,'/scanning/1-RRHH/','DOCS-1control.jpg','control.jpg',1,'A','1390.0000','429.0000','N',NULL,'A',4,'2018-12-14 12:28:33'),(2,2,1,'/scanning/1-RRHH/','img3.jpg','img3.jpg',1,'A','50.0000','43.0000','N',NULL,'A',4,'2018-12-14 12:29:15'),(3,2,1,'/scanning/1-RRHH/','img4.jpg','img4.jpg',2,'A','243.0000','629.0000','N',NULL,'A',4,'2018-12-14 12:29:15'),(4,3,1,'/scanning/1-RRHH/','DOCS-3DIGITALIZADOS.jpg','DIGITALIZADOS.jpg',1,'A','1920.0000','1080.0000','N',NULL,'A',4,'2018-12-14 14:40:50'),(7,4,1,'/scanning/1-RRHH/','DOCS-4control.jpg','control.jpg',1,'A','1390.0000','429.0000','N',NULL,'A',4,'2018-12-14 14:48:37'),(8,6,2,'/scanning/3-RRHH/','RRHH-1REPROCESO.jpg','REPROCESO.jpg',1,'A','1920.0000','1080.0000','N',NULL,'A',6,'2018-12-14 14:53:00'),(9,7,3,'/scanning/3-RRHH/','control.jpg','control.jpg',1,'A','1390.0000','429.0000','N',NULL,'A',6,'2018-12-14 14:54:46'),(10,7,3,'/scanning/3-RRHH/','DIGITALIZADOS.jpg','DIGITALIZADOS.jpg',2,'A','1920.0000','1080.0000','N',NULL,'A',6,'2018-12-14 14:54:46'),(11,7,3,'/scanning/3-RRHH/','lotizado.jpg','lotizado.jpg',3,'A','1385.0000','480.0000','N',NULL,'A',6,'2018-12-14 14:54:46'),(12,7,3,'/scanning/3-RRHH/','FORMATOS-1img4.jpg','img4.jpg',4,'A','243.0000','629.0000','N',NULL,'A',6,'2018-12-14 14:56:09'),(13,8,4,'/scanning/3-RRHH/','OTROS-1control.jpg','control.jpg',1,'A','1390.0000','429.0000','N',NULL,'A',6,'2018-12-14 15:02:35'),(14,9,4,'/scanning/3-RRHH/','OTROS-2-DIGITALIZADOS.jpg','DIGITALIZADOS.jpg',1,'A','1920.0000','1080.0000','N',NULL,'A',6,'2018-12-14 15:05:51'),(15,10,4,'/scanning/3-RRHH/','-lotizado.jpg','lotizado.jpg',1,'A','1385.0000','480.0000','N',NULL,'A',6,'2018-12-14 15:12:18'),(16,10,4,'/scanning/3-RRHH/','-REPROCESO.jpg','REPROCESO.jpg',2,'A','1920.0000','1080.0000','N',NULL,'A',6,'2018-12-14 15:12:18'),(25,6,2,'/scanning/3-RRHH/','RRHH-1-img3.jpg','img3.jpg',2,'A','50.0000','43.0000','N',NULL,'A',6,'2018-12-14 16:12:08'),(26,12,5,'/scanning/1-RRHH/','RRHH-1-img3.jpg','img3.jpg',1,'A','188.0000','130.0000','N',NULL,'A',4,'2018-12-14 16:15:07');

UNLOCK TABLES;

/*Table structure for table `paginas_error` */

DROP TABLE IF EXISTS `paginas_error`;

CREATE TABLE `paginas_error` (
  `id_pag` int(11) NOT NULL,
  `id_det` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `msg` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pag`,`id_det`,`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `paginas_error` */

LOCK TABLES `paginas_error` WRITE;

UNLOCK TABLES;

/*Table structure for table `paginas_error_log` */

DROP TABLE IF EXISTS `paginas_error_log`;

CREATE TABLE `paginas_error_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_pag` int(11) NOT NULL,
  `id_det` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `msg` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `paginas_error_log` */

LOCK TABLES `paginas_error_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `paginas_trazos` */

DROP TABLE IF EXISTS `paginas_trazos`;

CREATE TABLE `paginas_trazos` (
  `id_pag` int(11) NOT NULL,
  `cod_trazo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `texto` text COLLATE utf8_unicode_ci,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_pag`,`cod_trazo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `paginas_trazos` */

LOCK TABLES `paginas_trazos` WRITE;

UNLOCK TABLES;

/*Table structure for table `permiso_sistema` */

DROP TABLE IF EXISTS `permiso_sistema`;

CREATE TABLE `permiso_sistema` (
  `id_user` int(11) NOT NULL,
  `sis_id` smallint(6) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecact` date DEFAULT NULL,
  `hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`,`sis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permiso_sistema` */

LOCK TABLES `permiso_sistema` WRITE;

insert  into `permiso_sistema`(`id_user`,`sis_id`,`estado`,`id_usuario`,`fecact`,`hora`) values (1,1,'1',1,'2017-07-18','202001'),(2,1,'1',2,'2018-12-14','12'),(3,1,'1',3,'2018-12-14','12'),(4,1,'1',4,'2018-12-14','12'),(5,1,'1',5,'2018-12-14','12'),(6,1,'1',6,'2018-12-14','14');

UNLOCK TABLES;

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_user` int(11) NOT NULL,
  `id_service` smallint(6) NOT NULL,
  `acceso` smallint(6) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_act` int(11) DEFAULT NULL,
  `fecact` date DEFAULT NULL,
  PRIMARY KEY (`id_service`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permisos` */

LOCK TABLES `permisos` WRITE;

insert  into `permisos`(`id_user`,`id_service`,`acceso`,`estado`,`id_user_act`,`fecact`) values (1,1,1,'1',1,'2017-07-18'),(2,1,1,'1',2,'2018-12-14'),(3,1,1,'1',3,'2018-12-14'),(4,1,1,'1',4,'2018-12-14'),(5,1,1,'1',5,'2018-12-14'),(6,1,1,'1',6,'2018-12-14'),(1,2,1,'1',1,'2017-07-27'),(2,2,1,'1',2,'2018-12-14'),(3,2,1,'1',3,'2018-12-14'),(1,3,1,'1',1,'2017-07-27'),(2,3,1,'1',2,'2018-12-14'),(3,3,1,'1',3,'2018-12-14'),(4,3,1,'1',4,'2018-12-14'),(5,3,1,'1',5,'2018-12-14'),(6,3,1,'1',6,'2018-12-14'),(1,4,1,'1',1,'2017-07-28'),(1,5,1,'1',1,'2017-08-04'),(1,6,1,'1',1,'2018-07-17'),(1,7,1,'1',1,'2018-07-17'),(1,8,1,'1',1,'2017-08-07'),(1,9,1,'1',1,'2017-08-07'),(1,10,1,'1',1,'2018-10-10'),(2,10,1,'1',2,'2018-12-14'),(3,10,1,'1',3,'2018-12-14');

UNLOCK TABLES;

/*Table structure for table `permisos_mac` */

DROP TABLE IF EXISTS `permisos_mac`;

CREATE TABLE `permisos_mac` (
  `id_mac` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `mac_ip` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac_vence` date DEFAULT NULL,
  `mac_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permisos_mac` */

LOCK TABLES `permisos_mac` WRITE;

UNLOCK TABLES;

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `prov_codigo` smallint(6) DEFAULT NULL,
  `per_codigo` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_apellido` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_domicilio` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_tipo` smallint(6) DEFAULT NULL,
  `doc_numero` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciu_id` smallint(6) DEFAULT NULL,
  `tper_id` smallint(6) DEFAULT NULL,
  `per_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_ingreso` date DEFAULT NULL,
  `id_cargo` smallint(6) DEFAULT NULL,
  `fec_cese` date DEFAULT NULL,
  `cel_id` smallint(6) DEFAULT NULL,
  `per_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `personal` */

LOCK TABLES `personal` WRITE;

insert  into `personal`(`per_id`,`prov_codigo`,`per_codigo`,`per_apellido`,`per_nombre`,`per_domicilio`,`doc_tipo`,`doc_numero`,`ciu_id`,`tper_id`,`per_email`,`fec_ingreso`,`id_cargo`,`fec_cese`,`cel_id`,`per_estado`) values (1,1,'000001','Bazám Solis','Jimmy Anthony','Los Olivos',0,'44949730',3944,0,'jbazan.developer@gmail.com','2017-07-18',1,'0000-00-00',1,'1');

UNLOCK TABLES;

/*Table structure for table `personal_area` */

DROP TABLE IF EXISTS `personal_area`;

CREATE TABLE `personal_area` (
  `per_id` int(11) NOT NULL,
  `id_area` smallint(6) NOT NULL,
  `area_tipo` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_area`,`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `personal_area` */

LOCK TABLES `personal_area` WRITE;

UNLOCK TABLES;

/*Table structure for table `personal_equipo` */

DROP TABLE IF EXISTS `personal_equipo`;

CREATE TABLE `personal_equipo` (
  `per_id` int(11) NOT NULL,
  `prov_codigo` smallint(6) DEFAULT NULL,
  `id_turno` smallint(6) DEFAULT NULL,
  `cel_id` smallint(6) DEFAULT NULL,
  `und_id` smallint(6) DEFAULT NULL,
  `zon_id` smallint(6) DEFAULT NULL,
  `fec_cambio` date DEFAULT NULL,
  `fec_hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `personal_equipo` */

LOCK TABLES `personal_equipo` WRITE;

UNLOCK TABLES;

/*Table structure for table `plantilla` */

DROP TABLE IF EXISTS `plantilla`;

CREATE TABLE `plantilla` (
  `cod_plantilla` int(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` int(11) NOT NULL,
  `fac_cliente` smallint(6) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cod_formato` smallint(2) NOT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `tot_trazos` smallint(2) DEFAULT '0',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `pathorigen` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imgorigen` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `texto` text COLLATE utf8_unicode_ci,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `fecha` datetime DEFAULT NULL,
  `id_user` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cod_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `plantilla` */

LOCK TABLES `plantilla` WRITE;

UNLOCK TABLES;

/*Table structure for table `provincia` */

DROP TABLE IF EXISTS `provincia`;

CREATE TABLE `provincia` (
  `prov_codigo` smallint(6) NOT NULL,
  `prov_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prov_sigla` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prov_main` smallint(6) DEFAULT NULL,
  `prov_ambito` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciu_id` smallint(6) DEFAULT NULL,
  `dir_id` int(11) DEFAULT NULL,
  `prov_tipo` smallint(6) DEFAULT NULL,
  `prov_foto` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prov_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prov_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `provincia` */

LOCK TABLES `provincia` WRITE;

UNLOCK TABLES;

/*Table structure for table `reorder` */

DROP TABLE IF EXISTS `reorder`;

CREATE TABLE `reorder` (
  `id_lote` int(11) NOT NULL,
  `hijo` int(11) NOT NULL,
  `padre` int(11) NOT NULL,
  `nivel` smallint(1) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `orden` smallint(3) NOT NULL,
  PRIMARY KEY (`id_lote`,`padre`,`hijo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reorder` */

LOCK TABLES `reorder` WRITE;

UNLOCK TABLES;

/*Table structure for table `servicio_menu` */

DROP TABLE IF EXISTS `servicio_menu`;

CREATE TABLE `servicio_menu` (
  `id_service` smallint(6) NOT NULL AUTO_INCREMENT,
  `menu_id` smallint(6) NOT NULL,
  `serv_id` smallint(6) NOT NULL,
  `serv_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `servicio_menu` */

LOCK TABLES `servicio_menu` WRITE;

insert  into `servicio_menu`(`id_service`,`menu_id`,`serv_id`,`serv_nombre`,`estado`) values (1,1,1,'relacion Nuevo','1'),(2,3,1,'relacion Nuevo','1'),(3,2,1,'relacion Nuevo','1'),(4,4,1,'Mapa','1'),(5,5,1,'relacion','1'),(6,6,1,'relacion Nuevo','1'),(7,7,1,'relacion Nuevo','1'),(8,8,1,'relacion Nuevo','1'),(9,9,1,'Nuevo','1'),(10,10,1,'Nuevo','1');

UNLOCK TABLES;

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `serv_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `serv_nombre` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serv_descri` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serv_icono` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serv_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `servicios` */

LOCK TABLES `servicios` WRITE;

insert  into `servicios`(`serv_id`,`serv_nombre`,`serv_descri`,`serv_icono`,`serv_estado`) values (1,'Nuevo','Genera Nuevo Proceso','','1');

UNLOCK TABLES;

/*Table structure for table `shipper` */

DROP TABLE IF EXISTS `shipper`;

CREATE TABLE `shipper` (
  `shi_codigo` int(6) NOT NULL AUTO_INCREMENT,
  `shi_id` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shi_nombre` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_ingreso` date DEFAULT NULL,
  `shi_logo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shi_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecact` date DEFAULT NULL,
  `hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shi_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shipper` */

LOCK TABLES `shipper` WRITE;

insert  into `shipper`(`shi_codigo`,`shi_id`,`shi_nombre`,`fec_ingreso`,`shi_logo`,`shi_estado`,`id_user`,`fecact`,`hora`) values (1,NULL,'Cliente1','2018-12-14',NULL,'1',1,NULL,NULL),(2,NULL,'Cliente2','2018-12-14',NULL,'1',1,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `sistemas` */

DROP TABLE IF EXISTS `sistemas`;

CREATE TABLE `sistemas` (
  `sis_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sis_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sis_icono` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sistemas` */

LOCK TABLES `sistemas` WRITE;

insert  into `sistemas`(`sis_id`,`sis_nombre`,`sis_icono`) values (1,'Madison Web',''),(2,'Madison Móvil','');

UNLOCK TABLES;

/*Table structure for table `telefonos` */

DROP TABLE IF EXISTS `telefonos`;

CREATE TABLE `telefonos` (
  `tel_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tel_numero` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_tipo` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecact` date DEFAULT NULL,
  `hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tel_id`),
  UNIQUE KEY `tel_id` (`tel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `telefonos` */

LOCK TABLES `telefonos` WRITE;

UNLOCK TABLES;

/*Table structure for table `trazos` */

DROP TABLE IF EXISTS `trazos`;

CREATE TABLE `trazos` (
  `cod_trazo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_plantilla` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `x` double(7,4) NOT NULL DEFAULT '0.0000',
  `y` double(7,4) NOT NULL DEFAULT '0.0000',
  `w` double(7,4) NOT NULL DEFAULT '0.0000',
  `h` double(7,4) NOT NULL DEFAULT '0.0000',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `texto` text COLLATE utf8_unicode_ci,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `fecha` datetime DEFAULT NULL,
  `id_user` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cod_trazo`,`cod_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `trazos` */

LOCK TABLES `trazos` WRITE;

UNLOCK TABLES;

/*Table structure for table `ubigeo` */

DROP TABLE IF EXISTS `ubigeo`;

CREATE TABLE `ubigeo` (
  `ciu_id` int(11) NOT NULL,
  `nombre_ubigeo` varchar(80) NOT NULL,
  `codigo_ubigeo` varchar(2) NOT NULL,
  `etiqueta_ubigeo` varchar(200) DEFAULT NULL,
  `buscador_ubigeo` varchar(200) DEFAULT NULL,
  `numero_hijos_ubigeo` int(11) DEFAULT NULL,
  `nivel_ubigeo` smallint(6) DEFAULT NULL,
  `id_padre_ubigeo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ubigeo` */

LOCK TABLES `ubigeo` WRITE;

insert  into `ubigeo`(`ciu_id`,`nombre_ubigeo`,`codigo_ubigeo`,`etiqueta_ubigeo`,`buscador_ubigeo`,`numero_hijos_ubigeo`,`nivel_ubigeo`,`id_padre_ubigeo`) values (2533,'Perú','','Perú','perú',25,0,0),(2534,'Amazonas','01','Amazonas, Perú','amazonas perú',7,1,2533),(2535,'Chachapoyas','01','Chachapoyas, Amazonas','chachapoyas amazonas',21,2,2534),(2536,'Chachapoyas','01','Chachapoyas, Chachapoyas','chachapoyas chachapoyas',0,3,2535),(2537,'Asuncion','02','Asuncion, Chachapoyas','asuncion chachapoyas',0,3,2535),(2538,'Balsas','03','Balsas, Chachapoyas','balsas chachapoyas',0,3,2535),(2539,'Cheto','04','Cheto, Chachapoyas','cheto chachapoyas',0,3,2535),(2540,'Chiliquin','05','Chiliquin, Chachapoyas','chiliquin chachapoyas',0,3,2535),(2541,'Chuquibamba','06','Chuquibamba, Chachapoyas','chuquibamba chachapoyas',0,3,2535),(2542,'Granada','07','Granada, Chachapoyas','granada chachapoyas',0,3,2535),(2543,'Huancas','08','Huancas, Chachapoyas','huancas chachapoyas',0,3,2535),(2544,'La Jalca','09','La Jalca, Chachapoyas','la jalca chachapoyas',0,3,2535),(2545,'Leimebamba','10','Leimebamba, Chachapoyas','leimebamba chachapoyas',0,3,2535),(2546,'Levanto','11','Levanto, Chachapoyas','levanto chachapoyas',0,3,2535),(2547,'Magdalena','12','Magdalena, Chachapoyas','magdalena chachapoyas',0,3,2535),(2548,'Mariscal Castilla','13','Mariscal Castilla, Chachapoyas','mariscal castilla chachapoyas',0,3,2535),(2549,'Molinopampa','14','Molinopampa, Chachapoyas','molinopampa chachapoyas',0,3,2535),(2550,'Montevideo','15','Montevideo, Chachapoyas','montevideo chachapoyas',0,3,2535),(2551,'Olleros','16','Olleros, Chachapoyas','olleros chachapoyas',0,3,2535),(2552,'Quinjalca','17','Quinjalca, Chachapoyas','quinjalca chachapoyas',0,3,2535),(2553,'San Francisco de Daguas','18','San Francisco de Daguas, Chachapoyas','san francisco de daguas chachapoyas',0,3,2535),(2554,'San Isidro de Maino','19','San Isidro de Maino, Chachapoyas','san isidro de maino chachapoyas',0,3,2535),(2555,'Soloco','20','Soloco, Chachapoyas','soloco chachapoyas',0,3,2535),(2556,'Sonche','21','Sonche, Chachapoyas','sonche chachapoyas',0,3,2535),(2557,'Bagua','02','Bagua, Amazonas','bagua amazonas',5,2,2534),(2558,'La Peca','01','La Peca, Bagua','la peca bagua',0,3,2557),(2559,'Aramango','02','Aramango, Bagua','aramango bagua',0,3,2557),(2560,'Copallin','03','Copallin, Bagua','copallin bagua',0,3,2557),(2561,'El Parco','04','El Parco, Bagua','el parco bagua',0,3,2557),(2562,'Imaza','05','Imaza, Bagua','imaza bagua',0,3,2557),(2563,'Bongara','03','Bongara, Amazonas','bongara amazonas',12,2,2534),(2564,'Jumbilla','01','Jumbilla, Bongara','jumbilla bongara',0,3,2563),(2565,'Corosha','02','Corosha, Bongara','corosha bongara',0,3,2563),(2566,'Cuispes','03','Cuispes, Bongara','cuispes bongara',0,3,2563),(2567,'Chisquilla','04','Chisquilla, Bongara','chisquilla bongara',0,3,2563),(2568,'Churuja','05','Churuja, Bongara','churuja bongara',0,3,2563),(2569,'Florida','06','Florida, Bongara','florida bongara',0,3,2563),(2570,'Recta','07','Recta, Bongara','recta bongara',0,3,2563),(2571,'San Carlos','08','San Carlos, Bongara','san carlos bongara',0,3,2563),(2572,'Shipasbamba','09','Shipasbamba, Bongara','shipasbamba bongara',0,3,2563),(2573,'Valera','10','Valera, Bongara','valera bongara',0,3,2563),(2574,'Yambrasbamba','11','Yambrasbamba, Bongara','yambrasbamba bongara',0,3,2563),(2575,'Jazan','12','Jazan, Bongara','jazan bongara',0,3,2563),(2576,'Condorcanqui','04','Condorcanqui, Amazonas','condorcanqui amazonas',3,2,2534),(2577,'Nieva','01','Nieva, Condorcanqui','nieva condorcanqui',0,3,2576),(2578,'El Cenepa','02','El Cenepa, Condorcanqui','el cenepa condorcanqui',0,3,2576),(2579,'Rio Santiago','03','Rio Santiago, Condorcanqui','rio santiago condorcanqui',0,3,2576),(2580,'Luya','05','Luya, Amazonas','luya amazonas',23,2,2534),(2581,'Lamud','01','Lamud, Luya','lamud luya',0,3,2580),(2582,'Camporredondo','02','Camporredondo, Luya','camporredondo luya',0,3,2580),(2583,'Cocabamba','03','Cocabamba, Luya','cocabamba luya',0,3,2580),(2584,'Colcamar','04','Colcamar, Luya','colcamar luya',0,3,2580),(2585,'Conila','05','Conila, Luya','conila luya',0,3,2580),(2586,'Inguilpata','06','Inguilpata, Luya','inguilpata luya',0,3,2580),(2587,'Longuita','07','Longuita, Luya','longuita luya',0,3,2580),(2588,'Lonya Chico','08','Lonya Chico, Luya','lonya chico luya',0,3,2580),(2589,'Luya','09','Luya, Luya','luya luya',0,3,2580),(2590,'Luya Viejo','10','Luya Viejo, Luya','luya viejo luya',0,3,2580),(2591,'Maria','11','Maria, Luya','maria luya',0,3,2580),(2592,'Ocalli','12','Ocalli, Luya','ocalli luya',0,3,2580),(2593,'Ocumal','13','Ocumal, Luya','ocumal luya',0,3,2580),(2594,'Pisuquia','14','Pisuquia, Luya','pisuquia luya',0,3,2580),(2595,'Providencia','15','Providencia, Luya','providencia luya',0,3,2580),(2596,'San Cristobal','16','San Cristobal, Luya','san cristobal luya',0,3,2580),(2597,'San Francisco del Yeso','17','San Francisco del Yeso, Luya','san francisco del yeso luya',0,3,2580),(2598,'San Jeronimo','18','San Jeronimo, Luya','san jeronimo luya',0,3,2580),(2599,'San Juan de Lopecancha','19','San Juan de Lopecancha, Luya','san juan de lopecancha luya',0,3,2580),(2600,'Santa Catalina','20','Santa Catalina, Luya','santa catalina luya',0,3,2580),(2601,'Santo Tomas','21','Santo Tomas, Luya','santo tomas luya',0,3,2580),(2602,'Tingo','22','Tingo, Luya','tingo luya',0,3,2580),(2603,'Trita','23','Trita, Luya','trita luya',0,3,2580),(2604,'Rodriguez de Mendoza','06','Rodriguez de Mendoza, Amazonas','rodriguez de mendoza amazonas',12,2,2534),(2605,'San Nicolas','01','San Nicolas, Rodriguez de Mendoza','san nicolas rodriguez de mendoza',0,3,2604),(2606,'Chirimoto','02','Chirimoto, Rodriguez de Mendoza','chirimoto rodriguez de mendoza',0,3,2604),(2607,'Cochamal','03','Cochamal, Rodriguez de Mendoza','cochamal rodriguez de mendoza',0,3,2604),(2608,'Huambo','04','Huambo, Rodriguez de Mendoza','huambo rodriguez de mendoza',0,3,2604),(2609,'Limabamba','05','Limabamba, Rodriguez de Mendoza','limabamba rodriguez de mendoza',0,3,2604),(2610,'Longar','06','Longar, Rodriguez de Mendoza','longar rodriguez de mendoza',0,3,2604),(2611,'Mariscal Benavides','07','Mariscal Benavides, Rodriguez de Mendoza','mariscal benavides rodriguez de mendoza',0,3,2604),(2612,'Milpuc','08','Milpuc, Rodriguez de Mendoza','milpuc rodriguez de mendoza',0,3,2604),(2613,'Omia','09','Omia, Rodriguez de Mendoza','omia rodriguez de mendoza',0,3,2604),(2614,'Santa Rosa','10','Santa Rosa, Rodriguez de Mendoza','santa rosa rodriguez de mendoza',0,3,2604),(2615,'Totora','11','Totora, Rodriguez de Mendoza','totora rodriguez de mendoza',0,3,2604),(2616,'Vista Alegre','12','Vista Alegre, Rodriguez de Mendoza','vista alegre rodriguez de mendoza',0,3,2604),(2617,'Utcubamba','07','Utcubamba, Amazonas','utcubamba amazonas',7,2,2534),(2618,'Bagua Grande','01','Bagua Grande, Utcubamba','bagua grande utcubamba',0,3,2617),(2619,'Cajaruro','02','Cajaruro, Utcubamba','cajaruro utcubamba',0,3,2617),(2620,'Cumba','03','Cumba, Utcubamba','cumba utcubamba',0,3,2617),(2621,'El Milagro','04','El Milagro, Utcubamba','el milagro utcubamba',0,3,2617),(2622,'Jamalca','05','Jamalca, Utcubamba','jamalca utcubamba',0,3,2617),(2623,'Lonya Grande','06','Lonya Grande, Utcubamba','lonya grande utcubamba',0,3,2617),(2624,'Yamon','07','Yamon, Utcubamba','yamon utcubamba',0,3,2617),(2625,'Ancash','02','Ancash, Perú','ancash perú',20,1,2533),(2626,'Huaraz','01','Huaraz, Ancash','huaraz ancash',12,2,2625),(2627,'Huaraz','01','Huaraz, Huaraz','huaraz huaraz',0,3,2626),(2628,'Cochabamba','02','Cochabamba, Huaraz','cochabamba huaraz',0,3,2626),(2629,'Colcabamba','03','Colcabamba, Huaraz','colcabamba huaraz',0,3,2626),(2630,'Huanchay','04','Huanchay, Huaraz','huanchay huaraz',0,3,2626),(2631,'Independencia','05','Independencia, Huaraz','independencia huaraz',0,3,2626),(2632,'Jangas','06','Jangas, Huaraz','jangas huaraz',0,3,2626),(2633,'La Libertad','07','La Libertad, Huaraz','la libertad huaraz',0,3,2626),(2634,'Olleros','08','Olleros, Huaraz','olleros huaraz',0,3,2626),(2635,'Pampas','09','Pampas, Huaraz','pampas huaraz',0,3,2626),(2636,'Pariacoto','10','Pariacoto, Huaraz','pariacoto huaraz',0,3,2626),(2637,'Pira','11','Pira, Huaraz','pira huaraz',0,3,2626),(2638,'Tarica','12','Tarica, Huaraz','tarica huaraz',0,3,2626),(2639,'Aija','02','Aija, Ancash','aija ancash',5,2,2625),(2640,'Aija','01','Aija, Aija','aija aija',0,3,2639),(2641,'Coris','02','Coris, Aija','coris aija',0,3,2639),(2642,'Huacllan','03','Huacllan, Aija','huacllan aija',0,3,2639),(2643,'La Merced','04','La Merced, Aija','la merced aija',0,3,2639),(2644,'Succha','05','Succha, Aija','succha aija',0,3,2639),(2645,'Antonio Raymondi','03','Antonio Raymondi, Ancash','antonio raymondi ancash',6,2,2625),(2646,'Llamellin','01','Llamellin, Antonio Raymondi','llamellin antonio raymondi',0,3,2645),(2647,'Aczo','02','Aczo, Antonio Raymondi','aczo antonio raymondi',0,3,2645),(2648,'Chaccho','03','Chaccho, Antonio Raymondi','chaccho antonio raymondi',0,3,2645),(2649,'Chingas','04','Chingas, Antonio Raymondi','chingas antonio raymondi',0,3,2645),(2650,'Mirgas','05','Mirgas, Antonio Raymondi','mirgas antonio raymondi',0,3,2645),(2651,'San Juan de Rontoy','06','San Juan de Rontoy, Antonio Raymondi','san juan de rontoy antonio raymondi',0,3,2645),(2652,'Asuncion','04','Asuncion, Ancash','asuncion ancash',2,2,2625),(2653,'Chacas','01','Chacas, Asuncion','chacas asuncion',0,3,2652),(2654,'Acochaca','02','Acochaca, Asuncion','acochaca asuncion',0,3,2652),(2655,'Bolognesi','05','Bolognesi, Ancash','bolognesi ancash',15,2,2625),(2656,'Chiquian','01','Chiquian, Bolognesi','chiquian bolognesi',0,3,2655),(2657,'Abelardo Pardo Lezameta','02','Abelardo Pardo Lezameta, Bolognesi','abelardo pardo lezameta bolognesi',0,3,2655),(2658,'Antonio Raymondi','03','Antonio Raymondi, Bolognesi','antonio raymondi bolognesi',0,3,2655),(2659,'Aquia','04','Aquia, Bolognesi','aquia bolognesi',0,3,2655),(2660,'Cajacay','05','Cajacay, Bolognesi','cajacay bolognesi',0,3,2655),(2661,'Canis','06','Canis, Bolognesi','canis bolognesi',0,3,2655),(2662,'Colquioc','07','Colquioc, Bolognesi','colquioc bolognesi',0,3,2655),(2663,'Huallanca','08','Huallanca, Bolognesi','huallanca bolognesi',0,3,2655),(2664,'Huasta','09','Huasta, Bolognesi','huasta bolognesi',0,3,2655),(2665,'Huayllacayan','10','Huayllacayan, Bolognesi','huayllacayan bolognesi',0,3,2655),(2666,'La Primavera','11','La Primavera, Bolognesi','la primavera bolognesi',0,3,2655),(2667,'Mangas','12','Mangas, Bolognesi','mangas bolognesi',0,3,2655),(2668,'Pacllon','13','Pacllon, Bolognesi','pacllon bolognesi',0,3,2655),(2669,'San Miguel de Corpanqui','14','San Miguel de Corpanqui, Bolognesi','san miguel de corpanqui bolognesi',0,3,2655),(2670,'Ticllos','15','Ticllos, Bolognesi','ticllos bolognesi',0,3,2655),(2671,'Carhuaz','06','Carhuaz, Ancash','carhuaz ancash',11,2,2625),(2672,'Carhuaz','01','Carhuaz, Carhuaz','carhuaz carhuaz',0,3,2671),(2673,'Acopampa','02','Acopampa, Carhuaz','acopampa carhuaz',0,3,2671),(2674,'Amashca','03','Amashca, Carhuaz','amashca carhuaz',0,3,2671),(2675,'Anta','04','Anta, Carhuaz','anta carhuaz',0,3,2671),(2676,'Ataquero','05','Ataquero, Carhuaz','ataquero carhuaz',0,3,2671),(2677,'Marcara','06','Marcara, Carhuaz','marcara carhuaz',0,3,2671),(2678,'Pariahuanca','07','Pariahuanca, Carhuaz','pariahuanca carhuaz',0,3,2671),(2679,'San Miguel de Aco','08','San Miguel de Aco, Carhuaz','san miguel de aco carhuaz',0,3,2671),(2680,'Shilla','09','Shilla, Carhuaz','shilla carhuaz',0,3,2671),(2681,'Tinco','10','Tinco, Carhuaz','tinco carhuaz',0,3,2671),(2682,'Yungar','11','Yungar, Carhuaz','yungar carhuaz',0,3,2671),(2683,'Carlos Fermin Fitzcarrald','07','Carlos Fermin Fitzcarrald, Ancash','carlos fermin fitzcarrald ancash',3,2,2625),(2684,'San Luis','01','San Luis, Carlos Fermin Fitzcarrald','san luis carlos fermin fitzcarrald',0,3,2683),(2685,'San Nicolas','02','San Nicolas, Carlos Fermin Fitzcarrald','san nicolas carlos fermin fitzcarrald',0,3,2683),(2686,'Yauya','03','Yauya, Carlos Fermin Fitzcarrald','yauya carlos fermin fitzcarrald',0,3,2683),(2687,'Casma','08','Casma, Ancash','casma ancash',4,2,2625),(2688,'Casma','01','Casma, Casma','casma casma',0,3,2687),(2689,'Buena Vista Alta','02','Buena Vista Alta, Casma','buena vista alta casma',0,3,2687),(2690,'Comandante Noel','03','Comandante Noel, Casma','comandante noel casma',0,3,2687),(2691,'Yautan','04','Yautan, Casma','yautan casma',0,3,2687),(2692,'Corongo','09','Corongo, Ancash','corongo ancash',7,2,2625),(2693,'Corongo','01','Corongo, Corongo','corongo corongo',0,3,2692),(2694,'Aco','02','Aco, Corongo','aco corongo',0,3,2692),(2695,'Bambas','03','Bambas, Corongo','bambas corongo',0,3,2692),(2696,'Cusca','04','Cusca, Corongo','cusca corongo',0,3,2692),(2697,'La Pampa','05','La Pampa, Corongo','la pampa corongo',0,3,2692),(2698,'Yanac','06','Yanac, Corongo','yanac corongo',0,3,2692),(2699,'Yupan','07','Yupan, Corongo','yupan corongo',0,3,2692),(2700,'Huari','10','Huari, Ancash','huari ancash',16,2,2625),(2701,'Huari','01','Huari, Huari','huari huari',0,3,2700),(2702,'Anra','02','Anra, Huari','anra huari',0,3,2700),(2703,'Cajay','03','Cajay, Huari','cajay huari',0,3,2700),(2704,'Chavin de Huantar','04','Chavin de Huantar, Huari','chavin de huantar huari',0,3,2700),(2705,'Huacachi','05','Huacachi, Huari','huacachi huari',0,3,2700),(2706,'Huacchis','06','Huacchis, Huari','huacchis huari',0,3,2700),(2707,'Huachis','07','Huachis, Huari','huachis huari',0,3,2700),(2708,'Huantar','08','Huantar, Huari','huantar huari',0,3,2700),(2709,'Masin','09','Masin, Huari','masin huari',0,3,2700),(2710,'Paucas','10','Paucas, Huari','paucas huari',0,3,2700),(2711,'Ponto','11','Ponto, Huari','ponto huari',0,3,2700),(2712,'Rahuapampa','12','Rahuapampa, Huari','rahuapampa huari',0,3,2700),(2713,'Rapayan','13','Rapayan, Huari','rapayan huari',0,3,2700),(2714,'San Marcos','14','San Marcos, Huari','san marcos huari',0,3,2700),(2715,'San Pedro de Chana','15','San Pedro de Chana, Huari','san pedro de chana huari',0,3,2700),(2716,'Uco','16','Uco, Huari','uco huari',0,3,2700),(2717,'Huarmey','11','Huarmey, Ancash','huarmey ancash',5,2,2625),(2718,'Huarmey','01','Huarmey, Huarmey','huarmey huarmey',0,3,2717),(2719,'Cochapeti','02','Cochapeti, Huarmey','cochapeti huarmey',0,3,2717),(2720,'Culebras','03','Culebras, Huarmey','culebras huarmey',0,3,2717),(2721,'Huayan','04','Huayan, Huarmey','huayan huarmey',0,3,2717),(2722,'Malvas','05','Malvas, Huarmey','malvas huarmey',0,3,2717),(2723,'Huaylas','12','Huaylas, Ancash','huaylas ancash',10,2,2625),(2724,'Caraz','01','Caraz, Huaylas','caraz huaylas',0,3,2723),(2725,'Huallanca','02','Huallanca, Huaylas','huallanca huaylas',0,3,2723),(2726,'Huata','03','Huata, Huaylas','huata huaylas',0,3,2723),(2727,'Huaylas','04','Huaylas, Huaylas','huaylas huaylas',0,3,2723),(2728,'Mato','05','Mato, Huaylas','mato huaylas',0,3,2723),(2729,'Pamparomas','06','Pamparomas, Huaylas','pamparomas huaylas',0,3,2723),(2730,'Pueblo Libre','07','Pueblo Libre, Huaylas','pueblo libre huaylas',0,3,2723),(2731,'Santa Cruz','08','Santa Cruz, Huaylas','santa cruz huaylas',0,3,2723),(2732,'Santo Toribio','09','Santo Toribio, Huaylas','santo toribio huaylas',0,3,2723),(2733,'Yuracmarca','10','Yuracmarca, Huaylas','yuracmarca huaylas',0,3,2723),(2734,'Mariscal Luzuriaga','13','Mariscal Luzuriaga, Ancash','mariscal luzuriaga ancash',8,2,2625),(2735,'Piscobamba','01','Piscobamba, Mariscal Luzuriaga','piscobamba mariscal luzuriaga',0,3,2734),(2736,'Casca','02','Casca, Mariscal Luzuriaga','casca mariscal luzuriaga',0,3,2734),(2737,'Eleazar Guzman Barron','03','Eleazar Guzman Barron, Mariscal Luzuriaga','eleazar guzman barron mariscal luzuriaga',0,3,2734),(2738,'Fidel Olivas Escudero','04','Fidel Olivas Escudero, Mariscal Luzuriaga','fidel olivas escudero mariscal luzuriaga',0,3,2734),(2739,'Llama','05','Llama, Mariscal Luzuriaga','llama mariscal luzuriaga',0,3,2734),(2740,'Llumpa','06','Llumpa, Mariscal Luzuriaga','llumpa mariscal luzuriaga',0,3,2734),(2741,'Lucma','07','Lucma, Mariscal Luzuriaga','lucma mariscal luzuriaga',0,3,2734),(2742,'Musga','08','Musga, Mariscal Luzuriaga','musga mariscal luzuriaga',0,3,2734),(2743,'Ocros','14','Ocros, Ancash','ocros ancash',10,2,2625),(2744,'Ocros','01','Ocros, Ocros','ocros ocros',0,3,2743),(2745,'Acas','02','Acas, Ocros','acas ocros',0,3,2743),(2746,'Cajamarquilla','03','Cajamarquilla, Ocros','cajamarquilla ocros',0,3,2743),(2747,'Carhuapampa','04','Carhuapampa, Ocros','carhuapampa ocros',0,3,2743),(2748,'Cochas','05','Cochas, Ocros','cochas ocros',0,3,2743),(2749,'Congas','06','Congas, Ocros','congas ocros',0,3,2743),(2750,'Llipa','07','Llipa, Ocros','llipa ocros',0,3,2743),(2751,'San Cristobal de Rajan','08','San Cristobal de Rajan, Ocros','san cristobal de rajan ocros',0,3,2743),(2752,'San Pedro','09','San Pedro, Ocros','san pedro ocros',0,3,2743),(2753,'Santiago de Chilcas','10','Santiago de Chilcas, Ocros','santiago de chilcas ocros',0,3,2743),(2754,'Pallasca','15','Pallasca, Ancash','pallasca ancash',11,2,2625),(2755,'Cabana','01','Cabana, Pallasca','cabana pallasca',0,3,2754),(2756,'Bolognesi','02','Bolognesi, Pallasca','bolognesi pallasca',0,3,2754),(2757,'Conchucos','03','Conchucos, Pallasca','conchucos pallasca',0,3,2754),(2758,'Huacaschuque','04','Huacaschuque, Pallasca','huacaschuque pallasca',0,3,2754),(2759,'Huandoval','05','Huandoval, Pallasca','huandoval pallasca',0,3,2754),(2760,'Lacabamba','06','Lacabamba, Pallasca','lacabamba pallasca',0,3,2754),(2761,'Llapo','07','Llapo, Pallasca','llapo pallasca',0,3,2754),(2762,'Pallasca','08','Pallasca, Pallasca','pallasca pallasca',0,3,2754),(2763,'Pampas','09','Pampas, Pallasca','pampas pallasca',0,3,2754),(2764,'Santa Rosa','10','Santa Rosa, Pallasca','santa rosa pallasca',0,3,2754),(2765,'Tauca','11','Tauca, Pallasca','tauca pallasca',0,3,2754),(2766,'Pomabamba','16','Pomabamba, Ancash','pomabamba ancash',4,2,2625),(2767,'Pomabamba','01','Pomabamba, Pomabamba','pomabamba pomabamba',0,3,2766),(2768,'Huayllan','02','Huayllan, Pomabamba','huayllan pomabamba',0,3,2766),(2769,'Parobamba','03','Parobamba, Pomabamba','parobamba pomabamba',0,3,2766),(2770,'Quinuabamba','04','Quinuabamba, Pomabamba','quinuabamba pomabamba',0,3,2766),(2771,'Recuay','17','Recuay, Ancash','recuay ancash',10,2,2625),(2772,'Recuay','01','Recuay, Recuay','recuay recuay',0,3,2771),(2773,'Catac','02','Catac, Recuay','catac recuay',0,3,2771),(2774,'Cotaparaco','03','Cotaparaco, Recuay','cotaparaco recuay',0,3,2771),(2775,'Huayllapampa','04','Huayllapampa, Recuay','huayllapampa recuay',0,3,2771),(2776,'Llacllin','05','Llacllin, Recuay','llacllin recuay',0,3,2771),(2777,'Marca','06','Marca, Recuay','marca recuay',0,3,2771),(2778,'Pampas Chico','07','Pampas Chico, Recuay','pampas chico recuay',0,3,2771),(2779,'Pararin','08','Pararin, Recuay','pararin recuay',0,3,2771),(2780,'Tapacocha','09','Tapacocha, Recuay','tapacocha recuay',0,3,2771),(2781,'Ticapampa','10','Ticapampa, Recuay','ticapampa recuay',0,3,2771),(2782,'Santa','18','Santa, Ancash','santa ancash',9,2,2625),(2783,'Chimbote','01','Chimbote, Santa','chimbote santa',0,3,2782),(2784,'Caceres del Peru','02','Caceres del Peru, Santa','caceres del peru santa',0,3,2782),(2785,'Coishco','03','Coishco, Santa','coishco santa',0,3,2782),(2786,'Macate','04','Macate, Santa','macate santa',0,3,2782),(2787,'Moro','05','Moro, Santa','moro santa',0,3,2782),(2788,'Nepeqa','06','Nepeqa, Santa','nepeqa santa',0,3,2782),(2789,'Samanco','07','Samanco, Santa','samanco santa',0,3,2782),(2790,'Santa','08','Santa, Santa','santa santa',0,3,2782),(2791,'Nuevo Chimbote','09','Nuevo Chimbote, Santa','nuevo chimbote santa',0,3,2782),(2792,'Sihuas','19','Sihuas, Ancash','sihuas ancash',10,2,2625),(2793,'Sihuas','01','Sihuas, Sihuas','sihuas sihuas',0,3,2792),(2794,'Acobamba','02','Acobamba, Sihuas','acobamba sihuas',0,3,2792),(2795,'Alfonso Ugarte','03','Alfonso Ugarte, Sihuas','alfonso ugarte sihuas',0,3,2792),(2796,'Cashapampa','04','Cashapampa, Sihuas','cashapampa sihuas',0,3,2792),(2797,'Chingalpo','05','Chingalpo, Sihuas','chingalpo sihuas',0,3,2792),(2798,'Huayllabamba','06','Huayllabamba, Sihuas','huayllabamba sihuas',0,3,2792),(2799,'Quiches','07','Quiches, Sihuas','quiches sihuas',0,3,2792),(2800,'Ragash','08','Ragash, Sihuas','ragash sihuas',0,3,2792),(2801,'San Juan','09','San Juan, Sihuas','san juan sihuas',0,3,2792),(2802,'Sicsibamba','10','Sicsibamba, Sihuas','sicsibamba sihuas',0,3,2792),(2803,'Yungay','20','Yungay, Ancash','yungay ancash',8,2,2625),(2804,'Yungay','01','Yungay, Yungay','yungay yungay',0,3,2803),(2805,'Cascapara','02','Cascapara, Yungay','cascapara yungay',0,3,2803),(2806,'Mancos','03','Mancos, Yungay','mancos yungay',0,3,2803),(2807,'Matacoto','04','Matacoto, Yungay','matacoto yungay',0,3,2803),(2808,'Quillo','05','Quillo, Yungay','quillo yungay',0,3,2803),(2809,'Ranrahirca','06','Ranrahirca, Yungay','ranrahirca yungay',0,3,2803),(2810,'Shupluy','07','Shupluy, Yungay','shupluy yungay',0,3,2803),(2811,'Yanama','08','Yanama, Yungay','yanama yungay',0,3,2803),(2812,'Apurimac','03','Apurimac, Perú','apurimac perú',7,1,2533),(2813,'Abancay','01','Abancay, Apurimac','abancay apurimac',9,2,2812),(2814,'Abancay','01','Abancay, Abancay','abancay abancay',0,3,2813),(2815,'Chacoche','02','Chacoche, Abancay','chacoche abancay',0,3,2813),(2816,'Circa','03','Circa, Abancay','circa abancay',0,3,2813),(2817,'Curahuasi','04','Curahuasi, Abancay','curahuasi abancay',0,3,2813),(2818,'Huanipaca','05','Huanipaca, Abancay','huanipaca abancay',0,3,2813),(2819,'Lambrama','06','Lambrama, Abancay','lambrama abancay',0,3,2813),(2820,'Pichirhua','07','Pichirhua, Abancay','pichirhua abancay',0,3,2813),(2821,'San Pedro de Cachora','08','San Pedro de Cachora, Abancay','san pedro de cachora abancay',0,3,2813),(2822,'Tamburco','09','Tamburco, Abancay','tamburco abancay',0,3,2813),(2823,'Andahuaylas','02','Andahuaylas, Apurimac','andahuaylas apurimac',19,2,2812),(2824,'Andahuaylas','01','Andahuaylas, Andahuaylas','andahuaylas andahuaylas',0,3,2823),(2825,'Andarapa','02','Andarapa, Andahuaylas','andarapa andahuaylas',0,3,2823),(2826,'Chiara','03','Chiara, Andahuaylas','chiara andahuaylas',0,3,2823),(2827,'Huancarama','04','Huancarama, Andahuaylas','huancarama andahuaylas',0,3,2823),(2828,'Huancaray','05','Huancaray, Andahuaylas','huancaray andahuaylas',0,3,2823),(2829,'Huayana','06','Huayana, Andahuaylas','huayana andahuaylas',0,3,2823),(2830,'Kishuara','07','Kishuara, Andahuaylas','kishuara andahuaylas',0,3,2823),(2831,'Pacobamba','08','Pacobamba, Andahuaylas','pacobamba andahuaylas',0,3,2823),(2832,'Pacucha','09','Pacucha, Andahuaylas','pacucha andahuaylas',0,3,2823),(2833,'Pampachiri','10','Pampachiri, Andahuaylas','pampachiri andahuaylas',0,3,2823),(2834,'Pomacocha','11','Pomacocha, Andahuaylas','pomacocha andahuaylas',0,3,2823),(2835,'San Antonio de Cachi','12','San Antonio de Cachi, Andahuaylas','san antonio de cachi andahuaylas',0,3,2823),(2836,'San Jeronimo','13','San Jeronimo, Andahuaylas','san jeronimo andahuaylas',0,3,2823),(2837,'San Miguel de Chaccrampa','14','San Miguel de Chaccrampa, Andahuaylas','san miguel de chaccrampa andahuaylas',0,3,2823),(2838,'Santa Maria de Chicmo','15','Santa Maria de Chicmo, Andahuaylas','santa maria de chicmo andahuaylas',0,3,2823),(2839,'Talavera','16','Talavera, Andahuaylas','talavera andahuaylas',0,3,2823),(2840,'Tumay Huaraca','17','Tumay Huaraca, Andahuaylas','tumay huaraca andahuaylas',0,3,2823),(2841,'Turpo','18','Turpo, Andahuaylas','turpo andahuaylas',0,3,2823),(2842,'Kaquiabamba','19','Kaquiabamba, Andahuaylas','kaquiabamba andahuaylas',0,3,2823),(2843,'Antabamba','03','Antabamba, Apurimac','antabamba apurimac',7,2,2812),(2844,'Antabamba','01','Antabamba, Antabamba','antabamba antabamba',0,3,2843),(2845,'El Oro','02','El Oro, Antabamba','el oro antabamba',0,3,2843),(2846,'Huaquirca','03','Huaquirca, Antabamba','huaquirca antabamba',0,3,2843),(2847,'Juan Espinoza Medrano','04','Juan Espinoza Medrano, Antabamba','juan espinoza medrano antabamba',0,3,2843),(2848,'Oropesa','05','Oropesa, Antabamba','oropesa antabamba',0,3,2843),(2849,'Pachaconas','06','Pachaconas, Antabamba','pachaconas antabamba',0,3,2843),(2850,'Sabaino','07','Sabaino, Antabamba','sabaino antabamba',0,3,2843),(2851,'Aymaraes','04','Aymaraes, Apurimac','aymaraes apurimac',17,2,2812),(2852,'Chalhuanca','01','Chalhuanca, Aymaraes','chalhuanca aymaraes',0,3,2851),(2853,'Capaya','02','Capaya, Aymaraes','capaya aymaraes',0,3,2851),(2854,'Caraybamba','03','Caraybamba, Aymaraes','caraybamba aymaraes',0,3,2851),(2855,'Chapimarca','04','Chapimarca, Aymaraes','chapimarca aymaraes',0,3,2851),(2856,'Colcabamba','05','Colcabamba, Aymaraes','colcabamba aymaraes',0,3,2851),(2857,'Cotaruse','06','Cotaruse, Aymaraes','cotaruse aymaraes',0,3,2851),(2858,'Huayllo','07','Huayllo, Aymaraes','huayllo aymaraes',0,3,2851),(2859,'Justo Apu Sahuaraura','08','Justo Apu Sahuaraura, Aymaraes','justo apu sahuaraura aymaraes',0,3,2851),(2860,'Lucre','09','Lucre, Aymaraes','lucre aymaraes',0,3,2851),(2861,'Pocohuanca','10','Pocohuanca, Aymaraes','pocohuanca aymaraes',0,3,2851),(2862,'San Juan de Chacqa','11','San Juan de Chacqa, Aymaraes','san juan de chacqa aymaraes',0,3,2851),(2863,'Saqayca','12','Saqayca, Aymaraes','saqayca aymaraes',0,3,2851),(2864,'Soraya','13','Soraya, Aymaraes','soraya aymaraes',0,3,2851),(2865,'Tapairihua','14','Tapairihua, Aymaraes','tapairihua aymaraes',0,3,2851),(2866,'Tintay','15','Tintay, Aymaraes','tintay aymaraes',0,3,2851),(2867,'Toraya','16','Toraya, Aymaraes','toraya aymaraes',0,3,2851),(2868,'Yanaca','17','Yanaca, Aymaraes','yanaca aymaraes',0,3,2851),(2869,'Cotabambas','05','Cotabambas, Apurimac','cotabambas apurimac',6,2,2812),(2870,'Tambobamba','01','Tambobamba, Cotabambas','tambobamba cotabambas',0,3,2869),(2871,'Cotabambas','02','Cotabambas, Cotabambas','cotabambas cotabambas',0,3,2869),(2872,'Coyllurqui','03','Coyllurqui, Cotabambas','coyllurqui cotabambas',0,3,2869),(2873,'Haquira','04','Haquira, Cotabambas','haquira cotabambas',0,3,2869),(2874,'Mara','05','Mara, Cotabambas','mara cotabambas',0,3,2869),(2875,'Challhuahuacho','06','Challhuahuacho, Cotabambas','challhuahuacho cotabambas',0,3,2869),(2876,'Chincheros','06','Chincheros, Apurimac','chincheros apurimac',8,2,2812),(2877,'Chincheros','01','Chincheros, Chincheros','chincheros chincheros',0,3,2876),(2878,'Anco-Huallo','02','Anco-Huallo, Chincheros','anco-huallo chincheros',0,3,2876),(2879,'Cocharcas','03','Cocharcas, Chincheros','cocharcas chincheros',0,3,2876),(2880,'Huaccana','04','Huaccana, Chincheros','huaccana chincheros',0,3,2876),(2881,'Ocobamba','05','Ocobamba, Chincheros','ocobamba chincheros',0,3,2876),(2882,'Ongoy','06','Ongoy, Chincheros','ongoy chincheros',0,3,2876),(2883,'Uranmarca','07','Uranmarca, Chincheros','uranmarca chincheros',0,3,2876),(2884,'Ranracancha','08','Ranracancha, Chincheros','ranracancha chincheros',0,3,2876),(2885,'Grau','07','Grau, Apurimac','grau apurimac',14,2,2812),(2886,'Chuquibambilla','01','Chuquibambilla, Grau','chuquibambilla grau',0,3,2885),(2887,'Curpahuasi','02','Curpahuasi, Grau','curpahuasi grau',0,3,2885),(2888,'Gamarra','03','Gamarra, Grau','gamarra grau',0,3,2885),(2889,'Huayllati','04','Huayllati, Grau','huayllati grau',0,3,2885),(2890,'Mamara','05','Mamara, Grau','mamara grau',0,3,2885),(2891,'Micaela Bastidas','06','Micaela Bastidas, Grau','micaela bastidas grau',0,3,2885),(2892,'Pataypampa','07','Pataypampa, Grau','pataypampa grau',0,3,2885),(2893,'Progreso','08','Progreso, Grau','progreso grau',0,3,2885),(2894,'San Antonio','09','San Antonio, Grau','san antonio grau',0,3,2885),(2895,'Santa Rosa','10','Santa Rosa, Grau','santa rosa grau',0,3,2885),(2896,'Turpay','11','Turpay, Grau','turpay grau',0,3,2885),(2897,'Vilcabamba','12','Vilcabamba, Grau','vilcabamba grau',0,3,2885),(2898,'Virundo','13','Virundo, Grau','virundo grau',0,3,2885),(2899,'Curasco','14','Curasco, Grau','curasco grau',0,3,2885),(2900,'Arequipa','04','Arequipa, Perú','arequipa perú',8,1,2533),(2901,'Arequipa','01','Arequipa, Arequipa, Arequipa','arequipa arequipa arequipa',29,2,2900),(2902,'Arequipa','01','Arequipa, Arequipa','arequipa arequipa',0,3,2901),(2903,'Alto Selva Alegre','02','Alto Selva Alegre, Arequipa','alto selva alegre arequipa',0,3,2901),(2904,'Cayma','03','Cayma, Arequipa','cayma arequipa',0,3,2901),(2905,'Cerro Colorado','04','Cerro Colorado, Arequipa','cerro colorado arequipa',0,3,2901),(2906,'Characato','05','Characato, Arequipa','characato arequipa',0,3,2901),(2907,'Chiguata','06','Chiguata, Arequipa','chiguata arequipa',0,3,2901),(2908,'Jacobo Hunter','07','Jacobo Hunter, Arequipa','jacobo hunter arequipa',0,3,2901),(2909,'La Joya','08','La Joya, Arequipa','la joya arequipa',0,3,2901),(2910,'Mariano Melgar','09','Mariano Melgar, Arequipa','mariano melgar arequipa',0,3,2901),(2911,'Miraflores','10','Miraflores, Arequipa','miraflores arequipa',0,3,2901),(2912,'Mollebaya','11','Mollebaya, Arequipa','mollebaya arequipa',0,3,2901),(2913,'Paucarpata','12','Paucarpata, Arequipa','paucarpata arequipa',0,3,2901),(2914,'Pocsi','13','Pocsi, Arequipa','pocsi arequipa',0,3,2901),(2915,'Polobaya','14','Polobaya, Arequipa','polobaya arequipa',0,3,2901),(2916,'Quequeqa','15','Quequeqa, Arequipa','quequeqa arequipa',0,3,2901),(2917,'Sabandia','16','Sabandia, Arequipa','sabandia arequipa',0,3,2901),(2918,'Sachaca','17','Sachaca, Arequipa','sachaca arequipa',0,3,2901),(2919,'San Juan de Siguas','18','San Juan de Siguas, Arequipa','san juan de siguas arequipa',0,3,2901),(2920,'San Juan de Tarucani','19','San Juan de Tarucani, Arequipa','san juan de tarucani arequipa',0,3,2901),(2921,'Santa Isabel de Siguas','20','Santa Isabel de Siguas, Arequipa','santa isabel de siguas arequipa',0,3,2901),(2922,'Santa Rita de Siguas','21','Santa Rita de Siguas, Arequipa','santa rita de siguas arequipa',0,3,2901),(2923,'Socabaya','22','Socabaya, Arequipa','socabaya arequipa',0,3,2901),(2924,'Tiabaya','23','Tiabaya, Arequipa','tiabaya arequipa',0,3,2901),(2925,'Uchumayo','24','Uchumayo, Arequipa','uchumayo arequipa',0,3,2901),(2926,'Vitor','25','Vitor, Arequipa','vitor arequipa',0,3,2901),(2927,'Yanahuara','26','Yanahuara, Arequipa','yanahuara arequipa',0,3,2901),(2928,'Yarabamba','27','Yarabamba, Arequipa','yarabamba arequipa',0,3,2901),(2929,'Yura','28','Yura, Arequipa','yura arequipa',0,3,2901),(2930,'Jose Luis Bustamante y Rivero','29','Jose Luis Bustamante y Rivero, Arequipa','jose luis bustamante y rivero arequipa',0,3,2901),(2931,'Camana','02','Camana, Arequipa','camana arequipa',8,2,2900),(2932,'Camana','01','Camana, Camana','camana camana',0,3,2931),(2933,'Jose Maria Quimper','02','Jose Maria Quimper, Camana','jose maria quimper camana',0,3,2931),(2934,'Mariano Nicolas Valcarcel','03','Mariano Nicolas Valcarcel, Camana','mariano nicolas valcarcel camana',0,3,2931),(2935,'Mariscal Caceres','04','Mariscal Caceres, Camana','mariscal caceres camana',0,3,2931),(2936,'Nicolas de Pierola','05','Nicolas de Pierola, Camana','nicolas de pierola camana',0,3,2931),(2937,'Ocoqa','06','Ocoqa, Camana','ocoqa camana',0,3,2931),(2938,'Quilca','07','Quilca, Camana','quilca camana',0,3,2931),(2939,'Samuel Pastor','08','Samuel Pastor, Camana','samuel pastor camana',0,3,2931),(2940,'Caraveli','03','Caraveli, Arequipa','caraveli arequipa',13,2,2900),(2941,'Caraveli','01','Caraveli, Caraveli','caraveli caraveli',0,3,2940),(2942,'Acari','02','Acari, Caraveli','acari caraveli',0,3,2940),(2943,'Atico','03','Atico, Caraveli','atico caraveli',0,3,2940),(2944,'Atiquipa','04','Atiquipa, Caraveli','atiquipa caraveli',0,3,2940),(2945,'Bella Union','05','Bella Union, Caraveli','bella union caraveli',0,3,2940),(2946,'Cahuacho','06','Cahuacho, Caraveli','cahuacho caraveli',0,3,2940),(2947,'Chala','07','Chala, Caraveli','chala caraveli',0,3,2940),(2948,'Chaparra','08','Chaparra, Caraveli','chaparra caraveli',0,3,2940),(2949,'Huanuhuanu','09','Huanuhuanu, Caraveli','huanuhuanu caraveli',0,3,2940),(2950,'Jaqui','10','Jaqui, Caraveli','jaqui caraveli',0,3,2940),(2951,'Lomas','11','Lomas, Caraveli','lomas caraveli',0,3,2940),(2952,'Quicacha','12','Quicacha, Caraveli','quicacha caraveli',0,3,2940),(2953,'Yauca','13','Yauca, Caraveli','yauca caraveli',0,3,2940),(2954,'Castilla','04','Castilla, Arequipa','castilla arequipa',16,2,2900),(2955,'Aplao','01','Aplao, Castilla','aplao castilla',0,3,2954),(2956,'Andagua','02','Andagua, Castilla','andagua castilla',0,3,2954),(2957,'Ayo','03','Ayo, Castilla','ayo castilla',0,3,2954),(2958,'Chachas','04','Chachas, Castilla','chachas castilla',0,3,2954),(2959,'Chilcaymarca','05','Chilcaymarca, Castilla','chilcaymarca castilla',0,3,2954),(2960,'Choco','06','Choco, Castilla','choco castilla',0,3,2954),(2961,'Huancarqui','07','Huancarqui, Castilla','huancarqui castilla',0,3,2954),(2962,'Machaguay','08','Machaguay, Castilla','machaguay castilla',0,3,2954),(2963,'Orcopampa','09','Orcopampa, Castilla','orcopampa castilla',0,3,2954),(2964,'Pampacolca','10','Pampacolca, Castilla','pampacolca castilla',0,3,2954),(2965,'Tipan','11','Tipan, Castilla','tipan castilla',0,3,2954),(2966,'Uqon','12','Uqon, Castilla','uqon castilla',0,3,2954),(2967,'Uraca','13','Uraca, Castilla','uraca castilla',0,3,2954),(2968,'Viraco','14','Viraco, Castilla','viraco castilla',0,3,2954),(2969,'Yanque','19','Yanque, Castilla','yanque castilla',0,3,2954),(2970,'Majes','20','Majes, Castilla','majes castilla',0,3,2954),(2971,'Caylloma','05','Caylloma, Arequipa','caylloma arequipa',20,2,2900),(2972,'Chivay','01','Chivay, Caylloma','chivay caylloma',0,3,2971),(2973,'Achoma','02','Achoma, Caylloma','achoma caylloma',0,3,2971),(2974,'Cabanaconde','03','Cabanaconde, Caylloma','cabanaconde caylloma',0,3,2971),(2975,'Callalli','04','Callalli, Caylloma','callalli caylloma',0,3,2971),(2976,'Caylloma','05','Caylloma, Caylloma','caylloma caylloma',0,3,2971),(2977,'Coporaque','06','Coporaque, Caylloma','coporaque caylloma',0,3,2971),(2978,'Huambo','07','Huambo, Caylloma','huambo caylloma',0,3,2971),(2979,'Huanca','08','Huanca, Caylloma','huanca caylloma',0,3,2971),(2980,'Ichupampa','09','Ichupampa, Caylloma','ichupampa caylloma',0,3,2971),(2981,'Lari','10','Lari, Caylloma','lari caylloma',0,3,2971),(2982,'Lluta','11','Lluta, Caylloma','lluta caylloma',0,3,2971),(2983,'Maca','12','Maca, Caylloma','maca caylloma',0,3,2971),(2984,'Madrigal','13','Madrigal, Caylloma','madrigal caylloma',0,3,2971),(2985,'San Antonio de Chuca','14','San Antonio de Chuca, Caylloma','san antonio de chuca caylloma',0,3,2971),(2986,'Sibayo','15','Sibayo, Caylloma','sibayo caylloma',0,3,2971),(2987,'Tapay','16','Tapay, Caylloma','tapay caylloma',0,3,2971),(2988,'Tisco','17','Tisco, Caylloma','tisco caylloma',0,3,2971),(2989,'Tuti','18','Tuti, Caylloma','tuti caylloma',0,3,2971),(2990,'Yanque','19','Yanque, Caylloma','yanque caylloma',0,3,2971),(2991,'Majes','20','Majes, Caylloma','majes caylloma',0,3,2971),(2992,'Condesuyos','06','Condesuyos, Arequipa','condesuyos arequipa',8,2,2900),(2993,'Chuquibamba','01','Chuquibamba, Condesuyos','chuquibamba condesuyos',0,3,2992),(2994,'Andaray','02','Andaray, Condesuyos','andaray condesuyos',0,3,2992),(2995,'Cayarani','03','Cayarani, Condesuyos','cayarani condesuyos',0,3,2992),(2996,'Chichas','04','Chichas, Condesuyos','chichas condesuyos',0,3,2992),(2997,'Iray','05','Iray, Condesuyos','iray condesuyos',0,3,2992),(2998,'Rio Grande','06','Rio Grande, Condesuyos','rio grande condesuyos',0,3,2992),(2999,'Salamanca','07','Salamanca, Condesuyos','salamanca condesuyos',0,3,2992),(3000,'Yanaquihua','08','Yanaquihua, Condesuyos','yanaquihua condesuyos',0,3,2992),(3001,'Islay','07','Islay, Arequipa','islay arequipa',6,2,2900),(3002,'Mollendo','01','Mollendo, Islay','mollendo islay',0,3,3001),(3003,'Cocachacra','02','Cocachacra, Islay','cocachacra islay',0,3,3001),(3004,'Dean Valdivia','03','Dean Valdivia, Islay','dean valdivia islay',0,3,3001),(3005,'Islay','04','Islay, Islay','islay islay',0,3,3001),(3006,'Mejia','05','Mejia, Islay','mejia islay',0,3,3001),(3007,'Punta de Bombon','06','Punta de Bombon, Islay','punta de bombon islay',0,3,3001),(3008,'La Union','08','La Union, Arequipa','la union arequipa',11,2,2900),(3009,'Cotahuasi','01','Cotahuasi, La Union','cotahuasi la union',0,3,3008),(3010,'Alca','02','Alca, La Union','alca la union',0,3,3008),(3011,'Charcana','03','Charcana, La Union','charcana la union',0,3,3008),(3012,'Huaynacotas','04','Huaynacotas, La Union','huaynacotas la union',0,3,3008),(3013,'Pampamarca','05','Pampamarca, La Union','pampamarca la union',0,3,3008),(3014,'Puyca','06','Puyca, La Union','puyca la union',0,3,3008),(3015,'Quechualla','07','Quechualla, La Union','quechualla la union',0,3,3008),(3016,'Sayla','08','Sayla, La Union','sayla la union',0,3,3008),(3017,'Tauria','09','Tauria, La Union','tauria la union',0,3,3008),(3018,'Tomepampa','10','Tomepampa, La Union','tomepampa la union',0,3,3008),(3019,'Toro','11','Toro, La Union','toro la union',0,3,3008),(3020,'Ayacucho','05','Ayacucho, Perú','ayacucho perú',11,1,2533),(3021,'Huamanga','01','Huamanga, Ayacucho','huamanga ayacucho',15,2,3020),(3022,'Ayacucho','01','Ayacucho, Huamanga','ayacucho huamanga',0,3,3021),(3023,'Acocro','02','Acocro, Huamanga','acocro huamanga',0,3,3021),(3024,'Acos Vinchos','03','Acos Vinchos, Huamanga','acos vinchos huamanga',0,3,3021),(3025,'Carmen Alto','04','Carmen Alto, Huamanga','carmen alto huamanga',0,3,3021),(3026,'Chiara','05','Chiara, Huamanga','chiara huamanga',0,3,3021),(3027,'Ocros','06','Ocros, Huamanga','ocros huamanga',0,3,3021),(3028,'Pacaycasa','07','Pacaycasa, Huamanga','pacaycasa huamanga',0,3,3021),(3029,'Quinua','08','Quinua, Huamanga','quinua huamanga',0,3,3021),(3030,'San Jose de Ticllas','09','San Jose de Ticllas, Huamanga','san jose de ticllas huamanga',0,3,3021),(3031,'San Juan Bautista','10','San Juan Bautista, Huamanga','san juan bautista huamanga',0,3,3021),(3032,'Santiago de Pischa','11','Santiago de Pischa, Huamanga','santiago de pischa huamanga',0,3,3021),(3033,'Socos','12','Socos, Huamanga','socos huamanga',0,3,3021),(3034,'Tambillo','13','Tambillo, Huamanga','tambillo huamanga',0,3,3021),(3035,'Vinchos','14','Vinchos, Huamanga','vinchos huamanga',0,3,3021),(3036,'Jesús Nazareno','15','Jesús Nazareno, Huamanga','jesús nazareno huamanga',0,3,3021),(3037,'Cangallo','02','Cangallo, Ayacucho','cangallo ayacucho',6,2,3020),(3038,'Cangallo','01','Cangallo, Cangallo','cangallo cangallo',0,3,3037),(3039,'Chuschi','02','Chuschi, Cangallo','chuschi cangallo',0,3,3037),(3040,'Los Morochucos','03','Los Morochucos, Cangallo','los morochucos cangallo',0,3,3037),(3041,'Maria Parado de Bellido','04','Maria Parado de Bellido, Cangallo','maria parado de bellido cangallo',0,3,3037),(3042,'Paras','05','Paras, Cangallo','paras cangallo',0,3,3037),(3043,'Totos','06','Totos, Cangallo','totos cangallo',0,3,3037),(3044,'Huanca Sancos','03','Huanca Sancos, Ayacucho','huanca sancos ayacucho',4,2,3020),(3045,'Sancos','01','Sancos, Huanca Sancos','sancos huanca sancos',0,3,3044),(3046,'Carapo','02','Carapo, Huanca Sancos','carapo huanca sancos',0,3,3044),(3047,'Sacsamarca','03','Sacsamarca, Huanca Sancos','sacsamarca huanca sancos',0,3,3044),(3048,'Santiago de Lucanamarca','04','Santiago de Lucanamarca, Huanca Sancos','santiago de lucanamarca huanca sancos',0,3,3044),(3049,'Huanta','04','Huanta, Ayacucho','huanta ayacucho',8,2,3020),(3050,'Huanta','01','Huanta, Huanta','huanta huanta',0,3,3049),(3051,'Ayahuanco','02','Ayahuanco, Huanta','ayahuanco huanta',0,3,3049),(3052,'Huamanguilla','03','Huamanguilla, Huanta','huamanguilla huanta',0,3,3049),(3053,'Iguain','04','Iguain, Huanta','iguain huanta',0,3,3049),(3054,'Luricocha','05','Luricocha, Huanta','luricocha huanta',0,3,3049),(3055,'Santillana','06','Santillana, Huanta','santillana huanta',0,3,3049),(3056,'Sivia','07','Sivia, Huanta','sivia huanta',0,3,3049),(3057,'Llochegua','08','Llochegua, Huanta','llochegua huanta',0,3,3049),(3058,'La Mar','05','La Mar, Ayacucho','la mar ayacucho',8,2,3020),(3059,'San Miguel','01','San Miguel, La Mar','san miguel la mar',0,3,3058),(3060,'Anco','02','Anco, La Mar','anco la mar',0,3,3058),(3061,'Ayna','03','Ayna, La Mar','ayna la mar',0,3,3058),(3062,'Chilcas','04','Chilcas, La Mar','chilcas la mar',0,3,3058),(3063,'Chungui','05','Chungui, La Mar','chungui la mar',0,3,3058),(3064,'Luis Carranza','06','Luis Carranza, La Mar','luis carranza la mar',0,3,3058),(3065,'Santa Rosa','07','Santa Rosa, La Mar','santa rosa la mar',0,3,3058),(3066,'Tambo','08','Tambo, La Mar','tambo la mar',0,3,3058),(3067,'Lucanas','06','Lucanas, Ayacucho','lucanas ayacucho',21,2,3020),(3068,'Puquio','01','Puquio, Lucanas','puquio lucanas',0,3,3067),(3069,'Aucara','02','Aucara, Lucanas','aucara lucanas',0,3,3067),(3070,'Cabana','03','Cabana, Lucanas','cabana lucanas',0,3,3067),(3071,'Carmen Salcedo','04','Carmen Salcedo, Lucanas','carmen salcedo lucanas',0,3,3067),(3072,'Chaviqa','05','Chaviqa, Lucanas','chaviqa lucanas',0,3,3067),(3073,'Chipao','06','Chipao, Lucanas','chipao lucanas',0,3,3067),(3074,'Huac-Huas','07','Huac-Huas, Lucanas','huac-huas lucanas',0,3,3067),(3075,'Laramate','08','Laramate, Lucanas','laramate lucanas',0,3,3067),(3076,'Leoncio Prado','09','Leoncio Prado, Lucanas','leoncio prado lucanas',0,3,3067),(3077,'Llauta','10','Llauta, Lucanas','llauta lucanas',0,3,3067),(3078,'Lucanas','11','Lucanas, Lucanas','lucanas lucanas',0,3,3067),(3079,'Ocaqa','12','Ocaqa, Lucanas','ocaqa lucanas',0,3,3067),(3080,'Otoca','13','Otoca, Lucanas','otoca lucanas',0,3,3067),(3081,'Saisa','14','Saisa, Lucanas','saisa lucanas',0,3,3067),(3082,'San Cristobal','15','San Cristobal, Lucanas','san cristobal lucanas',0,3,3067),(3083,'San Juan','16','San Juan, Lucanas','san juan lucanas',0,3,3067),(3084,'San Pedro','17','San Pedro, Lucanas','san pedro lucanas',0,3,3067),(3085,'San Pedro de Palco','18','San Pedro de Palco, Lucanas','san pedro de palco lucanas',0,3,3067),(3086,'Sancos','19','Sancos, Lucanas','sancos lucanas',0,3,3067),(3087,'Santa Ana de Huaycahuacho','20','Santa Ana de Huaycahuacho, Lucanas','santa ana de huaycahuacho lucanas',0,3,3067),(3088,'Santa Lucia','21','Santa Lucia, Lucanas','santa lucia lucanas',0,3,3067),(3089,'Parinacochas','07','Parinacochas, Ayacucho','parinacochas ayacucho',8,2,3020),(3090,'Coracora','01','Coracora, Parinacochas','coracora parinacochas',0,3,3089),(3091,'Chumpi','02','Chumpi, Parinacochas','chumpi parinacochas',0,3,3089),(3092,'Coronel Castaqeda','03','Coronel Castaqeda, Parinacochas','coronel castaqeda parinacochas',0,3,3089),(3093,'Pacapausa','04','Pacapausa, Parinacochas','pacapausa parinacochas',0,3,3089),(3094,'Pullo','05','Pullo, Parinacochas','pullo parinacochas',0,3,3089),(3095,'Puyusca','06','Puyusca, Parinacochas','puyusca parinacochas',0,3,3089),(3096,'San Francisco de Ravacayco','07','San Francisco de Ravacayco, Parinacochas','san francisco de ravacayco parinacochas',0,3,3089),(3097,'Upahuacho','08','Upahuacho, Parinacochas','upahuacho parinacochas',0,3,3089),(3098,'Paucar del Sara Sara','08','Paucar del Sara Sara, Ayacucho','paucar del sara sara ayacucho',10,2,3020),(3099,'Pausa','01','Pausa, Paucar del Sara Sara','pausa paucar del sara sara',0,3,3098),(3100,'Colta','02','Colta, Paucar del Sara Sara','colta paucar del sara sara',0,3,3098),(3101,'Corculla','03','Corculla, Paucar del Sara Sara','corculla paucar del sara sara',0,3,3098),(3102,'Lampa','04','Lampa, Paucar del Sara Sara','lampa paucar del sara sara',0,3,3098),(3103,'Marcabamba','05','Marcabamba, Paucar del Sara Sara','marcabamba paucar del sara sara',0,3,3098),(3104,'Oyolo','06','Oyolo, Paucar del Sara Sara','oyolo paucar del sara sara',0,3,3098),(3105,'Pararca','07','Pararca, Paucar del Sara Sara','pararca paucar del sara sara',0,3,3098),(3106,'San Javier de Alpabamba','08','San Javier de Alpabamba, Paucar del Sara Sara','san javier de alpabamba paucar del sara sara',0,3,3098),(3107,'San Jose de Ushua','09','San Jose de Ushua, Paucar del Sara Sara','san jose de ushua paucar del sara sara',0,3,3098),(3108,'Sara Sara','10','Sara Sara, Paucar del Sara Sara','sara sara paucar del sara sara',0,3,3098),(3109,'Sucre','09','Sucre, Ayacucho','sucre ayacucho',11,2,3020),(3110,'Querobamba','01','Querobamba, Sucre','querobamba sucre',0,3,3109),(3111,'Belen','02','Belen, Sucre','belen sucre',0,3,3109),(3112,'Chalcos','03','Chalcos, Sucre','chalcos sucre',0,3,3109),(3113,'Chilcayoc','04','Chilcayoc, Sucre','chilcayoc sucre',0,3,3109),(3114,'Huacaqa','05','Huacaqa, Sucre','huacaqa sucre',0,3,3109),(3115,'Morcolla','06','Morcolla, Sucre','morcolla sucre',0,3,3109),(3116,'Paico','07','Paico, Sucre','paico sucre',0,3,3109),(3117,'San Pedro de Larcay','08','San Pedro de Larcay, Sucre','san pedro de larcay sucre',0,3,3109),(3118,'San Salvador de Quije','09','San Salvador de Quije, Sucre','san salvador de quije sucre',0,3,3109),(3119,'Santiago de Paucaray','10','Santiago de Paucaray, Sucre','santiago de paucaray sucre',0,3,3109),(3120,'Soras','11','Soras, Sucre','soras sucre',0,3,3109),(3121,'Victor Fajardo','10','Victor Fajardo, Ayacucho','victor fajardo ayacucho',12,2,3020),(3122,'Huancapi','01','Huancapi, Victor Fajardo','huancapi victor fajardo',0,3,3121),(3123,'Alcamenca','02','Alcamenca, Victor Fajardo','alcamenca victor fajardo',0,3,3121),(3124,'Apongo','03','Apongo, Victor Fajardo','apongo victor fajardo',0,3,3121),(3125,'Asquipata','04','Asquipata, Victor Fajardo','asquipata victor fajardo',0,3,3121),(3126,'Canaria','05','Canaria, Victor Fajardo','canaria victor fajardo',0,3,3121),(3127,'Cayara','06','Cayara, Victor Fajardo','cayara victor fajardo',0,3,3121),(3128,'Colca','07','Colca, Victor Fajardo','colca victor fajardo',0,3,3121),(3129,'Huamanquiquia','08','Huamanquiquia, Victor Fajardo','huamanquiquia victor fajardo',0,3,3121),(3130,'Huancaraylla','09','Huancaraylla, Victor Fajardo','huancaraylla victor fajardo',0,3,3121),(3131,'Huaya','10','Huaya, Victor Fajardo','huaya victor fajardo',0,3,3121),(3132,'Sarhua','11','Sarhua, Victor Fajardo','sarhua victor fajardo',0,3,3121),(3133,'Vilcanchos','12','Vilcanchos, Victor Fajardo','vilcanchos victor fajardo',0,3,3121),(3134,'Vilcas Huaman','11','Vilcas Huaman, Ayacucho','vilcas huaman ayacucho',8,2,3020),(3135,'Vilcas Huaman','01','Vilcas Huaman, Vilcas Huaman','vilcas huaman vilcas huaman',0,3,3134),(3136,'Accomarca','02','Accomarca, Vilcas Huaman','accomarca vilcas huaman',0,3,3134),(3137,'Carhuanca','03','Carhuanca, Vilcas Huaman','carhuanca vilcas huaman',0,3,3134),(3138,'Concepcion','04','Concepcion, Vilcas Huaman','concepcion vilcas huaman',0,3,3134),(3139,'Huambalpa','05','Huambalpa, Vilcas Huaman','huambalpa vilcas huaman',0,3,3134),(3140,'Independencia','06','Independencia, Vilcas Huaman','independencia vilcas huaman',0,3,3134),(3141,'Saurama','07','Saurama, Vilcas Huaman','saurama vilcas huaman',0,3,3134),(3142,'Vischongo','08','Vischongo, Vilcas Huaman','vischongo vilcas huaman',0,3,3134),(3143,'Cajamarca','06','Cajamarca, Perú','cajamarca perú',13,1,2533),(3144,'Cajamarca','01','Cajamarca, Cajamarca, Cajamarca','cajamarca cajamarca cajamarca',12,2,3143),(3145,'Cajamarca','01','Cajamarca, Cajamarca','cajamarca cajamarca',0,3,3144),(3146,'Asuncion','02','Asuncion, Cajamarca','asuncion cajamarca',0,3,3144),(3147,'Chetilla','03','Chetilla, Cajamarca','chetilla cajamarca',0,3,3144),(3148,'Cospan','04','Cospan, Cajamarca','cospan cajamarca',0,3,3144),(3149,'Encaqada','05','Encaqada, Cajamarca','encaqada cajamarca',0,3,3144),(3150,'Jesus','06','Jesus, Cajamarca','jesus cajamarca',0,3,3144),(3151,'Llacanora','07','Llacanora, Cajamarca','llacanora cajamarca',0,3,3144),(3152,'Los Baqos del Inca','08','Los Baqos del Inca, Cajamarca','los baqos del inca cajamarca',0,3,3144),(3153,'Magdalena','09','Magdalena, Cajamarca','magdalena cajamarca',0,3,3144),(3154,'Matara','10','Matara, Cajamarca','matara cajamarca',0,3,3144),(3155,'Namora','11','Namora, Cajamarca','namora cajamarca',0,3,3144),(3156,'San Juan','12','San Juan, Cajamarca','san juan cajamarca',0,3,3144),(3157,'Cajabamba','02','Cajabamba, Cajamarca','cajabamba cajamarca',4,2,3143),(3158,'Cajabamba','01','Cajabamba, Cajabamba','cajabamba cajabamba',0,3,3157),(3159,'Cachachi','02','Cachachi, Cajabamba','cachachi cajabamba',0,3,3157),(3160,'Condebamba','03','Condebamba, Cajabamba','condebamba cajabamba',0,3,3157),(3161,'Sitacocha','04','Sitacocha, Cajabamba','sitacocha cajabamba',0,3,3157),(3162,'Celendin','03','Celendin, Cajamarca','celendin cajamarca',12,2,3143),(3163,'Celendin','01','Celendin, Celendin','celendin celendin',0,3,3162),(3164,'Chumuch','02','Chumuch, Celendin','chumuch celendin',0,3,3162),(3165,'Cortegana','03','Cortegana, Celendin','cortegana celendin',0,3,3162),(3166,'Huasmin','04','Huasmin, Celendin','huasmin celendin',0,3,3162),(3167,'Jorge Chavez','05','Jorge Chavez, Celendin','jorge chavez celendin',0,3,3162),(3168,'Jose Galvez','06','Jose Galvez, Celendin','jose galvez celendin',0,3,3162),(3169,'Miguel Iglesias','07','Miguel Iglesias, Celendin','miguel iglesias celendin',0,3,3162),(3170,'Oxamarca','08','Oxamarca, Celendin','oxamarca celendin',0,3,3162),(3171,'Sorochuco','09','Sorochuco, Celendin','sorochuco celendin',0,3,3162),(3172,'Sucre','10','Sucre, Celendin','sucre celendin',0,3,3162),(3173,'Utco','11','Utco, Celendin','utco celendin',0,3,3162),(3174,'La Libertad de Pallan','12','La Libertad de Pallan, Celendin','la libertad de pallan celendin',0,3,3162),(3175,'Chota','04','Chota, Cajamarca','chota cajamarca',19,2,3143),(3176,'Chota','01','Chota, Chota','chota chota',0,3,3175),(3177,'Anguia','02','Anguia, Chota','anguia chota',0,3,3175),(3178,'Chadin','03','Chadin, Chota','chadin chota',0,3,3175),(3179,'Chiguirip','04','Chiguirip, Chota','chiguirip chota',0,3,3175),(3180,'Chimban','05','Chimban, Chota','chimban chota',0,3,3175),(3181,'Choropampa','06','Choropampa, Chota','choropampa chota',0,3,3175),(3182,'Cochabamba','07','Cochabamba, Chota','cochabamba chota',0,3,3175),(3183,'Conchan','08','Conchan, Chota','conchan chota',0,3,3175),(3184,'Huambos','09','Huambos, Chota','huambos chota',0,3,3175),(3185,'Lajas','10','Lajas, Chota','lajas chota',0,3,3175),(3186,'Llama','11','Llama, Chota','llama chota',0,3,3175),(3187,'Miracosta','12','Miracosta, Chota','miracosta chota',0,3,3175),(3188,'Paccha','13','Paccha, Chota','paccha chota',0,3,3175),(3189,'Pion','14','Pion, Chota','pion chota',0,3,3175),(3190,'Querocoto','15','Querocoto, Chota','querocoto chota',0,3,3175),(3191,'San Juan de Licupis','16','San Juan de Licupis, Chota','san juan de licupis chota',0,3,3175),(3192,'Tacabamba','17','Tacabamba, Chota','tacabamba chota',0,3,3175),(3193,'Tocmoche','18','Tocmoche, Chota','tocmoche chota',0,3,3175),(3194,'Chalamarca','19','Chalamarca, Chota','chalamarca chota',0,3,3175),(3195,'Contumaza','05','Contumaza, Cajamarca','contumaza cajamarca',8,2,3143),(3196,'Contumaza','01','Contumaza, Contumaza','contumaza contumaza',0,3,3195),(3197,'Chilete','02','Chilete, Contumaza','chilete contumaza',0,3,3195),(3198,'Cupisnique','03','Cupisnique, Contumaza','cupisnique contumaza',0,3,3195),(3199,'Guzmango','04','Guzmango, Contumaza','guzmango contumaza',0,3,3195),(3200,'San Benito','05','San Benito, Contumaza','san benito contumaza',0,3,3195),(3201,'Santa Cruz de Toled','06','Santa Cruz de Toled, Contumaza','santa cruz de toled contumaza',0,3,3195),(3202,'Tantarica','07','Tantarica, Contumaza','tantarica contumaza',0,3,3195),(3203,'Yonan','08','Yonan, Contumaza','yonan contumaza',0,3,3195),(3204,'Cutervo','06','Cutervo, Cajamarca','cutervo cajamarca',15,2,3143),(3205,'Cutervo','01','Cutervo, Cutervo','cutervo cutervo',0,3,3204),(3206,'Callayuc','02','Callayuc, Cutervo','callayuc cutervo',0,3,3204),(3207,'Choros','03','Choros, Cutervo','choros cutervo',0,3,3204),(3208,'Cujillo','04','Cujillo, Cutervo','cujillo cutervo',0,3,3204),(3209,'La Ramada','05','La Ramada, Cutervo','la ramada cutervo',0,3,3204),(3210,'Pimpingos','06','Pimpingos, Cutervo','pimpingos cutervo',0,3,3204),(3211,'Querocotillo','07','Querocotillo, Cutervo','querocotillo cutervo',0,3,3204),(3212,'San Andres de Cutervo','08','San Andres de Cutervo, Cutervo','san andres de cutervo cutervo',0,3,3204),(3213,'San Juan de Cutervo','09','San Juan de Cutervo, Cutervo','san juan de cutervo cutervo',0,3,3204),(3214,'San Luis de Lucma','10','San Luis de Lucma, Cutervo','san luis de lucma cutervo',0,3,3204),(3215,'Santa Cruz','11','Santa Cruz, Cutervo','santa cruz cutervo',0,3,3204),(3216,'Santo Domingo de la Capilla','12','Santo Domingo de la Capilla, Cutervo','santo domingo de la capilla cutervo',0,3,3204),(3217,'Santo Tomas','13','Santo Tomas, Cutervo','santo tomas cutervo',0,3,3204),(3218,'Socota','14','Socota, Cutervo','socota cutervo',0,3,3204),(3219,'Toribio Casanova','15','Toribio Casanova, Cutervo','toribio casanova cutervo',0,3,3204),(3220,'Hualgayoc','07','Hualgayoc, Cajamarca','hualgayoc cajamarca',3,2,3143),(3221,'Bambamarca','01','Bambamarca, Hualgayoc','bambamarca hualgayoc',0,3,3220),(3222,'Chugur','02','Chugur, Hualgayoc','chugur hualgayoc',0,3,3220),(3223,'Hualgayoc','03','Hualgayoc, Hualgayoc','hualgayoc hualgayoc',0,3,3220),(3224,'Jaen','08','Jaen, Cajamarca','jaen cajamarca',12,2,3143),(3225,'Jaen','01','Jaen, Jaen','jaen jaen',0,3,3224),(3226,'Bellavista','02','Bellavista, Jaen','bellavista jaen',0,3,3224),(3227,'Chontali','03','Chontali, Jaen','chontali jaen',0,3,3224),(3228,'Colasay','04','Colasay, Jaen','colasay jaen',0,3,3224),(3229,'Huabal','05','Huabal, Jaen','huabal jaen',0,3,3224),(3230,'Las Pirias','06','Las Pirias, Jaen','las pirias jaen',0,3,3224),(3231,'Pomahuaca','07','Pomahuaca, Jaen','pomahuaca jaen',0,3,3224),(3232,'Pucara','08','Pucara, Jaen','pucara jaen',0,3,3224),(3233,'Sallique','09','Sallique, Jaen','sallique jaen',0,3,3224),(3234,'San Felipe','10','San Felipe, Jaen','san felipe jaen',0,3,3224),(3235,'San Jose del Alto','11','San Jose del Alto, Jaen','san jose del alto jaen',0,3,3224),(3236,'Santa Rosa','12','Santa Rosa, Jaen','santa rosa jaen',0,3,3224),(3237,'San Ignacio','09','San Ignacio, Cajamarca','san ignacio cajamarca',7,2,3143),(3238,'San Ignacio','01','San Ignacio, San Ignacio','san ignacio san ignacio',0,3,3237),(3239,'Chirinos','02','Chirinos, San Ignacio','chirinos san ignacio',0,3,3237),(3240,'Huarango','03','Huarango, San Ignacio','huarango san ignacio',0,3,3237),(3241,'La Coipa','04','La Coipa, San Ignacio','la coipa san ignacio',0,3,3237),(3242,'Namballe','05','Namballe, San Ignacio','namballe san ignacio',0,3,3237),(3243,'San Jose de Lourdes','06','San Jose de Lourdes, San Ignacio','san jose de lourdes san ignacio',0,3,3237),(3244,'Tabaconas','07','Tabaconas, San Ignacio','tabaconas san ignacio',0,3,3237),(3245,'San Marcos','10','San Marcos, Cajamarca','san marcos cajamarca',7,2,3143),(3246,'Pedro Galvez','01','Pedro Galvez, San Marcos','pedro galvez san marcos',0,3,3245),(3247,'Chancay','02','Chancay, San Marcos','chancay san marcos',0,3,3245),(3248,'Eduardo Villanueva','03','Eduardo Villanueva, San Marcos','eduardo villanueva san marcos',0,3,3245),(3249,'Gregorio Pita','04','Gregorio Pita, San Marcos','gregorio pita san marcos',0,3,3245),(3250,'Ichocan','05','Ichocan, San Marcos','ichocan san marcos',0,3,3245),(3251,'Jose Manuel Quiroz','06','Jose Manuel Quiroz, San Marcos','jose manuel quiroz san marcos',0,3,3245),(3252,'Jose Sabogal','07','Jose Sabogal, San Marcos','jose sabogal san marcos',0,3,3245),(3253,'San Miguel','11','San Miguel, Cajamarca','san miguel cajamarca',13,2,3143),(3254,'San Miguel','01','San Miguel, San Miguel','san miguel san miguel',0,3,3253),(3255,'Bolivar','02','Bolivar, San Miguel','bolivar san miguel',0,3,3253),(3256,'Calquis','03','Calquis, San Miguel','calquis san miguel',0,3,3253),(3257,'Catilluc','04','Catilluc, San Miguel','catilluc san miguel',0,3,3253),(3258,'El Prado','05','El Prado, San Miguel','el prado san miguel',0,3,3253),(3259,'La Florida','06','La Florida, San Miguel','la florida san miguel',0,3,3253),(3260,'Llapa','07','Llapa, San Miguel','llapa san miguel',0,3,3253),(3261,'Nanchoc','08','Nanchoc, San Miguel','nanchoc san miguel',0,3,3253),(3262,'Niepos','09','Niepos, San Miguel','niepos san miguel',0,3,3253),(3263,'San Gregorio','10','San Gregorio, San Miguel','san gregorio san miguel',0,3,3253),(3264,'San Silvestre de Cochan','11','San Silvestre de Cochan, San Miguel','san silvestre de cochan san miguel',0,3,3253),(3265,'Tongod','12','Tongod, San Miguel','tongod san miguel',0,3,3253),(3266,'Union Agua Blanca','13','Union Agua Blanca, San Miguel','union agua blanca san miguel',0,3,3253),(3267,'San Pablo','12','San Pablo, Cajamarca','san pablo cajamarca',4,2,3143),(3268,'San Pablo','01','San Pablo, San Pablo','san pablo san pablo',0,3,3267),(3269,'San Bernardino','02','San Bernardino, San Pablo','san bernardino san pablo',0,3,3267),(3270,'San Luis','03','San Luis, San Pablo','san luis san pablo',0,3,3267),(3271,'Tumbaden','04','Tumbaden, San Pablo','tumbaden san pablo',0,3,3267),(3272,'Santa Cruz','13','Santa Cruz, Cajamarca','santa cruz cajamarca',11,2,3143),(3273,'Santa Cruz','01','Santa Cruz, Santa Cruz','santa cruz santa cruz',0,3,3272),(3274,'Andabamba','02','Andabamba, Santa Cruz','andabamba santa cruz',0,3,3272),(3275,'Catache','03','Catache, Santa Cruz','catache santa cruz',0,3,3272),(3276,'Chancaybaqos','04','Chancaybaqos, Santa Cruz','chancaybaqos santa cruz',0,3,3272),(3277,'La Esperanza','05','La Esperanza, Santa Cruz','la esperanza santa cruz',0,3,3272),(3278,'Ninabamba','06','Ninabamba, Santa Cruz','ninabamba santa cruz',0,3,3272),(3279,'Pulan','07','Pulan, Santa Cruz','pulan santa cruz',0,3,3272),(3280,'Saucepampa','08','Saucepampa, Santa Cruz','saucepampa santa cruz',0,3,3272),(3281,'Sexi','09','Sexi, Santa Cruz','sexi santa cruz',0,3,3272),(3282,'Uticyacu','10','Uticyacu, Santa Cruz','uticyacu santa cruz',0,3,3272),(3283,'Yauyucan','11','Yauyucan, Santa Cruz','yauyucan santa cruz',0,3,3272),(3285,'Callao','01','Callao, Callao, Lima','callao callao lima',6,2,3926),(3286,'Callao','01','Callao, Callao','callao callao',0,3,3285),(3287,'Bellavista','02','Bellavista, Callao','bellavista callao',0,3,3285),(3288,'Carmen de la Legua Reynoso','03','Carmen de la Legua Reynoso, Callao','carmen de la legua reynoso callao',0,3,3285),(3289,'La Perla','04','La Perla, Callao','la perla callao',0,3,3285),(3290,'La Punta','05','La Punta, Callao','la punta callao',0,3,3285),(3291,'Ventanilla','06','Ventanilla, Callao','ventanilla callao',0,3,3285),(3292,'Cusco','08','Cusco, Perú','cusco perú',13,1,2533),(3293,'Cusco','01','Cusco, Cusco, Cusco','cusco cusco cusco',8,2,3292),(3294,'Cusco','01','Cusco, Cusco','cusco cusco',0,3,3293),(3295,'Ccorca','02','Ccorca, Cusco','ccorca cusco',0,3,3293),(3296,'Poroy','03','Poroy, Cusco','poroy cusco',0,3,3293),(3297,'San Jeronimo','04','San Jeronimo, Cusco','san jeronimo cusco',0,3,3293),(3298,'San Sebastian','05','San Sebastian, Cusco','san sebastian cusco',0,3,3293),(3299,'Santiago','06','Santiago, Cusco','santiago cusco',0,3,3293),(3300,'Saylla','07','Saylla, Cusco','saylla cusco',0,3,3293),(3301,'Wanchaq','08','Wanchaq, Cusco','wanchaq cusco',0,3,3293),(3302,'Acomayo','02','Acomayo, Cusco','acomayo cusco',7,2,3292),(3303,'Acomayo','01','Acomayo, Acomayo','acomayo acomayo',0,3,3302),(3304,'Acopia','02','Acopia, Acomayo','acopia acomayo',0,3,3302),(3305,'Acos','03','Acos, Acomayo','acos acomayo',0,3,3302),(3306,'Mosoc Llacta','04','Mosoc Llacta, Acomayo','mosoc llacta acomayo',0,3,3302),(3307,'Pomacanchi','05','Pomacanchi, Acomayo','pomacanchi acomayo',0,3,3302),(3308,'Rondocan','06','Rondocan, Acomayo','rondocan acomayo',0,3,3302),(3309,'Sangarara','07','Sangarara, Acomayo','sangarara acomayo',0,3,3302),(3310,'Anta','03','Anta, Cusco','anta cusco',9,2,3292),(3311,'Anta','01','Anta, Anta','anta anta',0,3,3310),(3312,'Ancahuasi','02','Ancahuasi, Anta','ancahuasi anta',0,3,3310),(3313,'Cachimayo','03','Cachimayo, Anta','cachimayo anta',0,3,3310),(3314,'Chinchaypujio','04','Chinchaypujio, Anta','chinchaypujio anta',0,3,3310),(3315,'Huarocondo','05','Huarocondo, Anta','huarocondo anta',0,3,3310),(3316,'Limatambo','06','Limatambo, Anta','limatambo anta',0,3,3310),(3317,'Mollepata','07','Mollepata, Anta','mollepata anta',0,3,3310),(3318,'Pucyura','08','Pucyura, Anta','pucyura anta',0,3,3310),(3319,'Zurite','09','Zurite, Anta','zurite anta',0,3,3310),(3320,'Calca','04','Calca, Cusco','calca cusco',8,2,3292),(3321,'Calca','01','Calca, Calca','calca calca',0,3,3320),(3322,'Coya','02','Coya, Calca','coya calca',0,3,3320),(3323,'Lamay','03','Lamay, Calca','lamay calca',0,3,3320),(3324,'Lares','04','Lares, Calca','lares calca',0,3,3320),(3325,'Pisac','05','Pisac, Calca','pisac calca',0,3,3320),(3326,'San Salvador','06','San Salvador, Calca','san salvador calca',0,3,3320),(3327,'Taray','07','Taray, Calca','taray calca',0,3,3320),(3328,'Yanatile','08','Yanatile, Calca','yanatile calca',0,3,3320),(3329,'Canas','05','Canas, Cusco','canas cusco',8,2,3292),(3330,'Yanaoca','01','Yanaoca, Canas','yanaoca canas',0,3,3329),(3331,'Checca','02','Checca, Canas','checca canas',0,3,3329),(3332,'Kunturkanki','03','Kunturkanki, Canas','kunturkanki canas',0,3,3329),(3333,'Langui','04','Langui, Canas','langui canas',0,3,3329),(3334,'Layo','05','Layo, Canas','layo canas',0,3,3329),(3335,'Pampamarca','06','Pampamarca, Canas','pampamarca canas',0,3,3329),(3336,'Quehue','07','Quehue, Canas','quehue canas',0,3,3329),(3337,'Tupac Amaru','08','Tupac Amaru, Canas','tupac amaru canas',0,3,3329),(3338,'Canchis','06','Canchis, Cusco','canchis cusco',8,2,3292),(3339,'Sicuani','01','Sicuani, Canchis','sicuani canchis',0,3,3338),(3340,'Checacupe','02','Checacupe, Canchis','checacupe canchis',0,3,3338),(3341,'Combapata','03','Combapata, Canchis','combapata canchis',0,3,3338),(3342,'Marangani','04','Marangani, Canchis','marangani canchis',0,3,3338),(3343,'Pitumarca','05','Pitumarca, Canchis','pitumarca canchis',0,3,3338),(3344,'San Pablo','06','San Pablo, Canchis','san pablo canchis',0,3,3338),(3345,'San Pedro','07','San Pedro, Canchis','san pedro canchis',0,3,3338),(3346,'Tinta','08','Tinta, Canchis','tinta canchis',0,3,3338),(3347,'Chumbivilcas','07','Chumbivilcas, Cusco','chumbivilcas cusco',8,2,3292),(3348,'Santo Tomas','01','Santo Tomas, Chumbivilcas','santo tomas chumbivilcas',0,3,3347),(3349,'Capacmarca','02','Capacmarca, Chumbivilcas','capacmarca chumbivilcas',0,3,3347),(3350,'Chamaca','03','Chamaca, Chumbivilcas','chamaca chumbivilcas',0,3,3347),(3351,'Colquemarca','04','Colquemarca, Chumbivilcas','colquemarca chumbivilcas',0,3,3347),(3352,'Livitaca','05','Livitaca, Chumbivilcas','livitaca chumbivilcas',0,3,3347),(3353,'Llusco','06','Llusco, Chumbivilcas','llusco chumbivilcas',0,3,3347),(3354,'Quiqota','07','Quiqota, Chumbivilcas','quiqota chumbivilcas',0,3,3347),(3355,'Velille','08','Velille, Chumbivilcas','velille chumbivilcas',0,3,3347),(3356,'Espinar','08','Espinar, Cusco','espinar cusco',8,2,3292),(3357,'Espinar','01','Espinar, Espinar','espinar espinar',0,3,3356),(3358,'Condoroma','02','Condoroma, Espinar','condoroma espinar',0,3,3356),(3359,'Coporaque','03','Coporaque, Espinar','coporaque espinar',0,3,3356),(3360,'Ocoruro','04','Ocoruro, Espinar','ocoruro espinar',0,3,3356),(3361,'Pallpata','05','Pallpata, Espinar','pallpata espinar',0,3,3356),(3362,'Pichigua','06','Pichigua, Espinar','pichigua espinar',0,3,3356),(3363,'Suyckutambo','07','Suyckutambo, Espinar','suyckutambo espinar',0,3,3356),(3364,'Alto Pichigua','08','Alto Pichigua, Espinar','alto pichigua espinar',0,3,3356),(3365,'La Convencion','09','La Convencion, Cusco','la convencion cusco',10,2,3292),(3366,'Santa Ana','01','Santa Ana, La Convencion','santa ana la convencion',0,3,3365),(3367,'Echarate','02','Echarate, La Convencion','echarate la convencion',0,3,3365),(3368,'Huayopata','03','Huayopata, La Convencion','huayopata la convencion',0,3,3365),(3369,'Maranura','04','Maranura, La Convencion','maranura la convencion',0,3,3365),(3370,'Ocobamba','05','Ocobamba, La Convencion','ocobamba la convencion',0,3,3365),(3371,'Quellouno','06','Quellouno, La Convencion','quellouno la convencion',0,3,3365),(3372,'Quimbiri','07','Quimbiri, La Convencion','quimbiri la convencion',0,3,3365),(3373,'Santa Teresa','08','Santa Teresa, La Convencion','santa teresa la convencion',0,3,3365),(3374,'Vilcabamba','09','Vilcabamba, La Convencion','vilcabamba la convencion',0,3,3365),(3375,'Pichari','10','Pichari, La Convencion','pichari la convencion',0,3,3365),(3376,'Paruro','10','Paruro, Cusco','paruro cusco',9,2,3292),(3377,'Paruro','01','Paruro, Paruro','paruro paruro',0,3,3376),(3378,'Accha','02','Accha, Paruro','accha paruro',0,3,3376),(3379,'Ccapi','03','Ccapi, Paruro','ccapi paruro',0,3,3376),(3380,'Colcha','04','Colcha, Paruro','colcha paruro',0,3,3376),(3381,'Huanoquite','05','Huanoquite, Paruro','huanoquite paruro',0,3,3376),(3382,'Omacha','06','Omacha, Paruro','omacha paruro',0,3,3376),(3383,'Paccaritambo','07','Paccaritambo, Paruro','paccaritambo paruro',0,3,3376),(3384,'Pillpinto','08','Pillpinto, Paruro','pillpinto paruro',0,3,3376),(3385,'Yaurisque','09','Yaurisque, Paruro','yaurisque paruro',0,3,3376),(3386,'Paucartambo','11','Paucartambo, Cusco','paucartambo cusco',6,2,3292),(3387,'Paucartambo','01','Paucartambo, Paucartambo','paucartambo paucartambo',0,3,3386),(3388,'Caicay','02','Caicay, Paucartambo','caicay paucartambo',0,3,3386),(3389,'Challabamba','03','Challabamba, Paucartambo','challabamba paucartambo',0,3,3386),(3390,'Colquepata','04','Colquepata, Paucartambo','colquepata paucartambo',0,3,3386),(3391,'Huancarani','05','Huancarani, Paucartambo','huancarani paucartambo',0,3,3386),(3392,'Kosqipata','06','Kosqipata, Paucartambo','kosqipata paucartambo',0,3,3386),(3393,'Quispicanchi','12','Quispicanchi, Cusco','quispicanchi cusco',12,2,3292),(3394,'Urcos','01','Urcos, Quispicanchi','urcos quispicanchi',0,3,3393),(3395,'Andahuaylillas','02','Andahuaylillas, Quispicanchi','andahuaylillas quispicanchi',0,3,3393),(3396,'Camanti','03','Camanti, Quispicanchi','camanti quispicanchi',0,3,3393),(3397,'Ccarhuayo','04','Ccarhuayo, Quispicanchi','ccarhuayo quispicanchi',0,3,3393),(3398,'Ccatca','05','Ccatca, Quispicanchi','ccatca quispicanchi',0,3,3393),(3399,'Cusipata','06','Cusipata, Quispicanchi','cusipata quispicanchi',0,3,3393),(3400,'Huaro','07','Huaro, Quispicanchi','huaro quispicanchi',0,3,3393),(3401,'Lucre','08','Lucre, Quispicanchi','lucre quispicanchi',0,3,3393),(3402,'Marcapata','09','Marcapata, Quispicanchi','marcapata quispicanchi',0,3,3393),(3403,'Ocongate','10','Ocongate, Quispicanchi','ocongate quispicanchi',0,3,3393),(3404,'Oropesa','11','Oropesa, Quispicanchi','oropesa quispicanchi',0,3,3393),(3405,'Quiquijana','12','Quiquijana, Quispicanchi','quiquijana quispicanchi',0,3,3393),(3406,'Urubamba','13','Urubamba, Cusco','urubamba cusco',7,2,3292),(3407,'Urubamba','01','Urubamba, Urubamba','urubamba urubamba',0,3,3406),(3408,'Chinchero','02','Chinchero, Urubamba','chinchero urubamba',0,3,3406),(3409,'Huayllabamba','03','Huayllabamba, Urubamba','huayllabamba urubamba',0,3,3406),(3410,'Machupicchu','04','Machupicchu, Urubamba','machupicchu urubamba',0,3,3406),(3411,'Maras','05','Maras, Urubamba','maras urubamba',0,3,3406),(3412,'Ollantaytambo','06','Ollantaytambo, Urubamba','ollantaytambo urubamba',0,3,3406),(3413,'Yucay','07','Yucay, Urubamba','yucay urubamba',0,3,3406),(3414,'Huancavelica','09','Huancavelica, Perú','huancavelica perú',7,1,2533),(3415,'Huancavelica','01','Huancavelica, Huancavelica, Huancavelica','huancavelica huancavelica huancavelica',19,2,3414),(3416,'Huancavelica','01','Huancavelica, Huancavelica','huancavelica huancavelica',0,3,3415),(3417,'Acobambilla','02','Acobambilla, Huancavelica','acobambilla huancavelica',0,3,3415),(3418,'Acoria','03','Acoria, Huancavelica','acoria huancavelica',0,3,3415),(3419,'Conayca','04','Conayca, Huancavelica','conayca huancavelica',0,3,3415),(3420,'Cuenca','05','Cuenca, Huancavelica','cuenca huancavelica',0,3,3415),(3421,'Huachocolpa','06','Huachocolpa, Huancavelica','huachocolpa huancavelica',0,3,3415),(3422,'Huayllahuara','07','Huayllahuara, Huancavelica','huayllahuara huancavelica',0,3,3415),(3423,'Izcuchaca','08','Izcuchaca, Huancavelica','izcuchaca huancavelica',0,3,3415),(3424,'Laria','09','Laria, Huancavelica','laria huancavelica',0,3,3415),(3425,'Manta','10','Manta, Huancavelica','manta huancavelica',0,3,3415),(3426,'Mariscal Caceres','11','Mariscal Caceres, Huancavelica','mariscal caceres huancavelica',0,3,3415),(3427,'Moya','12','Moya, Huancavelica','moya huancavelica',0,3,3415),(3428,'Nuevo Occoro','13','Nuevo Occoro, Huancavelica','nuevo occoro huancavelica',0,3,3415),(3429,'Palca','14','Palca, Huancavelica','palca huancavelica',0,3,3415),(3430,'Pilchaca','15','Pilchaca, Huancavelica','pilchaca huancavelica',0,3,3415),(3431,'Vilca','16','Vilca, Huancavelica','vilca huancavelica',0,3,3415),(3432,'Yauli','17','Yauli, Huancavelica','yauli huancavelica',0,3,3415),(3433,'Ascensión','18','Ascensión, Huancavelica','ascensión huancavelica',0,3,3415),(3434,'Huando','19','Huando, Huancavelica','huando huancavelica',0,3,3415),(3435,'Acobamba','02','Acobamba, Huancavelica','acobamba huancavelica',8,2,3414),(3436,'Acobamba','01','Acobamba, Acobamba','acobamba acobamba',0,3,3435),(3437,'Andabamba','02','Andabamba, Acobamba','andabamba acobamba',0,3,3435),(3438,'Anta','03','Anta, Acobamba','anta acobamba',0,3,3435),(3439,'Caja','04','Caja, Acobamba','caja acobamba',0,3,3435),(3440,'Marcas','05','Marcas, Acobamba','marcas acobamba',0,3,3435),(3441,'Paucara','06','Paucara, Acobamba','paucara acobamba',0,3,3435),(3442,'Pomacocha','07','Pomacocha, Acobamba','pomacocha acobamba',0,3,3435),(3443,'Rosario','08','Rosario, Acobamba','rosario acobamba',0,3,3435),(3444,'Angaraes','03','Angaraes, Huancavelica','angaraes huancavelica',12,2,3414),(3445,'Lircay','01','Lircay, Angaraes','lircay angaraes',0,3,3444),(3446,'Anchonga','02','Anchonga, Angaraes','anchonga angaraes',0,3,3444),(3447,'Callanmarca','03','Callanmarca, Angaraes','callanmarca angaraes',0,3,3444),(3448,'Ccochaccasa','04','Ccochaccasa, Angaraes','ccochaccasa angaraes',0,3,3444),(3449,'Chincho','05','Chincho, Angaraes','chincho angaraes',0,3,3444),(3450,'Congalla','06','Congalla, Angaraes','congalla angaraes',0,3,3444),(3451,'Huanca-Huanca','07','Huanca-Huanca, Angaraes','huanca-huanca angaraes',0,3,3444),(3452,'Huayllay Grande','08','Huayllay Grande, Angaraes','huayllay grande angaraes',0,3,3444),(3453,'Julcamarca','09','Julcamarca, Angaraes','julcamarca angaraes',0,3,3444),(3454,'San Antonio de Antaparco','10','San Antonio de Antaparco, Angaraes','san antonio de antaparco angaraes',0,3,3444),(3455,'Santo Tomas de Pata','11','Santo Tomas de Pata, Angaraes','santo tomas de pata angaraes',0,3,3444),(3456,'Secclla','12','Secclla, Angaraes','secclla angaraes',0,3,3444),(3457,'Castrovirreyna','04','Castrovirreyna, Huancavelica','castrovirreyna huancavelica',13,2,3414),(3458,'Castrovirreyna','01','Castrovirreyna, Castrovirreyna','castrovirreyna castrovirreyna',0,3,3457),(3459,'Arma','02','Arma, Castrovirreyna','arma castrovirreyna',0,3,3457),(3460,'Aurahua','03','Aurahua, Castrovirreyna','aurahua castrovirreyna',0,3,3457),(3461,'Capillas','04','Capillas, Castrovirreyna','capillas castrovirreyna',0,3,3457),(3462,'Chupamarca','05','Chupamarca, Castrovirreyna','chupamarca castrovirreyna',0,3,3457),(3463,'Cocas','06','Cocas, Castrovirreyna','cocas castrovirreyna',0,3,3457),(3464,'Huachos','07','Huachos, Castrovirreyna','huachos castrovirreyna',0,3,3457),(3465,'Huamatambo','08','Huamatambo, Castrovirreyna','huamatambo castrovirreyna',0,3,3457),(3466,'Mollepampa','09','Mollepampa, Castrovirreyna','mollepampa castrovirreyna',0,3,3457),(3467,'San Juan','10','San Juan, Castrovirreyna','san juan castrovirreyna',0,3,3457),(3468,'Santa Ana','11','Santa Ana, Castrovirreyna','santa ana castrovirreyna',0,3,3457),(3469,'Tantara','12','Tantara, Castrovirreyna','tantara castrovirreyna',0,3,3457),(3470,'Ticrapo','13','Ticrapo, Castrovirreyna','ticrapo castrovirreyna',0,3,3457),(3471,'Churcampa','05','Churcampa, Huancavelica','churcampa huancavelica',10,2,3414),(3472,'Churcampa','01','Churcampa, Churcampa','churcampa churcampa',0,3,3471),(3473,'Anco','02','Anco, Churcampa','anco churcampa',0,3,3471),(3474,'Chinchihuasi','03','Chinchihuasi, Churcampa','chinchihuasi churcampa',0,3,3471),(3475,'El Carmen','04','El Carmen, Churcampa','el carmen churcampa',0,3,3471),(3476,'La Merced','05','La Merced, Churcampa','la merced churcampa',0,3,3471),(3477,'Locroja','06','Locroja, Churcampa','locroja churcampa',0,3,3471),(3478,'Paucarbamba','07','Paucarbamba, Churcampa','paucarbamba churcampa',0,3,3471),(3479,'San Miguel de Mayocc','08','San Miguel de Mayocc, Churcampa','san miguel de mayocc churcampa',0,3,3471),(3480,'San Pedro de Coris','09','San Pedro de Coris, Churcampa','san pedro de coris churcampa',0,3,3471),(3481,'Pachamarca','10','Pachamarca, Churcampa','pachamarca churcampa',0,3,3471),(3482,'Huaytara','06','Huaytara, Huancavelica','huaytara huancavelica',16,2,3414),(3483,'Huaytara','01','Huaytara, Huaytara','huaytara huaytara',0,3,3482),(3484,'Ayavi','02','Ayavi, Huaytara','ayavi huaytara',0,3,3482),(3485,'Cordova','03','Cordova, Huaytara','cordova huaytara',0,3,3482),(3486,'Huayacundo Arma','04','Huayacundo Arma, Huaytara','huayacundo arma huaytara',0,3,3482),(3487,'Laramarca','05','Laramarca, Huaytara','laramarca huaytara',0,3,3482),(3488,'Ocoyo','06','Ocoyo, Huaytara','ocoyo huaytara',0,3,3482),(3489,'Pilpichaca','07','Pilpichaca, Huaytara','pilpichaca huaytara',0,3,3482),(3490,'Querco','08','Querco, Huaytara','querco huaytara',0,3,3482),(3491,'Quito-Arma','09','Quito-Arma, Huaytara','quito-arma huaytara',0,3,3482),(3492,'San Antonio de Cusicancha','10','San Antonio de Cusicancha, Huaytara','san antonio de cusicancha huaytara',0,3,3482),(3493,'San Francisco de Sangayaico','11','San Francisco de Sangayaico, Huaytara','san francisco de sangayaico huaytara',0,3,3482),(3494,'San Isidro','12','San Isidro, Huaytara','san isidro huaytara',0,3,3482),(3495,'Santiago de Chocorvos','13','Santiago de Chocorvos, Huaytara','santiago de chocorvos huaytara',0,3,3482),(3496,'Santiago de Quirahuara','14','Santiago de Quirahuara, Huaytara','santiago de quirahuara huaytara',0,3,3482),(3497,'Santo Domingo de Capillas','15','Santo Domingo de Capillas, Huaytara','santo domingo de capillas huaytara',0,3,3482),(3498,'Tambo','16','Tambo, Huaytara','tambo huaytara',0,3,3482),(3499,'Tayacaja','07','Tayacaja, Huancavelica','tayacaja huancavelica',18,2,3414),(3500,'Pampas','01','Pampas, Tayacaja','pampas tayacaja',0,3,3499),(3501,'Acostambo','02','Acostambo, Tayacaja','acostambo tayacaja',0,3,3499),(3502,'Acraquia','03','Acraquia, Tayacaja','acraquia tayacaja',0,3,3499),(3503,'Ahuaycha','04','Ahuaycha, Tayacaja','ahuaycha tayacaja',0,3,3499),(3504,'Colcabamba','05','Colcabamba, Tayacaja','colcabamba tayacaja',0,3,3499),(3505,'Daniel Hernandez','06','Daniel Hernandez, Tayacaja','daniel hernandez tayacaja',0,3,3499),(3506,'Huachocolpa','07','Huachocolpa, Tayacaja','huachocolpa tayacaja',0,3,3499),(3507,'Huando','08','Huando, Tayacaja','huando tayacaja',0,3,3499),(3508,'Huaribamba','09','Huaribamba, Tayacaja','huaribamba tayacaja',0,3,3499),(3509,'Qahuimpuquio','10','Qahuimpuquio, Tayacaja','qahuimpuquio tayacaja',0,3,3499),(3510,'Pazos','11','Pazos, Tayacaja','pazos tayacaja',0,3,3499),(3511,'Pachamarca','12','Pachamarca, Tayacaja','pachamarca tayacaja',0,3,3499),(3512,'Quishuar','13','Quishuar, Tayacaja','quishuar tayacaja',0,3,3499),(3513,'Salcabamba','14','Salcabamba, Tayacaja','salcabamba tayacaja',0,3,3499),(3514,'Salcahuasi','15','Salcahuasi, Tayacaja','salcahuasi tayacaja',0,3,3499),(3515,'San Marcos de Rocchac','16','San Marcos de Rocchac, Tayacaja','san marcos de rocchac tayacaja',0,3,3499),(3516,'Surcubamba','17','Surcubamba, Tayacaja','surcubamba tayacaja',0,3,3499),(3517,'Tintay Puncu','18','Tintay Puncu, Tayacaja','tintay puncu tayacaja',0,3,3499),(3518,'Huanuco','10','Huanuco, Perú','huanuco perú',11,1,2533),(3519,'Huanuco','01','Huanuco, Huanuco, Huanuco','huanuco huanuco huanuco',11,2,3518),(3520,'Huanuco','01','Huanuco, Huanuco','huanuco huanuco',0,3,3519),(3521,'Amarilis','02','Amarilis, Huanuco','amarilis huanuco',0,3,3519),(3522,'Chinchao','03','Chinchao, Huanuco','chinchao huanuco',0,3,3519),(3523,'Churubamba','04','Churubamba, Huanuco','churubamba huanuco',0,3,3519),(3524,'Margos','05','Margos, Huanuco','margos huanuco',0,3,3519),(3525,'Quisqui','06','Quisqui, Huanuco','quisqui huanuco',0,3,3519),(3526,'San Francisco de Cayran','07','San Francisco de Cayran, Huanuco','san francisco de cayran huanuco',0,3,3519),(3527,'San Pedro de Chaulan','08','San Pedro de Chaulan, Huanuco','san pedro de chaulan huanuco',0,3,3519),(3528,'Santa Maria del Valle','09','Santa Maria del Valle, Huanuco','santa maria del valle huanuco',0,3,3519),(3529,'Yarumayo','10','Yarumayo, Huanuco','yarumayo huanuco',0,3,3519),(3530,'Pillcomarca','11','Pillcomarca, Huanuco','pillcomarca huanuco',0,3,3519),(3531,'Ambo','02','Ambo, Huanuco','ambo huanuco',8,2,3518),(3532,'Ambo','01','Ambo, Ambo','ambo ambo',0,3,3531),(3533,'Cayna','02','Cayna, Ambo','cayna ambo',0,3,3531),(3534,'Colpas','03','Colpas, Ambo','colpas ambo',0,3,3531),(3535,'Conchamarca','04','Conchamarca, Ambo','conchamarca ambo',0,3,3531),(3536,'Huacar','05','Huacar, Ambo','huacar ambo',0,3,3531),(3537,'San Francisco','06','San Francisco, Ambo','san francisco ambo',0,3,3531),(3538,'San Rafael','07','San Rafael, Ambo','san rafael ambo',0,3,3531),(3539,'Tomay Kichwa','08','Tomay Kichwa, Ambo','tomay kichwa ambo',0,3,3531),(3540,'Dos de Mayo','03','Dos de Mayo, Huanuco','dos de mayo huanuco',9,2,3518),(3541,'La Union','01','La Union, Dos de Mayo','la union dos de mayo',0,3,3540),(3542,'Chuquis','07','Chuquis, Dos de Mayo','chuquis dos de mayo',0,3,3540),(3543,'Marias','11','Marias, Dos de Mayo','marias dos de mayo',0,3,3540),(3544,'Pachas','13','Pachas, Dos de Mayo','pachas dos de mayo',0,3,3540),(3545,'Quivilla','16','Quivilla, Dos de Mayo','quivilla dos de mayo',0,3,3540),(3546,'Ripan','17','Ripan, Dos de Mayo','ripan dos de mayo',0,3,3540),(3547,'Shunqui','21','Shunqui, Dos de Mayo','shunqui dos de mayo',0,3,3540),(3548,'Sillapata','22','Sillapata, Dos de Mayo','sillapata dos de mayo',0,3,3540),(3549,'Yanas','23','Yanas, Dos de Mayo','yanas dos de mayo',0,3,3540),(3550,'Huacaybamba','04','Huacaybamba, Huanuco','huacaybamba huanuco',4,2,3518),(3551,'Huacaybamba','01','Huacaybamba, Huacaybamba','huacaybamba huacaybamba',0,3,3550),(3552,'Canchabamba','02','Canchabamba, Huacaybamba','canchabamba huacaybamba',0,3,3550),(3553,'Cochabamba','03','Cochabamba, Huacaybamba','cochabamba huacaybamba',0,3,3550),(3554,'Pinra','04','Pinra, Huacaybamba','pinra huacaybamba',0,3,3550),(3555,'Huamalies','05','Huamalies, Huanuco','huamalies huanuco',11,2,3518),(3556,'Llata','01','Llata, Huamalies','llata huamalies',0,3,3555),(3557,'Arancay','02','Arancay, Huamalies','arancay huamalies',0,3,3555),(3558,'Chavin de Pariarca','03','Chavin de Pariarca, Huamalies','chavin de pariarca huamalies',0,3,3555),(3559,'Jacas Grande','04','Jacas Grande, Huamalies','jacas grande huamalies',0,3,3555),(3560,'Jircan','05','Jircan, Huamalies','jircan huamalies',0,3,3555),(3561,'Miraflores','06','Miraflores, Huamalies','miraflores huamalies',0,3,3555),(3562,'Monzon','07','Monzon, Huamalies','monzon huamalies',0,3,3555),(3563,'Punchao','08','Punchao, Huamalies','punchao huamalies',0,3,3555),(3564,'Puqos','09','Puqos, Huamalies','puqos huamalies',0,3,3555),(3565,'Singa','10','Singa, Huamalies','singa huamalies',0,3,3555),(3566,'Tantamayo','11','Tantamayo, Huamalies','tantamayo huamalies',0,3,3555),(3567,'Leoncio Prado','06','Leoncio Prado, Huanuco','leoncio prado huanuco',6,2,3518),(3568,'Rupa-Rupa','01','Rupa-Rupa, Leoncio Prado','rupa-rupa leoncio prado',0,3,3567),(3569,'Daniel Alomias Robles','02','Daniel Alomias Robles, Leoncio Prado','daniel alomias robles leoncio prado',0,3,3567),(3570,'Hermilio Valdizan','03','Hermilio Valdizan, Leoncio Prado','hermilio valdizan leoncio prado',0,3,3567),(3571,'Jose Crespo y Castillo','04','Jose Crespo y Castillo, Leoncio Prado','jose crespo y castillo leoncio prado',0,3,3567),(3572,'Luyando','05','Luyando, Leoncio Prado','luyando leoncio prado',0,3,3567),(3573,'Mariano Damaso Beraun','06','Mariano Damaso Beraun, Leoncio Prado','mariano damaso beraun leoncio prado',0,3,3567),(3574,'Maraqon','07','Maraqon, Huanuco','maraqon huanuco',3,2,3518),(3575,'Huacrachuco','01','Huacrachuco, Maraqon','huacrachuco maraqon',0,3,3574),(3576,'Cholon','02','Cholon, Maraqon','cholon maraqon',0,3,3574),(3577,'San Buenaventura','03','San Buenaventura, Maraqon','san buenaventura maraqon',0,3,3574),(3578,'Pachitea','08','Pachitea, Huanuco','pachitea huanuco',4,2,3518),(3579,'Panao','01','Panao, Pachitea','panao pachitea',0,3,3578),(3580,'Chaglla','02','Chaglla, Pachitea','chaglla pachitea',0,3,3578),(3581,'Molino','03','Molino, Pachitea','molino pachitea',0,3,3578),(3582,'Umari','04','Umari, Pachitea','umari pachitea',0,3,3578),(3583,'Puerto Inca','09','Puerto Inca, Huanuco','puerto inca huanuco',5,2,3518),(3584,'Puerto Inca','01','Puerto Inca, Puerto Inca','puerto inca puerto inca',0,3,3583),(3585,'Codo del Pozuzo','02','Codo del Pozuzo, Puerto Inca','codo del pozuzo puerto inca',0,3,3583),(3586,'Honoria','03','Honoria, Puerto Inca','honoria puerto inca',0,3,3583),(3587,'Tournavista','04','Tournavista, Puerto Inca','tournavista puerto inca',0,3,3583),(3588,'Yuyapichis','05','Yuyapichis, Puerto Inca','yuyapichis puerto inca',0,3,3583),(3589,'Lauricocha','10','Lauricocha, Huanuco','lauricocha huanuco',7,2,3518),(3590,'Jesus','01','Jesus, Lauricocha','jesus lauricocha',0,3,3589),(3591,'Baqos','02','Baqos, Lauricocha','baqos lauricocha',0,3,3589),(3592,'Jivia','03','Jivia, Lauricocha','jivia lauricocha',0,3,3589),(3593,'Queropalca','04','Queropalca, Lauricocha','queropalca lauricocha',0,3,3589),(3594,'Rondos','05','Rondos, Lauricocha','rondos lauricocha',0,3,3589),(3595,'San Francisco de Asis','06','San Francisco de Asis, Lauricocha','san francisco de asis lauricocha',0,3,3589),(3596,'San Miguel de Cauri','07','San Miguel de Cauri, Lauricocha','san miguel de cauri lauricocha',0,3,3589),(3597,'Yarowilca','11','Yarowilca, Huanuco','yarowilca huanuco',8,2,3518),(3598,'Chavinillo','01','Chavinillo, Yarowilca','chavinillo yarowilca',0,3,3597),(3599,'Cahuac','02','Cahuac, Yarowilca','cahuac yarowilca',0,3,3597),(3600,'Chacabamba','03','Chacabamba, Yarowilca','chacabamba yarowilca',0,3,3597),(3601,'Chupan','04','Chupan, Yarowilca','chupan yarowilca',0,3,3597),(3602,'Jacas Chico','05','Jacas Chico, Yarowilca','jacas chico yarowilca',0,3,3597),(3603,'Obas','06','Obas, Yarowilca','obas yarowilca',0,3,3597),(3604,'Pampamarca','07','Pampamarca, Yarowilca','pampamarca yarowilca',0,3,3597),(3605,'Choras','08','Choras, Yarowilca','choras yarowilca',0,3,3597),(3606,'Ica','11','Ica, Perú','ica perú',5,1,2533),(3607,'Ica','01','Ica, Ica, Ica','ica ica ica',14,2,3606),(3608,'Ica','01','Ica, Ica','ica ica',0,3,3607),(3609,'La Tinguiqa','02','La Tinguiqa, Ica','la tinguiqa ica',0,3,3607),(3610,'Los Aquijes','03','Los Aquijes, Ica','los aquijes ica',0,3,3607),(3611,'Ocucaje','04','Ocucaje, Ica','ocucaje ica',0,3,3607),(3612,'Pachacutec','05','Pachacutec, Ica','pachacutec ica',0,3,3607),(3613,'Parcona','06','Parcona, Ica','parcona ica',0,3,3607),(3614,'Pueblo Nuevo','07','Pueblo Nuevo, Ica','pueblo nuevo ica',0,3,3607),(3615,'Salas','08','Salas, Ica','salas ica',0,3,3607),(3616,'San Jose de los Molinos','09','San Jose de los Molinos, Ica','san jose de los molinos ica',0,3,3607),(3617,'San Juan Bautista','10','San Juan Bautista, Ica','san juan bautista ica',0,3,3607),(3618,'Santiago','11','Santiago, Ica','santiago ica',0,3,3607),(3619,'Subtanjalla','12','Subtanjalla, Ica','subtanjalla ica',0,3,3607),(3620,'Tate','13','Tate, Ica','tate ica',0,3,3607),(3621,'Yauca del Rosario  1/','14','Yauca del Rosario  1/, Ica','yauca del rosario  1/ ica',0,3,3607),(3622,'Chincha','02','Chincha, Ica','chincha ica',11,2,3606),(3623,'Chincha Alta','01','Chincha Alta, Chincha','chincha alta chincha',0,3,3622),(3624,'Alto Laran','02','Alto Laran, Chincha','alto laran chincha',0,3,3622),(3625,'Chavin','03','Chavin, Chincha','chavin chincha',0,3,3622),(3626,'Chincha Baja','04','Chincha Baja, Chincha','chincha baja chincha',0,3,3622),(3627,'El Carmen','05','El Carmen, Chincha','el carmen chincha',0,3,3622),(3628,'Grocio Prado','06','Grocio Prado, Chincha','grocio prado chincha',0,3,3622),(3629,'Pueblo Nuevo','07','Pueblo Nuevo, Chincha','pueblo nuevo chincha',0,3,3622),(3630,'San Juan de Yanac','08','San Juan de Yanac, Chincha','san juan de yanac chincha',0,3,3622),(3631,'San Pedro de Huacarpana','09','San Pedro de Huacarpana, Chincha','san pedro de huacarpana chincha',0,3,3622),(3632,'Sunampe','10','Sunampe, Chincha','sunampe chincha',0,3,3622),(3633,'Tambo de Mora','11','Tambo de Mora, Chincha','tambo de mora chincha',0,3,3622),(3634,'Nazca','03','Nazca, Ica','nazca ica',5,2,3606),(3635,'Nazca','01','Nazca, Nazca','nazca nazca',0,3,3634),(3636,'Changuillo','02','Changuillo, Nazca','changuillo nazca',0,3,3634),(3637,'El Ingenio','03','El Ingenio, Nazca','el ingenio nazca',0,3,3634),(3638,'Marcona','04','Marcona, Nazca','marcona nazca',0,3,3634),(3639,'Vista Alegre','05','Vista Alegre, Nazca','vista alegre nazca',0,3,3634),(3640,'Palpa','04','Palpa, Ica','palpa ica',5,2,3606),(3641,'Palpa','01','Palpa, Palpa','palpa palpa',0,3,3640),(3642,'Llipata','02','Llipata, Palpa','llipata palpa',0,3,3640),(3643,'Rio Grande','03','Rio Grande, Palpa','rio grande palpa',0,3,3640),(3644,'Santa Cruz','04','Santa Cruz, Palpa','santa cruz palpa',0,3,3640),(3645,'Tibillo','05','Tibillo, Palpa','tibillo palpa',0,3,3640),(3646,'Pisco','05','Pisco, Ica','pisco ica',8,2,3606),(3647,'Pisco','01','Pisco, Pisco','pisco pisco',0,3,3646),(3648,'Huancano','02','Huancano, Pisco','huancano pisco',0,3,3646),(3649,'Humay','03','Humay, Pisco','humay pisco',0,3,3646),(3650,'Independencia','04','Independencia, Pisco','independencia pisco',0,3,3646),(3651,'Paracas','05','Paracas, Pisco','paracas pisco',0,3,3646),(3652,'San Andres','06','San Andres, Pisco','san andres pisco',0,3,3646),(3653,'San Clemente','07','San Clemente, Pisco','san clemente pisco',0,3,3646),(3654,'Tupac Amaru Inca','08','Tupac Amaru Inca, Pisco','tupac amaru inca pisco',0,3,3646),(3655,'Junin','12','Junin, Perú','junin perú',9,1,2533),(3656,'Huancayo','01','Huancayo, Junin','huancayo junin',28,2,3655),(3657,'Huancayo','01','Huancayo, Huancayo','huancayo huancayo',0,3,3656),(3658,'Carhuacallanga','04','Carhuacallanga, Huancayo','carhuacallanga huancayo',0,3,3656),(3659,'Chacapampa','05','Chacapampa, Huancayo','chacapampa huancayo',0,3,3656),(3660,'Chicche','06','Chicche, Huancayo','chicche huancayo',0,3,3656),(3661,'Chilca','07','Chilca, Huancayo','chilca huancayo',0,3,3656),(3662,'Chongos Alto','08','Chongos Alto, Huancayo','chongos alto huancayo',0,3,3656),(3663,'Chupuro','11','Chupuro, Huancayo','chupuro huancayo',0,3,3656),(3664,'Colca','12','Colca, Huancayo','colca huancayo',0,3,3656),(3665,'Cullhuas','13','Cullhuas, Huancayo','cullhuas huancayo',0,3,3656),(3666,'El Tambo','14','El Tambo, Huancayo','el tambo huancayo',0,3,3656),(3667,'Huacrapuquio','16','Huacrapuquio, Huancayo','huacrapuquio huancayo',0,3,3656),(3668,'Hualhuas','17','Hualhuas, Huancayo','hualhuas huancayo',0,3,3656),(3669,'Huancan','19','Huancan, Huancayo','huancan huancayo',0,3,3656),(3670,'Huasicancha','20','Huasicancha, Huancayo','huasicancha huancayo',0,3,3656),(3671,'Huayucachi','21','Huayucachi, Huancayo','huayucachi huancayo',0,3,3656),(3672,'Ingenio','22','Ingenio, Huancayo','ingenio huancayo',0,3,3656),(3673,'Pariahuanca','24','Pariahuanca, Huancayo','pariahuanca huancayo',0,3,3656),(3674,'Pilcomayo','25','Pilcomayo, Huancayo','pilcomayo huancayo',0,3,3656),(3675,'Pucara','26','Pucara, Huancayo','pucara huancayo',0,3,3656),(3676,'Quichuay','27','Quichuay, Huancayo','quichuay huancayo',0,3,3656),(3677,'Quilcas','28','Quilcas, Huancayo','quilcas huancayo',0,3,3656),(3678,'San Agustin','29','San Agustin, Huancayo','san agustin huancayo',0,3,3656),(3679,'San Jeronimo de Tunan','30','San Jeronimo de Tunan, Huancayo','san jeronimo de tunan huancayo',0,3,3656),(3680,'Saqo','32','Saqo, Huancayo','saqo huancayo',0,3,3656),(3681,'Sapallanga','33','Sapallanga, Huancayo','sapallanga huancayo',0,3,3656),(3682,'Sicaya','34','Sicaya, Huancayo','sicaya huancayo',0,3,3656),(3683,'Santo Domingo de Acobamba','35','Santo Domingo de Acobamba, Huancayo','santo domingo de acobamba huancayo',0,3,3656),(3684,'Viques','36','Viques, Huancayo','viques huancayo',0,3,3656),(3685,'Concepcion','02','Concepcion, Junin','concepcion junin',15,2,3655),(3686,'Concepcion','01','Concepcion, Concepcion','concepcion concepcion',0,3,3685),(3687,'Aco','02','Aco, Concepcion','aco concepcion',0,3,3685),(3688,'Andamarca','03','Andamarca, Concepcion','andamarca concepcion',0,3,3685),(3689,'Chambara','04','Chambara, Concepcion','chambara concepcion',0,3,3685),(3690,'Cochas','05','Cochas, Concepcion','cochas concepcion',0,3,3685),(3691,'Comas','06','Comas, Concepcion','comas concepcion',0,3,3685),(3692,'Heroinas Toledo','07','Heroinas Toledo, Concepcion','heroinas toledo concepcion',0,3,3685),(3693,'Manzanares','08','Manzanares, Concepcion','manzanares concepcion',0,3,3685),(3694,'Mariscal Castilla','09','Mariscal Castilla, Concepcion','mariscal castilla concepcion',0,3,3685),(3695,'Matahuasi','10','Matahuasi, Concepcion','matahuasi concepcion',0,3,3685),(3696,'Mito','11','Mito, Concepcion','mito concepcion',0,3,3685),(3697,'Nueve de Julio','12','Nueve de Julio, Concepcion','nueve de julio concepcion',0,3,3685),(3698,'Orcotuna','13','Orcotuna, Concepcion','orcotuna concepcion',0,3,3685),(3699,'San Jose de Quero','14','San Jose de Quero, Concepcion','san jose de quero concepcion',0,3,3685),(3700,'Santa Rosa de Ocopa','15','Santa Rosa de Ocopa, Concepcion','santa rosa de ocopa concepcion',0,3,3685),(3701,'Chanchamayo','03','Chanchamayo, Junin','chanchamayo junin',6,2,3655),(3702,'Chanchamayo','01','Chanchamayo, Chanchamayo','chanchamayo chanchamayo',0,3,3701),(3703,'Perene','02','Perene, Chanchamayo','perene chanchamayo',0,3,3701),(3704,'Pichanaqui','03','Pichanaqui, Chanchamayo','pichanaqui chanchamayo',0,3,3701),(3705,'San Luis de Shuaro','04','San Luis de Shuaro, Chanchamayo','san luis de shuaro chanchamayo',0,3,3701),(3706,'San Ramon','05','San Ramon, Chanchamayo','san ramon chanchamayo',0,3,3701),(3707,'Vitoc','06','Vitoc, Chanchamayo','vitoc chanchamayo',0,3,3701),(3708,'Jauja','04','Jauja, Junin','jauja junin',34,2,3655),(3709,'Jauja','01','Jauja, Jauja','jauja jauja',0,3,3708),(3710,'Acolla','02','Acolla, Jauja','acolla jauja',0,3,3708),(3711,'Apata','03','Apata, Jauja','apata jauja',0,3,3708),(3712,'Ataura','04','Ataura, Jauja','ataura jauja',0,3,3708),(3713,'Canchayllo','05','Canchayllo, Jauja','canchayllo jauja',0,3,3708),(3714,'Curicaca','06','Curicaca, Jauja','curicaca jauja',0,3,3708),(3715,'El Mantaro','07','El Mantaro, Jauja','el mantaro jauja',0,3,3708),(3716,'Huamali','08','Huamali, Jauja','huamali jauja',0,3,3708),(3717,'Huaripampa','09','Huaripampa, Jauja','huaripampa jauja',0,3,3708),(3718,'Huertas','10','Huertas, Jauja','huertas jauja',0,3,3708),(3719,'Janjaillo','11','Janjaillo, Jauja','janjaillo jauja',0,3,3708),(3720,'Julcan','12','Julcan, Jauja','julcan jauja',0,3,3708),(3721,'Leonor Ordoqez','13','Leonor Ordoqez, Jauja','leonor ordoqez jauja',0,3,3708),(3722,'Llocllapampa','14','Llocllapampa, Jauja','llocllapampa jauja',0,3,3708),(3723,'Marco','15','Marco, Jauja','marco jauja',0,3,3708),(3724,'Masma','16','Masma, Jauja','masma jauja',0,3,3708),(3725,'Masma Chicche','17','Masma Chicche, Jauja','masma chicche jauja',0,3,3708),(3726,'Molinos','18','Molinos, Jauja','molinos jauja',0,3,3708),(3727,'Monobamba','19','Monobamba, Jauja','monobamba jauja',0,3,3708),(3728,'Muqui','20','Muqui, Jauja','muqui jauja',0,3,3708),(3729,'Muquiyauyo','21','Muquiyauyo, Jauja','muquiyauyo jauja',0,3,3708),(3730,'Paca','22','Paca, Jauja','paca jauja',0,3,3708),(3731,'Paccha','23','Paccha, Jauja','paccha jauja',0,3,3708),(3732,'Pancan','24','Pancan, Jauja','pancan jauja',0,3,3708),(3733,'Parco','25','Parco, Jauja','parco jauja',0,3,3708),(3734,'Pomacancha','26','Pomacancha, Jauja','pomacancha jauja',0,3,3708),(3735,'Ricran','27','Ricran, Jauja','ricran jauja',0,3,3708),(3736,'San Lorenzo','28','San Lorenzo, Jauja','san lorenzo jauja',0,3,3708),(3737,'San Pedro de Chunan','29','San Pedro de Chunan, Jauja','san pedro de chunan jauja',0,3,3708),(3738,'Sausa','30','Sausa, Jauja','sausa jauja',0,3,3708),(3739,'Sincos','31','Sincos, Jauja','sincos jauja',0,3,3708),(3740,'Tunan Marca','32','Tunan Marca, Jauja','tunan marca jauja',0,3,3708),(3741,'Yauli','33','Yauli, Jauja','yauli jauja',0,3,3708),(3742,'Yauyos','34','Yauyos, Jauja','yauyos jauja',0,3,3708),(3743,'Junin','05','Junin, Junin, Junin','junin junin junin',4,2,3655),(3744,'Junin','01','Junin, Junin','junin junin',0,3,3743),(3745,'Carhuamayo','02','Carhuamayo, Junin','carhuamayo junin',0,3,3743),(3746,'Ondores','03','Ondores, Junin','ondores junin',0,3,3743),(3747,'Ulcumayo','04','Ulcumayo, Junin','ulcumayo junin',0,3,3743),(3748,'Satipo','06','Satipo, Junin','satipo junin',8,2,3655),(3749,'Satipo','01','Satipo, Satipo','satipo satipo',0,3,3748),(3750,'Coviriali','02','Coviriali, Satipo','coviriali satipo',0,3,3748),(3751,'Llaylla','03','Llaylla, Satipo','llaylla satipo',0,3,3748),(3752,'Mazamari','04','Mazamari, Satipo','mazamari satipo',0,3,3748),(3753,'Pampa Hermosa','05','Pampa Hermosa, Satipo','pampa hermosa satipo',0,3,3748),(3754,'Pangoa','06','Pangoa, Satipo','pangoa satipo',0,3,3748),(3755,'Rio Negro','07','Rio Negro, Satipo','rio negro satipo',0,3,3748),(3756,'Rio Tambo','08','Rio Tambo, Satipo','rio tambo satipo',0,3,3748),(3757,'Tarma','07','Tarma, Junin','tarma junin',9,2,3655),(3758,'Tarma','01','Tarma, Tarma','tarma tarma',0,3,3757),(3759,'Acobamba','02','Acobamba, Tarma','acobamba tarma',0,3,3757),(3760,'Huaricolca','03','Huaricolca, Tarma','huaricolca tarma',0,3,3757),(3761,'Huasahuasi','04','Huasahuasi, Tarma','huasahuasi tarma',0,3,3757),(3762,'La Union','05','La Union, Tarma','la union tarma',0,3,3757),(3763,'Palca','06','Palca, Tarma','palca tarma',0,3,3757),(3764,'Palcamayo','07','Palcamayo, Tarma','palcamayo tarma',0,3,3757),(3765,'San Pedro de Cajas','08','San Pedro de Cajas, Tarma','san pedro de cajas tarma',0,3,3757),(3766,'Tapo','09','Tapo, Tarma','tapo tarma',0,3,3757),(3767,'Yauli','08','Yauli, Junin','yauli junin',10,2,3655),(3768,'La Oroya','01','La Oroya, Yauli','la oroya yauli',0,3,3767),(3769,'Chacapalpa','02','Chacapalpa, Yauli','chacapalpa yauli',0,3,3767),(3770,'Huay-Huay','03','Huay-Huay, Yauli','huay-huay yauli',0,3,3767),(3771,'Marcapomacocha','04','Marcapomacocha, Yauli','marcapomacocha yauli',0,3,3767),(3772,'Morococha','05','Morococha, Yauli','morococha yauli',0,3,3767),(3773,'Paccha','06','Paccha, Yauli','paccha yauli',0,3,3767),(3774,'Santa Barbara de Carhuacayan','07','Santa Barbara de Carhuacayan, Yauli','santa barbara de carhuacayan yauli',0,3,3767),(3775,'Santa Rosa de Sacco','08','Santa Rosa de Sacco, Yauli','santa rosa de sacco yauli',0,3,3767),(3776,'Suitucancha','09','Suitucancha, Yauli','suitucancha yauli',0,3,3767),(3777,'Yauli','10','Yauli, Yauli','yauli yauli',0,3,3767),(3778,'Chupaca','09','Chupaca, Junin','chupaca junin',9,2,3655),(3779,'Chupaca','01','Chupaca, Chupaca','chupaca chupaca',0,3,3778),(3780,'Ahuac','02','Ahuac, Chupaca','ahuac chupaca',0,3,3778),(3781,'Chongos Bajo','03','Chongos Bajo, Chupaca','chongos bajo chupaca',0,3,3778),(3782,'Huachac','04','Huachac, Chupaca','huachac chupaca',0,3,3778),(3783,'Huamancaca Chico','05','Huamancaca Chico, Chupaca','huamancaca chico chupaca',0,3,3778),(3784,'San Juan de Iscos','06','San Juan de Iscos, Chupaca','san juan de iscos chupaca',0,3,3778),(3785,'San Juan de Jarpa','07','San Juan de Jarpa, Chupaca','san juan de jarpa chupaca',0,3,3778),(3786,'Tres de Diciembre','08','Tres de Diciembre, Chupaca','tres de diciembre chupaca',0,3,3778),(3787,'Yanacancha','09','Yanacancha, Chupaca','yanacancha chupaca',0,3,3778),(3788,'La Libertad','13','La Libertad, Perú','la libertad perú',12,1,2533),(3789,'Trujillo','01','Trujillo, La Libertad','trujillo la libertad',11,2,3788),(3790,'Trujillo','01','Trujillo, Trujillo','trujillo trujillo',0,3,3789),(3791,'El Porvenir','02','El Porvenir, Trujillo','el porvenir trujillo',0,3,3789),(3792,'Florencia de Mora','03','Florencia de Mora, Trujillo','florencia de mora trujillo',0,3,3789),(3793,'Huanchaco','04','Huanchaco, Trujillo','huanchaco trujillo',0,3,3789),(3794,'La Esperanza','05','La Esperanza, Trujillo','la esperanza trujillo',0,3,3789),(3795,'Laredo','06','Laredo, Trujillo','laredo trujillo',0,3,3789),(3796,'Moche','07','Moche, Trujillo','moche trujillo',0,3,3789),(3797,'Poroto','08','Poroto, Trujillo','poroto trujillo',0,3,3789),(3798,'Salaverry','09','Salaverry, Trujillo','salaverry trujillo',0,3,3789),(3799,'Simbal','10','Simbal, Trujillo','simbal trujillo',0,3,3789),(3800,'Victor Larco Herrera','11','Victor Larco Herrera, Trujillo','victor larco herrera trujillo',0,3,3789),(3801,'Ascope','02','Ascope, La Libertad','ascope la libertad',8,2,3788),(3802,'Ascope','01','Ascope, Ascope','ascope ascope',0,3,3801),(3803,'Chicama','02','Chicama, Ascope','chicama ascope',0,3,3801),(3804,'Chocope','03','Chocope, Ascope','chocope ascope',0,3,3801),(3805,'Magdalena de Cao','04','Magdalena de Cao, Ascope','magdalena de cao ascope',0,3,3801),(3806,'Paijan','05','Paijan, Ascope','paijan ascope',0,3,3801),(3807,'Razuri','06','Razuri, Ascope','razuri ascope',0,3,3801),(3808,'Santiago de Cao','07','Santiago de Cao, Ascope','santiago de cao ascope',0,3,3801),(3809,'Casa Grande','08','Casa Grande, Ascope','casa grande ascope',0,3,3801),(3810,'Bolivar','03','Bolivar, La Libertad','bolivar la libertad',6,2,3788),(3811,'Bolivar','01','Bolivar, Bolivar','bolivar bolivar',0,3,3810),(3812,'Bambamarca','02','Bambamarca, Bolivar','bambamarca bolivar',0,3,3810),(3813,'Condormarca','03','Condormarca, Bolivar','condormarca bolivar',0,3,3810),(3814,'Longotea','04','Longotea, Bolivar','longotea bolivar',0,3,3810),(3815,'Uchumarca','05','Uchumarca, Bolivar','uchumarca bolivar',0,3,3810),(3816,'Ucuncha','06','Ucuncha, Bolivar','ucuncha bolivar',0,3,3810),(3817,'Chepen','04','Chepen, La Libertad','chepen la libertad',3,2,3788),(3818,'Chepen','01','Chepen, Chepen','chepen chepen',0,3,3817),(3819,'Pacanga','02','Pacanga, Chepen','pacanga chepen',0,3,3817),(3820,'Pueblo Nuevo','03','Pueblo Nuevo, Chepen','pueblo nuevo chepen',0,3,3817),(3821,'Julcan','05','Julcan, La Libertad','julcan la libertad',4,2,3788),(3822,'Julcan','01','Julcan, Julcan','julcan julcan',0,3,3821),(3823,'Calamarca','02','Calamarca, Julcan','calamarca julcan',0,3,3821),(3824,'Carabamba','03','Carabamba, Julcan','carabamba julcan',0,3,3821),(3825,'Huaso','04','Huaso, Julcan','huaso julcan',0,3,3821),(3826,'Otuzco','06','Otuzco, La Libertad','otuzco la libertad',10,2,3788),(3827,'Otuzco','01','Otuzco, Otuzco','otuzco otuzco',0,3,3826),(3828,'Agallpampa','02','Agallpampa, Otuzco','agallpampa otuzco',0,3,3826),(3829,'Charat','04','Charat, Otuzco','charat otuzco',0,3,3826),(3830,'Huaranchal','05','Huaranchal, Otuzco','huaranchal otuzco',0,3,3826),(3831,'La Cuesta','06','La Cuesta, Otuzco','la cuesta otuzco',0,3,3826),(3832,'Mache','08','Mache, Otuzco','mache otuzco',0,3,3826),(3833,'Paranday','10','Paranday, Otuzco','paranday otuzco',0,3,3826),(3834,'Salpo','11','Salpo, Otuzco','salpo otuzco',0,3,3826),(3835,'Sinsicap','13','Sinsicap, Otuzco','sinsicap otuzco',0,3,3826),(3836,'Usquil','14','Usquil, Otuzco','usquil otuzco',0,3,3826),(3837,'Pacasmayo','07','Pacasmayo, La Libertad','pacasmayo la libertad',5,2,3788),(3838,'San Pedro de Lloc','01','San Pedro de Lloc, Pacasmayo','san pedro de lloc pacasmayo',0,3,3837),(3839,'Guadalupe','02','Guadalupe, Pacasmayo','guadalupe pacasmayo',0,3,3837),(3840,'Jequetepeque','03','Jequetepeque, Pacasmayo','jequetepeque pacasmayo',0,3,3837),(3841,'Pacasmayo','04','Pacasmayo, Pacasmayo','pacasmayo pacasmayo',0,3,3837),(3842,'San Jose','05','San Jose, Pacasmayo','san jose pacasmayo',0,3,3837),(3843,'Pataz','08','Pataz, La Libertad','pataz la libertad',13,2,3788),(3844,'Tayabamba','01','Tayabamba, Pataz','tayabamba pataz',0,3,3843),(3845,'Buldibuyo','02','Buldibuyo, Pataz','buldibuyo pataz',0,3,3843),(3846,'Chillia','03','Chillia, Pataz','chillia pataz',0,3,3843),(3847,'Huancaspata','04','Huancaspata, Pataz','huancaspata pataz',0,3,3843),(3848,'Huaylillas','05','Huaylillas, Pataz','huaylillas pataz',0,3,3843),(3849,'Huayo','06','Huayo, Pataz','huayo pataz',0,3,3843),(3850,'Ongon','07','Ongon, Pataz','ongon pataz',0,3,3843),(3851,'Parcoy','08','Parcoy, Pataz','parcoy pataz',0,3,3843),(3852,'Pataz','09','Pataz, Pataz','pataz pataz',0,3,3843),(3853,'Pias','10','Pias, Pataz','pias pataz',0,3,3843),(3854,'Santiago de Challas','11','Santiago de Challas, Pataz','santiago de challas pataz',0,3,3843),(3855,'Taurija','12','Taurija, Pataz','taurija pataz',0,3,3843),(3856,'Urpay','13','Urpay, Pataz','urpay pataz',0,3,3843),(3857,'Sanchez Carrion','09','Sanchez Carrion, La Libertad','sanchez carrion la libertad',8,2,3788),(3858,'Huamachuco','01','Huamachuco, Sanchez Carrion','huamachuco sanchez carrion',0,3,3857),(3859,'Chugay','02','Chugay, Sanchez Carrion','chugay sanchez carrion',0,3,3857),(3860,'Cochorco','03','Cochorco, Sanchez Carrion','cochorco sanchez carrion',0,3,3857),(3861,'Curgos','04','Curgos, Sanchez Carrion','curgos sanchez carrion',0,3,3857),(3862,'Marcabal','05','Marcabal, Sanchez Carrion','marcabal sanchez carrion',0,3,3857),(3863,'Sanagoran','06','Sanagoran, Sanchez Carrion','sanagoran sanchez carrion',0,3,3857),(3864,'Sarin','07','Sarin, Sanchez Carrion','sarin sanchez carrion',0,3,3857),(3865,'Sartimbamba','08','Sartimbamba, Sanchez Carrion','sartimbamba sanchez carrion',0,3,3857),(3866,'Santiago de Chuco','10','Santiago de Chuco, La Libertad','santiago de chuco la libertad',8,2,3788),(3867,'Santiago de Chuco','01','Santiago de Chuco, Santiago de Chuco','santiago de chuco santiago de chuco',0,3,3866),(3868,'Angasmarca','02','Angasmarca, Santiago de Chuco','angasmarca santiago de chuco',0,3,3866),(3869,'Cachicadan','03','Cachicadan, Santiago de Chuco','cachicadan santiago de chuco',0,3,3866),(3870,'Mollebamba','04','Mollebamba, Santiago de Chuco','mollebamba santiago de chuco',0,3,3866),(3871,'Mollepata','05','Mollepata, Santiago de Chuco','mollepata santiago de chuco',0,3,3866),(3872,'Quiruvilca','06','Quiruvilca, Santiago de Chuco','quiruvilca santiago de chuco',0,3,3866),(3873,'Santa Cruz de Chuca','07','Santa Cruz de Chuca, Santiago de Chuco','santa cruz de chuca santiago de chuco',0,3,3866),(3874,'Sitabamba','08','Sitabamba, Santiago de Chuco','sitabamba santiago de chuco',0,3,3866),(3875,'Gran Chimu','11','Gran Chimu, La Libertad','gran chimu la libertad',4,2,3788),(3876,'Cascas','01','Cascas, Gran Chimu','cascas gran chimu',0,3,3875),(3877,'Lucma','02','Lucma, Gran Chimu','lucma gran chimu',0,3,3875),(3878,'Marmot','03','Marmot, Gran Chimu','marmot gran chimu',0,3,3875),(3879,'Sayapullo','04','Sayapullo, Gran Chimu','sayapullo gran chimu',0,3,3875),(3880,'Viru','12','Viru, La Libertad','viru la libertad',3,2,3788),(3881,'Viru','01','Viru, Viru','viru viru',0,3,3880),(3882,'Chao','02','Chao, Viru','chao viru',0,3,3880),(3883,'Guadalupito','03','Guadalupito, Viru','guadalupito viru',0,3,3880),(3884,'Lambayeque','14','Lambayeque, Perú','lambayeque perú',3,1,2533),(3885,'Chiclayo','01','Chiclayo, Lambayeque','chiclayo lambayeque',20,2,3884),(3886,'Chiclayo','01','Chiclayo, Chiclayo','chiclayo chiclayo',0,3,3885),(3887,'Chongoyape','02','Chongoyape, Chiclayo','chongoyape chiclayo',0,3,3885),(3888,'Eten','03','Eten, Chiclayo','eten chiclayo',0,3,3885),(3889,'Eten Puerto','04','Eten Puerto, Chiclayo','eten puerto chiclayo',0,3,3885),(3890,'Jose Leonardo Ortiz','05','Jose Leonardo Ortiz, Chiclayo','jose leonardo ortiz chiclayo',0,3,3885),(3891,'La Victoria','06','La Victoria, Chiclayo','la victoria chiclayo',0,3,3885),(3892,'Lagunas','07','Lagunas, Chiclayo','lagunas chiclayo',0,3,3885),(3893,'Monsefu','08','Monsefu, Chiclayo','monsefu chiclayo',0,3,3885),(3894,'Nueva Arica','09','Nueva Arica, Chiclayo','nueva arica chiclayo',0,3,3885),(3895,'Oyotun','10','Oyotun, Chiclayo','oyotun chiclayo',0,3,3885),(3896,'Picsi','11','Picsi, Chiclayo','picsi chiclayo',0,3,3885),(3897,'Pimentel','12','Pimentel, Chiclayo','pimentel chiclayo',0,3,3885),(3898,'Reque','13','Reque, Chiclayo','reque chiclayo',0,3,3885),(3899,'Santa Rosa','14','Santa Rosa, Chiclayo','santa rosa chiclayo',0,3,3885),(3900,'Saqa','15','Saqa, Chiclayo','saqa chiclayo',0,3,3885),(3901,'Cayaltí','16','Cayaltí, Chiclayo','cayaltí chiclayo',0,3,3885),(3902,'Patapo','17','Patapo, Chiclayo','patapo chiclayo',0,3,3885),(3903,'Pomalca','18','Pomalca, Chiclayo','pomalca chiclayo',0,3,3885),(3904,'Pucalá','19','Pucalá, Chiclayo','pucalá chiclayo',0,3,3885),(3905,'Tumán','20','Tumán, Chiclayo','tumán chiclayo',0,3,3885),(3906,'Ferreqafe','02','Ferreqafe, Lambayeque','ferreqafe lambayeque',6,2,3884),(3907,'Ferreqafe','01','Ferreqafe, Ferreqafe','ferreqafe ferreqafe',0,3,3906),(3908,'Caqaris','02','Caqaris, Ferreqafe','caqaris ferreqafe',0,3,3906),(3909,'Incahuasi','03','Incahuasi, Ferreqafe','incahuasi ferreqafe',0,3,3906),(3910,'Manuel Antonio Mesones Muro','04','Manuel Antonio Mesones Muro, Ferreqafe','manuel antonio mesones muro ferreqafe',0,3,3906),(3911,'Pitipo','05','Pitipo, Ferreqafe','pitipo ferreqafe',0,3,3906),(3912,'Pueblo Nuevo','06','Pueblo Nuevo, Ferreqafe','pueblo nuevo ferreqafe',0,3,3906),(3913,'Lambayeque','03','Lambayeque, Lambayeque, Lambayeque','lambayeque lambayeque lambayeque',12,2,3884),(3914,'Lambayeque','01','Lambayeque, Lambayeque','lambayeque lambayeque',0,3,3913),(3915,'Chochope','02','Chochope, Lambayeque','chochope lambayeque',0,3,3913),(3916,'Illimo','03','Illimo, Lambayeque','illimo lambayeque',0,3,3913),(3917,'Jayanca','04','Jayanca, Lambayeque','jayanca lambayeque',0,3,3913),(3918,'Mochumi','05','Mochumi, Lambayeque','mochumi lambayeque',0,3,3913),(3919,'Morrope','06','Morrope, Lambayeque','morrope lambayeque',0,3,3913),(3920,'Motupe','07','Motupe, Lambayeque','motupe lambayeque',0,3,3913),(3921,'Olmos','08','Olmos, Lambayeque','olmos lambayeque',0,3,3913),(3922,'Pacora','09','Pacora, Lambayeque','pacora lambayeque',0,3,3913),(3923,'Salas','10','Salas, Lambayeque','salas lambayeque',0,3,3913),(3924,'San Jose','11','San Jose, Lambayeque','san jose lambayeque',0,3,3913),(3925,'Tucume','12','Tucume, Lambayeque','tucume lambayeque',0,3,3913),(3926,'Lima','15','Lima, Perú','lima perú',10,1,2533),(3927,'Lima','01','Lima, Lima, Lima','lima lima lima',43,2,3926),(3928,'Cercado de Lima','01','Cercado de Lima, Lima','cercado de lima lima',0,3,3927),(3929,'Ancon','02','Ancon, Lima','ancon lima',0,3,3927),(3930,'Ate','03','Ate, Lima','ate lima',0,3,3927),(3931,'Barranco','04','Barranco, Lima','barranco lima',0,3,3927),(3932,'Breña','05','Breña, Lima','brena lima',0,3,3927),(3933,'Carabayllo','06','Carabayllo, Lima','carabayllo lima',0,3,3927),(3934,'Chaclacayo','07','Chaclacayo, Lima','chaclacayo lima',0,3,3927),(3935,'Chorrillos','08','Chorrillos, Lima','chorrillos lima',0,3,3927),(3936,'Cieneguilla','09','Cieneguilla, Lima','cieneguilla lima',0,3,3927),(3937,'Comas','10','Comas, Lima','comas lima',0,3,3927),(3938,'El Agustino','11','El Agustino, Lima','el agustino lima',0,3,3927),(3939,'Independencia','12','Independencia, Lima','independencia lima',0,3,3927),(3940,'Jesus Maria','13','Jesus Maria, Lima','jesus maria lima',0,3,3927),(3941,'La Molina','14','La Molina, Lima','la molina lima',0,3,3927),(3942,'La Victoria','15','La Victoria, Lima','la victoria lima',0,3,3927),(3943,'Lince','16','Lince, Lima','lince lima',0,3,3927),(3944,'Los Olivos','17','Los Olivos, Lima','los olivos lima',0,3,3927),(3945,'Lurigancho','18','Lurigancho, Lima','lurigancho lima',0,3,3927),(3946,'Lurin','19','Lurin, Lima','lurin lima',0,3,3927),(3947,'Magdalena del Mar','20','Magdalena del Mar, Lima','magdalena del mar lima',0,3,3927),(3948,'Pueblo Libre','21','Pueblo Libre, Lima','pueblo libre lima',0,3,3927),(3949,'Miraflores','22','Miraflores, Lima','miraflores lima',0,3,3927),(3950,'Pachacamac','23','Pachacamac, Lima','pachacamac lima',0,3,3927),(3951,'Pucusana','24','Pucusana, Lima','pucusana lima',0,3,3927),(3952,'Puente Piedra','25','Puente Piedra, Lima','puente piedra lima',0,3,3927),(3953,'Punta Hermosa','26','Punta Hermosa, Lima','punta hermosa lima',0,3,3927),(3954,'Punta Negra','27','Punta Negra, Lima','punta negra lima',0,3,3927),(3955,'Rimac','28','Rimac, Lima','rimac lima',0,3,3927),(3956,'San Bartolo','29','San Bartolo, Lima','san bartolo lima',0,3,3927),(3957,'San Borja','30','San Borja, Lima','san borja lima',0,3,3927),(3958,'San Isidro','31','San Isidro, Lima','san isidro lima',0,3,3927),(3959,'San Juan de Lurigancho','32','San Juan de Lurigancho, Lima','san juan de lurigancho lima',0,3,3927),(3960,'San Juan de Miraflores','33','San Juan de Miraflores, Lima','san juan de miraflores lima',0,3,3927),(3961,'San Luis','34','San Luis, Lima','san luis lima',0,3,3927),(3962,'San Martin de Porres','35','San Martin de Porres, Lima','san martin de porres lima',0,3,3927),(3963,'San Miguel','36','San Miguel, Lima','san miguel lima',0,3,3927),(3964,'Santa Anita','37','Santa Anita, Lima','santa anita lima',0,3,3927),(3965,'Santa Maria del Mar','38','Santa Maria del Mar, Lima','santa maria del mar lima',0,3,3927),(3966,'Santa Rosa','39','Santa Rosa, Lima','santa rosa lima',0,3,3927),(3967,'Santiago de Surco','40','Santiago de Surco, Lima','santiago de surco lima',0,3,3927),(3968,'Surquillo','41','Surquillo, Lima','surquillo lima',0,3,3927),(3969,'Villa El Salvador','42','Villa El Salvador, Lima','villa el salvador lima',0,3,3927),(3970,'Villa Maria del Triunfo','43','Villa Maria del Triunfo, Lima','villa maria del triunfo lima',0,3,3927),(3971,'Barranca','02','Barranca, Lima','barranca lima',5,2,3926),(3972,'Barranca','01','Barranca, Barranca','barranca barranca',0,3,3971),(3973,'Paramonga','02','Paramonga, Barranca','paramonga barranca',0,3,3971),(3974,'Pativilca','03','Pativilca, Barranca','pativilca barranca',0,3,3971),(3975,'Supe','04','Supe, Barranca','supe barranca',0,3,3971),(3976,'Supe Puerto','05','Supe Puerto, Barranca','supe puerto barranca',0,3,3971),(3977,'Cajatambo','03','Cajatambo, Lima','cajatambo lima',5,2,3926),(3978,'Cajatambo','01','Cajatambo, Cajatambo','cajatambo cajatambo',0,3,3977),(3979,'Copa','02','Copa, Cajatambo','copa cajatambo',0,3,3977),(3980,'Gorgor','03','Gorgor, Cajatambo','gorgor cajatambo',0,3,3977),(3981,'Huancapon','04','Huancapon, Cajatambo','huancapon cajatambo',0,3,3977),(3982,'Manas','05','Manas, Cajatambo','manas cajatambo',0,3,3977),(3983,'Canta','04','Canta, Lima','canta lima',7,2,3926),(3984,'Canta','01','Canta, Canta','canta canta',0,3,3983),(3985,'Arahuay','02','Arahuay, Canta','arahuay canta',0,3,3983),(3986,'Huamantanga','03','Huamantanga, Canta','huamantanga canta',0,3,3983),(3987,'Huaros','04','Huaros, Canta','huaros canta',0,3,3983),(3988,'Lachaqui','05','Lachaqui, Canta','lachaqui canta',0,3,3983),(3989,'San Buenaventura','06','San Buenaventura, Canta','san buenaventura canta',0,3,3983),(3990,'Santa Rosa de Quives','07','Santa Rosa de Quives, Canta','santa rosa de quives canta',0,3,3983),(3991,'Cañete','05','Cañete, Lima','cañete lima',16,2,3926),(3992,'San Vicente de Cañete','01','San Vicente de Cañete, Cañete','san vicente de cañete cañete',0,3,3991),(3993,'Asia','02','Asia, Caqete','asia caqete',0,3,3991),(3994,'Calango','03','Calango, Caqete','calango caqete',0,3,3991),(3995,'Cerro Azul','04','Cerro Azul, Caqete','cerro azul caqete',0,3,3991),(3996,'Chilca','05','Chilca, Caqete','chilca caqete',0,3,3991),(3997,'Coayllo','06','Coayllo, Caqete','coayllo caqete',0,3,3991),(3998,'Imperial','07','Imperial, Caqete','imperial caqete',0,3,3991),(3999,'Lunahuana','08','Lunahuana, Caqete','lunahuana caqete',0,3,3991),(4000,'Mala','09','Mala, Caqete','mala caqete',0,3,3991),(4001,'Nuevo Imperial','10','Nuevo Imperial, Caqete','nuevo imperial caqete',0,3,3991),(4002,'Pacaran','11','Pacaran, Caqete','pacaran caqete',0,3,3991),(4003,'Quilmana','12','Quilmana, Caqete','quilmana caqete',0,3,3991),(4004,'San Antonio','13','San Antonio, Caqete','san antonio caqete',0,3,3991),(4005,'San Luis','14','San Luis, Caqete','san luis caqete',0,3,3991),(4006,'Santa Cruz de Flores','15','Santa Cruz de Flores, Caqete','santa cruz de flores caqete',0,3,3991),(4007,'Zuqiga','16','Zuqiga, Caqete','zuqiga caqete',0,3,3991),(4008,'Huaral','06','Huaral, Lima','huaral lima',12,2,3926),(4009,'Huaral','01','Huaral, Huaral','huaral huaral',0,3,4008),(4010,'Atavillos Alto','02','Atavillos Alto, Huaral','atavillos alto huaral',0,3,4008),(4011,'Atavillos Bajo','03','Atavillos Bajo, Huaral','atavillos bajo huaral',0,3,4008),(4012,'Aucallama','04','Aucallama, Huaral','aucallama huaral',0,3,4008),(4013,'Chancay','05','Chancay, Huaral','chancay huaral',0,3,4008),(4014,'Ihuari','06','Ihuari, Huaral','ihuari huaral',0,3,4008),(4015,'Lampian','07','Lampian, Huaral','lampian huaral',0,3,4008),(4016,'Pacaraos','08','Pacaraos, Huaral','pacaraos huaral',0,3,4008),(4017,'San Miguel de Acos','09','San Miguel de Acos, Huaral','san miguel de acos huaral',0,3,4008),(4018,'Santa Cruz de Andamarca','10','Santa Cruz de Andamarca, Huaral','santa cruz de andamarca huaral',0,3,4008),(4019,'Sumbilca','11','Sumbilca, Huaral','sumbilca huaral',0,3,4008),(4020,'Veintisiete de Noviembre','12','Veintisiete de Noviembre, Huaral','veintisiete de noviembre huaral',0,3,4008),(4021,'Huarochiri','07','Huarochiri, Lima','huarochiri lima',32,2,3926),(4022,'Matucana','01','Matucana, Huarochiri','matucana huarochiri',0,3,4021),(4023,'Antioquia','02','Antioquia, Huarochiri','antioquia huarochiri',0,3,4021),(4024,'Callahuanca','03','Callahuanca, Huarochiri','callahuanca huarochiri',0,3,4021),(4025,'Carampoma','04','Carampoma, Huarochiri','carampoma huarochiri',0,3,4021),(4026,'Chicla','05','Chicla, Huarochiri','chicla huarochiri',0,3,4021),(4027,'Cuenca','06','Cuenca, Huarochiri','cuenca huarochiri',0,3,4021),(4028,'Huachupampa','07','Huachupampa, Huarochiri','huachupampa huarochiri',0,3,4021),(4029,'Huanza','08','Huanza, Huarochiri','huanza huarochiri',0,3,4021),(4030,'Huarochiri','09','Huarochiri, Huarochiri','huarochiri huarochiri',0,3,4021),(4031,'Lahuaytambo','10','Lahuaytambo, Huarochiri','lahuaytambo huarochiri',0,3,4021),(4032,'Langa','11','Langa, Huarochiri','langa huarochiri',0,3,4021),(4033,'Laraos','12','Laraos, Huarochiri','laraos huarochiri',0,3,4021),(4034,'Mariatana','13','Mariatana, Huarochiri','mariatana huarochiri',0,3,4021),(4035,'Ricardo Palma','14','Ricardo Palma, Huarochiri','ricardo palma huarochiri',0,3,4021),(4036,'San Andres de Tupicocha','15','San Andres de Tupicocha, Huarochiri','san andres de tupicocha huarochiri',0,3,4021),(4037,'San Antonio','16','San Antonio, Huarochiri','san antonio huarochiri',0,3,4021),(4038,'San Bartolome','17','San Bartolome, Huarochiri','san bartolome huarochiri',0,3,4021),(4039,'San Damian','18','San Damian, Huarochiri','san damian huarochiri',0,3,4021),(4040,'San Juan de Iris','19','San Juan de Iris, Huarochiri','san juan de iris huarochiri',0,3,4021),(4041,'San Juan de Tantaranche','20','San Juan de Tantaranche, Huarochiri','san juan de tantaranche huarochiri',0,3,4021),(4042,'San Lorenzo de Quinti','21','San Lorenzo de Quinti, Huarochiri','san lorenzo de quinti huarochiri',0,3,4021),(4043,'San Mateo','22','San Mateo, Huarochiri','san mateo huarochiri',0,3,4021),(4044,'San Mateo de Otao','23','San Mateo de Otao, Huarochiri','san mateo de otao huarochiri',0,3,4021),(4045,'San Pedro de Casta','24','San Pedro de Casta, Huarochiri','san pedro de casta huarochiri',0,3,4021),(4046,'San Pedro de Huancayre','25','San Pedro de Huancayre, Huarochiri','san pedro de huancayre huarochiri',0,3,4021),(4047,'Sangallaya','26','Sangallaya, Huarochiri','sangallaya huarochiri',0,3,4021),(4048,'Santa Cruz de Cocachacra','27','Santa Cruz de Cocachacra, Huarochiri','santa cruz de cocachacra huarochiri',0,3,4021),(4049,'Santa Eulalia','28','Santa Eulalia, Huarochiri','santa eulalia huarochiri',0,3,4021),(4050,'Santiago de Anchucaya','29','Santiago de Anchucaya, Huarochiri','santiago de anchucaya huarochiri',0,3,4021),(4051,'Santiago de Tuna','30','Santiago de Tuna, Huarochiri','santiago de tuna huarochiri',0,3,4021),(4052,'Santo Domingo de los Olleros','31','Santo Domingo de los Olleros, Huarochiri','santo domingo de los olleros huarochiri',0,3,4021),(4053,'Surco','32','Surco, Huarochiri','surco huarochiri',0,3,4021),(4054,'Huaura','08','Huaura, Lima','huaura lima',12,2,3926),(4055,'Huacho','01','Huacho, Huaura','huacho huaura',0,3,4054),(4056,'Ambar','02','Ambar, Huaura','ambar huaura',0,3,4054),(4057,'Caleta de Carquin','03','Caleta de Carquin, Huaura','caleta de carquin huaura',0,3,4054),(4058,'Checras','04','Checras, Huaura','checras huaura',0,3,4054),(4059,'Hualmay','05','Hualmay, Huaura','hualmay huaura',0,3,4054),(4060,'Huaura','06','Huaura, Huaura','huaura huaura',0,3,4054),(4061,'Leoncio Prado','07','Leoncio Prado, Huaura','leoncio prado huaura',0,3,4054),(4062,'Paccho','08','Paccho, Huaura','paccho huaura',0,3,4054),(4063,'Santa Leonor','09','Santa Leonor, Huaura','santa leonor huaura',0,3,4054),(4064,'Santa Maria','10','Santa Maria, Huaura','santa maria huaura',0,3,4054),(4065,'Sayan','11','Sayan, Huaura','sayan huaura',0,3,4054),(4066,'Vegueta','12','Vegueta, Huaura','vegueta huaura',0,3,4054),(4067,'Oyon','09','Oyon, Lima','oyon lima',6,2,3926),(4068,'Oyon','01','Oyon, Oyon','oyon oyon',0,3,4067),(4069,'Andajes','02','Andajes, Oyon','andajes oyon',0,3,4067),(4070,'Caujul','03','Caujul, Oyon','caujul oyon',0,3,4067),(4071,'Cochamarca','04','Cochamarca, Oyon','cochamarca oyon',0,3,4067),(4072,'Navan','05','Navan, Oyon','navan oyon',0,3,4067),(4073,'Pachangara','06','Pachangara, Oyon','pachangara oyon',0,3,4067),(4074,'Yauyos','10','Yauyos, Lima','yauyos lima',33,2,3926),(4075,'Yauyos','01','Yauyos, Yauyos','yauyos yauyos',0,3,4074),(4076,'Alis','02','Alis, Yauyos','alis yauyos',0,3,4074),(4077,'Ayauca','03','Ayauca, Yauyos','ayauca yauyos',0,3,4074),(4078,'Ayaviri','04','Ayaviri, Yauyos','ayaviri yauyos',0,3,4074),(4079,'Azangaro','05','Azangaro, Yauyos','azangaro yauyos',0,3,4074),(4080,'Cacra','06','Cacra, Yauyos','cacra yauyos',0,3,4074),(4081,'Carania','07','Carania, Yauyos','carania yauyos',0,3,4074),(4082,'Catahuasi','08','Catahuasi, Yauyos','catahuasi yauyos',0,3,4074),(4083,'Chocos','09','Chocos, Yauyos','chocos yauyos',0,3,4074),(4084,'Cochas','10','Cochas, Yauyos','cochas yauyos',0,3,4074),(4085,'Colonia','11','Colonia, Yauyos','colonia yauyos',0,3,4074),(4086,'Hongos','12','Hongos, Yauyos','hongos yauyos',0,3,4074),(4087,'Huampara','13','Huampara, Yauyos','huampara yauyos',0,3,4074),(4088,'Huancaya','14','Huancaya, Yauyos','huancaya yauyos',0,3,4074),(4089,'Huangascar','15','Huangascar, Yauyos','huangascar yauyos',0,3,4074),(4090,'Huantan','16','Huantan, Yauyos','huantan yauyos',0,3,4074),(4091,'Huaqec','17','Huaqec, Yauyos','huaqec yauyos',0,3,4074),(4092,'Laraos','18','Laraos, Yauyos','laraos yauyos',0,3,4074),(4093,'Lincha','19','Lincha, Yauyos','lincha yauyos',0,3,4074),(4094,'Madean','20','Madean, Yauyos','madean yauyos',0,3,4074),(4095,'Miraflores','21','Miraflores, Yauyos','miraflores yauyos',0,3,4074),(4096,'Omas','22','Omas, Yauyos','omas yauyos',0,3,4074),(4097,'Putinza','23','Putinza, Yauyos','putinza yauyos',0,3,4074),(4098,'Quinches','24','Quinches, Yauyos','quinches yauyos',0,3,4074),(4099,'Quinocay','25','Quinocay, Yauyos','quinocay yauyos',0,3,4074),(4100,'San Joaquin','26','San Joaquin, Yauyos','san joaquin yauyos',0,3,4074),(4101,'San Pedro de Pilas','27','San Pedro de Pilas, Yauyos','san pedro de pilas yauyos',0,3,4074),(4102,'Tanta','28','Tanta, Yauyos','tanta yauyos',0,3,4074),(4103,'Tauripampa','29','Tauripampa, Yauyos','tauripampa yauyos',0,3,4074),(4104,'Tomas','30','Tomas, Yauyos','tomas yauyos',0,3,4074),(4105,'Tupe','31','Tupe, Yauyos','tupe yauyos',0,3,4074),(4106,'Viqac','32','Viqac, Yauyos','viqac yauyos',0,3,4074),(4107,'Vitis','33','Vitis, Yauyos','vitis yauyos',0,3,4074),(4108,'Loreto','16','Loreto, Perú','loreto perú',6,1,2533),(4109,'Maynas','01','Maynas, Loreto','maynas loreto',13,2,4108),(4110,'Iquitos','01','Iquitos, Maynas','iquitos maynas',0,3,4109),(4111,'Alto Nanay','02','Alto Nanay, Maynas','alto nanay maynas',0,3,4109),(4112,'Fernando Lores','03','Fernando Lores, Maynas','fernando lores maynas',0,3,4109),(4113,'Indiana','04','Indiana, Maynas','indiana maynas',0,3,4109),(4114,'Las Amazonas','05','Las Amazonas, Maynas','las amazonas maynas',0,3,4109),(4115,'Mazan','06','Mazan, Maynas','mazan maynas',0,3,4109),(4116,'Napo','07','Napo, Maynas','napo maynas',0,3,4109),(4117,'Punchana','08','Punchana, Maynas','punchana maynas',0,3,4109),(4118,'Putumayo','09','Putumayo, Maynas','putumayo maynas',0,3,4109),(4119,'Torres Causana','10','Torres Causana, Maynas','torres causana maynas',0,3,4109),(4120,'Yaquerana','11','Yaquerana, Maynas','yaquerana maynas',0,3,4109),(4121,'Belén','12','Belén, Maynas','belén maynas',0,3,4109),(4122,'San Juan Bautista','13','San Juan Bautista, Maynas','san juan bautista maynas',0,3,4109),(4123,'Alto Amazonas','02','Alto Amazonas, Loreto','alto amazonas loreto',11,2,4108),(4124,'Yurimaguas','01','Yurimaguas, Alto Amazonas','yurimaguas alto amazonas',0,3,4123),(4125,'Balsapuerto','02','Balsapuerto, Alto Amazonas','balsapuerto alto amazonas',0,3,4123),(4126,'Barranca','03','Barranca, Alto Amazonas','barranca alto amazonas',0,3,4123),(4127,'Cahuapanas','04','Cahuapanas, Alto Amazonas','cahuapanas alto amazonas',0,3,4123),(4128,'Jeberos','05','Jeberos, Alto Amazonas','jeberos alto amazonas',0,3,4123),(4129,'Lagunas','06','Lagunas, Alto Amazonas','lagunas alto amazonas',0,3,4123),(4130,'Manseriche','07','Manseriche, Alto Amazonas','manseriche alto amazonas',0,3,4123),(4131,'Morona','08','Morona, Alto Amazonas','morona alto amazonas',0,3,4123),(4132,'Pastaza','09','Pastaza, Alto Amazonas','pastaza alto amazonas',0,3,4123),(4133,'Santa Cruz','10','Santa Cruz, Alto Amazonas','santa cruz alto amazonas',0,3,4123),(4134,'Teniente Cesar Lopez Rojas','11','Teniente Cesar Lopez Rojas, Alto Amazonas','teniente cesar lopez rojas alto amazonas',0,3,4123),(4135,'Loreto','03','Loreto, Loreto','loreto loreto',5,2,4108),(4136,'Nauta','01','Nauta, Loreto','nauta loreto',0,3,4135),(4137,'Parinari','02','Parinari, Loreto','parinari loreto',0,3,4135),(4138,'Tigre','03','Tigre, Loreto','tigre loreto',0,3,4135),(4139,'Trompeteros','04','Trompeteros, Loreto','trompeteros loreto',0,3,4135),(4140,'Urarinas','05','Urarinas, Loreto','urarinas loreto',0,3,4135),(4141,'Mariscal Ramon Castilla','04','Mariscal Ramon Castilla, Loreto','mariscal ramon castilla loreto',4,2,4108),(4142,'Ramon Castilla','01','Ramon Castilla, Mariscal Ramon Castilla','ramon castilla mariscal ramon castilla',0,3,4141),(4143,'Pebas','02','Pebas, Mariscal Ramon Castilla','pebas mariscal ramon castilla',0,3,4141),(4144,'Yavari','03','Yavari, Mariscal Ramon Castilla','yavari mariscal ramon castilla',0,3,4141),(4145,'San Pablo','04','San Pablo, Mariscal Ramon Castilla','san pablo mariscal ramon castilla',0,3,4141),(4146,'Requena','05','Requena, Loreto','requena loreto',11,2,4108),(4147,'Requena','01','Requena, Requena','requena requena',0,3,4146),(4148,'Alto Tapiche','02','Alto Tapiche, Requena','alto tapiche requena',0,3,4146),(4149,'Capelo','03','Capelo, Requena','capelo requena',0,3,4146),(4150,'Emilio San Martin','04','Emilio San Martin, Requena','emilio san martin requena',0,3,4146),(4151,'Maquia','05','Maquia, Requena','maquia requena',0,3,4146),(4152,'Puinahua','06','Puinahua, Requena','puinahua requena',0,3,4146),(4153,'Saquena','07','Saquena, Requena','saquena requena',0,3,4146),(4154,'Soplin','08','Soplin, Requena','soplin requena',0,3,4146),(4155,'Tapiche','09','Tapiche, Requena','tapiche requena',0,3,4146),(4156,'Jenaro Herrera','10','Jenaro Herrera, Requena','jenaro herrera requena',0,3,4146),(4157,'Yaquerana','11','Yaquerana, Requena','yaquerana requena',0,3,4146),(4158,'Ucayali','06','Ucayali, Loreto','ucayali loreto',6,2,4108),(4159,'Contamana','01','Contamana, Ucayali','contamana ucayali',0,3,4158),(4160,'Inahuaya','02','Inahuaya, Ucayali','inahuaya ucayali',0,3,4158),(4161,'Padre Marquez','03','Padre Marquez, Ucayali','padre marquez ucayali',0,3,4158),(4162,'Pampa Hermosa','04','Pampa Hermosa, Ucayali','pampa hermosa ucayali',0,3,4158),(4163,'Sarayacu','05','Sarayacu, Ucayali','sarayacu ucayali',0,3,4158),(4164,'Vargas Guerra','06','Vargas Guerra, Ucayali','vargas guerra ucayali',0,3,4158),(4165,'Madre de Dios','17','Madre de Dios, Perú','madre de dios perú',3,1,2533),(4166,'Tambopata','01','Tambopata, Madre de Dios','tambopata madre de dios',4,2,4165),(4167,'Tambopata','01','Tambopata, Tambopata','tambopata tambopata',0,3,4166),(4168,'Inambari','02','Inambari, Tambopata','inambari tambopata',0,3,4166),(4169,'Las Piedras','03','Las Piedras, Tambopata','las piedras tambopata',0,3,4166),(4170,'Laberinto','04','Laberinto, Tambopata','laberinto tambopata',0,3,4166),(4171,'Manu','02','Manu, Madre de Dios','manu madre de dios',4,2,4165),(4172,'Manu','01','Manu, Manu','manu manu',0,3,4171),(4173,'Fitzcarrald','02','Fitzcarrald, Manu','fitzcarrald manu',0,3,4171),(4174,'Madre de Dios','03','Madre de Dios, Manu','madre de dios manu',0,3,4171),(4175,'Huepetuhe','04','Huepetuhe, Manu','huepetuhe manu',0,3,4171),(4176,'Tahuamanu','03','Tahuamanu, Madre de Dios','tahuamanu madre de dios',3,2,4165),(4177,'Iqapari','01','Iqapari, Tahuamanu','iqapari tahuamanu',0,3,4176),(4178,'Iberia','02','Iberia, Tahuamanu','iberia tahuamanu',0,3,4176),(4179,'Tahuamanu','03','Tahuamanu, Tahuamanu','tahuamanu tahuamanu',0,3,4176),(4180,'Moquegua','18','Moquegua, Perú','moquegua perú',3,1,2533),(4181,'Mariscal Nieto','01','Mariscal Nieto, Moquegua','mariscal nieto moquegua',6,2,4180),(4182,'Moquegua','01','Moquegua, Mariscal Nieto','moquegua mariscal nieto',0,3,4181),(4183,'Carumas','02','Carumas, Mariscal Nieto','carumas mariscal nieto',0,3,4181),(4184,'Cuchumbaya','03','Cuchumbaya, Mariscal Nieto','cuchumbaya mariscal nieto',0,3,4181),(4185,'Samegua','04','Samegua, Mariscal Nieto','samegua mariscal nieto',0,3,4181),(4186,'San Cristobal','05','San Cristobal, Mariscal Nieto','san cristobal mariscal nieto',0,3,4181),(4187,'Torata','06','Torata, Mariscal Nieto','torata mariscal nieto',0,3,4181),(4188,'General Sanchez Cerro','02','General Sanchez Cerro, Moquegua','general sanchez cerro moquegua',11,2,4180),(4189,'Omate','01','Omate, General Sanchez Cerro','omate general sanchez cerro',0,3,4188),(4190,'Chojata','02','Chojata, General Sanchez Cerro','chojata general sanchez cerro',0,3,4188),(4191,'Coalaque','03','Coalaque, General Sanchez Cerro','coalaque general sanchez cerro',0,3,4188),(4192,'Ichuqa','04','Ichuqa, General Sanchez Cerro','ichuqa general sanchez cerro',0,3,4188),(4193,'La Capilla','05','La Capilla, General Sanchez Cerro','la capilla general sanchez cerro',0,3,4188),(4194,'Lloque','06','Lloque, General Sanchez Cerro','lloque general sanchez cerro',0,3,4188),(4195,'Matalaque','07','Matalaque, General Sanchez Cerro','matalaque general sanchez cerro',0,3,4188),(4196,'Puquina','08','Puquina, General Sanchez Cerro','puquina general sanchez cerro',0,3,4188),(4197,'Quinistaquillas','09','Quinistaquillas, General Sanchez Cerro','quinistaquillas general sanchez cerro',0,3,4188),(4198,'Ubinas','10','Ubinas, General Sanchez Cerro','ubinas general sanchez cerro',0,3,4188),(4199,'Yunga','11','Yunga, General Sanchez Cerro','yunga general sanchez cerro',0,3,4188),(4200,'Ilo','03','Ilo, Moquegua','ilo moquegua',3,2,4180),(4201,'Ilo','01','Ilo, Ilo','ilo ilo',0,3,4200),(4202,'El Algarrobal','02','El Algarrobal, Ilo','el algarrobal ilo',0,3,4200),(4203,'Pacocha','03','Pacocha, Ilo','pacocha ilo',0,3,4200),(4204,'Pasco','19','Pasco, Perú','pasco perú',3,1,2533),(4205,'Pasco','01','Pasco, Pasco','pasco pasco',13,2,4204),(4206,'Chaupimarca','01','Chaupimarca, Pasco','chaupimarca pasco',0,3,4205),(4207,'Huachon','02','Huachon, Pasco','huachon pasco',0,3,4205),(4208,'Huariaca','03','Huariaca, Pasco','huariaca pasco',0,3,4205),(4209,'Huayllay','04','Huayllay, Pasco','huayllay pasco',0,3,4205),(4210,'Ninacaca','05','Ninacaca, Pasco','ninacaca pasco',0,3,4205),(4211,'Pallanchacra','06','Pallanchacra, Pasco','pallanchacra pasco',0,3,4205),(4212,'Paucartambo','07','Paucartambo, Pasco','paucartambo pasco',0,3,4205),(4213,'San Fco.De Asis de Yarusyacan','08','San Fco.De Asis de Yarusyacan, Pasco','san fco.de asis de yarusyacan pasco',0,3,4205),(4214,'Simon Bolivar','09','Simon Bolivar, Pasco','simon bolivar pasco',0,3,4205),(4215,'Ticlacayan','10','Ticlacayan, Pasco','ticlacayan pasco',0,3,4205),(4216,'Tinyahuarco','11','Tinyahuarco, Pasco','tinyahuarco pasco',0,3,4205),(4217,'Vicco','12','Vicco, Pasco','vicco pasco',0,3,4205),(4218,'Yanacancha','13','Yanacancha, Pasco','yanacancha pasco',0,3,4205),(4219,'Daniel Alcides Carrion','02','Daniel Alcides Carrion, Pasco','daniel alcides carrion pasco',8,2,4204),(4220,'Yanahuanca','01','Yanahuanca, Daniel Alcides Carrion','yanahuanca daniel alcides carrion',0,3,4219),(4221,'Chacayan','02','Chacayan, Daniel Alcides Carrion','chacayan daniel alcides carrion',0,3,4219),(4222,'Goyllarisquizga','03','Goyllarisquizga, Daniel Alcides Carrion','goyllarisquizga daniel alcides carrion',0,3,4219),(4223,'Paucar','04','Paucar, Daniel Alcides Carrion','paucar daniel alcides carrion',0,3,4219),(4224,'San Pedro de Pillao','05','San Pedro de Pillao, Daniel Alcides Carrion','san pedro de pillao daniel alcides carrion',0,3,4219),(4225,'Santa Ana de Tusi','06','Santa Ana de Tusi, Daniel Alcides Carrion','santa ana de tusi daniel alcides carrion',0,3,4219),(4226,'Tapuc','07','Tapuc, Daniel Alcides Carrion','tapuc daniel alcides carrion',0,3,4219),(4227,'Vilcabamba','08','Vilcabamba, Daniel Alcides Carrion','vilcabamba daniel alcides carrion',0,3,4219),(4228,'Oxapampa','03','Oxapampa, Pasco','oxapampa pasco',7,2,4204),(4229,'Oxapampa','01','Oxapampa, Oxapampa','oxapampa oxapampa',0,3,4228),(4230,'Chontabamba','02','Chontabamba, Oxapampa','chontabamba oxapampa',0,3,4228),(4231,'Huancabamba','03','Huancabamba, Oxapampa','huancabamba oxapampa',0,3,4228),(4232,'Palcazu','04','Palcazu, Oxapampa','palcazu oxapampa',0,3,4228),(4233,'Pozuzo','05','Pozuzo, Oxapampa','pozuzo oxapampa',0,3,4228),(4234,'Puerto Bermudez','06','Puerto Bermudez, Oxapampa','puerto bermudez oxapampa',0,3,4228),(4235,'Villa Rica','07','Villa Rica, Oxapampa','villa rica oxapampa',0,3,4228),(4236,'Piura','20','Piura, Perú','piura perú',8,1,2533),(4237,'Piura','01','Piura, Piura, Piura','piura piura piura',9,2,4236),(4238,'Piura','01','Piura, Piura','piura piura',0,3,4237),(4239,'Castilla','04','Castilla, Piura','castilla piura',0,3,4237),(4240,'Catacaos','05','Catacaos, Piura','catacaos piura',0,3,4237),(4241,'Cura Mori','07','Cura Mori, Piura','cura mori piura',0,3,4237),(4242,'El Tallan','08','El Tallan, Piura','el tallan piura',0,3,4237),(4243,'La Arena','09','La Arena, Piura','la arena piura',0,3,4237),(4244,'La Union','10','La Union, Piura','la union piura',0,3,4237),(4245,'Las Lomas','11','Las Lomas, Piura','las lomas piura',0,3,4237),(4246,'Tambo Grande','14','Tambo Grande, Piura','tambo grande piura',0,3,4237),(4247,'Ayabaca','02','Ayabaca, Piura','ayabaca piura',10,2,4236),(4248,'Ayabaca','01','Ayabaca, Ayabaca','ayabaca ayabaca',0,3,4247),(4249,'Frias','02','Frias, Ayabaca','frias ayabaca',0,3,4247),(4250,'Jilili','03','Jilili, Ayabaca','jilili ayabaca',0,3,4247),(4251,'Lagunas','04','Lagunas, Ayabaca','lagunas ayabaca',0,3,4247),(4252,'Montero','05','Montero, Ayabaca','montero ayabaca',0,3,4247),(4253,'Pacaipampa','06','Pacaipampa, Ayabaca','pacaipampa ayabaca',0,3,4247),(4254,'Paimas','07','Paimas, Ayabaca','paimas ayabaca',0,3,4247),(4255,'Sapillica','08','Sapillica, Ayabaca','sapillica ayabaca',0,3,4247),(4256,'Sicchez','09','Sicchez, Ayabaca','sicchez ayabaca',0,3,4247),(4257,'Suyo','10','Suyo, Ayabaca','suyo ayabaca',0,3,4247),(4258,'Huancabamba','03','Huancabamba, Piura','huancabamba piura',8,2,4236),(4259,'Huancabamba','01','Huancabamba, Huancabamba','huancabamba huancabamba',0,3,4258),(4260,'Canchaque','02','Canchaque, Huancabamba','canchaque huancabamba',0,3,4258),(4261,'El Carmen de la Frontera','03','El Carmen de la Frontera, Huancabamba','el carmen de la frontera huancabamba',0,3,4258),(4262,'Huarmaca','04','Huarmaca, Huancabamba','huarmaca huancabamba',0,3,4258),(4263,'Lalaquiz','05','Lalaquiz, Huancabamba','lalaquiz huancabamba',0,3,4258),(4264,'San Miguel de El Faique','06','San Miguel de El Faique, Huancabamba','san miguel de el faique huancabamba',0,3,4258),(4265,'Sondor','07','Sondor, Huancabamba','sondor huancabamba',0,3,4258),(4266,'Sondorillo','08','Sondorillo, Huancabamba','sondorillo huancabamba',0,3,4258),(4267,'Morropon','04','Morropon, Piura','morropon piura',10,2,4236),(4268,'Chulucanas','01','Chulucanas, Morropon','chulucanas morropon',0,3,4267),(4269,'Buenos Aires','02','Buenos Aires, Morropon','buenos aires morropon',0,3,4267),(4270,'Chalaco','03','Chalaco, Morropon','chalaco morropon',0,3,4267),(4271,'La Matanza','04','La Matanza, Morropon','la matanza morropon',0,3,4267),(4272,'Morropon','05','Morropon, Morropon','morropon morropon',0,3,4267),(4273,'Salitral','06','Salitral, Morropon','salitral morropon',0,3,4267),(4274,'San Juan de Bigote','07','San Juan de Bigote, Morropon','san juan de bigote morropon',0,3,4267),(4275,'Santa Catalina de Mossa','08','Santa Catalina de Mossa, Morropon','santa catalina de mossa morropon',0,3,4267),(4276,'Santo Domingo','09','Santo Domingo, Morropon','santo domingo morropon',0,3,4267),(4277,'Yamango','10','Yamango, Morropon','yamango morropon',0,3,4267),(4278,'Paita','05','Paita, Piura','paita piura',7,2,4236),(4279,'Paita','01','Paita, Paita','paita paita',0,3,4278),(4280,'Amotape','02','Amotape, Paita','amotape paita',0,3,4278),(4281,'Arenal','03','Arenal, Paita','arenal paita',0,3,4278),(4282,'Colan','04','Colan, Paita','colan paita',0,3,4278),(4283,'La Huaca','05','La Huaca, Paita','la huaca paita',0,3,4278),(4284,'Tamarindo','06','Tamarindo, Paita','tamarindo paita',0,3,4278),(4285,'Vichayal','07','Vichayal, Paita','vichayal paita',0,3,4278),(4286,'Sullana','06','Sullana, Piura','sullana piura',8,2,4236),(4287,'Sullana','01','Sullana, Sullana','sullana sullana',0,3,4286),(4288,'Bellavista','02','Bellavista, Sullana','bellavista sullana',0,3,4286),(4289,'Ignacio Escudero','03','Ignacio Escudero, Sullana','ignacio escudero sullana',0,3,4286),(4290,'Lancones','04','Lancones, Sullana','lancones sullana',0,3,4286),(4291,'Marcavelica','05','Marcavelica, Sullana','marcavelica sullana',0,3,4286),(4292,'Miguel Checa','06','Miguel Checa, Sullana','miguel checa sullana',0,3,4286),(4293,'Querecotillo','07','Querecotillo, Sullana','querecotillo sullana',0,3,4286),(4294,'Salitral','08','Salitral, Sullana','salitral sullana',0,3,4286),(4295,'Talara','07','Talara, Piura','talara piura',6,2,4236),(4296,'Pariqas','01','Pariqas, Talara','pariqas talara',0,3,4295),(4297,'El Alto','02','El Alto, Talara','el alto talara',0,3,4295),(4298,'La Brea','03','La Brea, Talara','la brea talara',0,3,4295),(4299,'Lobitos','04','Lobitos, Talara','lobitos talara',0,3,4295),(4300,'Los Organos','05','Los Organos, Talara','los organos talara',0,3,4295),(4301,'Mancora','06','Mancora, Talara','mancora talara',0,3,4295),(4302,'Sechura','08','Sechura, Piura','sechura piura',6,2,4236),(4303,'Sechura','01','Sechura, Sechura','sechura sechura',0,3,4302),(4304,'Bellavista de la Union','02','Bellavista de la Union, Sechura','bellavista de la union sechura',0,3,4302),(4305,'Bernal','03','Bernal, Sechura','bernal sechura',0,3,4302),(4306,'Cristo Nos Valga','04','Cristo Nos Valga, Sechura','cristo nos valga sechura',0,3,4302),(4307,'Vice','05','Vice, Sechura','vice sechura',0,3,4302),(4308,'Rinconada Llicuar','06','Rinconada Llicuar, Sechura','rinconada llicuar sechura',0,3,4302),(4309,'Puno','21','Puno, Perú','puno perú',13,1,2533),(4310,'Puno','01','Puno, Puno, Puno','puno puno puno',15,2,4309),(4311,'Puno','01','Puno, Puno','puno puno',0,3,4310),(4312,'Acora','02','Acora, Puno','acora puno',0,3,4310),(4313,'Amantani','03','Amantani, Puno','amantani puno',0,3,4310),(4314,'Atuncolla','04','Atuncolla, Puno','atuncolla puno',0,3,4310),(4315,'Capachica','05','Capachica, Puno','capachica puno',0,3,4310),(4316,'Chucuito','06','Chucuito, Puno','chucuito puno',0,3,4310),(4317,'Coata','07','Coata, Puno','coata puno',0,3,4310),(4318,'Huata','08','Huata, Puno','huata puno',0,3,4310),(4319,'Maqazo','09','Maqazo, Puno','maqazo puno',0,3,4310),(4320,'Paucarcolla','10','Paucarcolla, Puno','paucarcolla puno',0,3,4310),(4321,'Pichacani','11','Pichacani, Puno','pichacani puno',0,3,4310),(4322,'Plateria','12','Plateria, Puno','plateria puno',0,3,4310),(4323,'San Antonio','13','San Antonio, Puno','san antonio puno',0,3,4310),(4324,'Tiquillaca','14','Tiquillaca, Puno','tiquillaca puno',0,3,4310),(4325,'Vilque','15','Vilque, Puno','vilque puno',0,3,4310),(4326,'Azangaro','02','Azangaro, Puno','azangaro puno',15,2,4309),(4327,'Azangaro','01','Azangaro, Azangaro','azangaro azangaro',0,3,4326),(4328,'Achaya','02','Achaya, Azangaro','achaya azangaro',0,3,4326),(4329,'Arapa','03','Arapa, Azangaro','arapa azangaro',0,3,4326),(4330,'Asillo','04','Asillo, Azangaro','asillo azangaro',0,3,4326),(4331,'Caminaca','05','Caminaca, Azangaro','caminaca azangaro',0,3,4326),(4332,'Chupa','06','Chupa, Azangaro','chupa azangaro',0,3,4326),(4333,'Jose Domingo Choquehuanca','07','Jose Domingo Choquehuanca, Azangaro','jose domingo choquehuanca azangaro',0,3,4326),(4334,'Muqani','08','Muqani, Azangaro','muqani azangaro',0,3,4326),(4335,'Potoni','09','Potoni, Azangaro','potoni azangaro',0,3,4326),(4336,'Saman','10','Saman, Azangaro','saman azangaro',0,3,4326),(4337,'San Anton','11','San Anton, Azangaro','san anton azangaro',0,3,4326),(4338,'San Jose','12','San Jose, Azangaro','san jose azangaro',0,3,4326),(4339,'San Juan de Salinas','13','San Juan de Salinas, Azangaro','san juan de salinas azangaro',0,3,4326),(4340,'Santiago de Pupuja','14','Santiago de Pupuja, Azangaro','santiago de pupuja azangaro',0,3,4326),(4341,'Tirapata','15','Tirapata, Azangaro','tirapata azangaro',0,3,4326),(4342,'Carabaya','03','Carabaya, Puno','carabaya puno',10,2,4309),(4343,'Macusani','01','Macusani, Carabaya','macusani carabaya',0,3,4342),(4344,'Ajoyani','02','Ajoyani, Carabaya','ajoyani carabaya',0,3,4342),(4345,'Ayapata','03','Ayapata, Carabaya','ayapata carabaya',0,3,4342),(4346,'Coasa','04','Coasa, Carabaya','coasa carabaya',0,3,4342),(4347,'Corani','05','Corani, Carabaya','corani carabaya',0,3,4342),(4348,'Crucero','06','Crucero, Carabaya','crucero carabaya',0,3,4342),(4349,'Ituata','07','Ituata, Carabaya','ituata carabaya',0,3,4342),(4350,'Ollachea','08','Ollachea, Carabaya','ollachea carabaya',0,3,4342),(4351,'San Gaban','09','San Gaban, Carabaya','san gaban carabaya',0,3,4342),(4352,'Usicayos','10','Usicayos, Carabaya','usicayos carabaya',0,3,4342),(4353,'Chucuito','04','Chucuito, Puno','chucuito puno',7,2,4309),(4354,'Juli','01','Juli, Chucuito','juli chucuito',0,3,4353),(4355,'Desaguadero','02','Desaguadero, Chucuito','desaguadero chucuito',0,3,4353),(4356,'Huacullani','03','Huacullani, Chucuito','huacullani chucuito',0,3,4353),(4357,'Kelluyo','04','Kelluyo, Chucuito','kelluyo chucuito',0,3,4353),(4358,'Pisacoma','05','Pisacoma, Chucuito','pisacoma chucuito',0,3,4353),(4359,'Pomata','06','Pomata, Chucuito','pomata chucuito',0,3,4353),(4360,'Zepita','07','Zepita, Chucuito','zepita chucuito',0,3,4353),(4361,'El Collao','05','El Collao, Puno','el collao puno',5,2,4309),(4362,'Ilave','01','Ilave, El Collao','ilave el collao',0,3,4361),(4363,'Capazo','02','Capazo, El Collao','capazo el collao',0,3,4361),(4364,'Pilcuyo','03','Pilcuyo, El Collao','pilcuyo el collao',0,3,4361),(4365,'Santa Rosa','04','Santa Rosa, El Collao','santa rosa el collao',0,3,4361),(4366,'Conduriri','05','Conduriri, El Collao','conduriri el collao',0,3,4361),(4367,'Huancane','06','Huancane, Puno','huancane puno',8,2,4309),(4368,'Huancane','01','Huancane, Huancane','huancane huancane',0,3,4367),(4369,'Cojata','02','Cojata, Huancane','cojata huancane',0,3,4367),(4370,'Huatasani','03','Huatasani, Huancane','huatasani huancane',0,3,4367),(4371,'Inchupalla','04','Inchupalla, Huancane','inchupalla huancane',0,3,4367),(4372,'Pusi','05','Pusi, Huancane','pusi huancane',0,3,4367),(4373,'Rosaspata','06','Rosaspata, Huancane','rosaspata huancane',0,3,4367),(4374,'Taraco','07','Taraco, Huancane','taraco huancane',0,3,4367),(4375,'Vilque Chico','08','Vilque Chico, Huancane','vilque chico huancane',0,3,4367),(4376,'Lampa','07','Lampa, Puno','lampa puno',10,2,4309),(4377,'Lampa','01','Lampa, Lampa','lampa lampa',0,3,4376),(4378,'Cabanilla','02','Cabanilla, Lampa','cabanilla lampa',0,3,4376),(4379,'Calapuja','03','Calapuja, Lampa','calapuja lampa',0,3,4376),(4380,'Nicasio','04','Nicasio, Lampa','nicasio lampa',0,3,4376),(4381,'Ocuviri','05','Ocuviri, Lampa','ocuviri lampa',0,3,4376),(4382,'Palca','06','Palca, Lampa','palca lampa',0,3,4376),(4383,'Paratia','07','Paratia, Lampa','paratia lampa',0,3,4376),(4384,'Pucara','08','Pucara, Lampa','pucara lampa',0,3,4376),(4385,'Santa Lucia','09','Santa Lucia, Lampa','santa lucia lampa',0,3,4376),(4386,'Vilavila','10','Vilavila, Lampa','vilavila lampa',0,3,4376),(4387,'Melgar','08','Melgar, Puno','melgar puno',9,2,4309),(4388,'Ayaviri','01','Ayaviri, Melgar','ayaviri melgar',0,3,4387),(4389,'Antauta','02','Antauta, Melgar','antauta melgar',0,3,4387),(4390,'Cupi','03','Cupi, Melgar','cupi melgar',0,3,4387),(4391,'Llalli','04','Llalli, Melgar','llalli melgar',0,3,4387),(4392,'Macari','05','Macari, Melgar','macari melgar',0,3,4387),(4393,'Nuqoa','06','Nuqoa, Melgar','nuqoa melgar',0,3,4387),(4394,'Orurillo','07','Orurillo, Melgar','orurillo melgar',0,3,4387),(4395,'Santa Rosa','08','Santa Rosa, Melgar','santa rosa melgar',0,3,4387),(4396,'Umachiri','09','Umachiri, Melgar','umachiri melgar',0,3,4387),(4397,'Moho','09','Moho, Puno','moho puno',4,2,4309),(4398,'Moho','01','Moho, Moho','moho moho',0,3,4397),(4399,'Conima','02','Conima, Moho','conima moho',0,3,4397),(4400,'Huayrapata','03','Huayrapata, Moho','huayrapata moho',0,3,4397),(4401,'Tilali','04','Tilali, Moho','tilali moho',0,3,4397),(4402,'San Antonio de Putina','10','San Antonio de Putina, Puno','san antonio de putina puno',5,2,4309),(4403,'Putina','01','Putina, San Antonio de Putina','putina san antonio de putina',0,3,4402),(4404,'Ananea','02','Ananea, San Antonio de Putina','ananea san antonio de putina',0,3,4402),(4405,'Pedro Vilca Apaza','03','Pedro Vilca Apaza, San Antonio de Putina','pedro vilca apaza san antonio de putina',0,3,4402),(4406,'Quilcapuncu','04','Quilcapuncu, San Antonio de Putina','quilcapuncu san antonio de putina',0,3,4402),(4407,'Sina','05','Sina, San Antonio de Putina','sina san antonio de putina',0,3,4402),(4408,'San Roman','11','San Roman, Puno','san roman puno',4,2,4309),(4409,'Juliaca','01','Juliaca, San Roman','juliaca san roman',0,3,4408),(4410,'Cabana','02','Cabana, San Roman','cabana san roman',0,3,4408),(4411,'Cabanillas','03','Cabanillas, San Roman','cabanillas san roman',0,3,4408),(4412,'Caracoto','04','Caracoto, San Roman','caracoto san roman',0,3,4408),(4413,'Sandia','12','Sandia, Puno','sandia puno',9,2,4309),(4414,'Sandia','01','Sandia, Sandia','sandia sandia',0,3,4413),(4415,'Cuyocuyo','02','Cuyocuyo, Sandia','cuyocuyo sandia',0,3,4413),(4416,'Limbani','03','Limbani, Sandia','limbani sandia',0,3,4413),(4417,'Patambuco','04','Patambuco, Sandia','patambuco sandia',0,3,4413),(4418,'Phara','05','Phara, Sandia','phara sandia',0,3,4413),(4419,'Quiaca','06','Quiaca, Sandia','quiaca sandia',0,3,4413),(4420,'San Juan del Oro','07','San Juan del Oro, Sandia','san juan del oro sandia',0,3,4413),(4421,'Yanahuaya','08','Yanahuaya, Sandia','yanahuaya sandia',0,3,4413),(4422,'Alto Inambari','09','Alto Inambari, Sandia','alto inambari sandia',0,3,4413),(4423,'Yunguyo','13','Yunguyo, Puno','yunguyo puno',7,2,4309),(4424,'Yunguyo','01','Yunguyo, Yunguyo','yunguyo yunguyo',0,3,4423),(4425,'Anapia','02','Anapia, Yunguyo','anapia yunguyo',0,3,4423),(4426,'Copani','03','Copani, Yunguyo','copani yunguyo',0,3,4423),(4427,'Cuturapi','04','Cuturapi, Yunguyo','cuturapi yunguyo',0,3,4423),(4428,'Ollaraya','05','Ollaraya, Yunguyo','ollaraya yunguyo',0,3,4423),(4429,'Tinicachi','06','Tinicachi, Yunguyo','tinicachi yunguyo',0,3,4423),(4430,'Unicachi','07','Unicachi, Yunguyo','unicachi yunguyo',0,3,4423),(4431,'San Martin','22','San Martin, Perú','san martin perú',10,1,2533),(4432,'Moyobamba','01','Moyobamba, San Martin','moyobamba san martin',6,2,4431),(4433,'Moyobamba','01','Moyobamba, Moyobamba','moyobamba moyobamba',0,3,4432),(4434,'Calzada','02','Calzada, Moyobamba','calzada moyobamba',0,3,4432),(4435,'Habana','03','Habana, Moyobamba','habana moyobamba',0,3,4432),(4436,'Jepelacio','04','Jepelacio, Moyobamba','jepelacio moyobamba',0,3,4432),(4437,'Soritor','05','Soritor, Moyobamba','soritor moyobamba',0,3,4432),(4438,'Yantalo','06','Yantalo, Moyobamba','yantalo moyobamba',0,3,4432),(4439,'Bellavista','02','Bellavista, San Martin','bellavista san martin',6,2,4431),(4440,'Bellavista','01','Bellavista, Bellavista','bellavista bellavista',0,3,4439),(4441,'Alto Biavo','02','Alto Biavo, Bellavista','alto biavo bellavista',0,3,4439),(4442,'Bajo Biavo','03','Bajo Biavo, Bellavista','bajo biavo bellavista',0,3,4439),(4443,'Huallaga','04','Huallaga, Bellavista','huallaga bellavista',0,3,4439),(4444,'San Pablo','05','San Pablo, Bellavista','san pablo bellavista',0,3,4439),(4445,'San Rafael','06','San Rafael, Bellavista','san rafael bellavista',0,3,4439),(4446,'El Dorado','03','El Dorado, San Martin','el dorado san martin',5,2,4431),(4447,'San Jose de Sisa','01','San Jose de Sisa, El Dorado','san jose de sisa el dorado',0,3,4446),(4448,'Agua Blanca','02','Agua Blanca, El Dorado','agua blanca el dorado',0,3,4446),(4449,'San Martin','03','San Martin, El Dorado','san martin el dorado',0,3,4446),(4450,'Santa Rosa','04','Santa Rosa, El Dorado','santa rosa el dorado',0,3,4446),(4451,'Shatoja','05','Shatoja, El Dorado','shatoja el dorado',0,3,4446),(4452,'Huallaga','04','Huallaga, San Martin','huallaga san martin',6,2,4431),(4453,'Saposoa','01','Saposoa, Huallaga','saposoa huallaga',0,3,4452),(4454,'Alto Saposoa','02','Alto Saposoa, Huallaga','alto saposoa huallaga',0,3,4452),(4455,'El Eslabon','03','El Eslabon, Huallaga','el eslabon huallaga',0,3,4452),(4456,'Piscoyacu','04','Piscoyacu, Huallaga','piscoyacu huallaga',0,3,4452),(4457,'Sacanche','05','Sacanche, Huallaga','sacanche huallaga',0,3,4452),(4458,'Tingo de Saposoa','06','Tingo de Saposoa, Huallaga','tingo de saposoa huallaga',0,3,4452),(4459,'Lamas','05','Lamas, San Martin','lamas san martin',11,2,4431),(4460,'Lamas','01','Lamas, Lamas','lamas lamas',0,3,4459),(4461,'Alonso de Alvarado','02','Alonso de Alvarado, Lamas','alonso de alvarado lamas',0,3,4459),(4462,'Barranquita','03','Barranquita, Lamas','barranquita lamas',0,3,4459),(4463,'Caynarachi','04','Caynarachi, Lamas','caynarachi lamas',0,3,4459),(4464,'Cuqumbuqui','05','Cuqumbuqui, Lamas','cuqumbuqui lamas',0,3,4459),(4465,'Pinto Recodo','06','Pinto Recodo, Lamas','pinto recodo lamas',0,3,4459),(4466,'Rumisapa','07','Rumisapa, Lamas','rumisapa lamas',0,3,4459),(4467,'San Roque de Cumbaza','08','San Roque de Cumbaza, Lamas','san roque de cumbaza lamas',0,3,4459),(4468,'Shanao','09','Shanao, Lamas','shanao lamas',0,3,4459),(4469,'Tabalosos','10','Tabalosos, Lamas','tabalosos lamas',0,3,4459),(4470,'Zapatero','11','Zapatero, Lamas','zapatero lamas',0,3,4459),(4471,'Mariscal Caceres','06','Mariscal Caceres, San Martin','mariscal caceres san martin',5,2,4431),(4472,'Juanjui','01','Juanjui, Mariscal Caceres','juanjui mariscal caceres',0,3,4471),(4473,'Campanilla','02','Campanilla, Mariscal Caceres','campanilla mariscal caceres',0,3,4471),(4474,'Huicungo','03','Huicungo, Mariscal Caceres','huicungo mariscal caceres',0,3,4471),(4475,'Pachiza','04','Pachiza, Mariscal Caceres','pachiza mariscal caceres',0,3,4471),(4476,'Pajarillo','05','Pajarillo, Mariscal Caceres','pajarillo mariscal caceres',0,3,4471),(4477,'Picota','07','Picota, San Martin','picota san martin',10,2,4431),(4478,'Picota','01','Picota, Picota','picota picota',0,3,4477),(4479,'Buenos Aires','02','Buenos Aires, Picota','buenos aires picota',0,3,4477),(4480,'Caspisapa','03','Caspisapa, Picota','caspisapa picota',0,3,4477),(4481,'Pilluana','04','Pilluana, Picota','pilluana picota',0,3,4477),(4482,'Pucacaca','05','Pucacaca, Picota','pucacaca picota',0,3,4477),(4483,'San Cristobal','06','San Cristobal, Picota','san cristobal picota',0,3,4477),(4484,'San Hilarion','07','San Hilarion, Picota','san hilarion picota',0,3,4477),(4485,'Shamboyacu','08','Shamboyacu, Picota','shamboyacu picota',0,3,4477),(4486,'Tingo de Ponasa','09','Tingo de Ponasa, Picota','tingo de ponasa picota',0,3,4477),(4487,'Tres Unidos','10','Tres Unidos, Picota','tres unidos picota',0,3,4477),(4488,'Rioja','08','Rioja, San Martin','rioja san martin',9,2,4431),(4489,'Rioja','01','Rioja, Rioja','rioja rioja',0,3,4488),(4490,'Awajun','02','Awajun, Rioja','awajun rioja',0,3,4488),(4491,'Elias Soplin Vargas','03','Elias Soplin Vargas, Rioja','elias soplin vargas rioja',0,3,4488),(4492,'Nueva Cajamarca','04','Nueva Cajamarca, Rioja','nueva cajamarca rioja',0,3,4488),(4493,'Pardo Miguel','05','Pardo Miguel, Rioja','pardo miguel rioja',0,3,4488),(4494,'Posic','06','Posic, Rioja','posic rioja',0,3,4488),(4495,'San Fernando','07','San Fernando, Rioja','san fernando rioja',0,3,4488),(4496,'Yorongos','08','Yorongos, Rioja','yorongos rioja',0,3,4488),(4497,'Yuracyacu','09','Yuracyacu, Rioja','yuracyacu rioja',0,3,4488),(4498,'San Martin','09','San Martin, San Martin','san martin san martin',14,2,4431),(4499,'Tarapoto','01','Tarapoto, San Martin','tarapoto san martin',0,3,4498),(4500,'Alberto Leveau','02','Alberto Leveau, San Martin','alberto leveau san martin',0,3,4498),(4501,'Cacatachi','03','Cacatachi, San Martin','cacatachi san martin',0,3,4498),(4502,'Chazuta','04','Chazuta, San Martin','chazuta san martin',0,3,4498),(4503,'Chipurana','05','Chipurana, San Martin','chipurana san martin',0,3,4498),(4504,'El Porvenir','06','El Porvenir, San Martin','el porvenir san martin',0,3,4498),(4505,'Huimbayoc','07','Huimbayoc, San Martin','huimbayoc san martin',0,3,4498),(4506,'Juan Guerra','08','Juan Guerra, San Martin','juan guerra san martin',0,3,4498),(4507,'La Banda de Shilcayo','09','La Banda de Shilcayo, San Martin','la banda de shilcayo san martin',0,3,4498),(4508,'Morales','10','Morales, San Martin','morales san martin',0,3,4498),(4509,'Papaplaya','11','Papaplaya, San Martin','papaplaya san martin',0,3,4498),(4510,'San Antonio','12','San Antonio, San Martin','san antonio san martin',0,3,4498),(4511,'Sauce','13','Sauce, San Martin','sauce san martin',0,3,4498),(4512,'Shapaja','14','Shapaja, San Martin','shapaja san martin',0,3,4498),(4513,'Tocache','10','Tocache, San Martin','tocache san martin',5,2,4431),(4514,'Tocache','01','Tocache, Tocache','tocache tocache',0,3,4513),(4515,'Nuevo Progreso','02','Nuevo Progreso, Tocache','nuevo progreso tocache',0,3,4513),(4516,'Polvora','03','Polvora, Tocache','polvora tocache',0,3,4513),(4517,'Shunte','04','Shunte, Tocache','shunte tocache',0,3,4513),(4518,'Uchiza','05','Uchiza, Tocache','uchiza tocache',0,3,4513),(4519,'Tacna','23','Tacna, Perú','tacna perú',4,1,2533),(4520,'Tacna','01','Tacna, Tacna, Tacna','tacna tacna tacna',10,2,4519),(4521,'Tacna','01','Tacna, Tacna','tacna tacna',0,3,4520),(4522,'Alto de la Alianza','02','Alto de la Alianza, Tacna','alto de la alianza tacna',0,3,4520),(4523,'Calana','03','Calana, Tacna','calana tacna',0,3,4520),(4524,'Ciudad Nueva','04','Ciudad Nueva, Tacna','ciudad nueva tacna',0,3,4520),(4525,'Inclan','05','Inclan, Tacna','inclan tacna',0,3,4520),(4526,'Pachia','06','Pachia, Tacna','pachia tacna',0,3,4520),(4527,'Palca','07','Palca, Tacna','palca tacna',0,3,4520),(4528,'Pocollay','08','Pocollay, Tacna','pocollay tacna',0,3,4520),(4529,'Sama','09','Sama, Tacna','sama tacna',0,3,4520),(4530,'Cor Gregorio Albarracín','10','Cor Gregorio Albarracín, Tacna','cor gregorio albarracín tacna',0,3,4520),(4531,'Candarave','02','Candarave, Tacna','candarave tacna',6,2,4519),(4532,'Candarave','01','Candarave, Candarave','candarave candarave',0,3,4531),(4533,'Cairani','02','Cairani, Candarave','cairani candarave',0,3,4531),(4534,'Camilaca','03','Camilaca, Candarave','camilaca candarave',0,3,4531),(4535,'Curibaya','04','Curibaya, Candarave','curibaya candarave',0,3,4531),(4536,'Huanuara','05','Huanuara, Candarave','huanuara candarave',0,3,4531),(4537,'Quilahuani','06','Quilahuani, Candarave','quilahuani candarave',0,3,4531),(4538,'Jorge Basadre','03','Jorge Basadre, Tacna','jorge basadre tacna',3,2,4519),(4539,'Locumba','01','Locumba, Jorge Basadre','locumba jorge basadre',0,3,4538),(4540,'Ilabaya','02','Ilabaya, Jorge Basadre','ilabaya jorge basadre',0,3,4538),(4541,'Ite','03','Ite, Jorge Basadre','ite jorge basadre',0,3,4538),(4542,'Tarata','04','Tarata, Tacna','tarata tacna',8,2,4519),(4543,'Tarata','01','Tarata, Tarata','tarata tarata',0,3,4542),(4544,'Chucatamani','02','Chucatamani, Tarata','chucatamani tarata',0,3,4542),(4545,'Estique','03','Estique, Tarata','estique tarata',0,3,4542),(4546,'Estique-Pampa','04','Estique-Pampa, Tarata','estique-pampa tarata',0,3,4542),(4547,'Sitajara','05','Sitajara, Tarata','sitajara tarata',0,3,4542),(4548,'Susapaya','06','Susapaya, Tarata','susapaya tarata',0,3,4542),(4549,'Tarucachi','07','Tarucachi, Tarata','tarucachi tarata',0,3,4542),(4550,'Ticaco','08','Ticaco, Tarata','ticaco tarata',0,3,4542),(4551,'Tumbes','24','Tumbes, Perú','tumbes perú',3,1,2533),(4552,'Tumbes','01','Tumbes, Tumbes, Tumbes','tumbes tumbes tumbes',6,2,4551),(4553,'Tumbes','01','Tumbes, Tumbes','tumbes tumbes',0,3,4552),(4554,'Corrales','02','Corrales, Tumbes','corrales tumbes',0,3,4552),(4555,'La Cruz','03','La Cruz, Tumbes','la cruz tumbes',0,3,4552),(4556,'Pampas de Hospital','04','Pampas de Hospital, Tumbes','pampas de hospital tumbes',0,3,4552),(4557,'San Jacinto','05','San Jacinto, Tumbes','san jacinto tumbes',0,3,4552),(4558,'San Juan de la Virgen','06','San Juan de la Virgen, Tumbes','san juan de la virgen tumbes',0,3,4552),(4559,'Contralmirante Villar','02','Contralmirante Villar, Tumbes','contralmirante villar tumbes',2,2,4551),(4560,'Zorritos','01','Zorritos, Contralmirante Villar','zorritos contralmirante villar',0,3,4559),(4561,'Casitas','02','Casitas, Contralmirante Villar','casitas contralmirante villar',0,3,4559),(4562,'Zarumilla','03','Zarumilla, Tumbes','zarumilla tumbes',4,2,4551),(4563,'Zarumilla','01','Zarumilla, Zarumilla','zarumilla zarumilla',0,3,4562),(4564,'Aguas Verdes','02','Aguas Verdes, Zarumilla','aguas verdes zarumilla',0,3,4562),(4565,'Matapalo','03','Matapalo, Zarumilla','matapalo zarumilla',0,3,4562),(4566,'Papayal','04','Papayal, Zarumilla','papayal zarumilla',0,3,4562),(4567,'Ucayali','25','Ucayali, Perú','ucayali perú',4,1,2533),(4568,'Coronel Portillo','01','Coronel Portillo, Ucayali','coronel portillo ucayali',6,2,4567),(4569,'Calleria','01','Calleria, Coronel Portillo','calleria coronel portillo',0,3,4568),(4570,'Campoverde','02','Campoverde, Coronel Portillo','campoverde coronel portillo',0,3,4568),(4571,'Iparia','03','Iparia, Coronel Portillo','iparia coronel portillo',0,3,4568),(4572,'Masisea','04','Masisea, Coronel Portillo','masisea coronel portillo',0,3,4568),(4573,'Yarinacocha','05','Yarinacocha, Coronel Portillo','yarinacocha coronel portillo',0,3,4568),(4574,'Nueva Requena','06','Nueva Requena, Coronel Portillo','nueva requena coronel portillo',0,3,4568),(4575,'Atalaya','02','Atalaya, Ucayali','atalaya ucayali',4,2,4567),(4576,'Raymondi','01','Raymondi, Atalaya','raymondi atalaya',0,3,4575),(4577,'Sepahua','02','Sepahua, Atalaya','sepahua atalaya',0,3,4575),(4578,'Tahuania','03','Tahuania, Atalaya','tahuania atalaya',0,3,4575),(4579,'Yurua','04','Yurua, Atalaya','yurua atalaya',0,3,4575),(4580,'Padre Abad','03','Padre Abad, Ucayali','padre abad ucayali',3,2,4567),(4581,'Padre Abad','01','Padre Abad, Padre Abad','padre abad padre abad',0,3,4580),(4582,'Irazola','02','Irazola, Padre Abad','irazola padre abad',0,3,4580),(4583,'Curimana','03','Curimana, Padre Abad','curimana padre abad',0,3,4580),(4584,'Purus','04','Purus, Ucayali','purus ucayali',1,2,4567),(4585,'Purus','01','Purus, Purus','purus purus',0,3,4584),(4586,'Afghanistán','00','Afghanistán','afghanistán',0,0,0),(4587,'Albania','00','Albania','albania',0,0,0),(4588,'Alemania','00','Alemania','alemania',0,0,0),(4589,'Andorra','00','Andorra','andorra',0,0,0),(4590,'Angola','00','Angola','angola',0,0,0),(4591,'Anguilla','00','Anguilla','anguilla',0,0,0),(4592,'Antigua y Barbuda','00','Antigua y Barbuda','antigua y barbuda',0,0,0),(4593,'Arabia Saudita','00','Arabia Saudita','arabia saudita',0,0,0),(4594,'Argelia','00','Argelia','argelia',0,0,0),(4595,'Argentina','00','Argentina','argentina',0,0,0),(4596,'Armenia','00','Armenia','armenia',0,0,0),(4597,'Australia','00','Australia','australia',0,0,0),(4598,'Austria','00','Austria','austria',0,0,0),(4599,'Azerbayán','00','Azerbayán','azerbayán',0,0,0),(4600,'Bahamas','00','Bahamas','bahamas',0,0,0),(4601,'Bahrein','00','Bahrein','bahrein',0,0,0),(4602,'Bangladesh','00','Bangladesh','bangladesh',0,0,0),(4603,'Barbados','00','Barbados','barbados',0,0,0),(4604,'Belarús','00','Belarús','belarús',0,0,0),(4605,'Bélgica','00','Bélgica','bélgica',0,0,0),(4606,'Belice','00','Belice','belice',0,0,0),(4607,'Benin','00','Benin','benin',0,0,0),(4608,'Bhután','00','Bhután','bhután',0,0,0),(4609,'Birmania','00','Birmania','birmania',0,0,0),(4610,'Bolivia','00','Bolivia','bolivia',0,0,0),(4611,'Bosnia-Herzegovina','00','Bosnia-Herzegovina','bosnia-herzegovina',0,0,0),(4612,'Botswana','00','Botswana','botswana',0,0,0),(4613,'Brasil','00','Brasil','brasil',0,0,0),(4614,'Brunei','00','Brunei','brunei',0,0,0),(4615,'Bulgaria','00','Bulgaria','bulgaria',0,0,0),(4616,'Burkina Faso','00','Burkina Faso','burkina faso',0,0,0),(4617,'Burundi','00','Burundi','burundi',0,0,0),(4618,'Cabo Verde','00','Cabo Verde','cabo verde',0,0,0),(4619,'Camboya','00','Camboya','camboya',0,0,0),(4620,'Camerún','00','Camerún','camerún',0,0,0),(4621,'Canadá','00','Canadá','canadá',0,0,0),(4622,'Chad','00','Chad','chad',0,0,0),(4623,'Chile','00','Chile','chile',0,0,0),(4624,'China','00','China','china',0,0,0),(4625,'Chipre','00','Chipre','chipre',0,0,0),(4626,'Colombia','00','Colombia','colombia',0,0,0),(4627,'Comoras','00','Comoras','comoras',0,0,0),(4628,'Congo','00','Congo','congo',0,0,0),(4629,'Corea del Norte','00','Corea del Norte','corea del norte',0,0,0),(4630,'Corea del Sur','00','Corea del Sur','corea del sur',0,0,0),(4631,'Costa de Marfil','00','Costa de Marfil','costa de marfil',0,0,0),(4632,'Costa Rica','00','Costa Rica','costa rica',0,0,0),(4633,'Croacia','00','Croacia','croacia',0,0,0),(4634,'Cuba','00','Cuba','cuba',0,0,0),(4635,'Dinamarca','00','Dinamarca','dinamarca',0,0,0),(4636,'Djibouti','00','Djibouti','djibouti',0,0,0),(4637,'Ecuador','00','Ecuador','ecuador',0,0,0),(4638,'Egipto','00','Egipto','egipto',0,0,0),(4639,'El Salvador','00','El Salvador','el salvador',0,0,0),(4640,'Emiratos Arabes Unidos','00','Emiratos Arabes Unidos','emiratos arabes unidos',0,0,0),(4641,'Eritrea','00','Eritrea','eritrea',0,0,0),(4642,'Eslovaquia','00','Eslovaquia','eslovaquia',0,0,0),(4643,'Eslovenia','00','Eslovenia','eslovenia',0,0,0),(4644,'España','00','España','españa',0,0,0),(4645,'Estados Unidos','00','Estados Unidos','estados unidos',0,0,0),(4646,'Estonia','00','Estonia','estonia',0,0,0),(4647,'Etiopia','00','Etiopia','etiopia',0,0,0),(4648,'Fiji','00','Fiji','fiji',0,0,0),(4649,'Filipinas','00','Filipinas','filipinas',0,0,0),(4650,'Finlandia','00','Finlandia','finlandia',0,0,0),(4651,'Francia','00','Francia','francia',0,0,0),(4652,'Gabon','00','Gabon','gabon',0,0,0),(4653,'Gambia','00','Gambia','gambia',0,0,0),(4654,'Georgia','00','Georgia','georgia',0,0,0),(4655,'Ghana','00','Ghana','ghana',0,0,0),(4656,'Grecia','00','Grecia','grecia',0,0,0),(4657,'Granada','00','Granada','granada',0,0,0),(4658,'Guatemala','00','Guatemala','guatemala',0,0,0),(4659,'Guinea','00','Guinea','guinea',0,0,0),(4660,'Guinea-Bissau','00','Guinea-Bissau','guinea-bissau',0,0,0),(4661,'Guinea Ecuatorial','00','Guinea Ecuatorial','guinea ecuatorial',0,0,0),(4662,'Guyana','00','Guyana','guyana',0,0,0),(4663,'Haiti','00','Haiti','haiti',0,0,0),(4664,'Honduras','00','Honduras','honduras',0,0,0),(4665,'Hungria','00','Hungria','hungria',0,0,0),(4666,'Islandia','00','Islandia','islandia',0,0,0),(4667,'India','00','India','india',0,0,0),(4668,'Indonesia','00','Indonesia','indonesia',0,0,0),(4669,'Iran','00','Iran','iran',0,0,0),(4670,'Iraq','00','Iraq','iraq',0,0,0),(4671,'Irlanda','00','Irlanda','irlanda',0,0,0),(4672,'Israel','00','Israel','israel',0,0,0),(4673,'Italia','00','Italia','italia',0,0,0),(4674,'Jamaica','00','Jamaica','jamaica',0,0,0),(4675,'Japón','00','Japón','japón',0,0,0),(4676,'Jordania','00','Jordania','jordania',0,0,0),(4677,'Kazajstán','00','Kazajstán','kazajstán',0,0,0),(4678,'Kenia','00','Kenia','kenia',0,0,0),(4679,'Kirguistán','00','Kirguistán','kirguistán',0,0,0),(4680,'Kiribati','00','Kiribati','kiribati',0,0,0),(4681,'Kuwait','00','Kuwait','kuwait',0,0,0),(4682,'Laos','00','Laos','laos',0,0,0),(4683,'Letonia','00','Letonia','letonia',0,0,0),(4684,'Libano','00','Libano','libano',0,0,0),(4685,'Lesotho','00','Lesotho','lesotho',0,0,0),(4686,'Liberia','00','Liberia','liberia',0,0,0),(4687,'Libia','00','Libia','libia',0,0,0),(4688,'Liechtenstein','00','Liechtenstein','liechtenstein',0,0,0),(4689,'Lituania','00','Lituania','lituania',0,0,0),(4690,'Luxemburgo','00','Luxemburgo','luxemburgo',0,0,0),(4691,'Macedonia','00','Macedonia','macedonia',0,0,0),(4692,'Madagascar','00','Madagascar','madagascar',0,0,0),(4693,'Malawi','00','Malawi','malawi',0,0,0),(4694,'Malasia','00','Malasia','malasia',0,0,0),(4695,'Maldivas','00','Maldivas','maldivas',0,0,0),(4696,'Mali','00','Mali','mali',0,0,0),(4697,'Malta','00','Malta','malta',0,0,0),(4698,'Marruecos','00','Marruecos','marruecos',0,0,0),(4699,'Marshall','00','Marshall','marshall',0,0,0),(4700,'Mauricio','00','Mauricio','mauricio',0,0,0),(4701,'Mauritania','00','Mauritania','mauritania',0,0,0),(4702,'México','00','México','méxico',0,0,0),(4703,'Micronesia','00','Micronesia','micronesia',0,0,0),(4704,'Moldova','00','Moldova','moldova',0,0,0),(4705,'Mónaco','00','Mónaco','mónaco',0,0,0),(4706,'Mongolia','00','Mongolia','mongolia',0,0,0),(4707,'Mozambique','00','Mozambique','mozambique',0,0,0),(4708,'Namibia','00','Namibia','namibia',0,0,0),(4709,'Naurú','00','Naurú','naurú',0,0,0),(4710,'Nepal','00','Nepal','nepal',0,0,0),(4711,'Nicaragua','00','Nicaragua','nicaragua',0,0,0),(4712,'Niger','00','Niger','niger',0,0,0),(4713,'Nigeria','00','Nigeria','nigeria',0,0,0),(4714,'Noruega','00','Noruega','noruega',0,0,0),(4715,'Nueva Zelandia','00','Nueva Zelandia','nueva zelandia',0,0,0),(4716,'Omán','00','Omán','omán',0,0,0),(4717,'Países Bajos','00','Países Bajos','países bajos',0,0,0),(4718,'Pakistán','00','Pakistán','pakistán',0,0,0),(4719,'Palau','00','Palau','palau',0,0,0),(4720,'Panamá','00','Panamá','panamá',0,0,0),(4721,'Papúa-Nueva Guinea','00','Papúa-Nueva Guinea','papúa-nueva guinea',0,0,0),(4722,'Paraguay','00','Paraguay','paraguay',0,0,0),(4723,'Polonia','00','Polonia','polonia',0,0,0),(4724,'Portugal','00','Portugal','portugal',0,0,0),(4725,'Qatar','00','Qatar','qatar',0,0,0),(4726,'Reino Unido','00','Reino Unido','reino unido',0,0,0),(4727,'Rep. Centroafricana','00','Rep. Centroafricana','rep. centroafricana',0,0,0),(4728,'Rep. Checa','00','Rep. Checa','rep. checa',0,0,0),(4729,'Rep. Dominicana','00','Rep. Dominicana','rep. dominicana',0,0,0),(4730,'Ruanda','00','Ruanda','ruanda',0,0,0),(4731,'Rumania','00','Rumania','rumania',0,0,0),(4732,'Rusia','00','Rusia','rusia',0,0,0),(4733,'Salomon Islands','00','Salomon Islands','salomon islands',0,0,0),(4734,'Samoa','00','Samoa','samoa',0,0,0),(4735,'San Marino','00','San Marino','san marino',0,0,0),(4736,'San Cristóbal-Nevis','00','San Cristóbal-Nevis','san cristóbal-nevis',0,0,0),(4737,'Santa Lucía','00','Santa Lucía','santa lucía',0,0,0),(4738,'Santa Sede (Vaticano)','00','Santa Sede (Vaticano)','santa sede (vaticano)',0,0,0),(4739,'São Tomé y Principe','00','São Tomé y Principe','são tomé y principe',0,0,0),(4740,'St. Vincente las Grenadinas','00','St. Vincente las Grenadinas','st. vincente las grenadinas',0,0,0),(4741,'Senegal','00','Senegal','senegal',0,0,0),(4742,'Seychelles','00','Seychelles','seychelles',0,0,0),(4743,'Sierra Leona','00','Sierra Leona','sierra leona',0,0,0),(4744,'Singapur','00','Singapur','singapur',0,0,0),(4745,'Siria','00','Siria','siria',0,0,0),(4746,'Somalia','00','Somalia','somalia',0,0,0),(4747,'Sri Lanka','00','Sri Lanka','sri lanka',0,0,0),(4748,'Sudáfrica','00','Sudáfrica','sudáfrica',0,0,0),(4749,'Sudán','00','Sudán','sudán',0,0,0),(4750,'Suecia','00','Suecia','suecia',0,0,0),(4751,'Suiza','00','Suiza','suiza',0,0,0),(4752,'Suriname','00','Suriname','suriname',0,0,0),(4753,'Swazilandia','00','Swazilandia','swazilandia',0,0,0),(4754,'Tailandia','00','Tailandia','tailandia',0,0,0),(4755,'Taiwán','00','Taiwán','taiwán',0,0,0),(4756,'Tanzania','00','Tanzania','tanzania',0,0,0),(4757,'Tayikistán','00','Tayikistán','tayikistán',0,0,0),(4758,'Togo','00','Togo','togo',0,0,0),(4759,'Tonga','00','Tonga','tonga',0,0,0),(4760,'Trinidad y Tabago','00','Trinidad y Tabago','trinidad y tabago',0,0,0),(4761,'Túnez','00','Túnez','túnez',0,0,0),(4762,'Turkmenistan','00','Turkmenistan','turkmenistan',0,0,0),(4763,'Turquia','00','Turquia','turquia',0,0,0),(4764,'Tuvalu','00','Tuvalu','tuvalu',0,0,0),(4765,'Ucraina','00','Ucraina','ucraina',0,0,0),(4766,'Uganda','00','Uganda','uganda',0,0,0),(4767,'Uruguay','00','Uruguay','uruguay',0,0,0),(4768,'Uzbekistán','00','Uzbekistán','uzbekistán',0,0,0),(4769,'Vanuatu','00','Vanuatu','vanuatu',0,0,0),(4770,'Venezuela','00','Venezuela','venezuela',0,0,0),(4771,'Vietnam','00','Vietnam','vietnam',0,0,0),(4772,'Yémen','00','Yémen','yémen',0,0,0),(4773,'Yugoslavia','00','Yugoslavia','yugoslavia',0,0,0),(4774,'Zambia','00','Zambia','zambia',0,0,0),(4775,'Zimbabwe','00','Zimbabwe','zimbabwe',0,0,0),(4777,'antofagasta','','Antofagasta','antofagasta',9,1,4623),(4778,'atacama','','Atacama','atacama',9,1,4623),(4779,'Aysén del general carlos ','','Aysén del general carlos ','aysén del general carlos ',10,1,4623),(4780,'bío - bío','','Bío - bío','bío - bío',54,1,4623),(4781,'coquimbo','','Coquimbo','coquimbo',15,1,4623),(4782,'La araucanía','','La araucanía','la araucanía',32,1,4623),(4783,'Libertador general bernar','','Libertador general bernar','libertador general bernar',33,1,4623),(4784,'Los lagos','','Los lagos','los lagos',42,1,4623),(4785,'Magallanes y la antártica','','Magallanes y la antártica','magallanes y la antártica',11,1,4623),(4786,'Maule','','Maule','maule',30,1,4623),(4787,'Metropolitana de Santiago','','Metropolitana de Santiago','metropolitana de santiago',53,1,4623),(4788,'Tarapacá','','Tarapacá','tarapaca',11,1,4623),(4789,'Valparaíso','','Valparaíso','valparaíso',39,1,4623),(4790,'Antofagasta','','Antofagasta','antofagasta',4,2,4777),(4791,'El loa','','El loa','el loa',3,2,4777),(4792,'Tocopilla','','Tocopilla','tocopilla',2,2,4777),(4793,'Chañaral','','Chañaral','chañaral',2,2,4778),(4794,'Copiapó','','Copiapó','copiapó',3,2,4778),(4795,'Huasco','','Huasco','huasco',4,2,4778),(4796,'Aysén','','Aysén','aysén',3,2,4779),(4797,'Capitán prat','','Capitán prat','capitán prat',3,2,4779),(4798,'Coyhaique','','Coyhaique','coyhaique',2,2,4779),(4799,'General Carrera','','General Carrera','general carrera',2,2,4779),(4800,'Arauco','','Arauco','arauco',7,2,4780),(4801,'Bio-Bio','','Bio-Bio','bio-bio',14,2,4780),(4802,'Concepción','','Concepción','concepción',12,2,4780),(4803,'Ñuble','','Ñuble','ñuble',21,2,4780),(4804,'Choapa','','Choapa','choapa',4,2,4781),(4805,'Elqui','','Elqui','elqui',6,2,4781),(4806,'Limarí','','Limarí','limarí',5,2,4781),(4807,'Cautín','','Cautín','cautín',21,2,4782),(4808,'Malleco','','Malleco','malleco',11,2,4782),(4809,'Cachapoal','','Cachapoal','cachapoal',17,2,4783),(4810,'Cardenal Caro','','Cardenal Caro','cardenal caro',6,2,4783),(4811,'Colchagua','','Colchagua','colchagua',10,2,4783),(4812,'Chiloé','','Chiloé','chiloé',10,2,4784),(4813,'Llanquihue','','Llanquihue','llanquihue',9,2,4784),(4814,'Osorno','','Osorno','osorno',7,2,4784),(4815,'Palena','','Palena','palena',4,2,4784),(4816,'Valdivia','','Valdivia','valdivia',12,2,4784),(4817,'Antártica Chilena','','Antártica Chilena','antártica chilena',2,2,4785),(4818,'Magallanes','','Magallanes','magallanes',4,2,4785),(4819,'Tierra del Fuego','','Tierra del Fuego','tierra del fuego',3,2,4785),(4820,'Ultima Esperanza','','Ultima Esperanza','ultima esperanza',2,2,4785),(4821,'Cauquenes','','Cauquenes','cauquenes',3,2,4786),(4822,'Curicó','','Curicó','curicó',9,2,4786),(4823,'Linares','','Linares','linares',8,2,4786),(4824,'Talca','','Talca','talca',10,2,4786),(4825,'Chacabuco','','Chacabuco','chacabuco',3,2,4787),(4826,'Cordillera','','Cordillera','cordillera',3,2,4787),(4827,'Maipo','','Maipo','maipo',4,2,4787),(4828,'Melipilla','','Melipilla','melipilla',5,2,4787),(4829,'Santiago','','Santiago','santiago',33,2,4787),(4830,'Talagante','','Talagante','talagante',5,2,4788),(4831,'Arica','','Arica','arica',2,2,4788),(4832,'Iquique','','Iquique','iquique',7,2,4788),(4833,'Parinacota','','Parinacota','parinacota',2,2,4788),(4834,'Isla de Pascua','','Isla de Pascua','isla de pascua',1,2,4789),(4835,'La Calera','','La Calera','la calera',1,2,4789),(4836,'Los Andes','','Los Andes','los andes',4,2,4789),(4837,'Petorca','','Petorca','petorca',5,2,4789),(4838,'Quillota','','Quillota','quillota',7,2,4789),(4839,'San Antonio','','San Antonio','san antonio',6,2,4789),(4840,'San Felipe de Aconcagua','','San Felipe de Aconcagua','san felipe de aconcagua',6,2,4789),(4841,'Valparaíso','','Valparaíso','valparaíso',9,2,4789),(4842,'antofagasta','','Antofagasta','antofagasta',1,3,4790),(4843,'mejillones','','Mejillones','mejillones',1,3,4790),(4844,'sierra gorda','','Sierra gorda','sierra gorda',1,3,4790),(4845,'taltal','','Taltal','taltal',1,3,4790),(4846,'calama','','Calama','calama',1,3,4791),(4847,'ollague','','Ollague','ollague',1,3,4791),(4848,'san pedro de atacama','','San pedro de atacama','san pedro de atacama',1,3,4791),(4849,'maría elena','','María elena','maría elena',1,3,4792),(4850,'tocopilla','','Tocopilla','tocopilla',1,3,4792),(4851,'chañaral','','Chañaral','chañaral',1,3,4793),(4852,'diego de almagro','','Diego de almagro','diego de almagro',1,3,4793),(4853,'caldera','','Caldera','caldera',1,3,4794),(4854,'copiapó','','Copiapó','copiapó',1,3,4794),(4855,'tierra amarilla','','Tierra amarilla','tierra amarilla',1,3,4794),(4856,'alto del carmen','','Alto del carmen','alto del carmen',1,3,4795),(4857,'freirina','','Freirina','freirina',1,3,4795),(4858,'huasco','','Huasco','huasco',1,3,4795),(4859,'vallenar','','Vallenar','vallenar',1,3,4795),(4860,'aysén','','Aysén','aysén',1,3,4796),(4861,'cisnes','','Cisnes','cisnes',1,3,4796),(4862,'guaitecas','','Guaitecas','guaitecas',1,3,4796),(4863,'cochrane','','Cochrane','cochrane',1,3,4797),(4864,'o\'higgins','','O\'higgins','o\'higgins',1,3,4797),(4865,'tortel','','Tortel','tortel',1,3,4797),(4866,'coyhaique','','Coyhaique','coyhaique',1,3,4798),(4867,'lago verde','','Lago verde','lago verde',1,3,4798),(4868,'chile chico','','Chile chico','chile chico',1,3,4799),(4869,'río ibánez','','Río ibánez','río ibánez',1,3,4799),(4870,'arauco','','Arauco','arauco',1,3,4800),(4871,'cañete','','Cañete','cañete',1,3,4800),(4872,'contulmo','','Contulmo','contulmo',1,3,4800),(4873,'curanilahue','','Curanilahue','curanilahue',1,3,4800),(4874,'lebu','','Lebu','lebu',1,3,4800),(4875,'los alamos','','Los alamos','los alamos',1,3,4800),(4876,'tirua','','Tirua','tirua',1,3,4800),(4877,'alto bíobío','','Alto bíobío','alto bíobío',1,3,4801),(4878,'antuco','','Antuco','antuco',1,3,4801),(4879,'cabrero','','Cabrero','cabrero',1,3,4801),(4880,'laja','','Laja','laja',1,3,4801),(4881,'los angeles','','Los angeles','los angeles',1,3,4801),(4882,'mulchén','','Mulchén','mulchén',1,3,4801),(4883,'nacimiento','','Nacimiento','nacimiento',1,3,4801),(4884,'negrete','','Negrete','negrete',1,3,4801),(4885,'quilaco','','Quilaco','quilaco',1,3,4801),(4886,'quilleco','','Quilleco','quilleco',1,3,4801),(4887,'san rosendo','','San rosendo','san rosendo',1,3,4801),(4888,'santa bárbara','','Santa bárbara','santa bárbara',1,3,4801),(4889,'tucapel','','Tucapel','tucapel',1,3,4801),(4890,'yumbel','','Yumbel','yumbel',1,3,4801),(4891,'chiguayante','','Chiguayante','chiguayante',1,3,4802),(4892,'concepción','','Concepción','concepción',1,3,4802),(4893,'coronel','','Coronel','coronel',1,3,4802),(4894,'florida','','Florida','florida',1,3,4802),(4895,'hualpén','','Hualpén','hualpén',1,3,4802),(4896,'hualqui','','Hualqui','hualqui',1,3,4802),(4897,'lota','','Lota','lota',1,3,4802),(4898,'penco','','Penco','penco',1,3,4802),(4899,'san pedro de la paz','','San pedro de la paz','san pedro de la paz',1,3,4802),(4900,'santa juana','','Santa juana','santa juana',1,3,4802),(4901,'talcahuano','','Talcahuano','talcahuano',1,3,4802),(4902,'tomé','','Tomé','tomé',1,3,4802),(4903,'bulnes','','Bulnes','bulnes',1,3,4803),(4904,'chillán','','Chillán','chillán',1,3,4803),(4905,'chillan viejo','','Chillan viejo','chillan viejo',1,3,4803),(4906,'cobquecura','','Cobquecura','cobquecura',1,3,4803),(4907,'coelemu','','Coelemu','coelemu',1,3,4803),(4908,'coihueco','','Coihueco','coihueco',1,3,4803),(4909,'el carmen','','El carmen','el carmen',1,3,4803),(4910,'ninhue','','Ninhue','ninhue',1,3,4803),(4911,'ñiquén','','Ñiquén','ñiquén',1,3,4803),(4912,'pemuco','','Pemuco','pemuco',1,3,4803),(4913,'pinto','','Pinto','pinto',1,3,4803),(4914,'portezuelo','','Portezuelo','portezuelo',1,3,4803),(4915,'quillón','','Quillón','quillón',1,3,4803),(4916,'quirihue','','Quirihue','quirihue',1,3,4803),(4917,'ranquil','','Ranquil','ranquil',1,3,4803),(4918,'san carlos','','San carlos','san carlos',1,3,4803),(4919,'san fabián','','San fabián','san fabián',1,3,4803),(4920,'san ignacio','','San ignacio','san ignacio',1,3,4803),(4921,'san nicolás','','San nicolás','san nicolás',1,3,4803),(4922,'trehuaco','','Trehuaco','trehuaco',1,3,4803),(4923,'yungay','','Yungay','yungay',1,3,4803),(4924,'canela','','Canela','canela',1,3,4804),(4925,'illapel','','Illapel','illapel',1,3,4804),(4926,'los vilos','','Los vilos','los vilos',1,3,4804),(4927,'salamanca','','Salamanca','salamanca',1,3,4804),(4928,'andacollo','','Andacollo','andacollo',1,3,4805),(4929,'coquimbo','','Coquimbo','coquimbo',1,3,4805),(4930,'la higuera','','La higuera','la higuera',1,3,4805),(4931,'la serena','','La serena','la serena',1,3,4805),(4932,'paihuano','','Paihuano','paihuano',1,3,4805),(4933,'vicuña','','Vicuña','vicuña',1,3,4805),(4934,'combarbalá','','Combarbalá','combarbalá',1,3,4806),(4935,'monte patria','','Monte patria','monte patria',1,3,4806),(4936,'ovalle','','Ovalle','ovalle',1,3,4806),(4937,'punitaqui','','Punitaqui','punitaqui',1,3,4806),(4938,'río hurtado','','Río hurtado','río hurtado',1,3,4806),(4939,'carahue','','Carahue','carahue',1,3,4807),(4940,'cholchol','','Cholchol','cholchol',1,3,4807),(4941,'cunco','','Cunco','cunco',1,3,4807),(4942,'curarrehue','','Curarrehue','curarrehue',1,3,4807),(4943,'freire','','Freire','freire',1,3,4807),(4944,'galvarino','','Galvarino','galvarino',1,3,4807),(4945,'gorbea','','Gorbea','gorbea',1,3,4807),(4946,'lautaro','','Lautaro','lautaro',1,3,4807),(4947,'loncoche','','Loncoche','loncoche',1,3,4807),(4948,'melipeuco','','Melipeuco','melipeuco',1,3,4807),(4949,'nueva imperial','','Nueva imperial','nueva imperial',1,3,4807),(4950,'padre las casas','','Padre las casas','padre las casas',1,3,4807),(4951,'perquenco','','Perquenco','perquenco',1,3,4807),(4952,'pitrufquén','','Pitrufquén','pitrufquén',1,3,4807),(4953,'pucón','','Pucón','pucón',1,3,4807),(4954,'saavedra','','Saavedra','saavedra',1,3,4807),(4955,'temuco','','Temuco','temuco',1,3,4807),(4956,'teodoro schmidt','','Teodoro schmidt','teodoro schmidt',1,3,4807),(4957,'toltén','','Toltén','toltén',1,3,4807),(4958,'vilcún','','Vilcún','vilcún',1,3,4807),(4959,'villarrica','','Villarrica','villarrica',1,3,4807),(4960,'angol','','Angol','angol',1,3,4808),(4961,'collipulli','','Collipulli','collipulli',1,3,4808),(4962,'curacautín','','Curacautín','curacautín',1,3,4808),(4963,'ercilla','','Ercilla','ercilla',1,3,4808),(4964,'lonquimay','','Lonquimay','lonquimay',1,3,4808),(4965,'los sauces','','Los sauces','los sauces',1,3,4808),(4966,'lumaco','','Lumaco','lumaco',1,3,4808),(4967,'purén','','Purén','purén',1,3,4808),(4968,'renaico','','Renaico','renaico',1,3,4808),(4969,'traiguén','','Traiguén','traiguén',1,3,4808),(4970,'victoria','','Victoria','victoria',1,3,4808),(4971,'codegua','','Codegua','codegua',1,3,4809),(4972,'coinco','','Coinco','coinco',1,3,4809),(4973,'coltauco','','Coltauco','coltauco',1,3,4809),(4974,'doñihue','','Doñihue','doñihue',1,3,4809),(4975,'graneros','','Graneros','graneros',1,3,4809),(4976,'las cabras','','Las cabras','las cabras',1,3,4809),(4977,'machalí','','Machalí','machalí',1,3,4809),(4978,'malloa','','Malloa','malloa',1,3,4809),(4979,'mostazal','','Mostazal','mostazal',1,3,4809),(4980,'olivar','','Olivar','olivar',1,3,4809),(4981,'peumo','','Peumo','peumo',1,3,4809),(4982,'pichidegua','','Pichidegua','pichidegua',1,3,4809),(4983,'quinta de tilcoco','','Quinta de tilcoco','quinta de tilcoco',1,3,4809),(4984,'rancagua','','Rancagua','rancagua',1,3,4809),(4985,'rengo','','Rengo','rengo',1,3,4809),(4986,'requinoa','','Requinoa','requinoa',1,3,4809),(4987,'san vicente','','San vicente','san vicente',1,3,4809),(4988,'la estrella','','La estrella','la estrella',1,3,4810),(4989,'litueche','','Litueche','litueche',1,3,4810),(4990,'marchigue','','Marchigue','marchigue',1,3,4810),(4991,'navidad','','Navidad','navidad',1,3,4810),(4992,'paredones','','Paredones','paredones',1,3,4810),(4993,'pichilemu','','Pichilemu','pichilemu',1,3,4810),(4994,'chépica','','Chépica','chépica',1,3,4811),(4995,'chimbarongo','','Chimbarongo','chimbarongo',1,3,4811),(4996,'lolol','','Lolol','lolol',1,3,4811),(4997,'nancagua','','Nancagua','nancagua',1,3,4811),(4998,'palmilla','','Palmilla','palmilla',1,3,4811),(4999,'peralillo','','Peralillo','peralillo',1,3,4811),(5000,'placilla','','Placilla','placilla',1,3,4811),(5001,'pumanque','','Pumanque','pumanque',1,3,4811),(5002,'san fernando','','San fernando','san fernando',1,3,4811),(5003,'santa cruz','','Santa cruz','santa cruz',1,3,4811),(5004,'ancud','','Ancud','ancud',1,3,4812),(5005,'castro','','Castro','castro',1,3,4812),(5006,'chonchi','','Chonchi','chonchi',1,3,4812),(5007,'curaco de vélez','','Curaco de vélez','curaco de vélez',1,3,4812),(5008,'dalcahue','','Dalcahue','dalcahue',1,3,4812),(5009,'puqueldón','','Puqueldón','puqueldón',1,3,4812),(5010,'queilén','','Queilén','queilén',1,3,4812),(5011,'quellón','','Quellón','quellón',1,3,4812),(5012,'quemchi','','Quemchi','quemchi',1,3,4812),(5013,'quinchao','','Quinchao','quinchao',1,3,4812),(5014,'calbuco','','Calbuco','calbuco',1,3,4813),(5015,'cochamó','','Cochamó','cochamó',1,3,4813),(5016,'fresia','','Fresia','fresia',1,3,4813),(5017,'frutillar','','Frutillar','frutillar',1,3,4813),(5018,'llanquihue','','Llanquihue','llanquihue',1,3,4813),(5019,'los muermos','','Los muermos','los muermos',1,3,4813),(5020,'maullín','','Maullín','maullín',1,3,4813),(5021,'puerto montt','','Puerto montt','puerto montt',1,3,4813),(5022,'puerto varas','','Puerto varas','puerto varas',1,3,4813),(5023,'osorno','','Osorno','osorno',1,3,4814),(5024,'puerto octay','','Puerto octay','puerto octay',1,3,4814),(5025,'purranque','','Purranque','purranque',1,3,4814),(5026,'puyehue','','Puyehue','puyehue',1,3,4814),(5027,'río negro','','Río negro','río negro',1,3,4814),(5028,'san juan de la costa','','San juan de la costa','san juan de la costa',1,3,4814),(5029,'san pablo','','San pablo','san pablo',1,3,4814),(5030,'chaitén','','Chaitén','chaitén',1,3,4815),(5031,'futaleufú','','Futaleufú','futaleufú',1,3,4815),(5032,'hualaihue','','Hualaihue','hualaihue',1,3,4815),(5033,'palena','','Palena','palena',1,3,4815),(5034,'corral','','Corral','corral',1,3,4816),(5035,'futrono','','Futrono','futrono',1,3,4816),(5036,'la unión','','La unión','la unión',1,3,4816),(5037,'lago ranco','','Lago ranco','lago ranco',1,3,4816),(5038,'lanco','','Lanco','lanco',1,3,4816),(5039,'los lagos','','Los lagos','los lagos',1,3,4816),(5040,'máfil','','Máfil','máfil',1,3,4816),(5041,'mariquina','','Mariquina','mariquina',1,3,4816),(5042,'paillaco','','Paillaco','paillaco',1,3,4816),(5043,'panguipulli','','Panguipulli','panguipulli',1,3,4816),(5044,'río bueno','','Río bueno','río bueno',1,3,4816),(5045,'valdivia','','Valdivia','valdivia',1,3,4816),(5046,'antártica','','Antártica','antártica',1,3,4817),(5047,'cabo de hornos','','Cabo de hornos','cabo de hornos',1,3,4817),(5048,'laguna blanca','','Laguna blanca','laguna blanca',1,3,4818),(5049,'punta arenas','','Punta arenas','punta arenas',1,3,4818),(5050,'rio verde','','Rio verde','rio verde',1,3,4818),(5051,'san gregorio','','San gregorio','san gregorio',1,3,4818),(5052,'porvenir','','Porvenir','porvenir',1,3,4819),(5053,'primavera','','Primavera','primavera',1,3,4819),(5054,'timaukel','','Timaukel','timaukel',1,3,4819),(5055,'natales','','Natales','natales',1,3,4820),(5056,'torres del paine','','Torres del paine','torres del paine',1,3,4820),(5057,'cauquenes','','Cauquenes','cauquenes',1,3,4821),(5058,'chanco','','Chanco','chanco',1,3,4821),(5059,'pelluhue','','Pelluhue','pelluhue',1,3,4821),(5060,'curicó','','Curicó','curicó',1,3,4822),(5061,'hualañé','','Hualañé','hualañé',1,3,4822),(5062,'licantén','','Licantén','licantén',1,3,4822),(5063,'molina','','Molina','molina',1,3,4822),(5064,'rauco','','Rauco','rauco',1,3,4822),(5065,'romeral','','Romeral','romeral',1,3,4822),(5066,'sagrada familia','','Sagrada familia','sagrada familia',1,3,4822),(5067,'teno','','Teno','teno',1,3,4822),(5068,'vichuquén','','Vichuquén','vichuquén',1,3,4822),(5069,'colbún','','Colbún','colbún',1,3,4823),(5070,'linares','','Linares','linares',1,3,4823),(5071,'longaví','','Longaví','longaví',1,3,4823),(5072,'parral','','Parral','parral',1,3,4823),(5073,'retiro','','Retiro','retiro',1,3,4823),(5074,'san javier','','San javier','san javier',1,3,4823),(5075,'villa alegre','','Villa alegre','villa alegre',1,3,4823),(5076,'yerbas buenas','','Yerbas buenas','yerbas buenas',1,3,4823),(5077,'constitución','','Constitución','constitución',1,3,4824),(5078,'curepto','','Curepto','curepto',1,3,4824),(5079,'empedrado','','Empedrado','empedrado',1,3,4824),(5080,'maule','','Maule','maule',1,3,4824),(5081,'pelarco','','Pelarco','pelarco',1,3,4824),(5082,'pencahue','','Pencahue','pencahue',1,3,4824),(5083,'río claro','','Río claro','río claro',1,3,4824),(5084,'san clemente','','San clemente','san clemente',1,3,4824),(5085,'san rafael','','San rafael','san rafael',1,3,4824),(5086,'talca','','Talca','talca',1,3,4824),(5087,'colina','','Colina','colina',1,3,4825),(5088,'lampa','','Lampa','lampa',1,3,4825),(5089,'tiltil','','Tiltil','tiltil',1,3,4825),(5090,'pirque','','Pirque','pirque',1,3,4826),(5091,'puente alto','','Puente alto','puente alto',1,3,4826),(5092,'san josé de maipo','','San josé de maipo','san josé de maipo',1,3,4826),(5093,'buin','','Buin','buin',1,3,4827),(5094,'calera de tango','','Calera de tango','calera de tango',1,3,4827),(5095,'paine','','Paine','paine',1,3,4827),(5096,'san bernardo','','San bernardo','san bernardo',1,3,4827),(5097,'alhué','','Alhué','alhué',1,3,4828),(5098,'curacaví','','Curacaví','curacaví',1,3,4828),(5099,'maría pinto','','María pinto','maría pinto',1,3,4828),(5100,'melipilla','','Melipilla','melipilla',1,3,4828),(5101,'san pedro','','San pedro','san pedro',1,3,4828),(5102,'cerrillos','','Cerrillos','cerrillos',1,3,4829),(5103,'cerro navia','','Cerro navia','cerro navia',1,3,4829),(5104,'conchalí','','Conchalí','conchalí',1,3,4829),(5105,'el bosque','','El bosque','el bosque',1,3,4829),(5106,'estacion central','','Estacion central','estacion central',1,3,4829),(5107,'huechuraba','','Huechuraba','huechuraba',1,3,4829),(5108,'independencia','','Independencia','independencia',1,3,4829),(5109,'la cisterna','','La cisterna','la cisterna',1,3,4829),(5110,'la florida','','La florida','la florida',1,3,4829),(5111,'la granja','','La granja','la granja',1,3,4829),(5112,'la pintana','','La pintana','la pintana',1,3,4829),(5113,'la reina','','La reina','la reina',1,3,4829),(5114,'las condes','','Las condes','las condes',1,3,4829),(5115,'lo barnechea','','Lo barnechea','lo barnechea',1,3,4829),(5116,'lo espejo','','Lo espejo','lo espejo',1,3,4829),(5117,'lo prado','','Lo prado','lo prado',1,3,4829),(5118,'macul','','Macul','macul',1,3,4829),(5119,'maipú','','Maipú','maipú',1,3,4829),(5120,'ñuñoa','','Ñuñoa','ñuñoa',1,3,4829),(5121,'pedro aguirre cerda','','Pedro aguirre cerda','pedro aguirre cerda',1,3,4829),(5122,'peñalolén','','Peñalolén','peñalolén',1,3,4829),(5123,'providencia','','Providencia','providencia',1,3,4829),(5124,'pudahuel','','Pudahuel','pudahuel',1,3,4829),(5125,'puente alto','','Puente alto','puente alto',1,3,4829),(5126,'quilicura','','Quilicura','quilicura',1,3,4829),(5127,'quinta normal','','Quinta normal','quinta normal',1,3,4829),(5128,'recoleta','','Recoleta','recoleta',1,3,4829),(5129,'renca','','Renca','renca',1,3,4829),(5130,'san joaquín','','San joaquín','san joaquín',1,3,4829),(5131,'san miguel','','San miguel','san miguel',1,3,4829),(5132,'san ramón','','San ramón','san ramón',1,3,4829),(5133,'santiago-centro','','Santiago-centro','santiago-centro',1,3,4829),(5134,'vitacura','','Vitacura','vitacura',1,3,4829),(5135,'el monte','','El monte','el monte',1,3,4830),(5136,'isla de maipo','','Isla de maipo','isla de maipo',1,3,4830),(5137,'padre hurtado','','Padre hurtado','padre hurtado',1,3,4830),(5138,'peñaflor','','Peñaflor','peñaflor',1,3,4830),(5139,'talagante','','Talagante','talagante',1,3,4830),(5140,'arica','','Arica','arica',1,3,4831),(5141,'camarones','','Camarones','camarones',1,3,4831),(5142,'alto hospicio','','Alto hospicio','alto hospicio',1,3,4832),(5143,'camiña','','Camiña','camiña',1,3,4832),(5144,'colchane','','Colchane','colchane',1,3,4832),(5145,'huara','','Huara','huara',1,3,4832),(5146,'iquique','','Iquique','iquique',1,3,4832),(5147,'pica','','Pica','pica',1,3,4832),(5148,'pozo almonte','','Pozo almonte','pozo almonte',1,3,4832),(5149,'general lagos','','General lagos','general lagos',1,3,4833),(5150,'putre','','Putre','putre',1,3,4833),(5151,'isla de pascua','','Isla de pascua','isla de pascua',1,3,4834),(5152,'la calera','','La calera','la calera',1,3,4835),(5153,'calle larga','','Calle larga','calle larga',1,3,4836),(5154,'los andes','','Los andes','los andes',1,3,4836),(5155,'rinconada','','Rinconada','rinconada',1,3,4836),(5156,'san esteban','','San esteban','san esteban',1,3,4836),(5157,'cabildo','','Cabildo','cabildo',1,3,4837),(5158,'la ligua','','La ligua','la ligua',1,3,4837),(5159,'papudo','','Papudo','papudo',1,3,4837),(5160,'petorca','','Petorca','petorca',1,3,4837),(5161,'zapallar','','Zapallar','zapallar',1,3,4837),(5162,'calera','','Calera','calera',1,3,4838),(5163,'hijuelas','','Hijuelas','hijuelas',1,3,4838),(5164,'la cruz','','La cruz','la cruz',1,3,4838),(5165,'limache','','Limache','limache',1,3,4838),(5166,'nogales','','Nogales','nogales',1,3,4838),(5167,'olmué','','Olmué','olmué',1,3,4838),(5168,'quillota','','Quillota','quillota',1,3,4838),(5169,'algarrobo','','Algarrobo','algarrobo',1,3,4839),(5170,'cartagena','','Cartagena','cartagena',1,3,4839),(5171,'el quisco','','El quisco','el quisco',1,3,4839),(5172,'el tabo','','El tabo','el tabo',1,3,4839),(5173,'san antonio','','San antonio','san antonio',1,3,4839),(5174,'santo domingo','','Santo domingo','santo domingo',1,3,4839),(5175,'catemu','','Catemu','catemu',1,3,4840),(5176,'llayllay','','Llayllay','llayllay',1,3,4840),(5177,'panquehue','','Panquehue','panquehue',1,3,4840),(5178,'putaendo','','Putaendo','putaendo',1,3,4840),(5179,'san felipe','','San felipe','san felipe',1,3,4840),(5180,'santa maría','','Santa maría','santa maría',1,3,4840),(5181,'casablanca','','Casablanca','casablanca',1,3,4841),(5182,'concon','','Concon','concon',1,3,4841),(5183,'juan fernández','','Juan fernández','juan fernández',1,3,4841),(5184,'puchuncaví','','Puchuncaví','puchuncaví',1,3,4841),(5185,'quilpué','','Quilpué','quilpué',1,3,4841),(5186,'quintero','','Quintero','quintero',1,3,4841),(5187,'valparaíso','','Valparaíso','valparaíso',1,3,4841),(5188,'villa alemana','','Villa alemana','villa alemana',1,3,4841),(5189,'viña del mar','','Viña del mar','viña del mar',1,3,4841),(5190,'alabama','','Alabama','alabama',NULL,NULL,4645),(5191,'alaska','','Alaska','alaska',NULL,NULL,4645),(5192,'arizona','','Arizona','arizona',NULL,NULL,4645),(5193,'arkansas','','Arkansas','arkansas',NULL,NULL,4645),(5194,'california','','California','california',NULL,NULL,4645),(5195,'carolina del norte','','Carolina del norte','carolina-del-norte',NULL,NULL,4645),(5196,'carolina del sur','','Carolina del sur','carolina-del-sur',NULL,NULL,4645),(5197,'colorado','','Colorado','colorado',NULL,NULL,4645),(5198,'connecticut','','Connecticut','connecticut',NULL,NULL,4645),(5199,'dakota del norte','','Dakota del norte','dakota-del-norte',NULL,NULL,4645),(5200,'delaware','','Delaware','delaware',NULL,NULL,4645),(5201,'florida','','Florida','florida',NULL,NULL,4645),(5202,'georgia','','Georgia','georgia',NULL,NULL,4645),(5203,'hawái','','Hawái','hawái',NULL,NULL,4645),(5204,'idaho','','Idaho','idaho',NULL,NULL,4645),(5205,'illinois','','Illinois','illinois',NULL,NULL,4645),(5206,'illinois','','Illinois','illinois',NULL,NULL,4645),(5207,'indiana','','Indiana','indiana',NULL,NULL,4645),(5208,'lowa','','Lowa','lowa',NULL,NULL,4645),(5209,'kansas','','Kansas','kansas',NULL,NULL,4645),(5210,'kentucky','','Kentucky','kentucky',NULL,NULL,4645),(5211,'luisiana','','Luisiana','luisiana',NULL,NULL,4645),(5212,'maine','','Maine','maine',NULL,NULL,4645),(5213,'maryland','','Maryland','maryland',NULL,NULL,4645),(5214,'massachusetts','','Massachusetts','massachusetts',NULL,NULL,4645),(5215,'michigan','','Michigan','michigan',NULL,NULL,4645),(5216,'minnesota','','Minnesota','minnesota',NULL,NULL,4645),(5217,'misisipi','','Misisipi','misisipi',NULL,NULL,4645),(5218,'misuri','','Misuri','misuri',NULL,NULL,4645),(5219,'montana','','Montana','montana',NULL,NULL,4645),(5220,'nebraska','','Nebraska','nebraska',NULL,NULL,4645),(5221,'nevada','','Nevada','nevada',NULL,NULL,4645),(5222,'nueva jersey','','Nueva Jersey','nueva-jersey',NULL,NULL,4645),(5223,'nueva york','','Nueva York','nueva-york',NULL,NULL,4645),(5224,'nuevo hampshire','','Nuevo Hampshire','nuevo-hampshire',NULL,NULL,4645),(5225,'nuevo mexico','','Nuevo Mexico','nuevo-mexico',NULL,NULL,4645),(5226,'ohio','','Ohio','ohio',NULL,NULL,4645),(5227,'oklahoma','','Oklahoma','oklahoma',NULL,NULL,4645),(5228,'oregon','','Oregon','oregon',NULL,NULL,4645),(5229,'pensilvania','','Pensilvania','pensilvania',NULL,NULL,4645),(5230,'rhode island','','Rhode Island','rhode-island',NULL,NULL,4645),(5231,'tennesse ','','Tennesse','tennesse',NULL,NULL,4645),(5232,'texas','','Texas','texas',NULL,NULL,4645),(5233,'utah','','Utah','utah',NULL,NULL,4645),(5234,'vermont','','Vermont','vermont',NULL,NULL,4645),(5235,'virginia','','Virginia','virginia',NULL,NULL,4645),(5236,'virginia occidental','','Virginia Occidental','virginia-occidental',NULL,NULL,4645),(5237,'washington','','Washington','washington',NULL,NULL,4645),(5238,'wisconsin','','Wisconsin','wisconsin',NULL,NULL,4645),(5239,'wyoming','','Wyoming','wyoming',NULL,NULL,4645);

UNLOCK TABLES;

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `usr_codigo` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_passwd` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_tipo` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `usr_perfil` smallint(6) DEFAULT NULL,
  `usr_estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecact` date DEFAULT NULL,
  `hora` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_shi_cod` smallint(6) DEFAULT NULL,
  `id_cod_con` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

insert  into `usuarios`(`id_user`,`usr_codigo`,`usr_passwd`,`usr_tipo`,`usr_nombre`,`per_id`,`id_contacto`,`usr_perfil`,`usr_estado`,`id_usuario`,`fecact`,`hora`,`id_shi_cod`,`id_cod_con`) values (1,'rvite','','I','Ricardo Vite',1,0,5,'1',0,'2017-07-18','190501',0,0),(2,'super1','','I','supervisor1',1,0,4,'1',1,'2018-12-14','12',1,0),(3,'super2','','I','supervisor2',1,0,4,'1',1,'2018-12-14','12',2,0),(4,'basico1','','I','basico1',1,0,1,'1',2,'2018-12-14','12',1,1),(5,'basico2','','I','basico2',1,0,1,'1',2,'2018-12-14','12',1,2),(6,'basico3','','I','basico3',1,0,1,'1',3,'2018-12-14','14',2,3);

UNLOCK TABLES;

/* Procedure structure for procedure `get_list_client` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_client` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_client`(IN `vp_name` VARCHAR(100),IN `vp_date` VARCHAR(10),IN vp_estado CHAR(1))
BEGIN		
			SELECT shi_codigo,shi_nombre,fec_ingreso,shi_estado,B.usr_nombre as id_user,A.fecact FROM django.shipper A
			LEFT JOIN django.usuarios B ON A.id_user = B.id_user
			WHERE
			shi_nombre LIKE CONCAT('%',TRIM(IFNULL(vp_name,'')),'%') AND
			fec_ingreso = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fec_ingreso END) AND
			shi_estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE shi_estado END);
		
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_clientcontratos` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_clientcontratos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_clientcontratos`(IN `vp_name` VARCHAR(100),IN `vp_date` VARCHAR(10),IN vp_estado CHAR(1),IN `vp_id_user` INT)
BEGIN	
	DECLARE vl_id_shi_cod SMALLINT DEFAULT 0;
	SELECT id_shi_cod INTO vl_id_shi_cod FROM usuarios WHERE id_user = vp_id_user;
	select nivel,shi_codigo,shi_nombre,fec_ingreso,shi_estado,id_user,fecact,cod_contrato,pro_descri from (
	SELECT 1 as nivel,shi_codigo,shi_nombre,fec_ingreso,shi_estado,B.usr_nombre AS id_user,A.fecact,'' as cod_contrato,'' as pro_descri FROM django.shipper A
	inner JOIN django.usuarios B ON A.id_user = B.id_user
	WHERE
	shi_nombre LIKE CONCAT('%',TRIM(IFNULL(vp_name,'')),'%') AND
	fec_ingreso = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fec_ingreso END) AND
	shi_estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE shi_estado END) and
	shi_codigo = (CASE WHEN IFNULL(vl_id_shi_cod,0) !=0 THEN vl_id_shi_cod ELSE shi_codigo END) 
	union all		
	SELECT 2 as nivel, A.shi_codigo,shi_nombre,C.fecha_ing as fec_ingreso,C.estado as shi_estado,D.usr_nombre as id_user,C.fecha_act as fecact,C.cod_contrato,C.pro_descri FROM django.shipper A
	inner JOIN django.`fac_cliente` B on A.shi_codigo = B.shi_codigo
	inner JOIN django.contratos C ON B.cod_contrato = C.cod_contrato 
	inner join django.usuarios D ON C.id_user = D.id_user
	WHERE
	shi_nombre LIKE CONCAT('%',TRIM(IFNULL(vp_name,'')),'%') AND
	fec_ingreso = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fec_ingreso END) AND
	shi_estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE shi_estado END) and 
	A.shi_codigo = (CASE WHEN IFNULL(vl_id_shi_cod,0) !=0 THEN vl_id_shi_cod ELSE A.shi_codigo END)
	
	) as TAB order by shi_codigo, nivel, cod_contrato
	
	
	;
		
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_contratos` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_contratos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_contratos`(IN vp_shi_codigo smallint,IN vp_id_user INT)
BEGIN
DECLARE vl_id_cod_con SMALLINT DEFAULT 0;
	SELECT id_cod_con INTO vl_id_cod_con FROM usuarios WHERE id_user = vp_id_user;
	IF IFNULL(vl_id_cod_con,0) = 0 THEN	
		SELECT b.fac_cliente,a.cod_contrato,concat(a.cod_contrato,'-',a.pro_descri) as pro_descri
		FROM django.contratos a
		inner join fac_cliente b on b.cod_contrato=a.cod_contrato
		where b.shi_codigo=vp_shi_codigo;
	else
		SELECT b.fac_cliente,a.cod_contrato,CONCAT(a.cod_contrato,'-',a.pro_descri) AS pro_descri
		FROM django.contratos a
		INNER JOIN fac_cliente b ON b.cod_contrato=a.cod_contrato
		WHERE b.shi_codigo=vp_shi_codigo AND b.cod_contrato = vl_id_cod_con;
	
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_download_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_download_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_download_page`(IN vp_id_pag INTEGER,IN vp_shi_codigo smallint,IN vp_id_det INT,IN vp_id_lote INT)
BEGIN
	
    SELECT a.id_pag,a.id_det,a.id_lote,a.path,a.img,a.imgorigen,a.orden,d.nombre as expediente,l.nombre
	FROM paginas a
    inner join lote_detalle d on d.id_lote = a.id_lote and d.id_det = a.id_lote
    inner join lote l on l.id_lote = a.id_lote
    where 
    a.id_pag=(case when ifnull(vp_id_pag,0)=0 then a.id_pag else vp_id_pag end) and
    a.id_det=(case when ifnull(vp_id_det,0)=0 then a.id_det else vp_id_det end) and 
    a.id_lote=vp_id_lote and 
    a.estado='A' 
    order by a.orden asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_history` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_history` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_history`(IN vp_id_lote integer)
BEGIN
SELECT id_estado,id_lote,shi_codigo,lot_estado,usr_nombre,a.fecact
FROM lote_estado a
inner join usuarios b on b.id_user=a.id_user
where id_lote=vp_id_lote;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_lotizer_search` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_lotizer_search` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_lotizer_search`(
IN vp_op char(1),
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_lote INT,
IN vp_cod_trazo INT,
IN vp_lote_estado CHAR(2),
IN vp_name varchar(100),
IN vp_date varchar(8),
IN vp_estado char(1))
BEGIN
	
IF IFNULL(vp_op,'L')='L' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			id_lote = vp_lote AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente 
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = vp_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden
			FROM paginas P
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = vp_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente AND P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc,padre asc,hijo asc;
END IF;
IF IFNULL(vp_op,'L')='N' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM django.lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			id_lote = id_lote AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
            nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else lot_estado end)  AND
			fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
			estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden 
			FROM paginas P
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			and P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc, padre asc,hijo asc;
END IF;
IF IFNULL(vp_op,'L')='A' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			A.id_lote in(
				select distinct L.id_lote from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where L.shi_codigo=A.shi_codigo and L.fac_cliente = A.fac_cliente AND 
                P.imgorigen LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
			fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
			estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
            A.id_det in(
				select distinct D.id_det from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where 
                L.shi_codigo=C.shi_codigo AND L.fac_cliente = C.fac_cliente AND L.id_lote = C.id_lote AND
                P.imgorigen LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden
			FROM paginas P
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			P.imgorigen LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			and P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc,padre asc,hijo asc;
END IF;
IF IFNULL(vp_op,'L')='G' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			A.id_lote in(
				select distinct L.id_lote from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where L.shi_codigo=A.shi_codigo and L.fac_cliente = A.fac_cliente AND 
                P.img LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
			fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
			estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
            A.id_det in(
				select distinct D.id_det from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where 
                L.shi_codigo=C.shi_codigo AND L.fac_cliente = C.fac_cliente AND L.id_lote = C.id_lote AND
                P.img LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden
			FROM paginas P
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			P.img LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			and P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc,padre asc,hijo asc;
END IF;
IF IFNULL(vp_op,'L')='O' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM django.lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			id_lote in(
				select distinct L.id_lote from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where L.shi_codigo=A.shi_codigo and L.fac_cliente = A.fac_cliente AND 
                P.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
			fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
			estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
            A.id_det in(
				select distinct D.id_det from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
                where 
                L.shi_codigo=C.shi_codigo AND L.fac_cliente = C.fac_cliente AND L.id_lote = C.id_lote AND
                P.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND P.estado ='A'
            ) AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden
			FROM paginas P
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			P.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			and P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc,padre asc,hijo asc;
END IF;
IF IFNULL(vp_op,'L')='T' THEN
		SELECT nivel,
			hijo,
			padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
			nombre,
			descripcion,
			path,
			img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			id_user,
			usr_update,
			fec_update,
			estado,orden from (
			SELECT 1 AS nivel,
			id_lote as hijo,
			id_lote as padre,
			id_lote,
			shi_codigo,fac_cliente,
			lot_estado,
			tipdoc,
			nombre,
			descripcion,
			'' as path,
			'' as img,
			fecha,
			tot_folder,
			tot_pag,
			tot_errpag,
			A.id_user,
			B.usr_codigo as usr_update,
			fec_update,
			estado,0 as orden
			FROM 
            lote A
			LEFT JOIN usuarios B ON A.id_user = B.id_user
			where 
			id_lote in(
				select distinct L.id_lote from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
				INNER JOIN paginas_trazos T ON T.id_pag=P.id_pag 
                where L.shi_codigo=A.shi_codigo and L.fac_cliente = A.fac_cliente AND 
                T.cod_trazo=vp_cod_trazo and 
                T.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND T.estado ='A'
            ) AND 
			shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
            p.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
			fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
			estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
			union all
			select 2 AS nivel,
			A.id_det as hijo,
			A.id_lote as padre,#padre
			A.id_lote,
			A.shi_codigo,
			C.fac_cliente,
			C.lot_estado,
			C.tipdoc,
			A.nombre,'',
			'' as path,
			'' as img,
			A.fecha,
			1,
			A.tot_pag,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,A.orden
			from lote_detalle A
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
            A.id_det in(
				select distinct D.id_det from  lote L 
                INNER JOIN lote_detalle D ON D.shi_codigo=L.shi_codigo AND D.id_lote=L.id_lote
				INNER JOIN paginas P ON D.id_det=P.id_det and P.id_lote=D.id_lote
				INNER JOIN paginas_trazos T ON T.id_pag=P.id_pag 
                where 
                L.shi_codigo=C.shi_codigo AND L.fac_cliente = C.fac_cliente AND L.id_lote = C.id_lote AND
                T.cod_trazo=vp_cod_trazo AND 
                T.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND T.estado ='A'
            ) AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			union all
			select 3 AS nivel,
			P.id_pag as hijo,
			P.id_det as padre,
			C.id_lote,
			A.shi_codigo,C.fac_cliente,
			C.lot_estado AS lot_estado,
			C.tipdoc, 
			CONCAT(P.path,P.img)  AS nombre,'',
			P.path,
			P.img,
			A.fecha,
			0,
			1,
			A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,P.orden
			FROM paginas P
            INNER JOIN paginas_trazos T ON T.id_pag=P.id_pag 
			INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
			INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
			LEFT JOIN usuarios B ON A.usr_regis = B.id_user
			where 
			C.id_lote = C.id_lote AND 
			C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
			T.texto LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND T.estado ='A' AND
			C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
			C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
			and P.estado='A'
		) AS TAB ORDER BY nivel asc,orden asc,padre asc,hijo asc;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_page`(IN vp_id_pag INTEGER,IN vp_shi_codigo smallint,IN vp_id_det INT,IN vp_id_lote INT)
BEGIN
	
    SELECT a.id_pag,a.id_det,a.id_lote,a.path,a.img,a.imgorigen,a.lado,a.ocr,a.orden,a.estado,ifnull(e.id_pag,0) as id_pag_error,ifnull(e.msg,'') as msg_error
	FROM paginas a
    left join paginas_error e on a.id_pag=e.id_pag and a.id_det=e.id_det and a.id_lote=e.id_lote
    where 
    a.id_pag=(case when ifnull(vp_id_pag,0)=0 then a.id_pag else vp_id_pag end) and
    a.id_det=(case when ifnull(vp_id_det,0)=0 then a.id_det else vp_id_det end) and 
    a.id_lote=vp_id_lote and 
    a.estado='A' 
    order by a.orden asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_page_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_page_delete` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_page_delete`(IN vp_id_pag INTEGER,IN vp_shi_codigo smallint,IN vp_id_det INT,IN vp_id_lote INT)
BEGIN
	
    SELECT id_pag,id_det,id_lote,path,img,imgorigen,lado,ocr,orden,estado
	FROM paginas 
    where 
    id_pag=(case when ifnull(vp_id_pag,0)=0 then id_pag else vp_id_pag end) and
    id_det=(case when ifnull(vp_id_det,0)=0 then id_det else vp_id_det end) and 
    id_lote=vp_id_lote and 
    estado='A' 
    order by orden asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_shipper` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_shipper` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_shipper`(IN `vp_id_user` INT)
BEGIN
select a.shi_codigo,concat(a.shi_codigo,'-',a.shi_nombre) as shi_nombre,a.shi_logo,
fec_ingreso,shi_estado,id_user,fecact || ' - ' ||  hora as fecha_actual
 from shipper a
where shi_estado=1 order by a.shi_nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_lotizer_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_lotizer_detalle` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_lotizer_detalle`(IN `vp_id_lote` int(5))
BEGIN
		SELECT nombre,id_det,fecha,tot_pag,tot_pag_err,estado FROM lote_detalle
		WHERE id_lote = vp_id_lote;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_ocr_trazos` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_ocr_trazos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_ocr_trazos`(in vp_cod_plantilla smallint)
BEGIN
SELECT `trazos`.`cod_trazo`,
    `trazos`.`cod_plantilla`,
    `trazos`.`nombre`,
    `trazos`.`tipo`,
    `trazos`.`x`,
    `trazos`.`y`,
    `trazos`.`w`,
    `trazos`.`h`,
    path,
    `trazos`.`img`,
    `trazos`.`texto`,
    `trazos`.`estado`,
    `trazos`.`fecha`,
    `trazos`.`id_user`
FROM `django`.`trazos` where cod_plantilla=vp_cod_plantilla;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_usr_DataPerfil` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_usr_DataPerfil` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_usr_DataPerfil`(IN `vp_id_user` INT)
BEGIN
declare vl_usr_perfil INT;
	SELECT usr_perfil INTO vl_usr_perfil FROM usuarios WHERE id_user = vp_id_user;
	select * from dataperfil where code <= vl_usr_perfil;
	
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_digital_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_digital_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_digital_page`(IN `vp_shi_codigo` SMALLINT, IN `vp_fac_cliente` SMALLINT, IN `vp_lote` INT, IN `vp_lote_estado` CHAR(2), IN `vp_name` VARCHAR(100), IN `vp_date` VARCHAR(8), IN `vp_estado` CHAR(1))
BEGIN
	
    if ifnull(vp_lote,0)!= 0 then
		set vp_date = '';
        set vp_estado = '';
    end if;
    
	SELECT nivel,
		hijo,
        padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
        nombre,
        descripcion,
        path,
        img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		id_user,
		usr_update,
		fec_update,
		estado from (
		SELECT 1 AS nivel,
        id_lote as hijo,
        id_lote as padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		nombre,
        descripcion,
        '' as path,
        '' as img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		A.id_user,
		B.usr_codigo as usr_update,
		fec_update,
		estado
		FROM lote A
        LEFT JOIN usuarios B ON A.id_user = B.id_user
		where 
        id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else id_lote end) AND 
        shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        lot_estado IN('DI','DE')  AND
		fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
		estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
		union all
		select 2 AS nivel,
        A.id_det as hijo,
        A.id_lote as padre,#padre
        A.id_lote,
        A.shi_codigo,
        C.fac_cliente,
        C.lot_estado,
        C.tipdoc,
        A.nombre,'',
        '' as path,
        '' as img,
        A.fecha,
        1,
        A.tot_pag,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado 
        from lote_detalle A
        INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
        LEFT JOIN usuarios B ON A.usr_regis = B.id_user
        where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado IN('DI','DE')  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        union all
        select 3 AS nivel,
		P.id_pag as hijo,
        P.id_det as padre,
        C.id_lote,
		A.shi_codigo,C.fac_cliente,
		C.lot_estado AS lot_estado,
		C.tipdoc, 
		CONCAT(P.path,P.img)  AS nombre,'',
        P.path,
        P.img,
		A.fecha,
		0,
        1,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado 
		FROM paginas P
		INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
		INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
		LEFT JOIN usuarios B ON A.usr_regis = B.id_user
		where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado IN('DI','DE')  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        and P.estado='A'
        
	) AS TAB ORDER BY padre asc,hijo asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_page_trazos` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_page_trazos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_page_trazos`(IN vp_id_pag INTEGER,IN vp_shi_codigo smallint,IN vp_id_det INT,IN vp_id_lote INT,IN vp_ocr char(1))
BEGIN
SELECT 
p.id_pag,p.id_det,p.id_lote,p.path,p.img,p.imgorigen,
p.lado,p.ocr,p.orden,p.estado,t.cod_trazo,t.cod_plantilla,t.tipo,
t.x,t.y,t.w,t.h,p.w as wo,p.h as ho
FROM paginas p
inner join lote l on l.id_lote=p.id_lote
inner join plantilla pl on pl.shi_codigo =l.shi_codigo and pl.fac_cliente=l.fac_cliente 
inner join trazos t on t.cod_plantilla=pl.cod_plantilla
where 
p.id_pag=(case when ifnull(vp_id_pag,0)=0 then p.id_pag else vp_id_pag end) and
p.id_det=(case when ifnull(vp_id_det,0)=0 then p.id_det else vp_id_det end) and 
p.id_lote=vp_id_lote and 
p.ocr= case when ifnull(vp_ocr,'') != '' then vp_ocr  else p.ocr end and
p.estado='A' and t.estado='A' and pl.estado='A'
order by p.id_pag,orden asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_lotizer` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_lotizer` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_lotizer`(IN vp_op CHARACTER(1), IN `vp_id_lote` INTEGER, IN vp_shi_codigo smallint,IN vp_fac_cliente smallint, IN `vp_nombre` VARCHAR(100), IN vp_descripcion VARCHAR(200),IN `vp_tipdoc` CHAR(1), IN `vp_lote_fecha` VARCHAR(50), IN `vp_ctdad` INT , in vp_estado CHAR(1) ,  IN `vp_id_user` INT)
BEGIN
declare vl_exits smallint default 0;
declare vl_id_lote integer default 0;
IF vp_op = 'I' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from lote where shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and upper(trim(nombre)) = upper(trim(vp_nombre));
		if ifnull(vl_exits,0) = 0 then 
			insert into lote(shi_codigo,fac_cliente,lot_estado,nombre,descripcion,tipdoc,fecha,tot_folder,tot_pag,tot_errpag,id_user,usr_update,fec_update,estado)
			values(vp_shi_codigo,vp_fac_cliente,'LT',vp_nombre,vp_descripcion,vp_tipdoc,vp_lote_fecha,vp_ctdad,0,0,vp_id_user,vp_id_user,NOW(),'A');
			
			select max(id_lote) into vl_id_lote from lote;
            
            INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
			VALUES(vl_id_lote,vp_shi_codigo,'LT',vp_id_user,NOW()); 
			set vl_exits = 1;
			WHILE(vl_exits <= vp_ctdad) DO
				INSERT INTO lote_detalle(id_lote,shi_codigo,nombre,fecha,tot_pag,tot_pag_err,usr_regis,fec_regis,estado,orden)
				VALUES(vl_id_lote,vp_shi_codigo,concat(trim(vp_nombre),'-',vl_exits),vp_lote_fecha,0,0,vp_id_user,NOW(),'A',vl_exits);
				set vl_exits = vl_exits + 1;
			END WHILE;
			
			select 'OK' as 'status','Registro insertado'as 'response',vl_id_lote as 'id_lote';
		else
			select 'ER' as 'status','Nombre de Area ya existe, verifique.'as 'response',0 as 'id_lote';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para el Lote.'as 'response',0 as 'id_lote';
    end if;
    
    
end if;
IF vp_op = 'U' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado = 'LT';
        if ifnull(vl_exits,0)!= 0 then 
			set vl_exits = 0;
			select count(*) into vl_exits from lote where id_lote !=vp_id_lote and upper(trim(nombre)) = upper(trim(vp_nombre));
			if ifnull(vl_exits,0)= 0 then 
				update lote set shi_codigo = vp_shi_codigo,fac_cliente = vp_fac_cliente,nombre=vp_nombre,descripcion=vp_descripcion,tipdoc = vp_tipdoc,tot_folder=vp_ctdad,fec_update=NOW(),estado=vp_estado,usr_update=vp_id_user where  id_lote=vp_id_lote;
				update lote_estado set shi_codigo = vp_shi_codigo where id_estado!=0 and id_lote=vp_id_lote;
				set vl_exits = 1;
				delete from lote_detalle where id_det!=0 and id_lote=vp_id_lote;
				WHILE(vl_exits <= vp_ctdad) DO
					INSERT INTO lote_detalle(id_lote,shi_codigo,nombre,fecha,tot_pag,tot_pag_err,usr_regis,fec_regis,estado,orden)
					VALUES(vp_id_lote,vp_shi_codigo,concat(trim(vp_nombre),'-',vl_exits),vp_lote_fecha,0,0,vp_id_user,NOW(),'A',vl_exits);
					set vl_exits = vl_exits + 1;
				END WHILE;
				
				select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
			else
				select 'ER' as 'status','Nombre del Area ya existe, verifique.'as 'response',0 as 'id_lote';
			end if;
        else
			select 'ER' as 'status','Lote se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para el Area.'as 'response',0 as 'id_lote';
    end if;
end if;
IF vp_op = 'D' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado='LT';
	if ifnull(vl_exits,0)!= 0 then 
		update lote set estado = (case when estado = 'A' then 'I' else estado end),usr_update=vp_id_user where  id_lote=vp_id_lote;
           
		INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
		VALUES(vp_id_lote,vp_shi_codigo,'IN',vp_id_user,NOW());
        UPDATE lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
		select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
IF vp_op = 'L' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado='LT' and estado='A';
	if ifnull(vl_exits,0)!= 0 then 
		update lote set lot_estado= 'ES',proceso='C',usr_update=vp_id_user where  id_lote=vp_id_lote;
	    
		INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
		VALUES(vp_id_lote,vp_shi_codigo,'ES',vp_id_user,NOW());
        #UPDATE django.lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
		select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
IF vp_op = 'S' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado='ES' and estado='A';
	if ifnull(vl_exits,0)!= 0 then 
		update lote set lot_estado= 'CO',usr_update=vp_id_user where  id_lote=vp_id_lote;
	    
		INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
		VALUES(vp_id_lote,vp_shi_codigo,'CO',vp_id_user,NOW());
        #UPDATE django.lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
		select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
IF vp_op = 'R' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado='CO' and estado='A';
	if ifnull(vl_exits,0)!= 0 then 
		set vl_exits = 0;
		select count(1) into vl_exits from paginas_error where id_lote=vp_id_lote;
        
        if ifnull(vl_exits,0)!= 0 then 
			update lote set lot_estado= 'RE',usr_update=vp_id_user where  id_lote=vp_id_lote;
			
			INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
			VALUES(vp_id_lote,vp_shi_codigo,'RE',vp_id_user,NOW());
			#UPDATE django.lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
			select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
		else
			select 'ER' as 'status','Area no tiene ninguna página con error para enviar a re-procesar, no es posible modificar'as 'response',0 as 'id_lote';
		end if;
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
IF vp_op = 'C' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado ='RE' and estado='A';
	if ifnull(vl_exits,0)!= 0 then 
		set vl_exits = 0;
		select count(1) into vl_exits from paginas_error where id_lote=vp_id_lote;
        
        if ifnull(vl_exits,0)= 0 then 
			update lote set lot_estado='CO',usr_update=vp_id_user where  id_lote=vp_id_lote;
			
			INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
			VALUES(vp_id_lote,vp_shi_codigo,'CO',vp_id_user,NOW());
			#UPDATE django.lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
			select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
		else
			select 'ER' as 'status','El Area contiene página(s) con errores, corrija las páginas con errores pendientes antes de enviar a control.'as 'response',0 as 'id_lote';
		end if;
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
IF vp_op = 'X' then 
	select count(*) into vl_exits from lote where id_lote =vp_id_lote and lot_estado ='CO' and estado='A';
	if ifnull(vl_exits,0)!= 0 then 
		set vl_exits = 0;
		select count(1) into vl_exits from paginas_error where id_lote=vp_id_lote;
        if ifnull(vl_exits,0)= 0 then 
			update lote set lot_estado='DI',usr_update=vp_id_user where  id_lote=vp_id_lote;
			
			INSERT INTO lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
			VALUES(vp_id_lote,vp_shi_codigo,'DI',vp_id_user,NOW());
			#UPDATE django.lote_detalle SET estado='I' where id_det!=0 and id_lote=vp_id_lote;
			select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
		else
			select 'ER' as 'status','El Area contiene página(s) con errores, corrija las páginas con errores pendientes antes de enviar a digitalizado.'as 'response',0 as 'id_lote';
		end if;
	else
		select 'ER' as 'status','Area se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_reorder` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_reorder` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_reorder`(
in vp_op char(1),
in vp_id_lote int,
in vp_nivel SMALLINT(1),
in vp_hijo int,
in vp_padre int,
in vp_nombre varchar(200),
in vp_order SMALLINT(3),
in vp_id_user SMALLINT(6)
)
BEGIN
declare vl_hijo int default 0;
declare vl_padre int default 0;
declare vl_nombre varchar(200) default '';
declare vl_orden smallint(3) default 0;
declare vl_orden1 smallint(3) default 0;
declare vl_orden2 smallint(3) default 0;
declare vl_tot_pag smallint(4) default 0;
declare vl_page_error smallint(4) default 0;
declare vl_id_det int default 0;
declare vl_shi_codigo smallint default 0;
declare vl_folder smallint default 0;
declare vl_tot_error smallint default 0;
IF vp_op = 'D' then 
	delete from reorder where id_lote=vp_id_lote;
end if;
IF vp_op = 'R' then 
	INSERT INTO reorder(id_lote,hijo,padre,nivel,nombre,orden)VALUES
	(vp_id_lote,vp_hijo,vp_padre,vp_nivel,vp_nombre,vp_order);
	
	select 'OK' as 'status','Registro insertado'as 'response',vp_id_lote as 'id_lote';
end if;
IF vp_op = 'C' then 
	
    set vl_hijo = 0;
	set vl_padre = 0;
	set vl_nombre = '';
	set vl_orden = 0;
    
    select nombre into vl_nombre from reorder where id_lote=vp_id_lote and nivel=1;
    update lote set nombre=vl_nombre where id_lote=vp_id_lote;
    
    set vl_hijo = 0;
	set vl_padre = 0;
	set vl_nombre = '';
	set vl_orden = 0;
    
    
    nivel_uno:begin
		DECLARE vl_done BOOLEAN default false;
		DECLARE cursor1 CURSOR FOR
		select hijo,padre,nombre,orden from reorder where id_lote=vp_id_lote and nivel=2 order by orden asc;
        
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET vl_done = true;
		set vl_orden1 = 0;
		OPEN cursor1;
		LOOP1: LOOP
			FETCH cursor1 INTO vl_hijo,vl_padre,vl_nombre,vl_orden;
            
			IF vl_done THEN
			  CLOSE cursor1;
			  LEAVE LOOP1;
			END IF;
            set vl_orden1 = vl_orden1 + 1;
            
            update lote_detalle set nombre=vl_nombre,orden=vl_orden1,tot_pag=0,tot_pag_err=0 where id_det=vl_hijo and id_lote=vl_padre;
            set vl_id_det = vl_hijo;
			
            #set vl_hijo = 0;
			#set vl_padre = 0;
			set vl_nombre = '';
			set vl_orden = 0;
            
            nivel_medio:begin
				DECLARE cursor2 CURSOR FOR
				select hijo,padre,nombre,orden from reorder where id_lote=vp_id_lote and padre=vl_hijo and nivel=3 order by orden asc;
                
                set vl_orden2 =0;
                
				OPEN cursor2;
				LOOP2: LOOP
					FETCH cursor2 INTO vl_hijo,vl_padre,vl_nombre,vl_orden;
					IF vl_done THEN
					  SET vl_done = false;
					  CLOSE cursor2;
					  LEAVE LOOP2;
					END IF;
					set vl_orden2 = vl_orden2 + 1; 
					update paginas set id_det=vl_padre,orden=vl_orden2 where id_pag=vl_hijo and id_lote=vp_id_lote;
					
					set vl_hijo = 0;
					set vl_padre = 0;
					set vl_nombre = '';
					set vl_orden = 0;
				END LOOP LOOP2;
            end;
            
            set vl_tot_pag = 0;
			select count(1) into vl_tot_pag from paginas where id_det = vl_id_det  and id_lote = vp_id_lote;
			
			set vl_page_error = 0;
			select count(1) into vl_page_error from paginas_error where id_det = vl_id_det and id_lote = vp_id_lote;
			
			update lote_detalle set
			tot_pag=ifnull(vl_tot_pag,0),
			tot_pag_err=ifnull(vl_page_error,0)
			where id_det = vl_id_det and id_lote = vp_id_lote;
            
            set vl_hijo = 0;
			set vl_padre = 0;
			set vl_nombre = '';
			set vl_orden = 0;
            
        END LOOP LOOP1;
            
    end;
    
    
    /*
    nivel_dos:begin
		DECLARE cursor1 CURSOR FOR
		select hijo,padre,nombre,orden from reorder where id_lote=vp_id_lote and nivel=2 order by orden asc;
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done = true; 
    
		OPEN cursor1;
		LOOP1: LOOP
			FETCH cursor1 INTO vl_hijo,vl_padre,vl_nombre,vl_orden;
			IF @vl_done THEN
			  CLOSE cursor1;
			  LEAVE LOOP1;
			END IF;
            
            update lote_detalle set nombre=vl_nombre,orden=vl_orden where id_det=vl_hijo and id_lote=vl_padre;
			
            set vl_hijo = 0;
			set vl_padre = 0;
			set vl_nombre = '';
			set vl_orden = 0;
        END LOOP LOOP1;
            
    end;
    
    
    nivel_tres:begin
		DECLARE cursor2 CURSOR FOR
		select hijo,padre,nombre,orden from reorder where id_lote=vp_id_lote and nivel=3 order by orden asc;
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done2 = true; 
    
		OPEN cursor2;
		LOOP2: LOOP
			FETCH cursor2 INTO vl_hijo,vl_padre,vl_nombre,vl_orden;
			IF @vl_done2 THEN
			  CLOSE cursor2;
			  LEAVE LOOP2;
			END IF;
            
            update paginas set id_det=vl_padre,orden=vl_orden where id_pag=vl_hijo and id_lote=vp_id_lote;
		
			set vl_hijo = 0;
			set vl_padre = 0;
			set vl_nombre = '';
			set vl_orden = 0;
            
        END LOOP LOOP2;
            
    end;*/
	delete from reorder where id_lote=vp_id_lote;
	select 'OK' as 'status','Registro actualizado'as 'response',vp_id_lote as 'id_lote';
   
end if;
IF vp_op = 'A' then 
	set vl_orden = 0;
	select shi_codigo,nombre into vl_shi_codigo,vl_nombre from lote where id_lote = vp_id_lote;
    select max(orden) into vl_orden from lote_detalle where id_lote = vp_id_lote;
    set vl_orden = ifnull(vl_orden,0)+1;
	INSERT INTO lote_detalle(id_lote,shi_codigo,nombre,fecha,tot_pag,tot_pag_err,usr_regis,fec_regis,estado,orden)
	VALUES(vp_id_lote,vl_shi_codigo,concat(trim(vl_nombre),'-',vl_orden),NOW(),0,0,vp_id_user,NOW(),'A',vl_orden);
    
    
    set vl_orden = 0;
    select count(1) into vl_folder from lote_detalle where id_lote = vp_id_lote;
    
    set vl_orden = 0;
    select sum(tot_pag) into vl_orden from lote_detalle where id_lote = vp_id_lote;
    
    set vl_tot_error = 0;
	select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
    
    update lote set 
    tot_folder=ifnull(vl_folder,0),
    tot_pag=ifnull(vl_orden,0),
    tot_errpag=ifnull(vl_tot_error,0)
    where id_lote = vp_id_lote;
    
	select 'OK' as 'status','Registro agregado'as 'response',vp_id_lote as 'id_lote';
    
end if;
IF vp_op = 'Y' then 
	
    if ifnull(vp_nivel,0) = 1 then
		update lote set nombre=trim(vp_nombre) where id_lote = vp_id_lote;
        
        nivel_dos:begin
			DECLARE cursor1 CURSOR FOR
			select id_det from lote_detalle where id_lote=vp_id_lote order by orden asc;
			
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done = true; 
			set vl_orden = 1;
			OPEN cursor1;
			LOOP1: LOOP
				FETCH cursor1 INTO vl_hijo;
				IF @vl_done THEN
				  CLOSE cursor1;
				  LEAVE LOOP1;
				END IF;
				
				update lote_detalle set nombre=concat(trim(vp_nombre),'-',vl_orden), orden=vl_orden where id_det=vl_hijo and id_lote=vp_id_lote;
				
				set vl_hijo = 0;
				set vl_nombre = '';
				set vl_orden =  vl_orden + 1;
			END LOOP LOOP1;
				
		end;
    end if;
    
    if ifnull(vp_nivel,0) = 2 then
		update lote_detalle set nombre=trim(vp_nombre) where id_lote = vp_id_lote and id_det = vp_hijo;	
    end if;
    
	select 'OK' as 'status','Registros actualizados'as 'response',vp_id_lote as 'id_lote';
end if;
IF vp_op = 'X' then 
	if ifnull(vp_nivel,0) = 1 then
		set vl_orden = 0;
        select shi_codigo into vl_shi_codigo from lote where id_lote = vp_id_lote;
        select count(1) into vl_orden from lote_detalle where id_lote = vp_id_lote;
        if ifnull(vl_orden,0) = 0 then
			update lote set lot_estado='XX',estado='I',usr_update=vp_id_user where id_lote=vp_id_lote;
            
            insert into lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
            values(vp_id_lote,vl_shi_codigo,'XX',vp_id_user,NOW());
            select 'OK' as 'status','Registros actualizados'as 'response',vp_id_lote as 'id_lote';
		else
			select 'ER' as 'status','El lote cuenta con Expedientes, no es posible anular.'as 'response',vp_id_lote as 'id_lote';
        end if;
    end if;
    
    if ifnull(vp_nivel,0) = 2 then
		set vl_orden = 0;
        select count(1) into vl_orden from paginas where id_lote=vp_id_lote and id_det = vp_hijo;
        if ifnull(vl_orden,0) = 0 then
			delete from lote_detalle where id_lote = vp_id_lote and id_det = vp_hijo;
            
            set vl_orden = 0;
			select count(1) into vl_folder from lote_detalle where id_lote = vp_id_lote;
			
			set vl_orden = 0;
			select sum(tot_pag) into vl_orden from lote_detalle where id_lote = vp_id_lote;
			
			set vl_tot_error = 0;
			select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
			
			update lote set 
			tot_folder=ifnull(vl_folder,0),
			tot_pag=ifnull(vl_orden,0),
			tot_errpag=ifnull(vl_tot_error,0)
			where id_lote = vp_id_lote;
			
			select 'OK' as 'status','Expediente eliminado.'as 'response',vp_id_lote as 'id_lote';
		else
			select 'ER' as 'status','El Expediente cuenta con páginas, no es posible eliminar.'as 'response',vp_id_lote as 'id_lote';
		end if;
	end if;
    
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_lotizer` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_lotizer` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_lotizer`(IN vp_seleccionar char(1),IN vp_shi_codigo smallint,IN vp_fac_cliente smallint,IN vp_lote INT,IN vp_lote_estado CHAR(2),IN `vp_name` varchar(100),IN `vp_date` varchar(8),IN vp_estado char(1))
BEGIN
	declare vp_area varchar(30);
	SELECT pro_descri into vp_area from contratos where cod_contrato=vp_fac_cliente;
	set vp_lote_estado = '';
    if ifnull(vp_lote,0)!= 0 then
		set vp_date = '';
        set vp_estado = '';
    end if;
    
    if ifnull(vp_seleccionar,'P') = 'P' then
		set vp_date = '';
    end if;
    
    
	SELECT nivel,id_lote,shi_codigo,fac_cliente,id_det,
		lot_estado,
		tipdoc,
		#concat('LT',id_lote,'-',nombre) as lote_nombre,
        concat(CASE WHEN nivel = 1 THEN vp_area ELSE '' END,nombre) as lote_nombre,
        nombre,
        descripcion,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		id_user,
		usr_update,
		fec_update,
		estado from (
	SELECT 1 AS nivel,id_lote,shi_codigo,fac_cliente,0 as id_det,
		lot_estado,
		tipdoc,
		nombre,
        descripcion,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		A.id_user,
		B.usr_codigo as usr_update,
		fec_update,
		estado,0 as orden
		FROM lote A
        LEFT JOIN usuarios B ON A.id_user = B.id_user
		where 
        id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else id_lote end) AND 
        shi_codigo = vp_shi_codigo and fac_cliente = (CASE WHEN IFNULL(vp_fac_cliente,0)!= 0 THEN vp_fac_cliente ELSE fac_cliente END) and nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else lot_estado end)  AND
		fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
		estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
		union all
		select 2 AS nivel,
        A.id_lote,
        A.shi_codigo,C.fac_cliente,
        A.id_det,
        C.lot_estado,
        C.tipdoc,
        A.nombre,'',
        A.fecha,
        1,
        A.tot_pag,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado ,A.orden
        from lote_detalle A
        INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
        LEFT JOIN usuarios B ON A.usr_regis = B.id_user
        where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = (CASE WHEN IFNULL(vp_fac_cliente,0)!= 0 THEN vp_fac_cliente ELSE fac_cliente END) and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.proceso = (case when ifnull(vp_seleccionar,0) != 0 then vp_seleccionar else C.proceso end) AND 
        C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        
	) AS TAB ORDER BY id_lote desc,nivel, orden asc,id_det asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_return` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_return` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_return`(
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_id_dev INT,
IN vp_motivo char(2),
IN vp_fecha varchar(10),
IN vp_estado char(1),
IN vp_id_user smallint)
BEGIN
	
    declare vl_perfil smallint default 0;
    
    if ifnull(vp_id_dev,0)!= 0 then
		set vp_fecha = '';
        set vp_estado = '';
    end if;
    
    select usr_perfil into vl_perfil from usuarios where id_user=vp_id_user;
    
    if ifnull(vl_perfil,0) >= 4 then
        set vp_id_user=0;
    end if;
    
    SELECT a.id_dev,a.motivo,a.fecha,a.hora,a.responsable,a.documento,a.mensaje,a.tot_lotes,a.tot_folders,a.estado,a.fecha_registro,u.usr_nombre FROM devoluciones a
    inner join usuarios u on u.id_user=a.id_user
    where 
    a.shi_codigo=vp_shi_codigo and 
    a.fac_cliente=vp_fac_cliente and 
    a.id_dev = (case when ifnull(vp_id_dev,0) != 0 then vp_id_dev else a.id_dev end ) and 
    a.motivo= (case when ifnull(vp_motivo,'') != '' then vp_motivo else a.motivo end ) and 
    #a.fecha = (case when ifnull(vp_fecha,'') != '' then vp_fecha else a.fecha end ) and 
    date(a.fecha_registro) = (case when ifnull(vp_fecha,'') != '' then vp_fecha else date(a.fecha_registro) end ) and 
    a.estado= (case when ifnull(vp_estado,'') != '' then vp_estado else a.estado end ) and
    u.id_user = (case when ifnull(vp_id_user,0) != 0 then vp_id_user else u.id_user end )
    order by a.id_dev desc limit 100;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_user` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_user`(IN vp_op char(1),IN vp_nombre varchar(120),IN `vp_id_user` INT)
BEGIN
DECLARE vl_id_shi_cod SMALLINT DEFAULT 0;
SELECT id_shi_cod INTO vl_id_shi_cod FROM usuarios WHERE id_user = vp_id_user;
if (vl_id_shi_cod) = 0 then
if ifnull(vp_op,'U') = 'U' then
SELECT a.id_user,a.usr_codigo,
    a.usr_tipo,a.usr_nombre,a.per_id,
    a.id_contacto,a.usr_perfil,a.usr_estado,
    a.id_usuario,a.fecact,a.hora,b.shi_nombre,c.pro_descri
FROM usuarios a 
left JOIN shipper b ON a.id_shi_cod = b.shi_codigo
left JOIN contratos c ON a.id_cod_con = c.cod_contrato
WHERE usr_codigo LIKE CONCAT('%',TRIM(vp_nombre),'%') ORDER BY id_user ASC;
end if;
if ifnull(vp_op,'U') = 'N' then
SELECT a.id_user,a.usr_codigo,
    a.usr_tipo,a.usr_nombre,a.per_id,
    a.id_contacto,a.usr_perfil,a.usr_estado,
    a.id_usuario,a.fecact,a.hora,b.shi_nombre,c.pro_descri
FROM usuarios a
LEFT JOIN shipper b ON a.id_shi_cod = b.shi_codigo
LEFT JOIN contratos c ON a.id_cod_con = c.cod_contrato
where usr_nombre like concat('%',trim(vp_nombre),'%') order by id_user asc;
end if;
else
IF IFNULL(vp_op,'U') = 'U' THEN
SELECT a.id_user,a.usr_codigo,
    a.usr_tipo,a.usr_nombre,a.per_id,
    a.id_contacto,a.usr_perfil,a.usr_estado,
    a.id_usuario,a.fecact,a.hora,b.shi_nombre,c.pro_descri
FROM usuarios a
left JOIN shipper b ON a.id_shi_cod = b.shi_codigo
left JOIN contratos c ON a.id_cod_con = c.cod_contrato
WHERE usr_codigo LIKE CONCAT('%',TRIM(vp_nombre),'%') and id_shi_cod= vl_id_shi_cod ORDER BY id_user ASC;
END IF;
IF IFNULL(vp_op,'U') = 'N' THEN
SELECT a.id_user,a.usr_codigo,
    a.usr_tipo,a.usr_nombre,a.per_id,
    a.id_contacto,a.usr_perfil,a.usr_estado,
    a.id_usuario,a.fecact,a.hora,b.shi_nombre,c.pro_descri
FROM usuarios a
left JOIN shipper b ON a.id_shi_cod = b.shi_codigo
LEFT JOIN contratos c ON a.id_cod_con = c.cod_contrato
WHERE usr_nombre LIKE CONCAT('%',TRIM(vp_nombre),'%') AND id_shi_cod= vl_id_shi_cod ORDER BY id_user ASC;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_lotizer_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_lotizer_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_lotizer_page`(IN vp_shi_codigo smallint,IN vp_fac_cliente smallint,IN vp_lote INT,IN vp_lote_estado CHAR(2),IN `vp_name` varchar(100),IN `vp_date` varchar(8),IN vp_estado char(1))
BEGIN
	
    if ifnull(vp_lote,0)!= 0 then
		set vp_date = '';
        set vp_estado = '';
    end if;
    
	SELECT nivel,
		hijo,
        padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
        nombre,
        descripcion,
        path,
        img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		id_user,
		usr_update,
		fec_update,
		estado,orden from (
		SELECT 1 AS nivel,
        id_lote as hijo,
        id_lote as padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		nombre,
        descripcion,
        '' as path,
        '' as img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		A.id_user,
		B.usr_codigo as usr_update,
		fec_update,
		estado,0 as orden
		FROM django.lote A
        LEFT JOIN usuarios B ON A.id_user = B.id_user
		where 
        id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else id_lote end) AND 
        shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else lot_estado end)  AND
		fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
		estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
		union all
		select 2 AS nivel,
        A.id_det as hijo,
        A.id_lote as padre,#padre
        A.id_lote,
        A.shi_codigo,
        C.fac_cliente,
        C.lot_estado,
        C.tipdoc,
        A.nombre,'',
        '' as path,
        '' as img,
        A.fecha,
        1,
        A.tot_pag,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado ,A.orden
        from lote_detalle A
        INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
        LEFT JOIN usuarios B ON A.usr_regis = B.id_user
        where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        union all
        select 3 AS nivel,
		P.id_pag as hijo,
        P.id_det as padre,
        C.id_lote,
		A.shi_codigo,C.fac_cliente,
		C.lot_estado AS lot_estado,
		C.tipdoc, 
		CONCAT(P.path,P.img)  AS nombre,'',
        P.path,
        P.img,
		A.fecha,
		0,
        1,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado ,P.orden
		FROM paginas P
		INNER JOIN lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
		INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
		LEFT JOIN usuarios B ON A.usr_regis = B.id_user
		where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        and P.estado='A'
        
	) AS TAB ORDER BY padre asc,orden asc,hijo asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_ocr_plantillas` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_ocr_plantillas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_ocr_plantillas`(IN vp_shi_codigo smallint,IN vp_fac_cliente smallint,IN vp_nombre varchar(150), IN vp_fecha char(8))
BEGIN
SELECT a.cod_plantilla,
    a.shi_codigo,
    a.fac_cliente,
    a.nombre,
    a.cod_formato,
    a.tot_trazos,
    a.path,
    a.img,
    a.pathorigen,
    a.imgorigen,
    a.texto,
    a.estado,
    a.fecha,
    a.id_user  as usuario,
    a.width,
    a.height,
    b.width as width_formato,
    b.height as height_formato,
    b.nombre as formato
FROM plantilla as a
inner join formatos as b on a.cod_formato=b.cod_formato
where 
shi_codigo=vp_shi_codigo and 
fac_cliente=vp_fac_cliente and
a.nombre like concat('%',case when ifnull(trim(vp_nombre),'') = '' then a.nombre else trim(vp_nombre) end,'%') and
date(a.fecha)= (case when ifnull(vp_fecha,'')='' then date(a.fecha) else vp_fecha end );
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_pending_return` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_pending_return` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_pending_return`(
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_lote INT,
IN vp_lote_estado CHAR(2),
IN vp_name varchar(100),
IN vp_date varchar(8),
IN vp_estado char(1),
IN vp_id_user smallint)
BEGIN
	
    declare vl_perfil smallint default 0;
    
    if ifnull(vp_lote,0)!= 0 then
		set vp_date = '';
        set vp_estado = '';
    end if;
    
    select usr_perfil into vl_perfil from usuarios where id_user=vp_id_user;
    
    if ifnull(vl_perfil,0) >= 4 then
		set vp_lote_estado = '';
    end if;
    
	SELECT nivel,
		hijo,
        padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
        nombre,
        descripcion,
        path,
        img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		id_user,
		usr_update,
		fec_update,
		estado,id_dev,usr_dev
        from (
		SELECT 1 AS nivel,
        id_lote as hijo,
        id_lote as padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		nombre,
        descripcion,
        '' as path,
        '' as img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		A.id_user,
		B.usr_codigo as usr_update,
		fec_update,
		estado,(case when ifnull((select count(1) from devoluciones_detalle where id_lote=A.id_lote),0) = ifnull(tot_folder,0) then -1 else 0 end) as id_dev,'' as usr_dev
		FROM lote A
        LEFT JOIN usuarios B ON A.id_user = B.id_user
		where 
        id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else id_lote end) AND 
        shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        lot_estado = (case when ifnull(vp_lote_estado,'DI') != '' then vp_lote_estado else lot_estado end)   AND
		fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE fecha END) AND
		estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE estado END)
		union all
		select 2 AS nivel,
        A.id_det as hijo,
        A.id_lote as padre,#padre
        A.id_lote,
        A.shi_codigo,
        C.fac_cliente,
        C.lot_estado,
        C.tipdoc,
        A.nombre,'',
        '' as path,
        '' as img,
        A.fecha,
        1,
        A.tot_pag,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,ifnull(D.id_dev,0) as id_dev,ifnull(U.usr_nombre,'')  as usr_dev
        from lote_detalle A
        INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
        left join devoluciones_detalle D on D.id_lote = A.id_lote and D.id_det = A.id_det
        LEFT JOIN usuarios B ON A.usr_regis = B.id_user
        LEFT JOIN usuarios U ON U.id_user = D.id_user
        where 
        #A.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else A.id_lote end) AND 
        #A.shi_codigo = vp_shi_codigo AND  
        #C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end) AND  
        #A.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE A.estado END)
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado = (case when ifnull(vp_lote_estado,'DI') != '' then vp_lote_estado else C.lot_estado end)   AND 
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        /*union all
        select 3 AS nivel,
		P.id_pag as hijo,
        P.id_det as padre,
        C.id_lote,
		A.shi_codigo,C.fac_cliente,
		C.lot_estado AS lot_estado,
		C.tipdoc, 
		CONCAT(P.path,P.img)  AS nombre,'',
        P.path,
        P.img,
		A.fecha,
		0,
        1,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado 
		FROM paginas P
		INNER JOIN django.lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
		INNER JOIN django.lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
		LEFT JOIN usuarios B ON A.usr_regis = B.id_user
		where 
        
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        and P.estado='A'*/
        
	) AS TAB ORDER BY padre asc,hijo asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_usr_shipper` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_usr_shipper` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_usr_shipper`(IN `vp_id_user` INT)
BEGIN
declare vl_id_shi_cod SMALLINT DEFAULT 0;
	SELECT id_shi_cod INTO vl_id_shi_cod FROM usuarios WHERE id_user = vp_id_user;
IF IFNULL(vl_id_shi_cod,0) = 0 THEN	
	select a.shi_codigo,concat(a.shi_codigo,'-',a.shi_nombre) as shi_nombre,a.shi_logo,
	fec_ingreso,shi_estado,id_user,fecact || ' - ' ||  hora as fecha_actual
	 from shipper a
	where shi_estado=1 
	order by a.shi_nombre;
else
	SELECT a.shi_codigo,CONCAT(a.shi_codigo,'-',a.shi_nombre) AS shi_nombre,a.shi_logo,
	fec_ingreso,shi_estado,id_user,fecact || ' - ' ||  hora AS fecha_actual
	 FROM shipper a
	WHERE shi_estado=1 AND shi_codigo = vl_id_shi_cod
	ORDER BY a.shi_nombre;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_list_pre_return` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_list_pre_return` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_list_pre_return`(
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_id_dev INT,
IN vp_id_user smallint)
BEGIN
	
    declare vl_perfil smallint default 0;
    /*
    if ifnull(vp_lote,0)!= 0 then
		set vp_date = '';
        set vp_estado = '';
    end if;
    
    select usr_perfil into vl_perfil from usuarios where id_user=vp_id_user;
    
    if ifnull(vl_perfil,0) >= 4 then
		set vp_lote_estado = '';
    end if;*/
    
	SELECT nivel,
		hijo,
        padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		concat(CASE WHEN nivel = 1 THEN 'LT' WHEN nivel =2 THEN 'FDR' ELSE 'PG' END,hijo,'-',nombre) as lote_nombre,
        nombre,
        descripcion,
        path,
        img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		id_user,
		usr_update,
		fec_update,
		estado,id_dev,usr_dev
        from (
		SELECT 1 AS nivel,
        id_lote as hijo,
        id_lote as padre,
        id_lote,
        shi_codigo,fac_cliente,
		lot_estado,
		tipdoc,
		nombre,
        descripcion,
        '' as path,
        '' as img,
		fecha,
		tot_folder,
		tot_pag,
		tot_errpag,
		A.id_user,
		B.usr_codigo as usr_update,
		fec_update,
		estado,0 as id_dev,'' as usr_dev
		FROM lote A
        LEFT JOIN usuarios B ON A.id_user = B.id_user
		where 
        shi_codigo = vp_shi_codigo and fac_cliente = vp_fac_cliente and 
        id_lote in(
			select distinct id_lote  from devoluciones_detalle 
            WHERE  id_lote = A.id_lote and id_dev=vp_id_dev
        )
		union all
		select 2 AS nivel,
        A.id_det as hijo,
        A.id_lote as padre,#padre
        A.id_lote,
        A.shi_codigo,
        C.fac_cliente,
        C.lot_estado,
        C.tipdoc,
        A.nombre,'',
        '' as path,
        '' as img,
        A.fecha,
        1,
        A.tot_pag,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado,ifnull(D.id_dev,0) as id_dev,ifnull(U.usr_nombre,'') as usr_dev
        from lote_detalle A
        INNER JOIN lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
        INNER join devoluciones_detalle D on D.id_lote = A.id_lote and D.id_det = A.id_det
        INNER JOIN usuarios U ON U.id_user = D.id_user
        LEFT JOIN usuarios B ON A.usr_regis = B.id_user
        where 
        #C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        D.id_dev=vp_id_dev
        /*union all
        select 3 AS nivel,
		P.id_pag as hijo,
        P.id_det as padre,
        C.id_lote,
		A.shi_codigo,C.fac_cliente,
		C.lot_estado AS lot_estado,
		C.tipdoc, 
		CONCAT(P.path,P.img)  AS nombre,'',
        P.path,
        P.img,
		A.fecha,
		0,
        1,
        A.tot_pag_err,A.usr_regis,B.usr_codigo as usr_regis,'',A.estado 
		FROM paginas P
		INNER JOIN django.lote_detalle A ON A.id_det=P.id_det and P.id_lote=A.id_lote
		INNER JOIN django.lote C ON C.shi_codigo=A.shi_codigo AND C.id_lote=A.id_lote
		LEFT JOIN usuarios B ON A.usr_regis = B.id_user
		where 
        
        C.id_lote = (case when ifnull(vp_lote,0) != 0 then vp_lote else C.id_lote end) AND 
        C.shi_codigo = vp_shi_codigo and C.fac_cliente = vp_fac_cliente and 
        C.nombre LIKE concat('%',TRIM(IFNULL(vp_name,'')),'%') AND
        C.lot_estado = (case when ifnull(vp_lote_estado,'LT') != '' then vp_lote_estado else C.lot_estado end)  AND
		C.fecha = (CASE WHEN IFNULL(vp_date,'') != '' THEN  vp_date ELSE C.fecha END) AND
		C.estado = (CASE WHEN IFNULL(vp_estado,'')!='' THEN vp_estado ELSE C.estado END)
        and P.estado='A'*/
        
	) AS TAB ORDER BY padre asc,hijo asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_client` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_client` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_client`(IN vp_op CHARACTER(1), IN vp_shi_codigo SMALLINT,IN `vp_nombre` VARCHAR(100), in vp_estado CHAR(1) ,  IN `vp_id_user` INT)
BEGIN
declare vl_exits smallint default 0;
declare vl_id_lote integer default 0;
IF vp_op = 'I' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from shipper where upper(trim(shi_nombre)) = upper(trim(vp_nombre));
		if ifnull(vl_exits,0) = 0 then 
			insert into shipper(shi_nombre,fec_ingreso,shi_estado,id_user)
			values(vp_nombre,now(),'1',vp_id_user);
			select 'OK' as 'status','Registro insertado'as 'response',vp_shi_codigo as 'id_lote';
		else
			select 'ER' as 'status','Nombre de Cliente ya existe, verifique.'as 'response',0 as 'Cliente';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre de Cliente.'as 'response',0 as 'Cliente';
    end if;
    
    
end if;
IF vp_op = 'U' then 
     if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from shipper where UPPER(TRIM(shi_nombre)) = UPPER(TRIM(vp_nombre)) AND shi_codigo =vp_shi_codigo and shi_estado = vp_estado;
        if ifnull(vl_exits,0) = 0 then 
			set vl_exits = 0;
			SELECT COUNT(*) INTO vl_exits FROM shipper WHERE UPPER(TRIM(shi_nombre)) = UPPER(TRIM(vp_nombre)) and shi_codigo != vp_shi_codigo;
			if ifnull(vl_exits,0)= 0 then 
				update shipper set shi_nombre=vp_nombre,fecact=NOW(),shi_estado=vp_estado,id_user=vp_id_user where  shi_codigo=vp_shi_codigo;
				
				select 'OK' as 'status','Registro actualizado'as 'response',vp_shi_codigo as 'id_cliente';
			else
				select 'ER' as 'status','Nombre del Cliente ya existe, verifique.'as 'response',0 as 'id_cliente';
			end if;
        else
			select 'ER' as 'status','Cliente se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_cliente';
	end if;
    else
		select 'ER' as 'status','Ingrese un Nombre Cliente.'as 'response',0 as 'id_cliente';
    end if;
end if;
IF vp_op = 'D' then 
	SELECT COUNT(*) INTO vl_exits FROM shipper WHERE shi_codigo =vp_shi_codigo AND shi_estado = '0';
	if ifnull(vl_exits,0) = 0 then 
		update shipper set shi_estado = (case when shi_estado = '1' then '0' else shi_estado end),fecact=NOW(),id_user=vp_id_user where shi_codigo=vp_shi_codigo;
           
		select 'OK' as 'status','Registro Desactivado'as 'response',vp_shi_codigo as 'id_lote';
	else
		select 'ER' as 'status','Cliente se encuentra en otro estado, no es posible modificar'as 'response',0 as 'id_lote';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_contrato` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_contrato` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_contrato`(IN vp_op CHARACTER(1), IN vp_shi_codigo SMALLINT,IN `vp_nombre` VARCHAR(100), in vp_estado CHAR(1) ,IN vp_cod_contrato SMALLINT,  IN `vp_id_user` INT)
BEGIN
declare vl_exits smallint default 0;
declare vl_id_codcontrato integer default 0;
DECLARE vl_contrato varchar(100) DEFAULT '';
IF vp_op = 'I' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from contratos A inner join fac_cliente B on A.cod_contrato = B.cod_contrato and B.shi_codigo = vp_shi_codigo 
		where upper(trim(pro_descri)) = upper(trim(vp_nombre));
		if ifnull(vl_exits,0) = 0 then
		        SET vl_contrato = vp_nombre;  
			insert into contratos(pro_descri,fecha_ing,estado,id_user)
			values(vl_contrato,now(),'A',vp_id_user);
			SELECT MAX(cod_contrato) INTO vl_id_codcontrato FROM contratos;
			INSERT INTO fac_cliente (shi_codigo,cod_contrato,fac_estado)
			values (vp_shi_codigo,vl_id_codcontrato,vp_estado);
			select 'OK' as 'status','Registro insertado'as 'response',vp_cod_contrato as 'id_contrato';
		else
			select 'ER' as 'status','Nombre de Contrato ya existe, verifique.'as 'response',0 as 'id_contrato';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre de Contrato.'as 'response',0 as 'id_contrato';
    end if;
    
    
end if;
IF vp_op = 'U' then 
     if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from contratos where UPPER(TRIM(pro_descri)) = UPPER(TRIM(vp_nombre)) and cod_contrato = vp_cod_contrato and estado = vp_estado ;
        if ifnull(vl_exits,0)= 0 then 
			set vl_exits = 0;
			SELECT COUNT(*) INTO vl_exits FROM contratos A INNER JOIN fac_cliente B ON A.cod_contrato = B.cod_contrato AND B.shi_codigo = vp_shi_codigo 
			WHERE UPPER(TRIM(pro_descri)) = UPPER(TRIM(vp_nombre));
			if ifnull(vl_exits,0)= 0 then 
				update contratos set pro_descri=vp_nombre,fecha_act=NOW(),estado=vp_estado,id_user=vp_id_user where  cod_contrato=vp_cod_contrato;
				UPDATE fac_cliente SET fac_estado = vp_estado where  cod_contrato=vp_cod_contrato; 
				
				select 'OK' as 'status','Registro actualizado'as 'response',vp_cod_contrato as 'id_contrato';
			else
				select 'ER' as 'status','Nombre del Contrato ya existe, verifique.'as 'response',0 as 'id_contrato';
			end if;
        else
			select 'ER' as 'status','Contrato se encuentra registrado en otro estado, no es posible modificar'as 'response',0 as 'id_contrato';
	end if;
    else
		select 'ER' as 'status','Ingrese un Nombre Contrato.'as 'response',0 as 'id_contrato';
    end if;
end if;
IF vp_op = 'D' then 
	SELECT COUNT(*) INTO vl_exits FROM contratos WHERE cod_contrato =vp_cod_contrato AND estado = 'I';
	if ifnull(vl_exits,0) = 0 then 
		update contratos set estado = (case when estado = 'A' then 'I' else estado end),fecha_act=NOW(),id_user=vp_id_user where cod_contrato=vp_cod_contrato;
		update fac_cliente SET fac_estado = (CASE WHEN fac_estado = 'A' THEN 'I' ELSE fac_estado END) where cod_contrato = vp_cod_contrato; 
		select 'OK' as 'status','Registro Desactivado'as 'response',vp_shi_codigo as 'id_contrato';
	else
		select 'ER' as 'status','Contrato se encuentra en otro estado, no es posible Desactivar'as 'response',0 as 'id_contrato';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_ocr_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_ocr_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_ocr_page`(
in vp_op char(1),
in vp_id_pag int,
in vp_cod_trazo int,
in vp_id_det int,
in vp_id_lote int,
in vp_texto text,
in vp_id_user SMALLINT(6)
)
BEGIN
IF vp_op = 'I' then 
update paginas set
ocr='Y',
fecact=NOW(),
id_user =vp_id_user
where  id_pag = vp_id_pag;
delete from paginas_trazos where id_pag= vp_id_pag and cod_trazo=vp_cod_trazo;
INSERT INTO paginas_trazos(id_pag,cod_trazo,texto,estado,fecha,id_user)
VALUES(vp_id_pag,vp_cod_trazo,vp_texto,'A',NOW(),vp_id_user);
select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
end if;
IF vp_op = 'X' then 
update paginas set
ocr='N',
texto=vp_texto,
fecact=NOW(),
id_user =vp_id_user
where  id_pag = vp_id_pag;
delete from paginas_trazos where id_pag= vp_id_pag and cod_trazo=cod_trazo;
select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_pre_return` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_pre_return` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_pre_return`(
in vp_op char(1), 
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_id_lote int,
IN vp_id_det int,
IN vp_id_dev int,
IN vp_id_user INT)
BEGIN
	
	declare vl_exits smallint default 0;
	declare vl_id_lote integer default 0;
    declare vl_id_dev integer default 0;
    
    declare vl_tot_lotes smallint default 0;
    declare vl_tot_folder smallint default 0;
	
    
    select count(1) into vl_exits from devoluciones where id_dev=vp_id_dev and estado='P';
    IF IFNULL(vl_exits,0) != 0 THEN 
		set vl_exits = 0;
		IF IFNULL(vp_op,'I') = 'A' THEN 
            
            
            INSERT INTO devoluciones_detalle(id_dev,id_lote,id_det,lote_estado,total_pag,fecha,id_user)
			SELECT vp_id_dev,id_lote,id_det,det_estado,tot_pag,NOW(),vp_id_user FROM lote_detalle L
            WHERE id_lote = vp_id_lote AND id_det = (CASE WHEN IFNULL(vp_id_det,0) =0 THEN id_det ELSE vp_id_det END) AND
            id_det NOT IN(
				SELECT id_det FROM devoluciones_detalle WHERE id_det=L.id_det AND id_lote= L.id_lote
            );
            set vl_tot_lotes = 0;
            set vl_tot_folder = 0;
            
            SELECT COUNT(1) INTO vl_tot_lotes FROM (
            SELECT id_lote FROM devoluciones_detalle WHERE id_dev=vp_id_dev GROUP BY id_lote
            ) AS LOTE;
            
            SELECT COUNT(1) into vl_tot_folder FROM devoluciones_detalle WHERE id_dev=vp_id_dev;
            
            update devoluciones set
				tot_lotes=vl_tot_lotes,
				tot_folders=vl_tot_folder
			where id_dev=vp_id_dev;
			
			select 'OK' as 'status','Registro insertado'as 'response',vp_id_dev as 'id_dev';
		END IF;
		
		IF IFNULL(vp_op,'I') = 'D' THEN 
			
            DELETE FROM devoluciones_detalle 
            WHERE id_dev_det!=0 and id_lote = vp_id_lote AND id_det = (CASE WHEN IFNULL(vp_id_det,0) =0 THEN id_det ELSE vp_id_det END);
			
			set vl_tot_lotes = 0;
            set vl_tot_folder = 0;
            
            SELECT COUNT(1) INTO vl_tot_lotes FROM (
            SELECT id_lote FROM devoluciones_detalle WHERE id_dev=vp_id_dev GROUP BY id_lote
            ) AS LOTE;
            
            SELECT  COUNT(1) into vl_tot_folder FROM devoluciones_detalle WHERE id_dev=vp_id_dev;
            
            update devoluciones set
				tot_lotes=vl_tot_lotes,
				tot_folders=vl_tot_folder
			where id_dev=vp_id_dev;
			
			select 'OK' as 'status','Registro Actualizado'as 'response',vp_id_dev as 'id_dev';
			
		END IF;
    else
		select 'ER' as 'status','El estado de la pre devolucion no esta pendiente por favor.'as 'response',vp_id_dev as 'id_dev';
    end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_ocr_plantilla` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_ocr_plantilla` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_ocr_plantilla`(
IN vp_op char(1),
IN vp_cod_plantilla INT,
IN vp_shi_codigo INT,
IN vp_fac_cliente SMALLINT,
IN vp_nombre VARCHAR(100),
IN vp_cod_formato SMALLINT,
IN vp_width DOUBLE,
IN vp_height DOUBLE,
IN vp_path VARCHAR(200),
IN vp_img VARCHAR(150),
IN vp_pathorigen VARCHAR(200),
IN vp_imgorigen VARCHAR(150),
IN vp_texto TEXT,
IN vp_estado char(1),
in vp_id_user SMALLINT(6)
)
BEGIN
declare vl_exits smallint default 0;
declare vl_cod_plantilla integer default 0;
IF vp_op = 'I' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from plantilla where upper(trim(nombre)) = upper(trim(vp_nombre));
		if ifnull(vl_exits,0) = 0 then 
            INSERT INTO plantilla(shi_codigo,fac_cliente,nombre,cod_formato,width,height,tot_trazos,path,img,pathorigen,imgorigen,texto,estado,fecha,id_user)
			VALUES(vp_shi_codigo,vp_fac_cliente,vp_nombre,vp_cod_formato,vp_width,vp_height,0,vp_path,vp_img,vp_pathorigen,vp_imgorigen,vp_texto,vp_estado,NOW(),vp_id_user);
			
			select max(cod_plantilla) into vl_cod_plantilla from plantilla;
            
            update plantilla set
			img=concat(vl_cod_plantilla,'-plantilla',vp_img)
			where cod_plantilla = vl_cod_plantilla;
            
            select 'OK' as 'status','Registro insertado'as 'response',vl_cod_plantilla as 'cod_plantilla';
		else
			select 'ER' as 'status','Nombre de la Planitilla ya existe, verifique.'as 'response',0 as 'cod_plantilla';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para la Planitilla.'as 'response',0 as 'cod_plantilla';
    end if;
    
    
end if;
IF vp_op = 'U' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from plantilla where cod_plantilla = vp_cod_plantilla;
        if ifnull(vl_exits,0)!= 0 then 
			set vl_exits = 0;
			select count(*) into vl_exits from plantilla where cod_plantilla != vp_cod_plantilla and upper(trim(nombre)) = upper(trim(vp_nombre));
			if ifnull(vl_exits,0)= 0 then 
				
                update plantilla set
                shi_codigo=vp_shi_codigo,
                fac_cliente=vp_fac_cliente,
                nombre=vp_nombre,
                cod_formato=vp_cod_formato,
                width=vp_width,
                height=vp_height,
                path=vp_path,
                img=concat(vp_cod_plantilla,'-plantilla',vp_img),
                pathorigen=vp_pathorigen,
                imgorigen=vp_imgorigen,
                texto=vp_texto,
                estado=vp_estado,
                fecha=NOW(),
                id_user=vp_id_user
                where cod_plantilla = vp_cod_plantilla;
                
				select 'OK' as 'status','Registro actualizado'as 'response',vp_cod_plantilla as 'cod_plantilla';
			else
				select 'ER' as 'status','Nombre de la Planitilla ya existe, verifique.'as 'response',0 as 'cod_plantilla';
			end if;
        else
			select 'ER' as 'status','No existe la Planitilla, no es posible modificar'as 'response',0 as 'cod_plantilla';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para la Planitilla.'as 'response',0 as 'cod_plantilla';
    end if;
end if;
IF vp_op = 'D' then 
	select count(*) into vl_exits from plantilla where cod_plantilla = vp_cod_plantilla;
	if ifnull(vl_exits,0)!= 0 then 
		delete from plantilla where cod_plantilla = vp_cod_plantilla;
        
		select 'OK' as 'status','Registro actualizado'as 'response',vp_cod_trazo as 'cod_plantilla';
	else
		select 'ER' as 'status','Planitilla no existe, no es posible eliminar'as 'response',0 as 'cod_plantilla';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_shipper` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_shipper` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_shipper`(IN `vp_op` CHARACTER(1), IN `vp_shi_codigo` INTEGER, IN `vp_shi_nombre` VARCHAR(200), IN `vp_fec_ingreso` VARCHAR(50), IN `vp_shi_logo` VARCHAR(50), IN `vp_estado` INT, IN `vp_id_user` INT)
BEGIN
declare vl_exits smallint default 0;
declare vl_shi_codigo smallint default 0;
IF vp_op = 'I' then 
	select count(*) into vl_exits from shipper where upper(trim(shi_nombre)) = upper(trim(vp_shi_nombre));
    if ifnull(vl_exits,0) = 0 then 
		insert into shipper(shi_codigo,shi_id,shi_nombre,fec_ingreso,shi_logo,shi_estado,id_user,fecact,hora)
		values(0,0,vp_shi_nombre,vp_fec_ingreso,ifnull(vp_shi_logo,'default.jpg'),1,vp_id_user,CURDATE(),'');
			
		select max(shi_codigo) into vl_shi_codigo from shipper;
		select 'OK' as 'status','Registro insertado'as 'response',vl_shi_codigo as 'shi_codigo';
    else
		select 'ER' as 'status','Cliente ya existe, verifique.'as 'response',0 as 'shi_codigo';
    end if;
end if;
IF vp_op = 'U' then 
	select count(*) into vl_exits from shipper where upper(trim(shi_nombre)) = upper(trim(vp_shi_nombre)) and shi_codigo !=vp_shi_codigo;
    if ifnull(vl_exits,0)= 0 then 
		update shipper set shi_nombre=vp_shi_nombre,fec_ingreso=vp_fec_ingreso,shi_logo=(case when ifnull(vp_shi_logo,'') ='' then shi_logo else vp_shi_logo end),shi_estado=vp_estado where  shi_codigo=vp_shi_codigo;
		select 'OK' as 'status','Registro actualizado'as 'response',vp_shi_codigo as 'shi_codigo';
    else
		select 'ER' as 'status','Cliente ya existe, verifique.'as 'response',0 as 'shi_codigo';
    end if;
end if;
IF vp_op = 'D' then 
    update shipper set shi_estado = (case when shi_estado = 1 then 0 else 1  end) where  shi_codigo=vp_shi_codigo;
    select 'OK' as 'status','Registro actualizado'as 'response',vp_shi_codigo as 'shi_codigo';
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_ocr_trazos` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_ocr_trazos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_ocr_trazos`(
in vp_op char(1),
in vp_cod_trazo int,
in vp_cod_plantilla int,
in vp_nombre varchar(100),
in vp_tipo char(1),
in vp_x DOUBLE,
in vp_y DOUBLE,
in vp_w DOUBLE,
in vp_h DOUBLE,
in vp_path VARCHAR(200),
in vp_img VARCHAR(100),
in vp_texto text,
in vp_estado char(1),
in vp_id_user SMALLINT(6)
)
BEGIN
declare vl_exits smallint default 0;
declare vl_cod_trazo integer default 0;
declare vl_cod_plantilla integer default 0;
IF vp_op = 'I' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from trazos where cod_plantilla = vp_cod_plantilla and upper(trim(nombre)) = upper(trim(vp_nombre));
		if ifnull(vl_exits,0) = 0 then 
            INSERT INTO trazos(cod_trazo,cod_plantilla,nombre,tipo,x,y,w,h,path,img,texto,estado,fecha,id_user)
			VALUES(vl_cod_trazo,vp_cod_plantilla,vp_nombre,vp_tipo,vp_x,vp_y,vp_w,vp_h,vp_path,vp_img,vp_texto,vp_estado,NOW(),vp_id_user);
			
			select max(cod_trazo) into vl_cod_trazo from trazos where cod_plantilla=vp_cod_plantilla;
            
            update trazos set
                img=concat(vl_cod_trazo,'-trazo',vp_img)
                where cod_trazo = vl_cod_trazo and cod_plantilla = vp_cod_plantilla;
            
            select 'OK' as 'status','Registro insertado'as 'response',vl_cod_trazo as 'cod_trazo';
		else
			select 'ER' as 'status','Nombre de Trazo ya existe, verifique.'as 'response',0 as 'cod_trazo';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para el Trazo.'as 'response',0 as 'cod_trazo';
    end if;
    
    
end if;
IF vp_op = 'U' then 
	if ifnull(vp_nombre,'') != '' then
		select count(*) into vl_exits from trazos where cod_trazo = vp_cod_trazo and cod_plantilla = vp_cod_plantilla;
        if ifnull(vl_exits,0)!= 0 then 
			set vl_exits = 0;
			select count(*) into vl_exits from trazos where cod_trazo != vp_cod_trazo and cod_plantilla = vp_cod_plantilla and upper(trim(nombre)) = upper(trim(vp_nombre));
			if ifnull(vl_exits,0)= 0 then 
				
                update trazos set
                nombre=vp_nombre,
                tipo=vp_tipo,
                x=vp_x,
                y=vp_y,
                w=vp_w,
                h=vp_h,
                path=vp_path,
                img=concat(vp_cod_trazo,'-trazo',vp_img),
                texto=vp_texto,
                estado=vp_estado,
                fecha=NOW(),
                id_user =vp_id_user
                where cod_trazo = vp_cod_trazo and cod_plantilla = vp_cod_plantilla;
				
				select 'OK' as 'status','Registro actualizado'as 'response',vp_cod_trazo as 'cod_trazo';
			else
				select 'ER' as 'status','Nombre del trazo ya existe, verifique.'as 'response',0 as 'cod_trazo';
			end if;
        else
			select 'ER' as 'status','No existe el trazo, no es posible modificar'as 'response',0 as 'cod_trazo';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre para el Trazo.'as 'response',0 as 'cod_trazo';
    end if;
end if;
IF vp_op = 'D' then 
	select count(*) into vl_exits from trazos where cod_trazo = vp_cod_trazo and cod_plantilla = vp_cod_plantilla;
	if ifnull(vl_exits,0)!= 0 then 
		delete from trazos where cod_trazo = vp_cod_trazo and cod_plantilla = vp_cod_plantilla;
        
		select 'OK' as 'status','Registro actualizado'as 'response',vp_cod_trazo as 'cod_trazo';
	else
		select 'ER' as 'status','Trazo no existe, no es posible eliminar'as 'response',0 as 'cod_trazo';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_page` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_page` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_page`(
in vp_op char(1),
in vp_id_pag int,
in vp_id_det int,
in vp_id_lote int,
in vp_path varchar(200),
in vp_img varchar(150),
in vp_imgorigen varchar(150),
in vp_lado char(1),
in vp_estado char(1),
in vp_w decimal,
in vp_h decimal,
in vp_id_user SMALLINT(6)
)
BEGIN
declare vl_exits smallint default 0;
declare vl_orden smallint(6) default 0;
declare vl_folder smallint(6) default 0;
declare vl_tot_error smallint(6) default 0;
declare vl_page_error smallint(6) default 0;
declare vl_id_pag integer default 0;
IF vp_op = 'I' then 
	
	select max(orden) into vl_orden from paginas where id_det = vp_id_det and id_lote = vp_id_lote;
    
    set vl_orden = ifnull(vl_orden,0) + 1;
    
	INSERT INTO paginas(id_det,id_lote,path,img,imgorigen,lado,w,h,orden,estado,id_user,fecact)
	VALUES(vp_id_det,vp_id_lote,vp_path,vp_img,vp_imgorigen,vp_lado,ifnull(vp_w,0),ifnull(vp_h,0),vl_orden,vp_estado,vp_id_user,now());
	
	select max(id_pag) into vl_id_pag from paginas where id_det = vp_id_det and id_lote = vp_id_lote;
    
    UPDATE paginas SET
    img=TRIM(vp_img)
    WHERE id_pag=vl_id_pag;
    
    set vl_orden = 0;
    select count(1) into vl_orden from paginas where id_det = vp_id_det and id_lote = vp_id_lote;
    
    set vl_page_error = 0;
	select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
	
	update lote_detalle set
	tot_pag=ifnull(vl_orden,0),
    tot_pag_err=ifnull(vl_page_error,0)
	where id_det = vp_id_det and id_lote = vp_id_lote;
    
    set vl_orden = 0;
    select count(1) into vl_folder from lote_detalle where id_lote = vp_id_lote;
    
    set vl_orden = 0;
    select sum(tot_pag) into vl_orden from lote_detalle where id_lote = vp_id_lote;
    
    set vl_tot_error = 0;
	select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
    
    update lote set 
    tot_folder=ifnull(vl_folder,0),
    tot_pag=ifnull(vl_orden,0),
    tot_errpag=ifnull(vl_tot_error,0)
    where id_lote = vp_id_lote;
	
	
	select 'OK' as 'status','Registro insertado'as 'response',vl_id_pag as 'id_pag';
end if;
IF vp_op = 'U' then 
	select count(*) into vl_exits from paginas where id_pag = vp_id_pag;
	if ifnull(vl_exits,0)!= 0 then 
		update paginas set
			path=vp_path,
			img=vp_img,
			lado=vp_lado,
            w=ifnull(vp_w,0),
            h=ifnull(vp_h,0),
			orden=vp_orden,
			estado=vp_estado,
			fecact=NOW(),
			id_user =vp_id_user
			where  id_pag = vp_id_pag;
            
            #update paginas set
			#img=concat(vl_id_pag,trim(vp_img))
			#where id_pag=vl_id_pag;
    
            set vl_orden = 0;
			select count(1) into vl_orden from paginas where id_det = vp_id_det  and id_lote = vp_id_lote;
            
            set vl_page_error = 0;
			select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
			
			update lote_detalle set
			tot_pag=ifnull(vl_orden,0),
            tot_pag_err=ifnull(vl_page_error,0)
			where id_det = vp_id_det and id_lote = vp_id_lote;
			
			set vl_orden = 0;
			select count(1) into vl_folder from lote_detalle where id_lote = vp_id_lote;
			
			set vl_orden = 0;
			select sum(tot_pag) into vl_orden from lote_detalle where id_lote = vp_id_lote;
            
            set vl_tot_error = 0;
			select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
			
			update lote set 
			tot_folder=ifnull(vl_folder,0),
			tot_pag=ifnull(vl_orden,0),
            tot_errpag=ifnull(vl_tot_error,0)
			where id_lote = vp_id_lote;
			
			select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
	else
		select 'ER' as 'status','No existe página, no es posible modificar'as 'response',0 as 'id_pag';
	end if;
   
end if;
IF vp_op = 'D' then 
	select count(*) into vl_exits from paginas where id_pag = vp_id_pag;
	if ifnull(vl_exits,0)!= 0 then 
		delete from paginas where id_pag = vp_id_pag;
        
        delete from paginas_error where id_pag = vp_id_pag and id_det = vp_id_det and id_lote = vp_id_lote;
        
        
        set vl_orden = 0;
		select count(1) into vl_orden from paginas where id_det = vp_id_det  and id_lote = vp_id_lote;
        
        set vl_page_error = 0;
		select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
		
		update lote_detalle set
		tot_pag=ifnull(vl_orden,0),
        tot_pag_err=ifnull(vl_page_error,0)
		where id_det = vp_id_det and id_lote = vp_id_lote;
		
		set vl_orden = 0;
		select count(1) into vl_folder from lote_detalle where id_lote = vp_id_lote;
		
		set vl_orden = 0;
		select sum(tot_pag) into vl_orden from lote_detalle where id_lote = vp_id_lote;
        
        set vl_tot_error = 0;
		select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
		
		update lote set 
		tot_folder=ifnull(vl_folder,0),
		tot_pag=ifnull(vl_orden,0),
        tot_errpag=ifnull(vl_tot_error,0)
		where id_lote = vp_id_lote;
		
		select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
	else
		select 'ER' as 'status','Página no existe, no es posible eliminar'as 'response',0 as 'id_pag';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_page_error` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_page_error` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_page_error`(
in vp_op char(1),
in vp_id_pag int,
in vp_id_det int,
in vp_id_lote int,
in vp_msg varchar(250),
in vp_id_user SMALLINT(6)
)
BEGIN
declare vl_exits smallint default 0;
declare vl_tot_error smallint(6) default 0;
declare vl_page_error smallint(6) default 0;
declare vl_id_pag integer default 0;
IF vp_op = 'I' then 
	
	select count(1) into vl_exits from paginas_error where id_pag = vp_id_pag;
    if ifnull(vl_exits,0) = 0 then 
		
		INSERT INTO paginas_error(id_pag,id_det,id_lote,msg,fecha,id_user)
		VALUES(vp_id_pag,vp_id_det,vp_id_lote,vp_msg,now(),vp_id_user);
        
        INSERT INTO paginas_error_log(id_pag,id_det,id_lote,estado,msg,fecha,id_user)
        VALUES(vp_id_pag,vp_id_det,vp_id_lote,'I',vp_msg,now(),vp_id_user);
		
		set vl_page_error = 0;
		select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
		
		update lote_detalle set
		tot_pag_err=ifnull(vl_page_error,0)
		where id_det = vp_id_det and id_lote = vp_id_lote;
		
		set vl_tot_error = 0;
		select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
		
		update lote set 
		tot_errpag=ifnull(vl_tot_error,0)
		where id_lote = vp_id_lote;
		
		
		select 'OK' as 'status','Registro insertado'as 'response',vl_id_pag as 'id_pag';
    else
		select 'ER' as 'status','La página seleccionada ya se encuentra marcada como error, no es posible modificar'as 'response',0 as 'id_pag';
	end if;
end if;
IF vp_op = 'U' then 
	select count(*) into vl_exits from paginas_error where id_pag = vp_id_pag;
	if ifnull(vl_exits,0)!= 0 then 
			
			update paginas_error set
			msg=vp_msg,
			fecha=NOW(),
			id_user =vp_id_user
			where id_pag = vp_id_pag;
            
            INSERT INTO paginas_error_log(id_pag,id_det,id_lote,estado,msg,fecha,id_user)
			VALUES(vp_id_pag,vp_id_det,vp_id_lote,'U',vp_msg,now(),vp_id_user);
            
    
            set vl_page_error = 0;
			select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
			
			update lote_detalle set
			tot_pag_err=ifnull(vl_page_error,0)
			where id_det = vp_id_det and id_lote = vp_id_lote;
			
			set vl_tot_error = 0;
			select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
			
			update lote set 
			tot_errpag=ifnull(vl_tot_error,0)
			where id_lote = vp_id_lote;
			
			select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
	else
		select 'ER' as 'status','No existe página con error marcado, no es posible modificar'as 'response',0 as 'id_pag';
	end if;
   
end if;
IF vp_op = 'D' then 
	select count(*) into vl_exits from paginas_error where id_pag = vp_id_pag;
	if ifnull(vl_exits,0)!= 0 then 
		
		delete from paginas_error where id_pag = vp_id_pag and id_det = vp_id_det and id_lote = vp_id_lote;
        
        INSERT INTO paginas_error_log(id_pag,id_det,id_lote,estado,msg,fecha,id_user)
			VALUES(vp_id_pag,vp_id_det,vp_id_lote,'D',vp_msg,now(),vp_id_user);
        
        set vl_page_error = 0;
		select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
		
		update lote_detalle set
		tot_pag_err=ifnull(vl_page_error,0)
		where id_det = vp_id_det and id_lote = vp_id_lote;
		
		set vl_tot_error = 0;
		select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
		
		update lote set 
		tot_errpag=ifnull(vl_tot_error,0)
		where id_lote = vp_id_lote;
		
		select 'OK' as 'status','Registro actualizado'as 'response',vp_id_pag as 'id_pag';
	else
		select 'ER' as 'status','Página con error no existe, no es posible eliminar'as 'response',0 as 'id_pag';
	end if;
end if;
IF vp_op = 'C' then 
	select count(*) into vl_exits from paginas_error where id_pag = vp_id_pag;
	if ifnull(vl_exits,0)!= 0 then 
		
		delete from paginas_error where id_pag = vp_id_pag and id_det = vp_id_det and id_lote = vp_id_lote;
        
        INSERT INTO paginas_error_log(id_pag,id_det,id_lote,estado,msg,fecha,id_user)
			VALUES(vp_id_pag,vp_id_det,vp_id_lote,'C',vp_msg,now(),vp_id_user);
        
        set vl_page_error = 0;
		select count(1) into vl_page_error from paginas_error where id_det = vp_id_det and id_lote = vp_id_lote;
		
		update lote_detalle set
		tot_pag_err=ifnull(vl_page_error,0)
		where id_det = vp_id_det and id_lote = vp_id_lote;
		
		set vl_tot_error = 0;
		select count(1) into vl_tot_error from paginas_error where id_lote = vp_id_lote;
		
		update lote set 
		tot_errpag=ifnull(vl_tot_error,0)
		where id_lote = vp_id_lote;
		
		select 'OK' as 'status','Registro Corregido'as 'response',vp_id_pag as 'id_pag';
	else
		select 'ER' as 'status','Página con error no existe, no es posible Corregir'as 'response',0 as 'id_pag';
	end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_return` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_return` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_return`(
in vp_op char(1), 
IN vp_shi_codigo smallint,
IN vp_fac_cliente smallint,
IN vp_id_dev int,
in vp_motivo char(2), 
IN vp_fecha char(8),
IN vp_hora char(8),
IN vp_responsable varchar(100),  
IN vp_documento varchar(45),
IN vp_mensaje varchar(255),
IN vp_id_user INT)
BEGIN
	
	declare vl_exits smallint default 0;
	declare vl_id_lote integer default 0;
    declare vl_id_dev integer default 0;
    
    declare vl_tot_lotes smallint default 0;
    declare vl_tot_origen smallint default 0;
    declare vl_tot_folder smallint default 0;
	
    
    IF IFNULL(vp_op,'I') = 'I' THEN 
		
		INSERT INTO devoluciones(shi_codigo,fac_cliente,motivo,fecha,hora,responsable,documento,mensaje,tot_lotes,tot_folders,estado,fecha_registro,id_user)
		VALUES(vp_shi_codigo,vp_fac_cliente,vp_motivo,vp_fecha,vp_hora,vp_responsable,vp_documento,vp_mensaje,0,0,'P',NOW(),vp_id_user);
		
		select max(id_dev) into vl_id_dev from devoluciones where id_user=vp_id_user;
		
		INSERT INTO devoluciones_estado(id_dev,estado,fecha,id_user)
		VALUES(vl_id_dev,'P',NOW(),vp_id_user);
		
		select 'OK' as 'status','Registro insertado'as 'response',vl_id_dev as 'id_dev';
	END IF;
    
    IF IFNULL(vp_op,'I') = 'U' THEN 
		select count(1) into vl_exits from devoluciones where id_dev=vp_id_dev and estado='P';
        IF IFNULL(vl_exits,0) != 0 THEN 
			update devoluciones set
				motivo=vp_motivo,
				fecha=vp_fecha,
				hora=vp_hora,
				responsable=vp_responsable,
                documento=vp_documento,
				mensaje=vp_mensaje,
				tot_lotes=vl_tot_lotes,
				tot_folders=vl_tot_folder
			where id_dev=vp_id_dev;
			
			#INSERT INTO devoluciones_estado(id_dev,estado,fecha,id_user)
			#VALUES(vp_id_dev,'D',NOW(),vp_id_user);
			
			select 'OK' as 'status','Registro Actualizado'as 'response',vp_id_dev as 'id_dev';
		ELSE
			select 'ER' as 'status','Registro se encuentra en otro estado no es posible actualizar'as 'response',vp_id_dev as 'id_dev';
        END IF;
	END IF;
    
	IF IFNULL(vp_op,'I') = 'D' THEN 
    
		select count(1) into vl_exits from devoluciones_detalle where id_dev=vp_id_dev;
        
        IF IFNULL(vl_exits,0) != 0 THEN 
			set vl_exits=0;
			select count(1) into vl_exits from devoluciones where id_dev=vp_id_dev and estado='P';
			IF IFNULL(vl_exits,0) != 0 THEN 
				
                set vl_tot_lotes = 0;
				set vl_tot_folder = 0;
				
				SELECT COUNT(1) INTO vl_tot_lotes FROM (
				SELECT id_lote FROM devoluciones_detalle WHERE id_dev=vp_id_dev GROUP BY id_lote
				) AS LOTE;
				
				SELECT  COUNT(1) into vl_tot_folder FROM devoluciones_detalle WHERE id_dev=vp_id_dev;
				
				update devoluciones set
				tot_lotes=vl_tot_lotes,
				tot_folders=vl_tot_folder,
				estado='D'
				where id_dev=vp_id_dev;
				
				INSERT INTO devoluciones_estado(id_dev,estado,fecha,id_user)
				VALUES(vp_id_dev,'D',NOW(),vp_id_user);
                
                set vl_tot_lotes= 0;
				set vl_tot_origen= 0;
                
                RECORRE:begin
					DECLARE cursor1 CURSOR FOR SELECT id_lote FROM devoluciones_detalle WHERE id_dev=vp_id_dev GROUP BY id_lote;
					DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done = true; 
					OPEN cursor1;
					LOOP1: LOOP
						FETCH cursor1 INTO vl_id_lote;
						IF @vl_done THEN
						  CLOSE cursor1;
						  LEAVE LOOP1;
						END IF;
						
                        select count(1) into vl_tot_lotes from devoluciones_detalle where id_lote=vl_id_lote;
                        select count(1) into vl_tot_origen from lote_detalle where id_lote=vl_id_lote;
                        if ifnull(vl_tot_lotes,0) = ifnull(vl_tot_origen,0) then 
							update lote set lot_estado= 'DE',usr_update=vp_id_user where  id_lote=vl_id_lote;
							INSERT INTO django.lote_estado(id_lote,shi_codigo,lot_estado,id_user,fecact)
							VALUES(vl_id_lote,vp_shi_codigo,'DE',vp_id_user,NOW());
                        end if;
                        
					END LOOP LOOP1;
                END;
				
				select 'OK' as 'status','Registro Cerrado'as 'response',vp_id_dev as 'id_dev';
			ELSE
				select 'ER' as 'status','Registro se encuentra en otro estado no es posible actualizar'as 'response',vp_id_dev as 'id_dev';
			END IF;
		else
			select 'ER' as 'status','Devolución no tiene Documentos a devolver, no es posible cerrar.'as 'response',vp_id_dev as 'id_dev';
		end if;
	END IF;
    
	IF IFNULL(vp_op,'I') = 'C' THEN 
		
		update devoluciones set
		tot_lotes=0,
		tot_folders=0,
		estado='C'
		where id_dev=vp_id_dev;
		
        delete from devoluciones_detalle where id_dev_det!=0 and id_dev=vp_id_dev;
        
		INSERT INTO devoluciones_estado(id_dev,estado,fecha,id_user)
		VALUES(vp_id_dev,'C',NOW(),vp_id_user);
        
        select 'OK' as 'status','Registro Cerrado'as 'response',vp_id_dev as 'id_dev';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `set_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `set_user` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `set_user`(IN vp_op CHARACTER(1), IN vp_id_user integer,IN vp_usr_codigo VARCHAR(15),IN vp_usr_passwd VARCHAR(120), in vp_usr_nombre VARCHAR(40) ,  IN vp_usr_perfil smallint,IN vp_usr_estado char(1),IN vp_usr_cliente SMALLINT,IN vp_usr_contrato SMALLINT,IN vp_id_user_udt integer)
BEGIN
declare vl_exits smallint default 0;
declare vl_id_user integer default 0;
IF vp_op = 'I' then 
	if ifnull(vp_usr_codigo,'') != '' then
		select count(*) into vl_exits from usuarios where upper(trim(usr_codigo)) = upper(trim(vp_usr_codigo));
		if ifnull(vl_exits,0) = 0 then 
			insert into usuarios(usr_codigo,usr_passwd,usr_tipo,usr_nombre,per_id,id_contacto,usr_perfil,usr_estado,id_usuario,fecact,hora,id_shi_cod,id_cod_con)
			values(vp_usr_codigo,'','I',vp_usr_nombre,1,0,vp_usr_perfil,vp_usr_estado,vp_id_user_udt,now(),hour(now()),vp_usr_cliente,vp_usr_contrato);
            
		    select max(id_user) into vl_id_user from usuarios;
		    
		    INSERT INTO key_user(id_user,usr_clave,fec_cambio,fec_hora,fec_vence,tim_sesion,key_anterior)
		    vALUES(vl_id_user,vp_usr_passwd,now(),hour(now()),'2050-01-01',60,'');
		    INSERT INTO permiso_sistema (id_user,sis_id,estado,id_usuario,fecact,hora)
		    VALUEs (vl_id_user,1,vp_usr_estado,vl_id_user,CURDATE(),HOUR(NOW()));	
		    
			    
			    IF (vp_usr_perfil = 1) then
			      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
			      VALUES (vl_id_user,1,1,vp_usr_estado,vl_id_user,CURDATE());	
			      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
			      VALUES (vl_id_user,3,1,vp_usr_estado,vl_id_user,CURDATE());				    
			    else
				if (vp_usr_perfil = 4) THEN
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,1,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,2,1,vp_usr_estado,vl_id_user,CURDATE());
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)				      				
				      VALUES (vl_id_user,3,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,10,1,vp_usr_estado,vl_id_user,CURDATE());				    
			    
			        else
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUEs (vl_id_user,1,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,2,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,3,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,4,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,5,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,6,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,7,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,8,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,9,1,vp_usr_estado,vl_id_user,CURDATE());	
				      INSERT INTO permisos (id_user,id_service,acceso,estado,id_user_act,fecact)
				      VALUES (vl_id_user,10,1,vp_usr_estado,vl_id_user,CURDATE());	
			        END IF;   
			    end if;  
	      
	      
	      
			
			select 'OK' as 'status','Registro insertado'as 'response';
		else
			select 'ER' as 'status','Nombre del usuario ya existe, verifique.'as 'response';
		end if;
    else
		select 'ER' as 'status','Ingrese un Nombre por favor.'as 'response';
    end if;
end if;
IF vp_op = 'U' then 
     if ifnull(vp_usr_codigo,'') != '' then
		select count(*) into vl_exits from usuarios where id_user = vp_id_user;
        if ifnull(vl_exits,0) != 0 then 
			set vl_exits = 0;
			select count(*) into vl_exits from usuarios where upper(trim(usr_codigo)) = upper(trim(vp_usr_codigo)) and id_user != vp_id_user;
			if ifnull(vl_exits,0)= 0 then 
                update usuarios set 
                usr_codigo=vp_usr_codigo,
                usr_passwd='',
                usr_nombre=vp_usr_nombre,
                usr_perfil=vp_usr_perfil,
                usr_estado=vp_usr_estado,
                id_usuario=vp_id_user_udt,
                fecact=now(),
                hora=hour(now())
                where id_user = vp_id_user;
                
                update key_user set 
                key_anterior=usr_clave,
                usr_clave=vp_usr_passwd,
                fec_cambio=now(),
                fec_hora=hour(now()),
                fec_vence=now()+30
                where id_user = vp_id_user;
				select 'OK' as 'status','Registro actualizado'as 'response';
			else
				select 'ER' as 'status','Nombre de usuario ya existe, verifique.'as 'response';
			end if;
        else
			select 'ER' as 'status','Usuario no existe, no es posible modificar'as 'response';
		end if;
    else
		select 'ER' as 'status','Ingrese un nombre de usuario.'as 'response';
    end if;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usr_sis_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `usr_sis_login` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `usr_sis_login`(IN `pusr_codigo` VARCHAR(80), IN `pusr_passwd` VARCHAR(80), IN `pip_mac` VARCHAR(20))
proc_label:BEGIN
declare vl_estado      Smallint;
declare vl_id_user     int;
declare vl_shicodigo   Smallint;
declare vl_id_contacto integer;
declare vl_shi_nombre  varchar(100);
declare vl_usr_tipo    char(1);
declare vl_usuario     varchar(20);
declare vl_nombre      varchar(40);
declare vl_mac_ip      varchar(20);
declare vl_perfil      smallint;
declare vl_per_id      integer;
declare vl_prov_codigo smallint;
declare vl_prov_nombre varchar(50);
declare vl_prov_sigla  char(3);
declare vl_id_agencia  smallint;
declare vl_vence       smallint;
declare vl_sis_id      smallint;
declare vl_usr_clave   Char(40);
declare vl_time_session smallint;
declare vl_error       integer;
declare vl_err_sql     int;
declare vl_err_isam    int;
declare vl_err_info    varChar(100);
set @vl_err_sql  = 0;
set @vl_err_isam = 0;
set @vl_error    = 0;
set @vl_err_info = 'OK';
set @vl_estado       = 0;
set @vl_id_user      = 0;
set @vl_shicodigo    = 0;
set @vl_id_contacto  = 0;
set @vl_shi_nombre   = '';
set @vl_mac_ip       = '';
set @vl_usr_tipo     = '';
set @vl_usuario      = '';
set @vl_nombre       = '';
set @vl_perfil       = 0;
set @vl_per_id       = 0;
set @vl_prov_codigo  = 0;
set @vl_prov_nombre  = '';
set @vl_prov_sigla   = '';
set @vl_id_agencia   = 0;
set @vl_vence        = 0;
set @vl_sis_id       = 0;
set @vl_time_session = 60;
 
  SELECT id_user,id_contacto,usr_estado,usr_tipo,usr_codigo,usr_nombre,per_id,usr_perfil
    INTO @vl_id_user,@vl_id_contacto,@vl_estado,@vl_usr_tipo,@vl_usuario,@vl_nombre,@vl_per_id,@vl_perfil
  FROM usuarios Where upper(trim(usr_codigo))=upper(trim(pusr_codigo));
	
  
  If ifnull(@vl_id_user,0) = 0 Then
    select -1 as sql_error,'Este Usuario no lo Tenemos Registrado, Verifique e Intente otra vez' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
    LEAVE proc_label;
  End If;
  
	
  If @vl_estado=0 Then
    If @vl_usr_tipo='I' Then
     select -1 as sql_error,'Su usuario esta desactivado, Comuniquese con sistemas.' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
		LEAVE proc_label;
    Else
     select -1 as sql_error,'Su usuario ha sido desactivado, Comuniquese con su Ejecutivo de Cuenta ...' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
     LEAVE proc_label;
    End If;
  End If;
 
  SELECT fec_vence - CURDATE(),usr_clave INTO @vl_vence,@vl_usr_clave
  FROM key_user Where id_user=@vl_id_user;
  If @vl_usr_clave Is Null Or Trim(@vl_usr_clave)!=trim(pusr_passwd) Then
     select -1 as sql_error,'El Usuario Existe, Pero la Clave no es Correcta, Verifique e Intente otra vez' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
     LEAVE proc_label;
  End If;
  
  select s.sis_id into @vl_sis_id
	  from sistemas s
	  inner join permiso_sistema p on p.sis_id = s.sis_id
	  where p.id_user = @vl_id_user and p.estado > 0 
	  and s.sis_id in(
		select sis_id from modulos m
		inner join menus ms on ms.mod_id=m.mod_id
		inner join servicio_menu sm on sm.menu_id = ms.menu_id
		inner join permisos  pr on pr.id_service = sm.id_service
		where pr.id_user=p.id_user and pr.estado = 1 and sm.estado=1 and ms.menu_estado = 1
		group by 1
	  )
	  order by estado desc limit 1;
      
      
      
	 If ifnull(@vl_sis_id,0)=0 Then
		select -1 as sql_error,'Su usuario no tiene permiso para ingresar al sistema.' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
        LEAVE proc_label;
	  End If;
	  
	  If ifnull(@vl_vence,0) <= 0 then
		select -1 as sql_error,'Su clave a expirado, no tiene permiso para ingresar al sistema, cambie su clave.' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
        LEAVE proc_label;
	  else
		if @vl_vence <= 5 then
		  set @vl_err_sql = 0;
		  set @vl_err_info = 'Faltan '||@vl_vence||' días para que expire su clave.';
		else
		  set @vl_err_sql = 1;
		end if;
	  end if;
	
    
    
	 If @vl_usr_tipo='I' Then
		If ifnull(@vl_per_id,0) = 0 Then
		 select -1 as sql_error,'Usuario no esta registrado como personal interno, contate con sistemas' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
         LEAVE proc_label;
		End If;
		
		select prov_codigo into @vl_prov_codigo from personal where per_id = vl_per_id;
		select prov_nombre,prov_sigla into @vl_prov_nombre,@vl_prov_sigla from provincia where prov_codigo=vl_prov_codigo;
		
	  Else
		
		If ifnull(@vl_id_contacto,0) = 0 Then
		 select -1 as sql_error,'Usuario no esta relacionado a un contacto, Consulte a su Ejecutivo de Cuenta...' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
         LEAVE proc_label;
		End If;
		
		select shi_codigo,id_agencia into @vl_shicodigo,@vl_id_agencia from lcontacto where id_contacto = vl_id_contacto limit 1;
		If ifnull(@vl_shicodigo,0) = 0 Then
		   select -1 as sql_error,'Los Datos de Identificacion No es Valida, Consulte a su Ejecutivo de Cuenta' as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
           LEAVE proc_label;
		End If;
		
		select shi_nombre into @vl_shi_nombre from shipper where shi_codigo = vl_shicodigo limit 1;
		
		select prov_codigo into @vl_prov_codigo from agenciashipper where id_agencia = @vl_id_agencia and shi_codigo = @vl_shicodigo;
		
		select prov_nombre,prov_sigla into @vl_prov_nombre, @vl_prov_sigla from provincia where prov_codigo=@vl_prov_codigo;
		
        
	  End If;
      
      select @vl_err_sql as sql_error,@vl_err_info as msn_error,@vl_id_user as id_user,@vl_usuario as usuario,@vl_nombre as nombre,@vl_usr_tipo as usr_tipo,@vl_prov_codigo as prov_codigo,@vl_prov_nombre as prov_nombre,
	  @vl_prov_sigla as prov_sigla,@vl_per_id as per_id,IFNULL(@vl_perfil,2) as perfil,@vl_id_contacto as id_remitente,@vl_sis_id as sis_id,@vl_time_session as time_session,@vl_shicodigo as shi_codigo;
	  
	  If ifnull(@vl_error,0) = 1 then
		 select @vl_err_sql as sql_error,@vl_err_info as msn_error,0 as id_user,'' as usuario,'' as nombre,'' as usr_tipo,0 as prov_codigo,'' as prov_nombre,'' as prov_sigla,0 as per_id,0 as perfil,0 as id_remitente,0 as sis_id,0 as time_session,0 as shi_codigo;
	  End if;
	  
	  insert into log_accesos(id_user,sis_id,fec_ingreso,fec_salida,log_ip,log_estado)
	  values(@vl_id_user,@vl_sis_id,CURDATE(),CURDATE(),pip_mac,1);
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `usr_sis_menus` */

/*!50003 DROP PROCEDURE IF EXISTS  `usr_sis_menus` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `usr_sis_menus`(IN `vp_user` INTEGER, IN `vp_sis_id` INTEGER)
BEGIN
declare vs_Padre         smallInt;
declare vs_Nivel         smallInt;
declare vs_nombre        varChar(60);
declare vs_nombre_padre  varchar(60);
declare vs_url           varChar(100);
declare vs_icono         varChar(80);
declare vs_icono_padre   varChar(80);
declare vs_id_menu       smallInt;
declare vl_vs_padre_t    smallint;
declare vl_lineas        smallInt;
declare vl_order         smallInt;
declare vl_menu_class    varchar(30);
declare vl_id_modulo     smallint;
declare vl_error     integer;
declare vl_err_sql   int;
declare vl_err_isam  int;
declare vl_err_info  varChar(100);
CREATE TEMPORARY TABLE tmp_result (
    sql_error smallint ,
    msn_error varchar(200)  DEFAULT '',
    padre int NOT NULL DEFAULT 0, 
    nivel smallint  DEFAULT 0,
    nombre varchar(120)  DEFAULT '',
    url varchar(120)  DEFAULT '',
    icono varchar(50)  DEFAULT '',
    id_menu int  DEFAULT 0, 
    menu_class varchar(70)  DEFAULT '',
    orden smallint  DEFAULT 0
) ENGINE=InnoDB ;
set @vl_err_sql      = 0;
set @vl_err_isam     = 0;
set @vl_error        = 0;
set @vl_err_info     = '';
set @vl_lineas       = 0;
set @vs_nivel        = 0;
set @vl_vs_padre_t   = 0;
set @vs_icono_padre  = '';
set @vs_nombre_padre = '';
set @vl_menu_class   = '';
principal:begin
  
  
  
  
  
  DECLARE no_more_rows BOOLEAN DEFAULT false;
  DECLARE v_col1 INT;
  DECLARE v_col2 INT;
  DECLARE cursor1 CURSOR FOR
    select m.mod_id,m.mod_nombre,m.mod_icono 
        from modulos m
        inner join permiso_sistema p on p.sis_id=m.sis_id
        where p.sis_id = vp_sis_id and p.id_user = vp_user and m.mod_estado=1 and p.estado > 0
        order by m.mod_orden;
  DECLARE cursor2 CURSOR FOR
    select m.menu_orden,m.menu_nombre,m.menu_url,m.menu_icono,m.menu_id,m.menu_class 
                from menus m
                inner join servicio_menu sm on sm.menu_id = m.menu_id
                inner join permisos  p on p.id_service = sm.id_service
                where m.mod_id = vl_id_modulo and p.id_user = vp_user and m.menu_estado = 1 and p.estado = 1
                Group By 1,2,3,4,5,6
                order by 1,2;
  
  
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done = true; 
    
OPEN cursor1;
LOOP1: LOOP
    FETCH cursor1 INTO vl_id_modulo,vs_nombre_padre,vs_icono_padre;
    IF @vl_done THEN
	  CLOSE cursor1;
	  LEAVE LOOP1;
	END IF;
	
    set vs_padre = vl_id_modulo+500;
    OPEN cursor2;
LOOP2: LOOP
		  FETCH cursor2 INTO vl_order,vs_nombre,vs_url,vs_icono,vs_id_menu,vl_menu_class;
		  
			IF @vl_done THEN
			  SET @v_done = false;
			  CLOSE cursor2;
			  LEAVE LOOP2;
			END IF;
            
			set vl_lineas = vl_lineas + 1;
			set vs_icono = case when ifnull(vs_icono,'') in('.','./','') then 'logo_default.png' else vs_icono end;
			set vs_icono_padre = case when ifnull(vs_icono_padre,'') in('.','./','') then 'logo_default.png' else vs_icono end;
			if vl_id_modulo != vl_vs_padre_t then
				
				insert into tmp_result(sql_error,msn_error,padre,nivel,nombre,url,icono,id_menu,menu_class,orden)
				values(1,'OK',0,0,ifnull(vs_nombre_padre,''),'',ifnull(vs_icono_padre,''),ifnull(vs_padre,''),'',0);
				set vl_vs_padre_t = vl_id_modulo;
			end if;
		
		  insert into tmp_result(sql_error,msn_error,padre,nivel,nombre,url,icono,id_menu,menu_class,orden)
		  values(1,'OK',ifnull(vs_padre,0),1,ifnull(vs_nombre,''),ifnull(vs_url,''),ifnull(vs_icono,''),ifnull(vs_id_menu,''),ifnull(vl_menu_class,''),ifnull(vl_order,0));
		  
		END LOOP LOOP2;
		
	  END LOOP LOOP1;
 
end;
If ifnull(@vl_error,0) = 1 then
   select @vl_err_sql as 'sql_error',@vl_err_info as 'msn_error',0 as 'Padre',0 as 'Nivel','' as 'Nombre',''  as 'url',''  as 'icono',0  as 'Id_Menu','' as 'menu_class',0  as 'orden';
End if;
If vl_lineas = 0 Then
   select -1 as 'sql_error','Usuario No Tiene Menús Activos' as 'msn_error',0 as 'Padre',0 as 'Nivel','' as 'Nombre',''  as 'url',''  as 'icono',0  as 'Id_Menu','' as 'menu_class',0  as 'orden';
else
   select sql_error,msn_error,padre,nivel,nombre,url,icono,id_menu,menu_class,orden from tmp_result;
End if;
insert into log_accesos(id_user,sis_id,fec_ingreso,fec_salida,log_ip,log_estado)
	  values(1,1,CURDATE(),CURDATE(),'acceso',1);
drop table tmp_result;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usr_sis_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `usr_sis_servicios` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `usr_sis_servicios`(IN `vp_user` INTEGER, IN `vp_sis_id` SMALLINT, IN `vp_mod_id` SMALLINT, IN `vp_menu_id` SMALLINT)
BEGIN
declare vs_padre       smallint;
declare vl_serv_id     integer;
declare vl_menu_id     smallint;
declare vl_serv_nombre varChar(60);
declare vl_serv_descri varChar(100);
declare vl_serv_icono  varChar(80);
declare vs_id_menu     smallint;
declare vl_lineas      smallInt;
declare vl_order       smallInt;
declare vl_error     integer;
declare vl_err_sql   int;
declare vl_err_isam  int;
declare vl_err_info  varChar(100);
CREATE TEMPORARY TABLE tmp_result (
    sql_error smallint ,
    msn_error varchar(200)  DEFAULT '',
    serv_id int NOT NULL DEFAULT 0, 
    menu_id smallint  DEFAULT 0,
    serv_nombre varchar(120)  DEFAULT '',
    serv_descri varchar(120)  DEFAULT '',
    serv_icono varchar(50)  DEFAULT '',
    servicios int  DEFAULT 0
) ENGINE=InnoDB ;
set vl_err_sql      = 0;
set vl_err_isam     = 0;
set vl_error        = 0;
set vl_err_info     = "";
set vl_lineas       = 0;
set vs_padre        = 0;
set vl_serv_id      = 0;
set vl_menu_id      = 0;
set vl_serv_nombre  = '';
set vl_serv_descri  = '';
set vl_serv_icono   = '';
set vp_mod_id  = case when ifnull(vp_mod_id,0) != 0 then vp_mod_id else null end;
set vp_menu_id = case when ifnull(vp_menu_id,0) != 0 then vp_menu_id else null end;
principal:begin
  
  
  
  
  
  DECLARE no_more_rows BOOLEAN DEFAULT false;
  DECLARE v_col1 INT;
  DECLARE v_col2 INT;
  DECLARE cursor1 CURSOR FOR
    select m.mod_id 
        from modulos m
        inner join permiso_sistema p on p.sis_id=m.sis_id
        where p.sis_id = vp_sis_id and m.mod_id = ifnull(vp_mod_id,m.mod_id) and p.id_user = vp_user and m.mod_estado=1 and p.estado > 0
        order by m.mod_orden;
  DECLARE cursor2 CURSOR FOR
    select m.menu_id 
                from menus m
                inner join servicio_menu sm on sm.menu_id = m.menu_id
                inner join permisos  p on p.id_service = sm.id_service
                where m.mod_id = vs_padre and p.id_user = vp_user and m.menu_estado = 1 and p.estado = 1 and m.menu_id = ifnull(vp_menu_id,m.menu_id)
                Group By 1;
                
  DECLARE cursor3 CURSOR FOR
    select sm.id_service,sm.menu_id,s.serv_nombre,s.serv_descri,s.serv_icono 
                        from servicios s
                        inner join servicio_menu sm on sm.serv_id = s.serv_id
                        inner join permisos  p on p.id_service = sm.id_service
                        where p.id_user = vp_user and sm.menu_id = vs_id_menu  and sm.estado = 1 and s.serv_estado = 1 and p.estado = 1;
  
  
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET @vl_done = true;
    
OPEN cursor1;
LOOP1: LOOP
    FETCH cursor1 INTO vs_padre;
    IF @vl_done THEN
		  CLOSE cursor1;
		  LEAVE LOOP1;
		END IF;
		OPEN cursor2;
LOOP2: LOOP
		  FETCH cursor2 INTO vs_id_menu;
			  IF @vl_done THEN
			  SET @v_done = false;
			  CLOSE cursor2;
			  LEAVE LOOP2;
			END IF;
			  
			OPEN cursor3;
LOOP3: LOOP
			  FETCH cursor3 INTO vl_serv_id,vl_menu_id,vl_serv_nombre,vl_serv_descri,vl_serv_icono;
				
				IF @vl_done THEN
				  SET @v_done = false;
				  CLOSE cursor3;
				  LEAVE LOOP3;
				END IF;
                
				set @vl_lineas = @vl_lineas + 1;
				insert into tmp_result(sql_error,msn_error,serv_id,menu_id,serv_nombre,serv_descri,serv_icono,servicios)
				values(1,'OK',ifnull(vl_serv_id,0),vl_menu_id,ifnull(vl_serv_nombre,''),ifnull(vl_serv_descri,''),ifnull(vl_serv_icono,''),ifnull(vl_serv_id,0));
			  
			END LOOP LOOP3;
        
			
          
		END LOOP LOOP2;
        
		
     
    
  END LOOP LOOP1;
 
end;
If ifnull(@vl_error,0) = 1 then
   select @vl_err_sql as 'sql_error',@vl_err_info as 'msn_error',0 as 'serv_id',0 as 'menu_id','' as 'serv_nombre',''  as 'serv_descri',''  as 'serv_icono',''  as 'servicios';
End if;
If @vl_lineas = 0 Then
   select -1 as 'sql_error','Usuario No Tiene Servicios Activos' as 'msn_error',0 as 'serv_id',0 as 'menu_id','' as 'serv_nombre',''  as 'serv_descri',''  as 'serv_icono',''  as 'servicios';
else
   select sql_error,msn_error,serv_id,menu_id,serv_nombre,serv_descri,serv_icono,servicios from tmp_result;
End if;
drop table tmp_result;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
