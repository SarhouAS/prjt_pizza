/*
 Navicat Premium Data Transfer

 Source Server         : mysql_connect
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36)
 Source Host           : localhost:3306
 Source Schema         : pizzaboxinnodb

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36)
 File Encoding         : 65001

 Date: 05/12/2023 11:27:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `NROCLIE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMCLIE` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PRENOMCLIE` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ADRESSECLIE` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `VILLECLIE` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CODEPOSTALCLIE` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TITRECLIE` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NROTELCLIE` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NROCLIE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, 'Durban', 'Georges', '6, rue Emile Bertin', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (2, 'Dumas', 'Jean-Baptiste', '10, rue Ernest Renan', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (3, 'Duvernoy', 'Martine', '24, rue du Sergent Blandan', 'NANCY', '54000', 'Mme', NULL);
INSERT INTO `client` VALUES (4, 'Durendal', 'Roland', '17, boulevard Charlemagne', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (5, 'Durer', 'Albrecht', '20, rue Jules Ferry', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (6, 'Duquesnoy', 'Agnès', '10, rue des Clos', 'LAXOU', '54520', 'Mlle', NULL);
INSERT INTO `client` VALUES (7, 'Dutronc', 'Jacques', '6, rue Rodin', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (8, 'Durham', 'Jonathan', '12, rue Voltaire', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (9, 'Duluth', 'Pierre', '6, avenue Aristide Briand', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (10, 'Dutilleux', 'Henry', '10, avenue Paul Déroulède', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (11, 'Dufour', 'Elodie', '52, boulevard Charlemagne', 'NANCY', '54000', 'Mme', NULL);
INSERT INTO `client` VALUES (12, 'Duchatelet', 'Emilie', '20, boulevard Emile Zola', 'LAXOU', '54520', 'Mlle', NULL);
INSERT INTO `client` VALUES (13, 'Durao', 'José', '10, avenue du Général Leclerc', 'VANDOEUVRE', '54000', 'M', NULL);
INSERT INTO `client` VALUES (14, 'Dubcek', 'Alexndre', '20, rue de la Moselotte', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (15, 'Dupatin', 'Sébastien', '101, rue Raymond Poincaré', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (16, 'Dupeyron', 'Juliette', '55, rue Emile Bertin', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (17, 'Durrazo', 'Jérémie', '120, avenue de Boufflers', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (18, 'Durango', 'Flora', '220, boulevard des Aiguillettes', 'VILLERS', '54600', 'Mlle', NULL);
INSERT INTO `client` VALUES (19, 'Dusapin', 'Pascal', '45, rue de Maréville', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (20, 'Duparc', 'Henri', '20, rue de l\'Abbé Didelot', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (21, 'Durey', 'Louis', '30, rue Paul Bert', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (22, 'Duroc', 'Pierre', '25, rue de Santifontaine', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (23, 'Duverger', 'Maurice', '30, place de la Commanderie', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (24, 'Dullin', 'Charles', '5, rue du Petit Arbois', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (25, 'Dughet', 'Gaspard', '20, rue Anatole France', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (26, 'Durbuy', 'Claudine', '25, rue de la Forêt', 'LAXOU', '54520', 'Mlle', NULL);
INSERT INTO `client` VALUES (27, 'Dubrovnik', 'Raguse', '42, rue du Plateau', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (28, 'Dufay', 'Guillaume', '15, rue du Four', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (29, 'Dulcinée', 'Ginette', '53, avenue Aristide Briand', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (30, 'Dudley', 'Carole', '10, boulevard d\'Haussonville', 'VILLERS', '54600', 'Mlle', NULL);
INSERT INTO `client` VALUES (31, 'Duse', 'Eléonora', '10, avenue Paul Déroulède', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (32, 'Dunedine', 'Ginette', '50, rue du Petit Arbois', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (33, 'Dudelange', 'Catherine', '3, place du Jet d\'eau', 'LAXOU', '54520', 'Mlle', NULL);
INSERT INTO `client` VALUES (34, 'Dukou', 'Michaël', '52, rue Jules Ferry', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (35, 'Ducos', 'Martine', '10, place Paul painlevé', 'NANCY', '54000', 'Mle', NULL);
INSERT INTO `client` VALUES (36, 'Dunham', 'Catherine', '135, boulevard des Aiguilette', 'VILLERS', '54600', 'Mlle', NULL);
INSERT INTO `client` VALUES (37, 'Duclos', 'Jacques', '42, boulevard Charlemagne', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (38, 'Dublin', 'Zaccharie', '42, avenue du Montet', 'VANDOEUVRE', '54500', 'M', NULL);
INSERT INTO `client` VALUES (39, 'Duchesne', 'Aline', '5, allée du Bassigny', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (40, 'Ducommun', 'Elie', '42, rue du Sergent Blandan', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (41, 'Dubout', 'Albert', '20, avenue du Montet', 'VANDOEUVRE', '54500', 'M', NULL);
INSERT INTO `client` VALUES (42, 'Dubarry', 'Jeanne', '74, boulevard de Hardeval', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (43, 'Dugommier', 'Jacques', '45, avenue de l\'Europe', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (44, 'Duhem', 'Pierre', '10, rue Victor Hugo', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (45, 'Duprat', 'Antoine', '25, rue de Heubach', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (46, 'Duguillet', 'Pernette', '15, rue Lavigerie', 'NANCY', '54000', 'Mle', NULL);
INSERT INTO `client` VALUES (47, 'Dumas', 'Alexandre', '25, rue du Sergent Bobillot', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (48, 'Dupin', 'Jacques', '5, rue de l\'Octroi', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (49, 'Dumézil', 'Georges', '25, avenue de l\'Europe', 'NANCY', '54520', 'M', NULL);
INSERT INTO `client` VALUES (50, 'Duguit', 'Léon', '12, rue Jean Mermoz', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (51, 'Dupin', 'André', '52, avenue Paul Déroulède', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (52, 'Dupond', 'Patrick', '24, rue du Onze Novembre', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (53, 'Dupré', 'Marcel', '35, avenue Pierre Curie', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (54, 'Dutourd', 'Jean', '21, rue de Cronstadt', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (55, 'Dutrochet', 'René', '3, avenue de l\'europe', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (56, 'Duvivier', 'Julien', '2, rue de l\'Abbé Gridel', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (57, 'Duruflé', 'Maurice', '6, place des Ducs de Bar', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (58, 'Duras', 'Marguerite', '25, boulevard Cattenoz', 'VILLERS', '54600', 'Mme', NULL);
INSERT INTO `client` VALUES (59, 'Duparc', 'Thérèse', '51, avenue de L\'Europe', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (60, 'Dupré', 'Jules', '2, rue Léomont', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (61, 'Duguesclin', 'Bertrand', '72, rue de Santifontaine', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (62, 'Dupré', 'Jacqueline', '25, rue de Mondésert', 'NANCY', '54000', 'Mme', NULL);
INSERT INTO `client` VALUES (63, 'Dumas', 'Alexandre', '14, boulevard Cattenoz', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (64, 'Dunand', 'Henri', '74, Boulevard de Baudricourt', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (65, 'Duplessis', 'Armand', '20, rue de la Forêt', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (66, 'Dulac', 'Germaine', '12, rue Marie-Odile', 'LAXOU', '54000', 'Mlle', NULL);
INSERT INTO `client` VALUES (67, 'Dulong', 'Pierre', '13, rue de Mondésert', 'NANCY', '54000', 'M', NULL);
INSERT INTO `client` VALUES (68, 'Dukas', 'Paul', '14, rue Edouard Grosjean', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (69, 'Dufy', 'Raoul', '23, rue du Pressoir', 'LAXOU', '54000', 'M', NULL);
INSERT INTO `client` VALUES (70, 'Dufresne', 'Diane', '25, Rue Pasteur', 'NANCY', '54000', 'Mme', NULL);
INSERT INTO `client` VALUES (71, 'Duby', 'Georges', '51, rue des Coteaux', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (72, 'Dubalet', 'Raoul', '14, rue baron Buquet', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (73, 'Durango', 'Marina', '51, rue Ernest Albert', 'LAXOU', '54520', 'Mme', NULL);
INSERT INTO `client` VALUES (74, 'Dubillard', 'Roland', '13, rue Chopin', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (75, 'Duchamps', 'marcel', '54, rue Raymond Poincaré', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (76, 'Dubellay', 'Joachim', '21, rue Mozart', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (77, 'Dubuffet', 'Jean', '38, rue Coriolis', 'NANCY', '5400', 'M', NULL);
INSERT INTO `client` VALUES (78, 'Dubos', 'René', '45, rue de l\'Asnée', 'VILLERS', '54600', 'M', NULL);
INSERT INTO `client` VALUES (79, 'Ducasse', 'Alain', '15, Allées de Médreville', 'LAXOU', '54520', 'M', NULL);
INSERT INTO `client` VALUES (80, 'Ducharme', 'Réjean', '65, rue du Colonel Moll', 'LAXOU', '54520', 'M', NULL);

-- ----------------------------
-- Table structure for commande
-- ----------------------------
DROP TABLE IF EXISTS `commande`;
CREATE TABLE `commande`  (
  `NROCMDE` int(11) NOT NULL,
  `DATECMDE` date NULL DEFAULT NULL,
  `HEURECMDE` time NULL DEFAULT NULL,
  `NROCLIE` int(11) NOT NULL,
  `NROLIVR` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NROCMDE`) USING BTREE,
  INDEX `FK_FAIT`(`NROCLIE`) USING BTREE,
  INDEX `FK_LIVRE`(`NROLIVR`) USING BTREE,
  CONSTRAINT `FK_FAIT` FOREIGN KEY (`NROCLIE`) REFERENCES `client` (`NROCLIE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_LIVRE` FOREIGN KEY (`NROLIVR`) REFERENCES `livreur` (`NROLIVR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commande
-- ----------------------------
INSERT INTO `commande` VALUES (453, '2021-04-06', '11:05:00', 66, 303);
INSERT INTO `commande` VALUES (454, '2021-04-06', '11:25:00', 40, 303);
INSERT INTO `commande` VALUES (455, '2021-04-06', '11:45:00', 80, 303);
INSERT INTO `commande` VALUES (456, '2021-04-06', '11:55:00', 16, 303);
INSERT INTO `commande` VALUES (457, '2021-04-06', '12:20:00', 15, 202);
INSERT INTO `commande` VALUES (458, '2021-04-07', '12:25:00', 14, 202);
INSERT INTO `commande` VALUES (459, '2021-04-07', '12:50:00', 34, 303);
INSERT INTO `commande` VALUES (460, '2021-04-07', '13:15:00', 25, 202);
INSERT INTO `commande` VALUES (461, '2021-04-07', '18:14:00', 52, 202);
INSERT INTO `commande` VALUES (462, '2021-04-07', '18:24:00', 74, 202);
INSERT INTO `commande` VALUES (463, '2021-04-07', '18:40:00', 72, 303);
INSERT INTO `commande` VALUES (464, '2021-04-07', '19:00:00', 11, 303);
INSERT INTO `commande` VALUES (465, '2021-04-07', '19:10:00', 42, 303);
INSERT INTO `commande` VALUES (466, '2021-04-07', '19:20:00', 30, 202);
INSERT INTO `commande` VALUES (467, '2021-04-07', '19:25:00', 62, 202);
INSERT INTO `commande` VALUES (468, '2021-04-07', '19:35:00', 7, 202);
INSERT INTO `commande` VALUES (469, '2021-04-07', '19:40:00', 8, 303);
INSERT INTO `commande` VALUES (470, '2021-04-07', '19:50:00', 64, 303);
INSERT INTO `commande` VALUES (471, '2021-04-07', '19:55:00', 4, 101);
INSERT INTO `commande` VALUES (472, '2021-04-07', '20:00:00', 27, 202);
INSERT INTO `commande` VALUES (473, '2021-04-07', '20:10:00', 38, 202);
INSERT INTO `commande` VALUES (474, '2021-04-07', '20:15:00', 39, 202);
INSERT INTO `commande` VALUES (475, '2021-04-07', '20:25:00', 75, 303);
INSERT INTO `commande` VALUES (476, '2021-04-07', '20:35:00', 31, 303);
INSERT INTO `commande` VALUES (477, '2021-04-09', '11:40:00', 13, 404);
INSERT INTO `commande` VALUES (478, '2021-04-09', '11:50:00', 60, 404);
INSERT INTO `commande` VALUES (479, '2021-04-09', '12:30:00', 18, NULL);
INSERT INTO `commande` VALUES (480, '2021-04-09', '12:45:00', 54, 404);
INSERT INTO `commande` VALUES (481, '2021-04-09', '19:10:00', 35, 505);
INSERT INTO `commande` VALUES (482, '2021-04-09', '19:20:00', 51, 505);
INSERT INTO `commande` VALUES (483, '2021-04-09', '19:30:00', 48, 505);
INSERT INTO `commande` VALUES (484, '2021-04-09', '19:50:00', 3, NULL);
INSERT INTO `commande` VALUES (485, '2021-04-09', '20:45:00', 59, 505);
INSERT INTO `commande` VALUES (486, '2021-04-09', '20:50:00', 13, 505);
INSERT INTO `commande` VALUES (487, '2021-04-11', '12:10:00', 52, 101);
INSERT INTO `commande` VALUES (488, '2021-04-11', '12:15:00', 67, 101);
INSERT INTO `commande` VALUES (489, '2021-04-11', '12:30:00', 29, 101);
INSERT INTO `commande` VALUES (490, '2021-04-11', '12:50:00', 45, 101);
INSERT INTO `commande` VALUES (491, '2021-04-11', '19:10:00', 46, 202);
INSERT INTO `commande` VALUES (492, '2021-04-11', '20:00:00', 31, 101);
INSERT INTO `commande` VALUES (493, '2021-04-11', '20:15:00', 75, 101);
INSERT INTO `commande` VALUES (494, '2021-04-11', '20:30:00', 79, NULL);
INSERT INTO `commande` VALUES (495, '2021-04-11', '20:35:00', 20, 101);
INSERT INTO `commande` VALUES (496, '2021-04-11', '20:45:00', 22, 101);

-- ----------------------------
-- Table structure for composer
-- ----------------------------
DROP TABLE IF EXISTS `composer`;
CREATE TABLE `composer`  (
  `NROPIZZ` int(11) NOT NULL,
  `CODEINGR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `QTECOMP` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CODEINGR`, `NROPIZZ`) USING BTREE,
  INDEX `FK_COMPOSER2`(`NROPIZZ`) USING BTREE,
  CONSTRAINT `FK_COMPOSER` FOREIGN KEY (`CODEINGR`) REFERENCES `ingredient` (`CODEINGR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COMPOSER2` FOREIGN KEY (`NROPIZZ`) REFERENCES `pizza` (`NROPIZZ`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of composer
-- ----------------------------
INSERT INTO `composer` VALUES (10, 'artichaut', 5);
INSERT INTO `composer` VALUES (11, 'basilic', 10);
INSERT INTO `composer` VALUES (7, 'boeuf', 75);
INSERT INTO `composer` VALUES (9, 'boeuf', 50);
INSERT INTO `composer` VALUES (13, 'capre', 20);
INSERT INTO `composer` VALUES (1, 'champignon', 40);
INSERT INTO `composer` VALUES (4, 'champignon', 20);
INSERT INTO `composer` VALUES (9, 'champignon', 30);
INSERT INTO `composer` VALUES (2, 'chèvre', 60);
INSERT INTO `composer` VALUES (3, 'chèvre', 40);
INSERT INTO `composer` VALUES (6, 'chèvre', 30);
INSERT INTO `composer` VALUES (1, 'chorizo', 50);
INSERT INTO `composer` VALUES (4, 'crème', 10);
INSERT INTO `composer` VALUES (12, 'crème', 50);
INSERT INTO `composer` VALUES (3, 'emmental', 50);
INSERT INTO `composer` VALUES (11, 'féta', 70);
INSERT INTO `composer` VALUES (6, 'herbes', 5);
INSERT INTO `composer` VALUES (1, 'jambon', 60);
INSERT INTO `composer` VALUES (2, 'jambon', 40);
INSERT INTO `composer` VALUES (4, 'jambon', 40);
INSERT INTO `composer` VALUES (5, 'jambon', 50);
INSERT INTO `composer` VALUES (12, 'jambon', 40);
INSERT INTO `composer` VALUES (4, 'lard', 20);
INSERT INTO `composer` VALUES (12, 'lard', 40);
INSERT INTO `composer` VALUES (8, 'merguez', 1);
INSERT INTO `composer` VALUES (1, 'mozzarelle', 120);
INSERT INTO `composer` VALUES (2, 'mozzarelle', 90);
INSERT INTO `composer` VALUES (3, 'mozzarelle', 60);
INSERT INTO `composer` VALUES (5, 'mozzarelle', 120);
INSERT INTO `composer` VALUES (6, 'mozzarelle', 80);
INSERT INTO `composer` VALUES (7, 'mozzarelle', 80);
INSERT INTO `composer` VALUES (8, 'mozzarelle', 80);
INSERT INTO `composer` VALUES (9, 'mozzarelle', 120);
INSERT INTO `composer` VALUES (10, 'mozzarelle', 80);
INSERT INTO `composer` VALUES (11, 'mozzarelle', 60);
INSERT INTO `composer` VALUES (13, 'mozzarelle', 80);
INSERT INTO `composer` VALUES (5, 'oeuf', 1);
INSERT INTO `composer` VALUES (8, 'oeuf', 1);
INSERT INTO `composer` VALUES (7, 'oignon', 40);
INSERT INTO `composer` VALUES (10, 'oignon', 30);
INSERT INTO `composer` VALUES (12, 'oignon', 20);
INSERT INTO `composer` VALUES (2, 'olive', 6);
INSERT INTO `composer` VALUES (7, 'olive', 6);
INSERT INTO `composer` VALUES (10, 'olive', 8);
INSERT INTO `composer` VALUES (11, 'olive', 8);
INSERT INTO `composer` VALUES (8, 'poivron', 40);
INSERT INTO `composer` VALUES (9, 'poivron', 30);
INSERT INTO `composer` VALUES (10, 'poivron', 30);
INSERT INTO `composer` VALUES (11, 'poivron', 20);
INSERT INTO `composer` VALUES (9, 'poulet', 60);
INSERT INTO `composer` VALUES (12, 'roblochon', 40);
INSERT INTO `composer` VALUES (3, 'roquefort', 40);
INSERT INTO `composer` VALUES (13, 'thon', 60);
INSERT INTO `composer` VALUES (6, 'thym', 4);
INSERT INTO `composer` VALUES (10, 'thym', 4);
INSERT INTO `composer` VALUES (1, 'tomate', 80);
INSERT INTO `composer` VALUES (2, 'tomate', 70);
INSERT INTO `composer` VALUES (3, 'tomate', 60);
INSERT INTO `composer` VALUES (4, 'tomate', 80);
INSERT INTO `composer` VALUES (5, 'tomate', 60);
INSERT INTO `composer` VALUES (6, 'tomate', 60);
INSERT INTO `composer` VALUES (7, 'tomate', 80);
INSERT INTO `composer` VALUES (8, 'tomate', 80);
INSERT INTO `composer` VALUES (9, 'tomate', 100);
INSERT INTO `composer` VALUES (10, 'tomate', 80);
INSERT INTO `composer` VALUES (13, 'tomate', 80);
INSERT INTO `composer` VALUES (6, 'tomates', 1);
INSERT INTO `composer` VALUES (10, 'tomates', 1);
INSERT INTO `composer` VALUES (11, 'tomates', 80);
INSERT INTO `composer` VALUES (13, 'tomates', 1);

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient`  (
  `CODEINGR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NOMINGR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `UNITEINGR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CODEINGR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ingredient
-- ----------------------------
INSERT INTO `ingredient` VALUES ('artichaut', 'Cœur d\'artichaut', 'u');
INSERT INTO `ingredient` VALUES ('basilic', 'Basilic Frais', 'gr');
INSERT INTO `ingredient` VALUES ('boeuf', 'Bœuf haché', 'gr');
INSERT INTO `ingredient` VALUES ('capre', 'Capres', 'gr');
INSERT INTO `ingredient` VALUES ('champignon', 'Champignons frais', 'gr');
INSERT INTO `ingredient` VALUES ('chèvre', 'Fromage de chêvre', 'gr');
INSERT INTO `ingredient` VALUES ('chorizo', 'Chorizo', 'gr');
INSERT INTO `ingredient` VALUES ('ciboulette', 'Ciboulette fraîche', 'gr');
INSERT INTO `ingredient` VALUES ('crème', 'Crème fraiche', 'cl');
INSERT INTO `ingredient` VALUES ('emmental', 'emmental français', 'gr');
INSERT INTO `ingredient` VALUES ('féta', 'Féta provençale', 'gr');
INSERT INTO `ingredient` VALUES ('herbes', 'Herbes de provences', 'gr');
INSERT INTO `ingredient` VALUES ('jambon', 'Epaule de porc', 'gr');
INSERT INTO `ingredient` VALUES ('lard', 'Lardons', 'gr');
INSERT INTO `ingredient` VALUES ('merguez', 'Merguez', 'u');
INSERT INTO `ingredient` VALUES ('mozzarelle', 'Fromage mozzarelle', 'gr');
INSERT INTO `ingredient` VALUES ('oeuf', 'Œuf', 'u');
INSERT INTO `ingredient` VALUES ('oignon', 'Oignons frais', 'gr');
INSERT INTO `ingredient` VALUES ('olive', 'olives noires', 'u');
INSERT INTO `ingredient` VALUES ('poivron', 'Poivron Frais', 'gr');
INSERT INTO `ingredient` VALUES ('poulet', 'morceaux de poulet', 'u');
INSERT INTO `ingredient` VALUES ('roblochon', 'roblochon de savoie', 'gr');
INSERT INTO `ingredient` VALUES ('roquefort', 'Roquefort', 'gr');
INSERT INTO `ingredient` VALUES ('thon', 'Miettes de thon', 'gr');
INSERT INTO `ingredient` VALUES ('thym', 'Thym de provence', 'gr');
INSERT INTO `ingredient` VALUES ('tomate', 'Purée de tomate', 'ml');
INSERT INTO `ingredient` VALUES ('tomates', 'Tomates fraiches', 'u');

-- ----------------------------
-- Table structure for lister
-- ----------------------------
DROP TABLE IF EXISTS `lister`;
CREATE TABLE `lister`  (
  `NROCMDE` int(11) NOT NULL,
  `NROPIZZ` int(11) NOT NULL,
  `QTELIST` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NROPIZZ`, `NROCMDE`) USING BTREE,
  INDEX `FK_LISTER2`(`NROCMDE`) USING BTREE,
  CONSTRAINT `FK_LISTER` FOREIGN KEY (`NROPIZZ`) REFERENCES `pizza` (`NROPIZZ`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_LISTER2` FOREIGN KEY (`NROCMDE`) REFERENCES `commande` (`NROCMDE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lister
-- ----------------------------
INSERT INTO `lister` VALUES (453, 1, 2);
INSERT INTO `lister` VALUES (458, 1, 3);
INSERT INTO `lister` VALUES (462, 1, 1);
INSERT INTO `lister` VALUES (469, 1, 2);
INSERT INTO `lister` VALUES (478, 1, 3);
INSERT INTO `lister` VALUES (484, 1, 2);
INSERT INTO `lister` VALUES (492, 1, 2);
INSERT INTO `lister` VALUES (454, 2, 4);
INSERT INTO `lister` VALUES (455, 2, 1);
INSERT INTO `lister` VALUES (464, 2, 1);
INSERT INTO `lister` VALUES (465, 2, 1);
INSERT INTO `lister` VALUES (467, 2, 1);
INSERT INTO `lister` VALUES (476, 2, 2);
INSERT INTO `lister` VALUES (485, 2, 1);
INSERT INTO `lister` VALUES (494, 2, 1);
INSERT INTO `lister` VALUES (454, 3, 1);
INSERT INTO `lister` VALUES (455, 3, 1);
INSERT INTO `lister` VALUES (465, 3, 1);
INSERT INTO `lister` VALUES (470, 3, 1);
INSERT INTO `lister` VALUES (474, 3, 2);
INSERT INTO `lister` VALUES (477, 3, 1);
INSERT INTO `lister` VALUES (486, 3, 2);
INSERT INTO `lister` VALUES (495, 3, 1);
INSERT INTO `lister` VALUES (458, 4, 1);
INSERT INTO `lister` VALUES (462, 4, 1);
INSERT INTO `lister` VALUES (468, 4, 2);
INSERT INTO `lister` VALUES (470, 4, 3);
INSERT INTO `lister` VALUES (473, 4, 1);
INSERT INTO `lister` VALUES (480, 4, 2);
INSERT INTO `lister` VALUES (487, 4, 2);
INSERT INTO `lister` VALUES (492, 4, 1);
INSERT INTO `lister` VALUES (453, 5, 1);
INSERT INTO `lister` VALUES (471, 5, 2);
INSERT INTO `lister` VALUES (480, 5, 2);
INSERT INTO `lister` VALUES (481, 5, 2);
INSERT INTO `lister` VALUES (488, 5, 2);
INSERT INTO `lister` VALUES (491, 5, 2);
INSERT INTO `lister` VALUES (459, 6, 2);
INSERT INTO `lister` VALUES (460, 6, 2);
INSERT INTO `lister` VALUES (473, 6, 2);
INSERT INTO `lister` VALUES (489, 6, 2);
INSERT INTO `lister` VALUES (492, 6, 1);
INSERT INTO `lister` VALUES (454, 7, 2);
INSERT INTO `lister` VALUES (455, 7, 1);
INSERT INTO `lister` VALUES (459, 7, 1);
INSERT INTO `lister` VALUES (461, 7, 2);
INSERT INTO `lister` VALUES (482, 7, 3);
INSERT INTO `lister` VALUES (490, 7, 1);
INSERT INTO `lister` VALUES (492, 7, 1);
INSERT INTO `lister` VALUES (496, 7, 3);
INSERT INTO `lister` VALUES (454, 8, 1);
INSERT INTO `lister` VALUES (468, 8, 1);
INSERT INTO `lister` VALUES (475, 8, 2);
INSERT INTO `lister` VALUES (488, 8, 1);
INSERT INTO `lister` VALUES (492, 8, 1);
INSERT INTO `lister` VALUES (494, 8, 1);
INSERT INTO `lister` VALUES (457, 9, 1);
INSERT INTO `lister` VALUES (462, 9, 1);
INSERT INTO `lister` VALUES (464, 9, 3);
INSERT INTO `lister` VALUES (468, 9, 1);
INSERT INTO `lister` VALUES (476, 9, 1);
INSERT INTO `lister` VALUES (488, 9, 1);
INSERT INTO `lister` VALUES (456, 10, 2);
INSERT INTO `lister` VALUES (460, 10, 2);
INSERT INTO `lister` VALUES (466, 10, 1);
INSERT INTO `lister` VALUES (473, 10, 1);
INSERT INTO `lister` VALUES (474, 10, 1);
INSERT INTO `lister` VALUES (486, 10, 1);
INSERT INTO `lister` VALUES (496, 10, 2);
INSERT INTO `lister` VALUES (459, 11, 1);
INSERT INTO `lister` VALUES (472, 11, 1);
INSERT INTO `lister` VALUES (480, 11, 1);
INSERT INTO `lister` VALUES (483, 11, 1);
INSERT INTO `lister` VALUES (486, 11, 1);
INSERT INTO `lister` VALUES (493, 11, 2);
INSERT INTO `lister` VALUES (455, 12, 1);
INSERT INTO `lister` VALUES (463, 12, 4);
INSERT INTO `lister` VALUES (467, 12, 2);
INSERT INTO `lister` VALUES (477, 12, 1);
INSERT INTO `lister` VALUES (479, 12, 2);
INSERT INTO `lister` VALUES (484, 12, 1);

-- ----------------------------
-- Table structure for livreur
-- ----------------------------
DROP TABLE IF EXISTS `livreur`;
CREATE TABLE `livreur`  (
  `NROLIVR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMLIVR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PRENOMLIVR` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DATEEMBAUCHLIVR` date NULL DEFAULT NULL,
  PRIMARY KEY (`NROLIVR`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of livreur
-- ----------------------------
INSERT INTO `livreur` VALUES (101, 'Hémeriche', 'Sylvain', '2003-10-01');
INSERT INTO `livreur` VALUES (202, 'Gillon', 'Sylvette', '2003-10-01');
INSERT INTO `livreur` VALUES (303, 'Tollag', 'Dino', '2003-11-01');
INSERT INTO `livreur` VALUES (404, 'Pigeot', 'Loïc', '2003-12-01');
INSERT INTO `livreur` VALUES (505, 'Patoux', 'Michel', '2003-12-01');
INSERT INTO `livreur` VALUES (606, 'Ferry', 'Martin', '2004-02-01');

-- ----------------------------
-- Table structure for pizza
-- ----------------------------
DROP TABLE IF EXISTS `pizza`;
CREATE TABLE `pizza`  (
  `NROPIZZ` int(11) NOT NULL AUTO_INCREMENT,
  `DESIGNPIZZ` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TARIFPIZZ` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`NROPIZZ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pizza
-- ----------------------------
INSERT INTO `pizza` VALUES (1, 'pizza caviar', 250.00);
INSERT INTO `pizza` VALUES (2, 'La Seguin', 13.50);
INSERT INTO `pizza` VALUES (3, 'La From', 14.50);
INSERT INTO `pizza` VALUES (4, 'La Fermière', 12.50);
INSERT INTO `pizza` VALUES (5, 'La chausson', 13.00);
INSERT INTO `pizza` VALUES (6, 'La Provençale', 12.50);
INSERT INTO `pizza` VALUES (7, 'La Caramba', 14.50);
INSERT INTO `pizza` VALUES (8, 'l\'Orient Express', 14.50);
INSERT INTO `pizza` VALUES (9, 'La Gourmande', 14.50);
INSERT INTO `pizza` VALUES (10, 'La primeure', 12.50);
INSERT INTO `pizza` VALUES (11, 'La Péloponèse', 14.50);
INSERT INTO `pizza` VALUES (12, 'La Savoyarde', 14.50);
INSERT INTO `pizza` VALUES (13, 'la Pêcheur', 13.50);
INSERT INTO `pizza` VALUES (456, 'puree', 19.20);

SET FOREIGN_KEY_CHECKS = 1;
