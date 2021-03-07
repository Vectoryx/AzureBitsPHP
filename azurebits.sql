-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.14-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database azurebits
CREATE DATABASE IF NOT EXISTS `azurebits` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `azurebits`;

-- Dump della struttura di tabella azurebits.classi
CREATE TABLE IF NOT EXISTS `classi` (
  `ID` varchar(5) NOT NULL,
  `indirizzo` varchar(20) DEFAULT NULL,
  `anno_scolastico` year(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.classi: ~45 rows (circa)
/*!40000 ALTER TABLE `classi` DISABLE KEYS */;
INSERT INTO `classi` (`ID`, `indirizzo`, `anno_scolastico`) VALUES
	('1^A', 'biennio', '2020'),
	('1^B', 'biennio', '2020'),
	('1^C', 'biennio', '2020'),
	('1^D', 'biennio', '2020'),
	('1^F', 'biennio', '2020'),
	('1^G', 'biennio', '2020'),
	('1^H', 'biennio', '2020'),
	('1^I', 'biennio', '2020'),
	('1^L', 'biennio', '2020'),
	('2^A', 'biennio', '2020'),
	('2^B', 'biennio', '2020'),
	('2^C', 'biennio', '2020'),
	('2^D', 'biennio', '2020'),
	('2^E', 'biennio', '2020'),
	('2^F', 'biennio', '2020'),
	('2^G', 'biennio', '2020'),
	('2^H', 'biennio', '2020'),
	('2^I', 'biennio', '2020'),
	('2^L', 'biennio', '2020'),
	('3^A', 'informatica', '2020'),
	('3^B', 'informatica', '2020'),
	('3^C', 'informatica', '2020'),
	('3^D', 'informatica', '2020'),
	('3^E', 'automazione', '2020'),
	('3^F', 'automazione', '2020'),
	('3^H', 'automazione', '2020'),
	('3^I', 'grafica', '2020'),
	('3^L', 'grafica', '2020'),
	('3^M', 'grafica', '2020'),
	('4^A', 'informatica', '2020'),
	('4^B', 'informatica', '2020'),
	('4^D', 'informatica', '2020'),
	('4^E', 'automazione', '2020'),
	('4^F', 'automazione', '2020'),
	('4^H', 'automazione', '2020'),
	('4^I', 'grafica', '2020'),
	('4^L', 'grafica', '2020'),
	('5^A', 'informatica', '2020'),
	('5^B', 'informatica', '2020'),
	('5^Ca', 'automazione', '2020'),
	('5^Ci', 'informatica', '2020'),
	('5^F', 'automazione', '2020'),
	('5^H', 'grafica', '2020'),
	('5^I', 'grafica', '2020'),
	('5^L', 'grafica', '2020');
/*!40000 ALTER TABLE `classi` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.docenti
CREATE TABLE IF NOT EXISTS `docenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hasLoggedOnce` tinyint(4) DEFAULT 0,
  `admin` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.docenti: ~87 rows (circa)
/*!40000 ALTER TABLE `docenti` DISABLE KEYS */;
INSERT INTO `docenti` (`ID`, `username`, `password`, `hasLoggedOnce`, `admin`) VALUES
	(1, 'admin', 'Admin', 1, 1),
	(2, 'stefano.maschio', '402dkhqx', 0, 0),
	(3, 'stefania.bonetto', '459vimly', 0, 0),
	(4, 'silvano.monastero', '531qudbw', 0, 0),
	(5, 'sergio.cicogna', '529tettb', 0, 0),
	(6, 'sabrina.susanna', '196eswnr', 0, 0),
	(7, 'rodolfo.murador', '383rdsbf', 0, 0),
	(8, 'roberto.simionato', '216rdjtt', 0, 0),
	(9, 'roberto.rossi', '294cjsgf', 0, 0),
	(10, 'roberto.mariuzzo', '234tlomb', 0, 0),
	(11, 'roberto.marcuzzo', '252valtr', 0, 0),
	(12, 'roberto.lopresti', '756mqehf', 0, 0),
	(13, 'roberta.pivetta', '120lbhyy', 0, 0),
	(14, 'roberta.caputo', '320yovbc', 0, 0),
	(15, 'rino.cuccurullo', '772gciyn', 0, 0),
	(16, 'pietro.fantuzzi', '930fkjtu', 0, 0),
	(17, 'piera.isgro', '834klhuk', 0, 0),
	(18, 'patrizia.zangirolami', '783mkfwr', 0, 0),
	(19, 'pasquale.falcone', '596berrl', 0, 0),
	(20, 'paola.turchi', '964smrmp', 0, 0),
	(21, 'paola.milanese', '640ivveu', 0, 0),
	(22, 'morena.depoli', '167vjftp', 0, 0),
	(23, 'monica.petteno', '309wgvga', 0, 0),
	(24, 'miriam.rossi', '351brrvc', 0, 0),
	(25, 'mirco.segatello', '653xijqt', 0, 0),
	(26, 'maurizio.trevisan', '400kkklh', 0, 0),
	(27, 'maurizio.niero', '126oqrhp', 0, 0),
	(28, 'massimo.ramon', '764dijec', 0, 0),
	(29, 'marzio.zorzi', '664rfgxg', 0, 0),
	(30, 'marika.polloni', '302xadjr', 0, 0),
	(31, 'mariella.piazzolla', '873uyfmh', 0, 0),
	(32, 'marialuisa.tonin', '895rmvkd', 0, 0),
	(33, 'marialoretta.pavan', '155ycchs', 0, 0),
	(34, 'mariagrazia.castorina', '328rtrln', 0, 0),
	(35, 'mariaantonietta.sartorel', '802buwpu', 0, 0),
	(36, 'lucia.zecchin', '345nkwkt', 0, 0),
	(37, 'lucia.perissinotto', '783clrwh', 0, 0),
	(38, 'luca.bortoletto', '154vfbif', 0, 0),
	(39, 'lorenzo.rigoletto', '135mnpav', 0, 0),
	(40, 'lodovico.gottardi', '992afpmg', 0, 0),
	(41, 'isabella.passi', '392nkyhi', 0, 0),
	(42, 'giuseppina.ditizio', '680wulfm', 0, 0),
	(43, 'giorgio.jovinelli', '500dqytk', 0, 0),
	(44, 'gianluigi.dariol', '368plfdu', 0, 0),
	(45, 'gemma.capovilla', '299fsimm', 0, 0),
	(46, 'gaetano.daluiso', '897jfqks', 0, 0),
	(47, 'gabriella.pivesso', '463scakw', 0, 0),
	(48, 'franco.silecchia', '702vxavw', 0, 0),
	(49, 'francesco.branca', '876dqhtv', 0, 0),
	(50, 'franca.gressini', '767lnmli', 0, 0),
	(51, 'flavio.voltolina', 'Linux', 1, 0),
	(52, 'fabrizio.vendramin', '142vrbjm', 0, 0),
	(53, 'fabio.ferrari', '776cykfb', 0, 0),
	(54, 'fabio.causarano', '129spwyf', 0, 0),
	(55, 'erica.basso', '368wyiad', 0, 0),
	(56, 'elisa.macchion', '201qvcrb', 0, 0),
	(57, 'egidio.fantuzzi', '458vxdyt', 0, 0),
	(58, 'donatella.pavanello', '387fsyxg', 0, 0),
	(59, 'domenico.rizzo', '912xocnv', 0, 0),
	(60, 'diego.furlan', '577xecdf', 0, 0),
	(61, 'diego.depieri', '161ypttg', 0, 0),
	(62, 'daniele.slepoi', '472ggpsx', 0, 0),
	(63, 'cristinamaria.cibin', '625ocrlu', 0, 0),
	(64, 'claudia.vazzoler', '957rfien', 0, 0),
	(65, 'cesare.cusan', '394hegtv', 0, 0),
	(66, 'caterina.fregonese', '866nplcl', 0, 0),
	(67, 'caterina.cattai', '760runkg', 0, 0),
	(68, 'carmen.granzotto', '995xurwk', 0, 0),
	(69, 'carmen.berbigli', '936rgwan', 0, 0),
	(70, 'bernardo.ciniglio', '640cudqw', 0, 0),
	(71, 'beatrice.hitthaler', '281fnamf', 0, 0),
	(72, 'barbara.laporta', '876qlqqu', 0, 0),
	(73, 'barbara.carrer', '677toots', 0, 0),
	(74, 'arturo.locastro', '453ynebh', 0, 0),
	(75, 'arrigo.vidotto', '661cveqr', 0, 0),
	(76, 'antonio.trinco', '890cpaig', 0, 0),
	(77, 'antonio.moretto', '532aoomc', 0, 0),
	(78, 'antonella.pighin', '860xpbdl', 0, 0),
	(79, 'anna.peretti', '501eovvl', 0, 0),
	(80, 'angela.zottarel', '814fslbs', 0, 0),
	(81, 'angela.bonomo', '774ysaju', 0, 0),
	(82, 'andrea.trevisan', '972slfmm', 0, 0),
	(83, 'alessandra.celeghin', '463dwfdn', 0, 0),
	(84, 'aldogiulio.delmastro', '533eowxx', 0, 0),
	(85, 'alberto.zorzi', '773bkmrt', 0, 0),
	(86, 'alberto.farci', '210mnwmo', 0, 0),
	(87, 'adriano.varagnolo', '449mtidf', 0, 0);
/*!40000 ALTER TABLE `docenti` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.docenti_classi
CREATE TABLE IF NOT EXISTS `docenti_classi` (
  `id_docente` int(11) NOT NULL,
  `id_classe` varchar(5) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_classe`),
  KEY `id_classe` (`id_classe`),
  CONSTRAINT `docenti_classi_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`ID`),
  CONSTRAINT `docenti_classi_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.docenti_classi: ~0 rows (circa)
/*!40000 ALTER TABLE `docenti_classi` DISABLE KEYS */;
/*!40000 ALTER TABLE `docenti_classi` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.domande
CREATE TABLE IF NOT EXISTS `domande` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testo` varchar(150) NOT NULL,
  `img_url` varchar(50) DEFAULT NULL,
  `punteggio` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT NULL,
  `creatore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `domande_ibfk_1` FOREIGN KEY (`creatore`) REFERENCES `docenti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.domande: ~0 rows (circa)
/*!40000 ALTER TABLE `domande` DISABLE KEYS */;
/*!40000 ALTER TABLE `domande` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.materie
CREATE TABLE IF NOT EXISTS `materie` (
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.materie: ~10 rows (circa)
/*!40000 ALTER TABLE `materie` DISABLE KEYS */;
INSERT INTO `materie` (`nome`) VALUES
	('Gestione Progetto'),
	('Informatica'),
	('Inglese'),
	('Italiano'),
	('Matematica'),
	('Religione'),
	('Scienze motorie e sportive'),
	('Sistemi e Reti'),
	('Storia'),
	('TPSIT');
/*!40000 ALTER TABLE `materie` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.materie_docenti
CREATE TABLE IF NOT EXISTS `materie_docenti` (
  `id_docente` int(11) NOT NULL,
  `id_materia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_materia`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `materie_docenti_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`ID`),
  CONSTRAINT `materie_docenti_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materie` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.materie_docenti: ~0 rows (circa)
/*!40000 ALTER TABLE `materie_docenti` DISABLE KEYS */;
/*!40000 ALTER TABLE `materie_docenti` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.risposte
CREATE TABLE IF NOT EXISTS `risposte` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testo` varchar(150) NOT NULL,
  `correzione` varchar(10) DEFAULT NULL,
  `img_url` varchar(50) DEFAULT NULL,
  `id_domanda` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_domanda` (`id_domanda`),
  CONSTRAINT `risposte_ibfk_1` FOREIGN KEY (`id_domanda`) REFERENCES `domande` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.risposte: ~0 rows (circa)
/*!40000 ALTER TABLE `risposte` DISABLE KEYS */;
/*!40000 ALTER TABLE `risposte` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.studenti
CREATE TABLE IF NOT EXISTS `studenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hasLoggedOnce` tinyint(4) DEFAULT 0,
  `id_classe` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_classe` (`id_classe`),
  CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.studenti: ~243 rows (circa)
/*!40000 ALTER TABLE `studenti` DISABLE KEYS */;
INSERT INTO `studenti` (`ID`, `username`, `password`, `hasLoggedOnce`, `id_classe`) VALUES
	(1, 'alice.trevisiol', '451sgds', 0, '5^B'),
	(2, 'angelo.denadai', 'denadei', 1, '5^B'),
	(3, 'carlo.zamuner', 'carlocci', 1, '5^B'),
	(4, 'ciprian.agafitei', '769hlirb', 0, '5^B'),
	(5, 'daniele.pontillo', '320yqcee', 0, '5^B'),
	(6, 'daniele.pravato', '300uevnr', 0, '5^B'),
	(7, 'davide.facco', '719ttbal', 0, '5^B'),
	(8, 'fabio.foltran', '474aetub', 0, '5^B'),
	(9, 'francesco.ceron', '287okkpf', 0, '5^B'),
	(10, 'giovanni.basso', '321fxbwe', 0, '5^B'),
	(11, 'giovanni.tedesco', '382dhulc', 0, '5^B'),
	(12, 'giuseppe.blundo', '171prlvb', 0, '5^B'),
	(13, 'leonardo.montagner', 'Leo', 1, '5^B'),
	(14, 'lorenzo.costa', '328ewunl', 0, '5^B'),
	(15, 'matteo.faedda', '951oqxic', 0, '5^B'),
	(16, 'mattia.pravato', '697xslde', 0, '5^B'),
	(17, 'mattias.veronese', '633ifqrm', 0, '5^B'),
	(18, 'mirko.borsatto', '451rsxae', 0, '5^B'),
	(19, 'piergiorgio.toniolo', '195bqndg', 0, '5^B'),
	(20, 'riccardo.castiello', '795demyh', 0, '5^B'),
	(21, 'ruben.dotta', '798ykcgw', 0, '5^B'),
	(22, 'simone.moretto', '528rtoqq', 0, '5^B'),
	(23, 'simone.turcato', '241oredf', 0, '5^B'),
	(24, 'simone.vit', '841wkhdi', 0, '5^B'),
	(25, 'thomas.bertoncin', '368nspyl', 0, '5^B'),
	(26, 'tommaso.pierobon', '562wbkbp', 0, '5^B'),
	(27, 'vesel.neziri', '789vxhxj', 0, '5^B'),
	(28, 'alberto.barucco', '320iobn', 0, '1^A'),
	(29, 'andrea.pati', '795lcwz', 0, '1^A'),
	(30, 'cristian.codognotto', '257fsav', 0, '1^A'),
	(31, 'davide.dimatteo', '310vkrx', 0, '1^A'),
	(32, 'denis.carnielli', '706dmgg', 0, '1^A'),
	(33, 'dionisie.rotaru', '385dvzm', 0, '1^A'),
	(34, 'edoardo.balzaro', '529awcn', 0, '1^A'),
	(35, 'edoardo.cattel', '705ntob', 0, '1^A'),
	(36, 'elir.argentini', '859efuc', 0, '1^A'),
	(37, 'gabrielpablo.callegari', '911ztvd', 0, '1^A'),
	(38, 'kevin.grimaldi', '940noiu', 0, '1^A'),
	(39, 'leonardo.carlozamuner', '859hmgi', 0, '1^A'),
	(40, 'lorenzo.vendramini', '453xfic', 0, '1^A'),
	(41, 'mario.camminatiello', '676robt', 0, '1^A'),
	(42, 'matteo.perissinotto', '331kfet', 0, '1^A'),
	(43, 'matteo.salmasi', '268amro', 0, '1^A'),
	(44, 'matthias.pasquon', '230orfa', 0, '1^A'),
	(45, 'mattia.visentin', '505xqpq', 0, '1^A'),
	(46, 'nicolas.teso', '892pcvw', 0, '1^A'),
	(47, 'omar.elhafdi', '881cxvx', 0, '1^A'),
	(48, 'pietro.prase', '755nemr', 0, '1^A'),
	(49, 'redi.dhama', '156pygk', 0, '1^A'),
	(50, 'roberto.busanello', '863jrna', 0, '1^A'),
	(51, 'thomas.simioni', '742diik', 0, '1^A'),
	(52, 'alexandro.truglia', '603otxc', 0, '1^B'),
	(53, 'atkeya.hossain', '485psgw', 0, '1^B'),
	(54, 'dajana.saric', '824trhc', 0, '1^B'),
	(55, 'dario.bagolin', '670plwh', 0, '1^B'),
	(56, 'diego.rosiglioni', '745cvni', 0, '1^B'),
	(57, 'dylanjamespontino.dacawi', '401tsrd', 0, '1^B'),
	(58, 'francesco.naimoli', '454eims', 0, '1^B'),
	(59, 'gianmaria.presottin', '973nxgm', 0, '1^B'),
	(60, 'joele.buffolo', '995rfbf', 0, '1^B'),
	(61, 'marco.artuso', '182qrsn', 0, '1^B'),
	(62, 'marco.nalesso', '206qjxh', 0, '1^B'),
	(63, 'maria.maddalosso', '808bscu', 0, '1^B'),
	(64, 'martina.marangoni', '980zqud', 0, '1^B'),
	(65, 'mdmodifulislam.rahi', '938bzjj', 0, '1^B'),
	(66, 'promi.uzzaman', '848zcdm', 0, '1^B'),
	(67, 'riccardo.pramparo', '625ivix', 0, '1^B'),
	(68, 'riccardo.prataviera', '889fizp', 0, '1^B'),
	(69, 'rocco.vello', '608rhlo', 0, '1^B'),
	(70, 'rosa.pavan', '336arwr', 0, '1^B'),
	(71, 'salvatore.battaglia', '313vacd', 0, '1^B'),
	(72, 'samina.sayeda', '954qxrd', 0, '1^B'),
	(73, 'thomas.zanin', '332czzn', 0, '1^B'),
	(74, 'tommaso.bortoluzzo', '498fuug', 0, '1^B'),
	(75, 'tommaso.steffenel', '701auld', 0, '1^B'),
	(76, 'aloake.khan', '694zaqc', 0, '1^C'),
	(77, 'angelosanto.ferrazzo', '876sqge', 0, '1^C'),
	(78, 'daniele.vianello', '483jnlw', 0, '1^C'),
	(79, 'dmitry.litvinov', '744mkww', 0, '1^C'),
	(80, 'edoardo.coppe', '266kdxd', 0, '1^C'),
	(81, 'filippo.soncin', '879lwhd', 0, '1^C'),
	(82, 'flavio.zane', '821disz', 0, '1^C'),
	(83, 'francesco.fiore', '585hiah', 0, '1^C'),
	(84, 'guglielmo.bragato', '797ezqq', 0, '1^C'),
	(85, 'jinyu.lu', '637wnio', 0, '1^C'),
	(86, 'leonardo.andreuzza', '135jbrj', 0, '1^C'),
	(87, 'lorenzo.pedron', '811rivi', 0, '1^C'),
	(88, 'lucaandrei.silivestru', '804humj', 0, '1^C'),
	(89, 'matteo.basso', '138derw', 0, '1^C'),
	(90, 'matteo.merotto', '985piuh', 0, '1^C'),
	(91, 'mattia.bellezza', '217lxfa', 0, '1^C'),
	(92, 'nicolaraul.battiston', '975mvgq', 0, '1^C'),
	(93, 'nicolo.finotto', '607crux', 0, '1^C'),
	(94, 'pietro.gaballo', '795ovly', 0, '1^C'),
	(95, 'pietroalessandro.bolognesi', '638atht', 0, '1^C'),
	(96, 'porak.hawlader', '124bkto', 0, '1^C'),
	(97, 'shimei.nie', '140zgnj', 0, '1^C'),
	(98, 'simone.serafin', '127bnht', 0, '1^C'),
	(99, 'alberto.carretta', '328ydon', 0, '1^D'),
	(100, 'alessandro.cappelletto', '752fhyt', 0, '1^D'),
	(101, 'angelo.nube', '204mgoq', 0, '1^D'),
	(102, 'antonio.furlanetto', '821ekpr', 0, '1^D'),
	(103, 'cristian.katia', '260ucuq', 0, '1^D'),
	(104, 'davide.zanin', '650psbo', 0, '1^D'),
	(105, 'enzo.polita', '946tlax', 0, '1^D'),
	(106, 'giacomo.casetta', '139osiq', 0, '1^D'),
	(107, 'giovanni.battistelli', '221nzki', 0, '1^D'),
	(108, 'haytham.samih', '877dwkj', 0, '1^D'),
	(109, 'imam.hossain', '401xffc', 0, '1^D'),
	(110, 'lorenzo.carnieletto', '640swys', 0, '1^D'),
	(111, 'lorenzo.finotto', '487bish', 0, '1^D'),
	(112, 'lorenzo.zanchettin', '555zjzs', 0, '1^D'),
	(113, 'luca.caldo', '892ksek', 0, '1^D'),
	(114, 'massimiliano.pasin', '159lfqj', 0, '1^D'),
	(115, 'mattia.furlan', '560ovfz', 0, '1^D'),
	(116, 'riccardo.tarantino', '941eaqp', 0, '1^D'),
	(117, 'samuel.montagner', '755bemt', 0, '1^D'),
	(118, 'samuelegianmaria.bonan', '738ywbo', 0, '1^D'),
	(119, 'stefano.dedin', '730ttan', 0, '1^D'),
	(120, 'stefano.primelli', '992eoks', 0, '1^D'),
	(121, 'tommaso.michelin', '560gkak', 0, '1^D'),
	(122, 'valentino.voltan', '569itou', 0, '1^D'),
	(123, 'alessandro.dirosa', '772akru', 0, '1^F'),
	(124, 'alessandro.tolfo', '736timb', 0, '1^F'),
	(125, 'alessio.pantarotto', '182ltei', 0, '1^F'),
	(126, 'andrea.varischetti', '954oeoq', 0, '1^F'),
	(127, 'angelo.zanin', '723fhbk', 0, '1^F'),
	(128, 'antonio.gaudino', '597uxyn', 0, '1^F'),
	(129, 'azizibryassen.eslamaliabdel', '639hwll', 0, '1^F'),
	(130, 'davide.trevisan', '371apet', 0, '1^F'),
	(131, 'eros.marson', '306bxgd', 0, '1^F'),
	(132, 'giovanni.cicutto', '608khsb', 0, '1^F'),
	(133, 'giovanni.trefusio', '627hfra', 0, '1^F'),
	(134, 'ivan.illotta', '293yilj', 0, '1^F'),
	(135, 'leonardo.tosi', '437bwyp', 0, '1^F'),
	(136, 'lorenzo.cerchier', '942cohf', 0, '1^F'),
	(137, 'marco.geretto', '640zbys', 0, '1^F'),
	(138, 'matteo.dalberton', '651lrjh', 0, '1^F'),
	(139, 'matteo.sforzin', '425fkvx', 0, '1^F'),
	(140, 'michele.favarofiorini', '972mhjj', 0, '1^F'),
	(141, 'riccardo.moretto', '358btdx', 0, '1^F'),
	(142, 'samet.osmani', '269xrod', 0, '1^F'),
	(143, 'umberto.ferro', '960gpof', 0, '1^F'),
	(144, 'xin.lin', '131mkzb', 0, '1^F'),
	(145, 'yassin.biriri', '241gcaj', 0, '1^F'),
	(146, 'yassin.charroufi', '950eqdx', 0, '1^F'),
	(147, 'alessandro.ierardi', '353wypc', 0, '1^G'),
	(148, 'alinemanuel.ionel', '928ybkh', 0, '1^G'),
	(149, 'anamul.chowdhury', '300kasj', 0, '1^G'),
	(150, 'andrea.battagliarin', '446xssa', 0, '1^G'),
	(151, 'christian.pacilio', '319ysal', 0, '1^G'),
	(152, 'filippo.pacquola', '365qsny', 0, '1^G'),
	(153, 'francesco.mezzapelle', '620ejyh', 0, '1^G'),
	(154, 'gianmaria.carbone', '307jxeo', 0, '1^G'),
	(155, 'giovanni.dicaprio', '256xbrx', 0, '1^G'),
	(156, 'harjot.singh', '921mjrv', 0, '1^G'),
	(157, 'lorenzo.camolese', '199qmkt', 0, '1^G'),
	(158, 'lorenzo.maranesi', '429tiyg', 0, '1^G'),
	(159, 'luca.zamuner', '298tmca', 0, '1^G'),
	(160, 'maksim.miljkovic', '161dbdf', 0, '1^G'),
	(161, 'marco.montagner', '658jzwi', 0, '1^G'),
	(162, 'marco.trevisan', '284gejl', 0, '1^G'),
	(163, 'mattia.conti', '919ivpu', 0, '1^G'),
	(164, 'nico.cristofoletti', '992vfpp', 0, '1^G'),
	(165, 'paolo.maglieri', '267jlmq', 0, '1^G'),
	(166, 'sergio.dasilvacorreia', '350blij', 0, '1^G'),
	(167, 'simone.lorenzon', '236nhzc', 0, '1^G'),
	(168, 'simone.vidal', '762wtbz', 0, '1^G'),
	(169, 'tommaso.calabresi', '777snfz', 0, '1^G'),
	(170, 'wassim.bensalah', '306qxsx', 0, '1^G'),
	(171, 'alessio.delsorbo', '539uwkp', 0, '1^H'),
	(172, 'alex.forcolin', '901iwqq', 0, '1^H'),
	(173, 'amine.sersif', '280sdaf', 0, '1^H'),
	(174, 'andrea.morodettorocco', '137okvr', 0, '1^H'),
	(175, 'anes.mersimoski', '137fsad', 0, '1^H'),
	(176, 'cesare.uliana', '380stei', 0, '1^H'),
	(177, 'daniel.difolco', '503ldsf', 0, '1^H'),
	(178, 'davide.simondo', '998ogjj', 0, '1^H'),
	(179, 'enrico.fantin', '587keyr', 0, '1^H'),
	(180, 'enrico.negretto', '545cbno', 0, '1^H'),
	(181, 'filippo.bottan', '936eifb', 0, '1^H'),
	(182, 'filippo.lucchetta', '972qzit', 0, '1^H'),
	(183, 'francesco.sala', '532hily', 0, '1^H'),
	(184, 'gianluca.cappelli', '302qkin', 0, '1^H'),
	(185, 'gioele.vazzola', '369fkui', 0, '1^H'),
	(186, 'giuseppe.tigani', '603fdaa', 0, '1^H'),
	(187, 'leonardo.rosada', '625hpma', 0, '1^H'),
	(188, 'luca.frasson', '126apeo', 0, '1^H'),
	(189, 'luca.sgorlon', '801leva', 0, '1^H'),
	(190, 'luca.zambon', '148psgy', 0, '1^H'),
	(191, 'luis.jaupi', '557kyah', 0, '1^H'),
	(192, 'michael.badocco', '982oddt', 0, '1^H'),
	(193, 'raul.masetti', '951qivh', 0, '1^H'),
	(194, 'alessandro.presotto', '884wftg', 0, '1^I'),
	(195, 'alessia.delaini', '227plzm', 0, '1^I'),
	(196, 'alessia.paludetto', '625mone', 0, '1^I'),
	(197, 'alessio.digioia', '667juhm', 0, '1^I'),
	(198, 'alexey.fetisov', '418nzkb', 0, '1^I'),
	(199, 'amal.morfi', '135czkp', 0, '1^I'),
	(200, 'angela.zanatta', '607yila', 0, '1^I'),
	(201, 'angelica.gobbo', '658mcci', 0, '1^I'),
	(202, 'anna.bragato', '553jnrv', 0, '1^I'),
	(203, 'aurora.montagner', '725klzy', 0, '1^I'),
	(204, 'caterina.bergo', '699ktsd', 0, '1^I'),
	(205, 'dario.tiepolato', '155vsnj', 0, '1^I'),
	(206, 'elena.chimento', '689xlrv', 0, '1^I'),
	(207, 'elena.fusco', '740dhug', 0, '1^I'),
	(208, 'elisa.enzo', '537xred', 0, '1^I'),
	(209, 'filippo.inzirillo', '641syua', 0, '1^I'),
	(210, 'gabriele.gasparini', '826yxex', 0, '1^I'),
	(211, 'lorenzo.cusin', '494gyyg', 0, '1^I'),
	(212, 'lorenzo.volpato', '188mcvj', 0, '1^I'),
	(213, 'matteo.costanzo', '284ctpj', 0, '1^I'),
	(214, 'nicolo.barbiero', '110bzjy', 0, '1^I'),
	(215, 'patrik.tubiana', '130fbdw', 0, '1^I'),
	(216, 'prastut.karki', '129ssro', 0, '1^I'),
	(217, 'renee.simonetti', '315dypo', 0, '1^I'),
	(218, 'teodor.bazon', '410rqca', 0, '1^I'),
	(219, 'tommaso.mazzotto', '362hzqt', 0, '1^I'),
	(220, 'uyiosabarry.edokpaigbe', '471elpy', 0, '1^I'),
	(221, 'alessandro.favaro', '961kweq', 0, '1^L'),
	(222, 'alessia.cadamuro', '664pfqi', 0, '1^L'),
	(223, 'alex.trevisan', '522ooyn', 0, '1^L'),
	(224, 'alice.dallafrancesca', '767nkhm', 0, '1^L'),
	(225, 'christian.contarin', '827fxwu', 0, '1^L'),
	(226, 'christianioan.tudor', '394prwy', 0, '1^L'),
	(227, 'davide.bodi', '992ntoa', 0, '1^L'),
	(228, 'francesco.caravello', '172dieu', 0, '1^L'),
	(229, 'giacomo.bortolotto.1', '109eclh', 0, '1^L'),
	(230, 'giacomo.bortolotto.2', '237euff', 0, '1^L'),
	(231, 'giovanni.marconit', '145rksk', 0, '1^L'),
	(232, 'lorenzo.sgro', '302pusa', 0, '1^L'),
	(233, 'manuel.falcier', '739twkc', 0, '1^L'),
	(234, 'massimo.rizzetto', '489ywgp', 0, '1^L'),
	(235, 'nicola.midena', '600xlys', 0, '1^L'),
	(236, 'nicolas.bonfante', '644jlqx', 0, '1^L'),
	(237, 'noemi.zottino', '744jekk', 0, '1^L'),
	(238, 'pamela.civitavecchia', '272kxfy', 0, '1^L'),
	(239, 'pietro.pavan', '769gnyq', 0, '1^L'),
	(240, 'rachele.amadio', '100uquq', 0, '1^L'),
	(241, 'sebastiano.trevisiol', '949iqrv', 0, '1^L'),
	(242, 'simone.callegari', '771dcch', 0, '1^L'),
	(243, 'simone.prizzon', '534xyvd', 0, '1^L');
/*!40000 ALTER TABLE `studenti` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.studenti_test
CREATE TABLE IF NOT EXISTS `studenti_test` (
  `id_studente` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  PRIMARY KEY (`id_test`,`id_studente`),
  KEY `id_studente` (`id_studente`),
  CONSTRAINT `studenti_test_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`ID`),
  CONSTRAINT `studenti_test_ibfk_2` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.studenti_test: ~0 rows (circa)
/*!40000 ALTER TABLE `studenti_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `studenti_test` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.test
CREATE TABLE IF NOT EXISTS `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(30) NOT NULL,
  `tempo` time NOT NULL,
  `voto_massimo` int(11) DEFAULT 10,
  `attivo` tinyint(4) DEFAULT 0,
  `penalita` int(11) DEFAULT 0,
  `creatore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`creatore`) REFERENCES `docenti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.test: ~0 rows (circa)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Dump della struttura di tabella azurebits.test_domande
CREATE TABLE IF NOT EXISTS `test_domande` (
  `id_domanda` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  PRIMARY KEY (`id_test`,`id_domanda`),
  KEY `id_domanda` (`id_domanda`),
  CONSTRAINT `test_domande_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`ID`),
  CONSTRAINT `test_domande_ibfk_2` FOREIGN KEY (`id_domanda`) REFERENCES `domande` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.test_domande: ~0 rows (circa)
/*!40000 ALTER TABLE `test_domande` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_domande` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
