CREATE DATABASE  IF NOT EXISTS `arts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arts`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: arts
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `painting`
--

DROP TABLE IF EXISTS `painting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `painting` (
  `p_Code` int(11) NOT NULL AUTO_INCREMENT,
  `p_Name` varchar(100) DEFAULT NULL,
  `p_Artist` varchar(100) DEFAULT NULL,
  `p_Year` varchar(100) DEFAULT NULL,
  `p_Location` varchar(100) DEFAULT NULL,
  `p_Material` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painting`
--

LOCK TABLES `painting` WRITE;
/*!40000 ALTER TABLE `painting` DISABLE KEYS */;
INSERT INTO `painting` VALUES (1,'The Starry Night','Vincent van Gogh','1889','MoMA The Museum of Modern Art','Oil on canvas'),(2,'Indians Spear Fishing','Albert Bierstadt','1862','The Museum of Fine Arts, Houston','Oil on canvas'),(3,'Seascape near Les Saintes-Maries-de-la-Mer','Vincent van Gogh','1888','Van Gogh Museum','Oil on canvas'),(4,'The Return of the Flock, Laren','Unknown','1886 - 1887','Philadelphia Museum of Art','Oil on canvas'),(5,'The birth of Venus','Sandro Botticelli','1483 - 1485','Uffizi Gallery','Tempera on panel'),(6,'The Dutch Proverbs','Pieter Bruegel the Elder','1559','Gemäldegalerie, Staatliche Museen zu Berlin','Oil on oak wood'),(7,'The Quarrel of Oberon and Titania','Joseph Noel Paton','1849','Scottish National Gallery','Oil on canvas'),(8,'Princes Street with the Commencement of the Building of the Royal Institution','Alexander Nasmyth','1825','Scottish National Gallery','Oil on canvas'),(9,'The Monument to Philopappos,  Athens','Giovanni Battista Lusieri','1805 - 1807','Scottish National Gallery','Oil on canvas'),(10,'Macbeth','John Martin','1820','Scottish National Gallery','Oil on canvas'),(11,'The Marne at Chennevières','Camille Pissarro','1864 - 1865','Scottish National Gallery','Oil on canvas'),(12,'The Tower of Babel','Pieter Bruegel the Elder','1563','Kunsthistorisches Museum Wien','Oil on Wood'),(13,'Forest path near Spandau','Carl Blechen','1835','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(14,'Gothic Church on a Rock by the Sea','Karl Friedrich Schinkel','1815','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(15,'Gorge near Amalfi','Carl Blechen','1831','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(16,'Monk by the Sea','Caspar David Friedrich','1808 - 1810','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(17,'The Road to Gelmeroda','Christian Rohlfs','1893','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(18,'Moonrise over the Sea','Caspar David Friedrich','1822','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(19,'Morning','Karl Friedrich Schinkel','1813','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(20,'The Interior of the Palm House','Carl Blechen','1832 - 1833','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on paper, stretched on canvas'),(21,'The Rowers','Hans von Marées','1873','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(22,'An Avalanche in the Alps','Phillip James De Loutherbourg','1803','Tate Britain','Oil on canvas'),(23,'Ophelia','Sir John Everett Millais','1851','Tate Britain','Oil on canvas'),(24,'The Battle of Camperdown','Phillip James De Loutherbourg','1799','Tate Britain','Oil on canvas'),(25,'Landscape with Water','Joseph Mallord William Turner','1840','Tate Britain','Oil on canvas'),(26,'Young Mother','Giovanni Giacometti','1910','The Museum of Fine Arts, Houston','Oil on canvas'),(27,'Landscape with a Footbridge','Albrecht Altdorfer','1518 - 1520','The National Gallery, London','Oil on vellum on wood'),(28,'Melencolia I','Albrecht Dürer','1514','The National Museum of Western Art, Tokyo','Oil on canvas'),(29,'With Red Swallow-Patterned Wallpaper','Alexei Jawlensky','1915','Albertina Museum','Oil on cardboard'),(30,'Dodges Ridge','Andrew Wyeth','1947','Smithsonian American Art Museum','Oil on canvas'),(31,'Andy Warhol and Jean-Michel Basquiat','Michael Halsband','1985','SCAD Museum of Art','Gelatin Silver Print'),(32,'Les Plaisirs du Bal','Jean-Antoine Watteau','1715 - 1717','Dulwich Picture Gallery','Oil on canvas'),(33,'Summer Day','Arnold Böcklin','1881','New Masters Gallery, Dresden State Art Collections','Oil on canvas'),(34,'Scene Under the Arcades in Thun','August Macke','1913','Kunstpalast','Charcoal, grey wash'),(35,'Dance at Le Moulin de la Galette','Auguste Renoir','1876','Musée d’Orsay, Paris','Oil on canvas'),(36,'Adoration of the Magi','Bartolomé Esteban Murillo','1655 - 1660','The Toledo Museum of Art','Oil on canvas'),(37,'The Magdalen with the Smoking Flame','Unknown','Unknown','Los Angeles County Museum of Art','Oil on canvas'),(38,'In the Alpine High Valley (Landscape with Mt. Wendelstein)','Carl Spitzweg','1871','Kunstpalast','Oil on canvas'),(39,'Solitary Tree','Caspar David Friedrich','1822','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(40,'Waterloo Bridge','Claude Monet','1903','Denver Art Museum','Oil on canvas'),(41,'The Infante Baltasar Carlos on Horseback','Workshop of Diego Velázquez','1635','Dulwich Picture Gallery','Oil on canvas'),(42,'After the Bath: Seated Woman Drying Herself','Edgar Degas','1885','The Nelson-Atkins Museum of Art','Pastel and black chalk on paper'),(43,'The House at Rueil','Edouard Manet','1882','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(44,'The Death of Marat II','Edvard Munch','1907','The Munch Museum, Oslo','Oil on canvas'),(45,'Death in the Sickroom','Edvard Munch','1893','The Munch Museum, Oslo','Oil on canvas'),(46,'Red and White','Edvard Munch','1899 - 1900','The Munch Museum, Oslo','Oil on canvas'),(47,'Hotel Lobby','Hopper, Edward','1943','Indianapolis Museum of Art at Newfields','Oil on canvas'),(48,'Seated Couple, 1915','Egon Schiele','1915','Albertina Museum','Brush, watercolor, pencil, die stamp, mounted on cardboard'),(49,'Horse Frightened by Lightning','Eugène Delacroix','1825 - 1829','Museum of Fine Arts, Budapest','Watercolour, white heightening, gum arabic on watercolour paper'),(50,'St\'s Peter and Paul','El Greco','1587 - 1592','The State Hermitage Museum','Oil on canvas'),(51,'Two Girls / Naked GirlsTalking','Ernst Ludwig Kirchner','1910','Kunstpalast','Oil on canvas'),(52,'Homenaje a Fernand Léger','Ernesto DEIRA','1963','Museo Nacional de Bellas Artes de Argentina','Oil on canvas'),(53,'Pin Up 1963 – for Francis Bacon','Sam Walsh','1963','Walker Art Gallery, Liverpool','Oil on hardboard'),(54,'Monk Talking to an Old Woman','Francisco José de Goya y Lucientes','1824 - 1825','Princeton University Art Museum','Watercolor on ivory'),(55,'Deer in the Forest I','Franz Marc','1913','The Phillips Collection','Oil on canvas'),(56,'Fox','Georges Braque','1911','Blanton Museum of Art','Pastel and black chalk on paper'),(57,'A Sunday on La Grande Jatte','Georges Seurat','1884 -1886','The Art Institute of Chicago','Oil on canvas'),(58,'The Raising of Lazarus','Duccio di Buoninsegna','1310 – 1311','Kimbell Art Museum','Tempera and gold on panel'),(59,'Madonna and Child with St. John the Baptist','Bellini, Giovanni','1490 - 1500','Indianapolis Museum of Art at Newfields','tempera and oil on wood'),(60,'Four Seasons in One Head','Giuseppe Arcimboldo','1590','National Gallery of Art, Washington DC','Oil on panel'),(61,'Deer Running in the Snow','Gustave COURBET','1856 - 1857','Artizon Museum, Ishibashi Foundation','Oil on canvas'),(62,'Hans Holbein the Younger','Hans Makart','1882 - 1884','Kunsthistorisches Museum Wien','Oil on canvas'),(63,'St. Christopher','Hans Memling (Flemish','1433','Cincinnati Art Museum','Oil on panel'),(64,'The Sleeping Gypsy','Henri Rousseau','1897','MoMA The Museum of Modern Art','Oil on canvas'),(65,'The Tree-Man, c. 1505','Hieronymus Bosch','1505','Albertina Museum','Pen and brown ink'),(66,'Leo Tolstoy Barefoot','Ilya Repin','1901','The State Russian Museum','Oil on canvas'),(67,'Bonaparte Crossing the Grand Saint-Bernard Pass','Jacques Louis David','1900','Palace of Versailles','Oil on canvas'),(68,'Saint Francis of Assisi Receiving the Stigmata','Jan van Eyck','1430 - 1432','Philadelphia Museum of Art','Oil on vellum on panel'),(69,'The milkmaid','Johannes Vermeer','1660','Rijksmuseum','Oil on canvas'),(70,'The Spring','Jean Auguste Dominique Ingres','1820 - 1856','Musée d’Orsay, Paris','Oil on canvas'),(71,'Pèpinièriste','Jean Dubuffet','1944','Philbrook Museum of Art','Oil on canvas'),(72,'The Good Education','Jean-Siméon Chardin','1753','The Museum of Fine Arts, Houston','Oil on canvas'),(73,'Public Exhibition of a Picture','Joan Ferrer Miró','1888','Museu Nacional d\'Art de Catalunya - MNAC, Barcelona','Oil on canvas'),(74,'Study of A boat passing a lock','John Constable','1823 - 1826','National Gallery of Victoria','Oil on canvas'),(75,'Light Grey Wall','Josef Albers','1958','Museum of Fine Arts, Budapest','Oil on canvas'),(76,'Bowl with Judah and Lion Surrounded by Scened from the Book of Esther','Russian','1690','The Walters Art Museum','Silver gilt, painted and filigree enamel'),(77,'Superficial anatomy of the shoulder and neck (recto)','Leonardo da Vinci','1510','Royal Collection Trust, UK','Pen and ink with wash, over traces of black chalk'),(78,'Madonna and Child with Saints Catherine and Thomas (sacra conversazione)','Lorenzo Lotto','1527 - 1533','Kunsthistorisches Museum Wien','Oil on canvas'),(79,'The Blinded Samson','Lovis Corinth','1912','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(80,'Cupid complaining to Venus','Lucas Cranach the Elder','1525','The National Gallery, London','Oil on wood'),(81,'Compositional Study for ‘To Russia, to the Asses and Others’','Marc Chagall','1911 - 1912','Museum of Fine Arts, Budapest','Gouache on paper'),(82,'Gallic Cock','Raymond Duchamp-Villon','1916','The Phillips Collection','Polychrome plaster relief on wood support'),(83,'The Triumph of Bacchus','Nicolas Poussin','1635 - 1636','The Nelson-Atkins Museum of Art','Oil on canvas'),(84,'Portrait of Pablo Picasso','Juan Gris','1887 - 1927','The Art Institute of Chicago','Oil on canvas'),(85,'Battle of San Romano','Paolo Uccello','1436 - 1440','Uffizi Gallery','Tempera on panel'),(86,'Respect','Paolo Veronese','1575','The National Gallery, London','Oil on canvas'),(87,'Mill on the Couleuvre at Pontoise','Paul Cézanne','1881','Alte Nationalgalerie, Staatliche Museen zu Berlin','Oil on canvas'),(88,'The Seed of the Areoi','Paul Gauguin','1892','MoMA The Museum of Modern Art','Oil on burlap'),(89,'The Beginnings of a Smile','Paul Klee','1921','Kunstpalast','Oil transfer drawing and watercolour on paper, spot-glued onto cardboard'),(90,'Portraits of the Duke and Duchess of Urbino, Federico da Montefeltro and Battista Sforza','Piero della Francesca','1467 - 1472','Uffizi Gallery','Tempera on panel'),(91,'The Dining Room','Pierre Bonnard','1923','The Israel Museum, Jerusalem','Oil on canvas'),(92,'Jean Metzinger','Robert Delaunay','1906','The Museum of Fine Arts, Houston','Oil on paper'),(93,'The Voice of My Beloved Behold from Song of Songs of Solomon','Salvador Dali','1971','SCAD Museum of Art','Etching with stencil coloring'),(94,'Venus of Urbino','Tiziano Vecellio','1538','Uffizi Gallery','Oil on canvas'),(95,'Points','Wassily Kandinsky','1920','Ohara Museum of Art','Oil on canvas'),(96,'Stonehenge - Twilight','William Turner of Oxford','1840','The J. Paul Getty Museum','Watercolor');
/*!40000 ALTER TABLE `painting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_Id` varchar(45) NOT NULL,
  `u_Pw` varchar(45) DEFAULT NULL,
  `u_Name` varchar(45) DEFAULT NULL,
  `u_Email` varchar(45) DEFAULT NULL,
  `u_QUit` tinyint(4) NOT NULL,
  PRIMARY KEY (`u_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('coconutcacao','c123',NULL,NULL,0),('elkim','e123',NULL,NULL,0),('gihuk123','g123',NULL,NULL,0),('hyeopyi','h123',NULL,NULL,0),('peterhd','p123',NULL,NULL,0),('swyoo39','qwer1234!','유시웅','swyoo39@naver.com',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-10 11:42:56
