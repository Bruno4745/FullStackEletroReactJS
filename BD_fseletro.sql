CREATE DATABASE  IF NOT EXISTS `fseletro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fseletro`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: fseletro
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `endereco` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `telefone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (10,'Bruno Gouveia','Rua Abc, 123','11 96666-5555'),(11,'Joao','Rua Joao','(21) 98765-4321'),(12,'Joao','Rua Joao','(21) 98765-4321'),(13,'Maria','Rua Maria, 99','(11) 3333-4444'),(14,'Carlos','Rua Carlos, 70','(11) 2222-1111'),(15,'Amanda','Rua Amanda, 301','(11) 9999-8888'),(16,'Amanda','Rua Amanda, 301','(11) 9999-8888'),(17,'Amanda','Rua Amanda, 301','(11) 9999-8888');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcomentario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'TESTE','A','2020-12-04 01:28:10'),(2,'TESTE','A','2020-12-04 01:28:12'),(3,'Teste','Teste','2020-12-05 01:53:27'),(4,'Bruno','Mensagem teste!!!','2020-12-05 01:53:39');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idpedidos` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) DEFAULT NULL,
  `valor_unit` decimal(8,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_total` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idpedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Micro-ondas Philco 26L',499.00,1,499.00),(2,'Lava Louças 14 Serviços Brastemp',3397.20,1,3397.20),(3,'Geladeira Brastemp Frost Free Duplex 375 litros Inox',2384.10,2,4768.20),(4,'Lava Louças Electrolux 8 Servicos',2799.00,2,5598.00),(5,'Fogão 5 Bocas Brastemp',1394.10,1,1394.10),(6,'Micro-ondas Brastemp 38L com Grill Ative',879.90,1,879.90),(7,'Geladeira Cycle Defrost Inox 475L Electrolux',2699.00,1,2699.00),(8,'Lavadoura de Roupas Electrolux Automática 13kg',1499.00,1,1499.00);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `preco` decimal(8,2) DEFAULT NULL,
  `precofinal` decimal(8,2) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'geladeira','Geladeira Brastemp Frost Free Duplex 375 litros Inox',3479.00,2384.10,'geladeira_brastemp.png'),(2,'lavadouraroupa','Lavadoura de Roupas Samsung WD4000 Inox Look - 11kg',4359.00,3299.00,'lavaroupa_samsung.png'),(3,'microondas','Micro-ondas Brastemp 38L com Grill Ative',1567.90,879.90,'microondas_brastemp.png'),(4,'microondas','Micro-ondas Electrolux MS37R',599.00,539.10,'microondas_electrolux.png'),(5,'fogao','Fogão 5 Bocas Brastemp',1599.00,1394.10,'fogao_brastemp.png'),(6,'lavalouca','Lava Louças Electrolux 8 Servicos',3129.00,2799.00,'lavalouca_selectrolux.png'),(7,'geladeira','Geladeira Consul CRE44AK Frost Free Duplex',2879.00,2591.10,'geladeira_consul.png'),(8,'lavalouca','Lava Louças 14 Serviços Brastemp',5229.00,3397.20,'lavalouca_sbrastemp.png'),(9,'geladeira','Geladeira Cycle Defrost Inox 475L Electrolux',3339.00,2699.00,'geladeira_eletrolux.png'),(10,'fogao','Fogão Consul 4 bocas cor Inox',1059.00,979.00,'fogao_consul.png'),(11,'lavadouraroupa','Lavadora de Roupas Electrolux Automática 13kg',1699.00,1499.00,'lavaroupa_eletrolux.png'),(12,'microondas','Micro-ondas Philco 26L',629.00,499.00,'microondas_philco.png');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL AUTO_INCREMENT,
  `idpedidos` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvendas`,`idpedidos`,`idproduto`),
  KEY `idpedidos` (`idpedidos`),
  KEY `idproduto` (`idproduto`),
  KEY `idcliente_idx` (`idcliente`),
  CONSTRAINT `idcliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,1,12,10),(2,2,8,11),(3,3,1,11),(4,4,6,13),(5,5,5,14),(6,6,3,15),(7,7,9,15),(8,8,11,15);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fseletro'
--

--
-- Dumping routines for database 'fseletro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 22:55:32
