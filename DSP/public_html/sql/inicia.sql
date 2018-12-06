
DROP TABLE IF EXISTS `key_user`;

CREATE TABLE `key_user` (
  `id_user` INT(11) NOT NULL,
  `usr_clave` CHAR(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_cambio` DATETIME DEFAULT NULL,
  `fec_hora` CHAR(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_vence` DATE DEFAULT NULL,
  `tim_sesion` SMALLINT(6) DEFAULT NULL,
  `key_anterior` CHAR(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `key_user` */

LOCK TABLES `key_user` WRITE;

INSERT  INTO `key_user`(`id_user`,`usr_clave`,`fec_cambio`,`fec_hora`,`fec_vence`,`tim_sesion`,`key_anterior`) VALUES (1,'40bd001563085fc35165329ea1ff5c5ecbdbbeef','2017-01-02 00:00:00','201701','2050-01-02',60,'40bd001563085fc35165329ea1ff5c5ecbdbbeef');

UNLOCK TABLES;


/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `usr_codigo` CHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_passwd` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_tipo` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_nombre` VARCHAR(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_id` INT(11) DEFAULT NULL,
  `id_contacto` INT(11) DEFAULT NULL,
  `usr_perfil` SMALLINT(6) DEFAULT NULL,
  `usr_estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` INT(11) DEFAULT NULL,
  `fecact` DATE DEFAULT NULL,
  `hora` CHAR(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_shi_cod` SMALLINT(6) DEFAULT NULL,
  `id_cod_con` SMALLINT(6) DEFAULT NULL,  
  PRIMARY KEY (`id_user`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

INSERT  INTO `usuarios`(`id_user`,`usr_codigo`,`usr_passwd`,`usr_tipo`,`usr_nombre`,`per_id`,`id_contacto`,`usr_perfil`,`usr_estado`,`id_usuario`,`fecact`,`hora`,`id_shi_cod`,`id_cod_con`) VALUES (1,'rvite','','I','Ricardo Vite',1,0,5,'1',0,'2017-07-18','190501',0,0);

UNLOCK TABLES;



/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_user` INT(11) NOT NULL,
  `id_service` SMALLINT(6) NOT NULL,
  `acceso` SMALLINT(6) DEFAULT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_act` INT(11) DEFAULT NULL,
  `fecact` DATE DEFAULT NULL,
  PRIMARY KEY (`id_service`,`id_user`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permisos` */

LOCK TABLES `permisos` WRITE;

INSERT  INTO `permisos`(`id_user`,`id_service`,`acceso`,`estado`,`id_user_act`,`fecact`) VALUES (1,1,1,'1',1,'2017-07-18'),(1,2,1,'1',1,'2017-07-27'),(1,3,1,'1',1,'2017-07-27'),(1,4,1,'1',1,'2017-07-28'),(1,5,1,'1',1,'2017-08-04'),(1,6,1,'1',1,'2018-07-17'),(1,7,1,'1',1,'2018-07-17'),(1,8,1,'1',1,'2017-08-07'),(1,9,1,'1',1,'2017-08-07'),(1,10,1,'1',1,'2018-10-10');

UNLOCK TABLES;


/*Table structure for table `permiso_sistema` */

DROP TABLE IF EXISTS `permiso_sistema`;

CREATE TABLE `permiso_sistema` (
  `id_user` INT(11) NOT NULL,
  `sis_id` SMALLINT(6) NOT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` INT(11) DEFAULT NULL,
  `fecact` DATE DEFAULT NULL,
  `hora` CHAR(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`,`sis_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permiso_sistema` */

LOCK TABLES `permiso_sistema` WRITE;

INSERT  INTO `permiso_sistema`(`id_user`,`sis_id`,`estado`,`id_usuario`,`fecact`,`hora`) VALUES (1,1,'1',1,'2017-07-18','202001');

UNLOCK TABLES;



/*Table structure for table `shipper` */

DROP TABLE IF EXISTS `shipper`;

CREATE TABLE `shipper` (
  `shi_codigo` INT(6) NOT NULL AUTO_INCREMENT,
  `shi_id` CHAR(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shi_nombre` VARCHAR(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_ingreso` DATE DEFAULT NULL,
  `shi_logo` VARCHAR(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shi_estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` INT(11) DEFAULT NULL,
  `fecact` DATE DEFAULT NULL,
  `hora` CHAR(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shi_codigo`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `contratos` */

DROP TABLE IF EXISTS `contratos`;

CREATE TABLE `contratos` (
  `cod_contrato` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `pro_descri` VARCHAR(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ing` DATE DEFAULT NULL,
  `fecha_act` DATE DEFAULT NULL,
  `id_user` INT(11) DEFAULT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  PRIMARY KEY (`cod_contrato`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `lote`;

CREATE TABLE `lote` (
  `id_lote` INT(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` SMALLINT(6) NOT NULL,
  `fac_cliente` SMALLINT(6) NOT NULL,
  `lot_estado` CHAR(2) COLLATE utf8_unicode_ci NOT NULL,
  `proceso` CHAR(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `tipdoc` VARCHAR(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` DATETIME NOT NULL,
  `tot_folder` INT(5) NOT NULL,
  `tot_pag` INT(5) NOT NULL,
  `tot_errpag` INT(5) NOT NULL,
  `id_user` CHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_update` CHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_update` DATETIME DEFAULT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_lote`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*Table structure for table `lote_detalle` */

DROP TABLE IF EXISTS `lote_detalle`;

CREATE TABLE `lote_detalle` (
  `id_det` INT(11) NOT NULL AUTO_INCREMENT,
  `id_lote` INT(11) NOT NULL,
  `shi_codigo` SMALLINT(6) NOT NULL,
  `nombre` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `det_estado` CHAR(2) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` DATETIME NOT NULL,
  `tot_pag` INT(5) NOT NULL,
  `tot_pag_err` INT(5) DEFAULT NULL,
  `usr_regis` CHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_regis` DATE DEFAULT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden` SMALLINT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_det`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





/*Table structure for table `lote_estado` */

DROP TABLE IF EXISTS `lote_estado`;

CREATE TABLE `lote_estado` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT,
  `id_lote` INT(11) NOT NULL,
  `shi_codigo` SMALLINT(6) NOT NULL,
  `lot_estado` CHAR(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` INT(11) DEFAULT NULL,
  `fecact` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*Table structure for table `fac_cliente` */

DROP TABLE IF EXISTS `fac_cliente`;

CREATE TABLE `fac_cliente` (
  `fac_cliente` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `shi_codigo` SMALLINT(6) DEFAULT NULL,
  `cod_contrato` SMALLINT(6) DEFAULT NULL,
  `fac_estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fac_cliente`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `devoluciones` */

DROP TABLE IF EXISTS `devoluciones`;

CREATE TABLE `devoluciones` (
  `id_dev` INT(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` SMALLINT(6) NOT NULL,
  `fac_cliente` SMALLINT(6) NOT NULL,
  `motivo` CHAR(2) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` CHAR(5) COLLATE utf8_unicode_ci NOT NULL,
  `responsable` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `documento` VARCHAR(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tot_lotes` SMALLINT(6) NOT NULL DEFAULT '0',
  `tot_folders` SMALLINT(6) NOT NULL DEFAULT '0',
  `estado` CHAR(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` DATETIME NOT NULL,
  `id_user` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id_dev`)
) ENGINE=INNODB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*Table structure for table `devoluciones_detalle` */

DROP TABLE IF EXISTS `devoluciones_detalle`;

CREATE TABLE `devoluciones_detalle` (
  `id_dev_det` INT(11) NOT NULL AUTO_INCREMENT,
  `id_dev` INT(11) NOT NULL,
  `id_lote` INT(11) NOT NULL,
  `id_det` INT(11) NOT NULL,
  `lote_estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_pag` SMALLINT(6) DEFAULT NULL,
  `fecha` DATETIME NOT NULL,
  `id_user` CHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_dev_det`,`id_dev`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*Table structure for table `devoluciones_estado` */

DROP TABLE IF EXISTS `devoluciones_estado`;

CREATE TABLE `devoluciones_estado` (
  `id_dev_st` INT(11) NOT NULL AUTO_INCREMENT,
  `id_dev` INT(11) NOT NULL,
  `estado` CHAR(1) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_user` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id_dev_st`,`id_dev`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

CREATE TABLE `paginas` (
  `id_pag` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_det` INT(11) DEFAULT NULL,
  `id_lote` INT(11) DEFAULT NULL,
  `path` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
  `img` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
  `imgorigen` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `orden` SMALLINT(6) DEFAULT NULL,
  `lado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `w` DECIMAL(9,4) NOT NULL DEFAULT '0.0000',
  `h` DECIMAL(9,4) NOT NULL DEFAULT '0.0000',
  `ocr` CHAR(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `texto` TEXT COLLATE utf8_unicode_ci,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` INT(11) DEFAULT NULL,
  `fecact` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id_pag`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `paginas_error` */

DROP TABLE IF EXISTS `paginas_error`;

CREATE TABLE `paginas_error` (
  `id_pag` INT(11) NOT NULL,
  `id_det` INT(11) NOT NULL,
  `id_lote` INT(11) NOT NULL,
  `msg` VARCHAR(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` DATE DEFAULT NULL,
  `id_user` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_pag`,`id_det`,`id_lote`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `paginas_error_log` */

DROP TABLE IF EXISTS `paginas_error_log`;

CREATE TABLE `paginas_error_log` (
  `id_log` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pag` INT(11) NOT NULL,
  `id_det` INT(11) NOT NULL,
  `id_lote` INT(11) NOT NULL,
  `estado` CHAR(1) COLLATE utf8_unicode_ci NOT NULL,
  `msg` VARCHAR(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` VARCHAR(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` VARCHAR(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*Table structure for table `paginas_trazos` */

DROP TABLE IF EXISTS `paginas_trazos`;

CREATE TABLE `paginas_trazos` (
  `id_pag` INT(11) NOT NULL,
  `cod_trazo` VARCHAR(45) COLLATE utf8_unicode_ci NOT NULL,
  `texto` TEXT COLLATE utf8_unicode_ci,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` CHAR(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY (`id_pag`,`cod_trazo`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `plantilla` */

DROP TABLE IF EXISTS `plantilla`;

CREATE TABLE `plantilla` (
  `cod_plantilla` INT(11) NOT NULL AUTO_INCREMENT,
  `shi_codigo` INT(11) NOT NULL,
  `fac_cliente` SMALLINT(6) NOT NULL,
  `nombre` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `cod_formato` SMALLINT(2) NOT NULL,
  `width` DOUBLE DEFAULT NULL,
  `height` DOUBLE DEFAULT NULL,
  `tot_trazos` SMALLINT(2) DEFAULT '0',
  `path` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
  `pathorigen` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imgorigen` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
  `texto` TEXT COLLATE utf8_unicode_ci,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `fecha` DATETIME DEFAULT NULL,
  `id_user` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY (`cod_plantilla`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/*Table structure for table `reorder` */

DROP TABLE IF EXISTS `reorder`;

CREATE TABLE `reorder` (
  `id_lote` INT(11) NOT NULL,
  `hijo` INT(11) NOT NULL,
  `padre` INT(11) NOT NULL,
  `nivel` SMALLINT(1) NOT NULL,
  `nombre` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
  `orden` SMALLINT(3) NOT NULL,
  PRIMARY KEY (`id_lote`,`padre`,`hijo`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*Table structure for table `trazos` */

DROP TABLE IF EXISTS `trazos`;

CREATE TABLE `trazos` (
  `cod_trazo` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_plantilla` INT(11) NOT NULL,
  `nombre` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` CHAR(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `x` DOUBLE(7,4) NOT NULL DEFAULT '0.0000',
  `y` DOUBLE(7,4) NOT NULL DEFAULT '0.0000',
  `w` DOUBLE(7,4) NOT NULL DEFAULT '0.0000',
  `h` DOUBLE(7,4) NOT NULL DEFAULT '0.0000',
  `path` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  `texto` TEXT COLLATE utf8_unicode_ci,
  `estado` CHAR(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `fecha` DATETIME DEFAULT NULL,
  `id_user` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY (`cod_trazo`,`cod_plantilla`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*Table structure for table `dataperfil` */

DROP TABLE IF EXISTS `dataperfil`;

CREATE TABLE `dataperfil` (
  `code` INT(1) NOT NULL,
  `name` VARCHAR(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dataperfil` */

LOCK TABLES `dataperfil` WRITE;

INSERT  INTO `dataperfil`(`code`,`name`) VALUES (1,'Básico'),(4,'Supervisor'),(5,'Administrador');

UNLOCK TABLES;



