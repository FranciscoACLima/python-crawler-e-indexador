
DROP TABLE IF EXISTS `palavras`;
CREATE TABLE `palavras` (
  `idpalavra` int(11) NOT NULL AUTO_INCREMENT,
  `palavra` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idpalavra`),
  KEY `idx_palavras_palavra` (`palavra`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `idurl` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idurl`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page_rank`;
CREATE TABLE `page_rank` (
  `idurl` int(11) NOT NULL,
  `nota` float NOT NULL,
  PRIMARY KEY (`idurl`),
  CONSTRAINT `fk_page_rank_idurl` FOREIGN KEY (`idurl`) REFERENCES `urls` (`idurl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `palavra_localizacao`;
CREATE TABLE `palavra_localizacao` (
  `idpalavra_localizacao` int(11) NOT NULL AUTO_INCREMENT,
  `idurl` int(11) NOT NULL,
  `idpalavra` int(11) NOT NULL,
  `localizacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpalavra_localizacao`),
  KEY `fk_palavra_localizacao_idurl` (`idurl`),
  KEY `idx_palavra_localizacao_idpalavra` (`idpalavra`),
  CONSTRAINT `fk_palavra_localizacao_idpalavra` FOREIGN KEY (`idpalavra`) REFERENCES `palavras` (`idpalavra`),
  CONSTRAINT `fk_palavra_localizacao_idurl` FOREIGN KEY (`idurl`) REFERENCES `urls` (`idurl`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `url_ligacao`;
CREATE TABLE `url_ligacao` (
  `idurl_ligacao` int(11) NOT NULL AUTO_INCREMENT,
  `idurl_origem` int(11) NOT NULL,
  `idurl_destino` int(11) NOT NULL,
  PRIMARY KEY (`idurl_ligacao`),
  KEY `idx_url_ligacao_idurl_origem` (`idurl_origem`),
  KEY `idx_url_ligacao_idurl_destino` (`idurl_destino`),
  CONSTRAINT `fk_url_ligacao_idurl_destino` FOREIGN KEY (`idurl_destino`) REFERENCES `urls` (`idurl`),
  CONSTRAINT `fk_url_ligacao_idurl_origem` FOREIGN KEY (`idurl_origem`) REFERENCES `urls` (`idurl`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `url_palavra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_palavra` (
  `idurl_palavra` int(11) NOT NULL AUTO_INCREMENT,
  `idpalavra` int(11) NOT NULL,
  `idurl_ligacao` int(11) NOT NULL,
  PRIMARY KEY (`idurl_palavra`),
  KEY `fk_url_palavra_idurl_ligacao` (`idurl_ligacao`),
  KEY `idx_url_palavra_idpalavra` (`idpalavra`),
  CONSTRAINT `fk_url_palavra_idpalavra` FOREIGN KEY (`idpalavra`) REFERENCES `palavras` (`idpalavra`),
  CONSTRAINT `fk_url_palavra_idurl_ligacao` FOREIGN KEY (`idurl_ligacao`) REFERENCES `url_ligacao` (`idurl_ligacao`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
