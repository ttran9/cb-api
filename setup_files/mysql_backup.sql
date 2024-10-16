-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: cb_db
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application_user`
--

DROP TABLE IF EXISTS `application_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cb61p28hanadv7k0nx1ec0n5l` (`email`),
  UNIQUE KEY `UK_6c0v0rco93sykgyetukfmkkod` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_user`
--

LOCK TABLES `application_user` WRITE;
/*!40000 ALTER TABLE `application_user` DISABLE KEYS */;
INSERT INTO `application_user` VALUES (1,'2020-12-30','toddtran10@gmail.com',_binary '','Dwight Schrute','$2a$10$qYjWyUQkMS/0G5eRQmbbc.zTz8247R7GV5nyQWMRzxVD53k3mMXVe','2020-12-30','toddtran10'),(2,'2020-12-30','wptran58@gmail.com',_binary '','David Wallace','$2a$10$e81KwO7m6GFUUM.7JmP1FupoAv1ftVi/.ag5OHw6xOaVBJaGzXCH2','2020-12-30','wptran58'),(4,'2020-12-30','ttran453@horizon.csueastbay.edu',_binary '','Todd Tran','$2a$10$IVT/wF6GX6tMckWlOsdUVerYt2rW./kvXwMwxsF.D/9pT8dd7FihW','2020-12-30','snickers'),(5,'2020-12-30','toddtran9@gmail.com',_binary '','Todd Tran','$2a$10$BP5735HRieoY5lq.lktwX.qDsu2SKmW2IvYFuxw0iNPqyk594JL6i','2020-12-30','toddtran9'),(6,'2021-09-24','tvstran@ucdavis.edu',_binary '','Snickers','$2a$10$QO9LD.Yh0OjZZmxo1bMcMurI/uLDdaPvvPixvAWmu2G2yV1VpkFvy','2021-09-24','stl1');
/*!40000 ALTER TABLE `application_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_note`
--

DROP TABLE IF EXISTS `build_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `build_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` longtext,
  `priority` int NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `computer_build_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dgbwtmnmm7gd30vqm94xwvc8r` (`unique_identifier`),
  KEY `FK1t8qyyfmr67exvqsb8spw59qv` (`computer_build_id`),
  CONSTRAINT `FK1t8qyyfmr67exvqsb8spw59qv` FOREIGN KEY (`computer_build_id`) REFERENCES `computer_build` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_note`
--

LOCK TABLES `build_note` WRITE;
/*!40000 ALTER TABLE `build_note` DISABLE KEYS */;
INSERT INTO `build_note` VALUES (1,'2020-12-30','This is just the highest tier of builds that I would go for a personal desktop/workstation. I realize that there are more costly motherboards, the 3950x is coming out in sept 2019 and I could get the rtx 2080 ti or the 2080 super, etc. I could also get more expensive cases as well, higher tier ram/higher frequency low latency.',2,'vy7vhvz3-bn-1','2020-12-30',1),(2,'2020-12-30','This build will be more than sufficient for the current tasks I am doing such as development, and using virtual machines to watch videos. Even if  I were gaming I believe this budget build would be fine as I would prefer to game on 1080p 144hz. If I  were to upgrade to 1440p/144hz with a 27\" monitor I would just need to upgrade to something such as the  2070 super.',2,'zabyqrut-bn-1','2020-12-30',2);
/*!40000 ALTER TABLE `build_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_password_token`
--

DROP TABLE IF EXISTS `change_password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_password_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKldbnfob8es7ynmk72txk45oki` (`user_id`),
  CONSTRAINT `FKldbnfob8es7ynmk72txk45oki` FOREIGN KEY (`user_id`) REFERENCES `application_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_password_token`
--

LOCK TABLES `change_password_token` WRITE;
/*!40000 ALTER TABLE `change_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_build`
--

DROP TABLE IF EXISTS `computer_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer_build` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `build_description` longtext,
  `build_identifier` varchar(255) DEFAULT NULL,
  `build_notes_inserted` int DEFAULT NULL,
  `computer_parts_inserted` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `directions_inserted` int DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `overclocking_notes_inserted` int DEFAULT NULL,
  `purposes_inserted` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ctsf0o3mvj6w0ro9xxqkc6nax` (`build_identifier`),
  KEY `FKkiik80lmgs3v5vnicovgly6q5` (`user_id`),
  CONSTRAINT `FKkiik80lmgs3v5vnicovgly6q5` FOREIGN KEY (`user_id`) REFERENCES `application_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_build`
--

LOCK TABLES `computer_build` WRITE;
/*!40000 ALTER TABLE `computer_build` DISABLE KEYS */;
INSERT INTO `computer_build` VALUES (1,'This is another proposed build for my next system. I am considering this build because there are a variety of programs I use that max out my processor usage. However, this build will have a higher budget than the build labeled \"Proposed Ryzen 2019 Build.\"','vy7vhvz3',1,6,'2020-12-30',1,'Alternative Ryzen 2019 Build',1,3,1705.38,'2020-12-30',2),(2,'This is another proposed build. I am considering this build because there are a variety of programs I use that max out my processor usage. However, this build will have a lower budget than the build labeled \"Alternative Ryzen 2019 Build.\"','zabyqrut',1,6,'2020-12-30',1,'Proposed Ryzen 2019 Build',1,2,1260.3,'2020-12-30',2);
/*!40000 ALTER TABLE `computer_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_part`
--

DROP TABLE IF EXISTS `computer_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer_part` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `other_note` longtext,
  `place_purchased_at` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `purchase_date` date NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `computer_build_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tcjjr3qqjmkoj4yg2oltn165n` (`unique_identifier`),
  KEY `FKq3tcsehgkvox1gb242pyk6uj` (`computer_build_id`),
  CONSTRAINT `FKq3tcsehgkvox1gb242pyk6uj` FOREIGN KEY (`computer_build_id`) REFERENCES `computer_build` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_part`
--

LOCK TABLES `computer_part` WRITE;
/*!40000 ALTER TABLE `computer_part` DISABLE KEYS */;
INSERT INTO `computer_part` VALUES (1,'Ryzen 9 3900x','This is the processor which has a higher L3 cache than the 3700x and 3800x. According to some benchmarks this can be really beneficial especially for 7-Zip x64 decompression.','Central Computers',499.99,'2019-11-22','vy7vhvz3-cp-1',1),(2,'GIGABYTE X570 AORUS Master','This is a high-end motherboard but not top of the line. ASUS claims the VRM on this motherboard is very high quality. According to a few benchmarks I\'ve looked at such as one by Hardware Unboxed and a few reviews I\'ve read online this seems to be the case.','Amazon',349.99,'2019-11-22','vy7vhvz3-cp-2',1),(3,'Crucial Ballistix Sport LT (BLS2K16G4D30AESB)','I definitely want 32gb of ram so I can use VMs with lots of ram allocated (8gb). I also realize that programs these days are using a lot more memory than back in the day. I remember my 2010 build which was very good, my only regret with it is that I should\'ve gotten 12gb of ram and not just 6gb. This is LPX ram so it will go well with my Noctua NH-D15s.','Amazon',142.43,'2019-11-22','vy7vhvz3-cp-3',1),(4,'Fractal Design R6','This case is highly customizable and highly modular. I realize this case is DEFINITELY over kill but I want more to work with than less to work with. I am open to other cases though and I may do more research.','Amazon',142.99,'2019-08-14','vy7vhvz3-cp-4',1),(5,'EVGA GeForce RTX 2060 SUPER SC','This is the proposed video card but I may go with the 1660 as I do not believe I am doing anything too graphic intensive. Development is definitely not graphic intensive and I don\'t plan to play any modern AAA titles/games on high resolutions.','EVGA\'s Website',419.99,'2019-11-22','vy7vhvz3-cp-5',1),(6,'Seasonic Platinum SSR-850PX','I don\'t have much knowledge on power supplies and \"platinum\" may not actually be of higher quality than say \"gold\" but this is just a place holder power supply. I\'ve had my 850w corsair since 2010. It is important to note that this was once 131.99 instead of 149.99 back in August of 2019 or so.','Amazon',149.99,'2019-11-22','vy7vhvz3-cp-6',1),(7,'Ryzen 7 3700x','This is the processor. I am choosing this because I want a minimum of 8cores/16 threads (to match the 9900k) and for the processor I buy to be very \"snappy\" for \"productivity\" workloads (not sure if development counts as that). I am still considering the 3900x at the time of writing this. I don\'t really care for gaming performance although this would get me very high FPS in some of the games (if I even plan to play).','Central Computers',319.95,'2019-11-22','zabyqrut-cp-1',2),(8,'ASRock x570 Taichi','This is a pretty high end board. It has many features. I am mostly focusing on the fact that it\'s VRM is definitely acceptable but I believe the Crosshair VIII Hero has VRMs that run much cooler. I will have to do more and in-depth research on this motherboard and the crosshair VIII to compare their VRMS and the power delivery system. One thing that I very much like on this board is that it has a ps2 port for better keyboard support when going into the BIOs. I\'m not sure if this would be an issue but on my Z87 motherboard (Haswell) I have an issue with my K70 lux not working in the BIOS so I have to use my ps2 port to navigate or just use my mouse.','Amazon',299.99,'2019-11-22','zabyqrut-cp-2',2),(9,'Crucial Ballistix Sport LT (BLS2K16G4D30AESB)','I definitely want 32gb of ram so I can use VMs with lots of ram allocated (8gb). I also realize that programs these days are using a lot more memory than back in the day. I remember my 2010 build which was very good, my only regret with it is that I should\'ve gotten 12gb of ram and not just 6gb. This is LPX ram so it will go well with my Noctua NH-D15s.','Amazon',142.43,'2019-11-22','zabyqrut-cp-3',2),(10,'Fractal Design R6','This case is highly customizable and highly modular. I realize this case is DEFINITELY over kill but I want more to work with than less to work with. I am open to other cases though and I may do more research.','Amazon',142.99,'2019-08-14','zabyqrut-cp-4',2),(11,'EVGA GeForce GTX 1660 SC ULTRA GAMING (06G-P4-1067-KR)','This is a place holder card. I may go with an AMD card possibly, or a 1660ti with this budget.','EVGA\'s Website',229.95,'2019-11-22','zabyqrut-cp-5',2),(12,'Seasonic FOCUS Plus 850 Gold SSR-850FX ','Overall, this power supply would be more than sufficient. I am curious what the lowest price for this would be if the platinum version was once 131.99 because in that case this should be around 106.99 (I assume the platinum and gold should differ by about 25 dollars or so. Just like in the alternative build I would have to do more research on PSUs.','Amazon',124.99,'2019-11-22','zabyqrut-cp-6',2);
/*!40000 ALTER TABLE `computer_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction`
--

DROP TABLE IF EXISTS `direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `computer_build_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hirmg7cubhb5jm6jy0h6u9l9m` (`unique_identifier`),
  KEY `FKfqt8bu411441bdm5ucm4sqium` (`computer_build_id`),
  CONSTRAINT `FKfqt8bu411441bdm5ucm4sqium` FOREIGN KEY (`computer_build_id`) REFERENCES `computer_build` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction`
--

LOCK TABLES `direction` WRITE;
/*!40000 ALTER TABLE `direction` DISABLE KEYS */;
INSERT INTO `direction` VALUES (1,'I may update this once I build my next system.','vy7vhvz3-dir-1',1),(2,'TBA because I have not built this yet.','zabyqrut-dir-1',2);
/*!40000 ALTER TABLE `direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verification_token`
--

DROP TABLE IF EXISTS `email_verification_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg1dq0t76iyq9jnbrvtpx7l2ai` (`user_id`),
  CONSTRAINT `FKg1dq0t76iyq9jnbrvtpx7l2ai` FOREIGN KEY (`user_id`) REFERENCES `application_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification_token`
--

LOCK TABLES `email_verification_token` WRITE;
/*!40000 ALTER TABLE `email_verification_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overclocking_note`
--

DROP TABLE IF EXISTS `overclocking_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overclocking_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` longtext,
  `priority` int NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `computer_build_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o12k01i62fgc4o1yrmk0y09e3` (`unique_identifier`),
  KEY `FKk0xnrm0by9rdf46b2s539jyq1` (`computer_build_id`),
  CONSTRAINT `FKk0xnrm0by9rdf46b2s539jyq1` FOREIGN KEY (`computer_build_id`) REFERENCES `computer_build` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overclocking_note`
--

LOCK TABLES `overclocking_note` WRITE;
/*!40000 ALTER TABLE `overclocking_note` DISABLE KEYS */;
INSERT INTO `overclocking_note` VALUES (1,'2020-12-30','I don\'t plan to do much manual overclocking with this build!',2,'vy7vhvz3-ocn-1','2020-12-30',1),(2,'2020-12-30','I don\'t believe this build will require manual overclocking.',2,'zabyqrut-ocn-1','2020-12-30',2);
/*!40000 ALTER TABLE `overclocking_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purpose`
--

DROP TABLE IF EXISTS `purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purpose` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` longtext,
  `priority` int NOT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `computer_build_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5n52i87ihubousikst7i9mka8` (`unique_identifier`),
  KEY `FKmyf4jo7jk51m6ijtfe5f8jlci` (`computer_build_id`),
  CONSTRAINT `FKmyf4jo7jk51m6ijtfe5f8jlci` FOREIGN KEY (`computer_build_id`) REFERENCES `computer_build` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpose`
--

LOCK TABLES `purpose` WRITE;
/*!40000 ALTER TABLE `purpose` DISABLE KEYS */;
INSERT INTO `purpose` VALUES (1,'2020-12-30','The purpose of this build is that I want to get lower CPU temps. In order to get lower temps and with the 3900x I may choose to put the Crosshair VIII Hero into the build because according to a benchmark by Hardware Unboxed the Crosshair VIII Hero has a very good VRM which tends to stay very low. This is in comparison to an EVGA x58 a1 motherboard I had with my i7-930 that when I was running 1.4V and I remember hitting a VRM temperature of well over 92 celsius while just running DotA 2 on spectator mode. I realize that my test was not ideal because I was running on a coolermaster hyper 212 and currently i\'m running a noctua nh-d15s. For the noctua nh-d15s build I am using 1 less 120mm intake and 1 less 120mm exhaust fan. I realize my EVGA x58 board was only a $230 board and this crosshair board is $380 and is 10 years newer than my older board so the upgrade will be significant. Of course, I\'m not sure if this is 100% accurate but I do believe that X570 motherboards tend to run very hot so I\'m considering paying the premium because I want to keep this build for a minimum of 4+ years (like my previous two builds). As I mentioned earlier I want to keep the build for 4+ years, although ideally I wouldn\'t want to upgrade the 3900x for at least 6-7 years. I was watching an interesting video by Buildzoid where he was monitoring the temperatures on his 3700x on a x370 motherboard and he was running a Prime95 test (single-threaded) and then he was talking about how the temperature spike was to be expected because the heat was packed into such a small surface area on the processor and that cooling/dissipating that heat is very difficult to do even on a more expensive cooler with a high TDP because those heatsinks tend to have a very large surface area so they are expected to cool heat over a large amount of surface area and not just a very small portion of a processor. Given what was said on this video, I am initially thinking that if the silicon is higher quality (such as when I buy the 3900x) the processor wouldn\'t require as much voltage to boost to a certain frequency and this would result in a lower temperature and lower \"spikes.\" Of course, currently in august of 2019, the 3900x is always out of stock and the demand is astronomically higher than the supply then AMD may not be able to produce the highest quality 3900xs so that\'s why I don\'t mind waiting. Another reason I don\'t mind waiting is I definitely want to make sure Ubuntu 19.04 has no issues. There may be some things I have forgotten or not written that I may be thinking of. I\'ll eventually edit this and I definitely want to make this more presentable instead one huge blob.',2,'vy7vhvz3-pur-1','2020-12-30',1),(2,'2020-12-30','Regarding the RAM, I don\'t see myself purchasing any very high end ram stick because according to the benchmarks there is a huge amount to be paid for very minimal performance. Following what I talked about above, one can argue that I may want to go for a cheaper processor such as the 3700x at most or the 3600, or 3600x. The reason I would want to go with the 3900x is because I believe the silicon will be of higher quality (better bin).',2,'vy7vhvz3-pur-2','2020-12-30',1),(3,'2020-12-30','Regarding the video card, I don\'t see myself spending more for the video card because I don\'t see myself gaming at a resolution higher than 1080p. Although I currently haven\'t touched DotA 2 for a while now, I can\'t imagine playing dota 2 on a 1440p capable monitor, a 24\" 1440p to me is just weird. Given what I have discussed above, I feel that a rtx 2060 or a 2060 super may be what I want. The reason I don\'t want to buy a 5700XT is because I have very bad memories of the XFX 5770 that I once had and even further back when I was very young I had a ATI Radeon 9800 Pro which also had over-heating issues. Following up on the ATI Radeon 9800 Pro, the cooling way back then was definitely not as polished and efficient as it is now. However the 5770 I had was up until roughly 2014 when I upgraded to my current 760, and even that 5770 had massive temperature issues. One can claim that I should just be willing to ticker with it more or perhaps buy a RAIJINTEK MORPHEUS II GPU cooler. That may be true but the fact that the amd GPUs run so hot is just a concern for me that makes me hestiate. To conclude, I will DEFINITELY do more research on GPUs before I make a purchase. TLDR: I really dislike high temps so that\'s why ryzen 3000 and coffee lake refresh worries me.',2,'vy7vhvz3-pur-3','2020-12-30',1),(4,'2020-12-30','I am creating this build to have a more smooth experience when doing productivity workloads, specifically local development so it is easier to follow online tutorials/videos and other sources.',2,'zabyqrut-pur-1','2020-12-30',2),(5,'2020-12-30','One other reason I would want a modern desktop is that I may choose to learn editing programs such as Magix Vegas or one of the Adobe tools and in that case  a new Ryzen CPU and system would be a huge upgrade from my Haswell or Broadwell processors.',2,'zabyqrut-pur-2','2020-12-30',2);
/*!40000 ALTER TABLE `purpose` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01  9:44:55
