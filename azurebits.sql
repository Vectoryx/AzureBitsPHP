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

-- Dump dei dati della tabella azurebits.classi: ~46 rows (circa)
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
	(1, 'admin', '*D89A99106002D77C1D327FC41E005919505638B0', 1, 1),
	(2, 'stefano.maschio', '*2C0B8FC053647EF9178F8283A1B361B1FFBFD056', 0, 0),
	(3, 'stefania.bonetto', '*E3E328A484EE8ABEE40A684EC5D27031CEF29FE3', 0, 0),
	(4, 'silvano.monastero', '*F9C371ABCF8C00508606D1E4D8766C6035CF9FE4', 0, 0),
	(5, 'sergio.cicogna', '*7797C9607E08D37F7BF8F8E897BFEF763955CAF2', 0, 0),
	(6, 'sabrina.susanna', '*85ECA02E156FDF7E678582CBAFE1E1A00F23BB5F', 0, 0),
	(7, 'rodolfo.murador', '*D9C9DE7B8C829A4B65DDEA71F124587A7FF5D5EE', 0, 0),
	(8, 'roberto.simionato', '*AEC1468C4C2769A814BF7328305CC64CEAB7F20F', 0, 0),
	(9, 'roberto.rossi', '*44DFCCB862C6BC555C1DEE59841A477652110958', 0, 0),
	(10, 'roberto.mariuzzo', '*95081A69F659A5D468D59E6289B6145F10D4FC09', 0, 0),
	(11, 'roberto.marcuzzo', '*EB401FF0F6E1438CA0906E51607FA6E877CB6EB4', 0, 0),
	(12, 'roberto.lopresti', '*2FDDA7566AD91E22445BB4223A035FBE1C064181', 0, 0),
	(13, 'roberta.pivetta', '*CD3BB12C4755F48D5A01BB682F5E1278107FA6F9', 0, 0),
	(14, 'roberta.caputo', '*59B27A594B00C57D280905B125AC5F8F7E328ACF', 0, 0),
	(15, 'rino.cuccurullo', '*C41209E455F45FA2F97E1B9EB221DB9B3A9D11DE', 0, 0),
	(16, 'pietro.fantuzzi', '*22DC3BEF21FB2DBB2272293E4ED6AE13A3588AC5', 0, 0),
	(17, 'piera.isgro', '*418A8AD465ADE459B526C76464CA23461EA9288B', 0, 0),
	(18, 'patrizia.zangirolami', '*2B7C730874D781DF3D5C7EA58424E9947145A099', 0, 0),
	(19, 'pasquale.falcone', '*23AF54E0C941F38852E984E95DA22F8110E5AE10', 0, 0),
	(20, 'paola.turchi', '*829965CBA0512041E255CEFDC6BCCD46A08B2734', 0, 0),
	(21, 'paola.milanese', '*C1E86A716D981C86B038C7309B2DA42FDA40DD2C', 0, 0),
	(22, 'morena.depoli', '*186D277FEC65C71B460B2509F88A0D9E6886E6DD', 0, 0),
	(23, 'monica.petteno', '*00E59EBE59E004208C9004F75774D185763E464E', 0, 0),
	(24, 'miriam.rossi', '*C127B715C80DEBBCBB54C650F02589BBDF92B812', 0, 0),
	(25, 'mirco.segatello', '*722846ABF1C5B26F5F9C48FC7003C7DCB17B172C', 0, 0),
	(26, 'maurizio.trevisan', '*422687821D5F8D03C305045C3A6125968B85F085', 0, 0),
	(27, 'maurizio.niero', '*5E850FEE0F4095C0FCC6D33A45EFEF36F0C6F6C1', 0, 0),
	(28, 'massimo.ramon', '*3C2A4BD90C6678BDBE3AF74D34E738E5CBDB3480', 0, 0),
	(29, 'marzio.zorzi', '*5B9AF56B8AB5F7DF58302533E0DE20D769CAF883', 0, 0),
	(30, 'marika.polloni', '*AFBA3BC47253C7FDFB7C89E825564068BDE8B61B', 0, 0),
	(31, 'mariella.piazzolla', '*C9026499BA38292CD138BC52C1A018949B48FA06', 0, 0),
	(32, 'marialuisa.tonin', '*DEAFCF18F93A6C6C6D1655D4B3DDD0086E1B6E4C', 0, 0),
	(33, 'marialoretta.pavan', '*EA8FBB22549FB065FC3D896DB5192F40B6C95B06', 0, 0),
	(34, 'mariagrazia.castorina', '*3603B34EE07526327EDBD64D37019FB5484435A6', 0, 0),
	(35, 'mariaantonietta.sartorel', '*03FA925AD8E18EFFF42F9738055F7D2E6EDF8246', 0, 0),
	(36, 'lucia.zecchin', '*CC8734650BEC82E40D4186C36D6371B6756E0207', 0, 0),
	(37, 'lucia.perissinotto', '*BEABF8613E24E72458D640FFC475B57C8D6046D9', 0, 0),
	(38, 'luca.bortoletto', '*E7C9C4568D0DA94300AAE4DA6F3DE48AE15059F0', 0, 0),
	(39, 'lorenzo.rigoletto', '*4A7EFDA7217E9F75C718AB0512E088798DF0FD82', 0, 0),
	(40, 'lodovico.gottardi', '*28A81D1AB16123A5C5BAED45C22364127464A6EC', 0, 0),
	(41, 'isabella.passi', '*9046D16D72792DC3B969B02C07B4ACD374B5110C', 0, 0),
	(42, 'giuseppina.ditizio', '*ED1010AEE97CB76166DF167EB297947B2BBA0452', 0, 0),
	(43, 'giorgio.jovinelli', '*B15042DA92E7B526A5B718112ED06D7706258092', 0, 0),
	(44, 'gianluigi.dariol', '*C84B8EF54A9300F9A0656AB5019EE4B8794900E4', 0, 0),
	(45, 'gemma.capovilla', '*79574D021A8635C13B68AE90C93D61B5AFC7DA4E', 0, 0),
	(46, 'gaetano.daluiso', '*46D48AB2CBFB707C115764A1CD9EAA1E7B1A5567', 0, 0),
	(47, 'gabriella.pivesso', '*DC0A69AAA67E87E39D395EADFA7AD8B6CB502BA2', 0, 0),
	(48, 'franco.silecchia', '*50EAFDE26D5670D3A82DC388A5D217C90BC0A560', 0, 0),
	(49, 'francesco.branca', '*915BE646D6EAFFFA3A0EAAF960484EDD77425AFF', 0, 0),
	(50, 'franca.gressini', '*838AD28D0BEE33840673D1F7F0C0C8227E2DC627', 0, 0),
	(51, 'flavio.voltolina', '*9780504402D0FF100F804FC9D1844E92165D8253', 1, 0),
	(52, 'fabrizio.vendramin', '*29B62809B6BFD7F64BE87ED95357E354026B7B36', 0, 0),
	(53, 'fabio.ferrari', '*5145DAF6D4CA8058F823B974C5D6F38995DC6ABF', 0, 0),
	(54, 'fabio.causarano', '*7C26727C8BB640571C59695EDE692F41D651E1F4', 0, 0),
	(55, 'erica.basso', '*7F2999B8E4CEE8E9FEF4356BF11C56A27DCC6FFF', 0, 0),
	(56, 'elisa.macchion', '*6CB215F52FA8776EE1E65C2C70E1C876D5F17E10', 0, 0),
	(57, 'egidio.fantuzzi', '*A64A8D9DB1955D6F51512AF7A8EB966797442BF0', 0, 0),
	(58, 'donatella.pavanello', '*0BA19E378B73FF5C5DECBEB0AE1D6E9BB412D204', 0, 0),
	(59, 'domenico.rizzo', '*DCF74AC4541C96C0836B214842135CB21F50E85E', 0, 0),
	(60, 'diego.furlan', '*AA8B202948BA706EB02411C8EB0248B8A63ADF61', 0, 0),
	(61, 'diego.depieri', '*8FBB2183E5566B6F9322E26435D527B74BFEE060', 0, 0),
	(62, 'daniele.slepoi', '*A8A07FB6C9C93FCF3139D2D18AE431F18449733D', 0, 0),
	(63, 'cristinamaria.cibin', '*5D813A1D586965F266909B38FA04CCCF8E54E38E', 0, 0),
	(64, 'claudia.vazzoler', '*11E24FCD3E7674097E2276FF8383B02C6F7ACA47', 0, 0),
	(65, 'cesare.cusan', '*7EA09DF5D0A59B0B4CAC43AC72C4C6BBCFA8A0A4', 0, 0),
	(66, 'caterina.fregonese', '*C3EB2E25A4EC04E2711F8183FA0F2A37491ABAC3', 0, 0),
	(67, 'caterina.cattai', '*02F226A7C8F26EB1A50C2E35CDAD1E815053224F', 0, 0),
	(68, 'carmen.granzotto', '*9F80FB9586357A8A8498786731C2275621C829BA', 0, 0),
	(69, 'carmen.berbigli', '*7FAB21CB1C9FBFCCAE405B37645FFDF40B3961A6', 0, 0),
	(70, 'bernardo.ciniglio', '*3613FC31BE9E2AC01941C4ADA0DF76DD8F371D93', 0, 0),
	(71, 'beatrice.hitthaler', '*722B54706F79600FDDD33B00BEA2108D9B630388', 0, 0),
	(72, 'barbara.laporta', '*5356B019BFE4345A4E0D221F274CBE0250286D56', 0, 0),
	(73, 'barbara.carrer', '*C7824F6205B49421385FF7849F127CDD836F48FC', 0, 0),
	(74, 'arturo.locastro', '*A30F43099FFDD0B593A2D7873F191C01FE44FBC3', 0, 0),
	(75, 'arrigo.vidotto', '*1766939ED2C2C8DCA01510E60F9A9D11D556766B', 0, 0),
	(76, 'antonio.trinco', '*4C09161B2C5CBDD26E706BD9943EC817D763CCDE', 0, 0),
	(77, 'antonio.moretto', '*C1326B91D541FCEAEB9CF814447B52469EECAF29', 0, 0),
	(78, 'antonella.pighin', '*9B3DBEA3A3E69A056A47F1C1F9D644A247EABA3E', 0, 0),
	(79, 'anna.peretti', '*5E874CC16D3B83411B86082CAA1BBA831F559B13', 0, 0),
	(80, 'angela.zottarel', '*40872E6F5983C360C0F5D2265B1EE05B42477D99', 0, 0),
	(81, 'angela.bonomo', '*ED761039E06A2858959ECD775E00875A33E6BCE8', 0, 0),
	(82, 'andrea.trevisan', '*E1013E94431F3BEDFAAFD5BFF4455BE1152D8B6A', 0, 0),
	(83, 'alessandra.celeghin', '*2F567BB21E4EFEB74751D871F5AF220A2226B719', 0, 0),
	(84, 'aldogiulio.delmastro', '*B1EA75E42CBF0FE194A54E95257DBCBC095BFFD2', 0, 0),
	(85, 'alberto.zorzi', '*59B0443F255B337A048BFFD335E24D1F6B29938B', 0, 0),
	(86, 'alberto.farci', '*1D33121D306D43D2F92098C53F8C440DBD5D79D8', 0, 0),
	(87, 'adriano.varagnolo', '*97B8FAE3A49603208C1458AFC812A2B9D7184551', 0, 0);
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

-- Dump dei dati della tabella azurebits.materie_docenti: ~1 rows (circa)
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
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella azurebits.studenti: ~250 rows (circa)
/*!40000 ALTER TABLE `studenti` DISABLE KEYS */;
INSERT INTO `studenti` (`ID`, `username`, `password`, `hasLoggedOnce`, `id_classe`) VALUES
	(1, 'alice.trevisiol', '*BFA8F0242111DE996D78EA40AF9C1A926FC1C0E8', 0, '5^B'),
	(2, 'angelo.denadai', '*0E3C52FBDF027DA7B5D29BE1572B00CFE44EA57E', 1, '5^B'),
	(3, 'carlo.zamuner', '*AA276D56F1D0D3495931FA50E1742110C7CB9811', 1, '5^B'),
	(4, 'ciprian.agafitei', '*82A2BC0F00BFAB9A780176DF4C8A42834C229806', 0, '5^B'),
	(5, 'daniele.pontillo', '*1B39B717E1CBEF9866BE0EBF3FB3BF4C3BB3DBAF', 0, '5^B'),
	(6, 'daniele.pravato', '*B22A9EDBA98E896B1A8D9F3CA21A4A0399EF24AA', 0, '5^B'),
	(7, 'davide.facco', '*5DFF60E690731C9C9261B1A5CCB0F2A2B9501459', 0, '5^B'),
	(8, 'fabio.foltran', '*44A2E1E6BC5F47D3307457A9CB8D36EDEDA7514F', 0, '5^B'),
	(9, 'francesco.ceron', '*5E784AD9700C0B59F3D5860E2CE6477006E5EE7F', 0, '5^B'),
	(10, 'giovanni.basso', '*3F0B2EA18D7F43CF1DF3FA7DFD2469EDB7FB2CA0', 0, '5^B'),
	(11, 'giovanni.tedesco', '*E7A5ACE23B84754B019583CBE754D2866AE24ADA', 0, '5^B'),
	(12, 'giuseppe.blundo', '*5BFD0BD39EE741DB9F6CA693105F974766249F6D', 0, '5^B'),
	(13, 'leonardo.montagner', '*E756B58A03CF85E9360C76DB5A1735FB99941E89', 1, '5^B'),
	(14, 'lorenzo.costa', '*515E4F84677B17B888CE61901CE4FACEA52E6783', 0, '5^B'),
	(15, 'matteo.faedda', '*2B6D0943E72713BEFCB479979BA48D9272525A3B', 0, '5^B'),
	(16, 'mattia.pravato', '*9B891FDBA696AB4DA1D26497EF3AE4EC17BC6E83', 0, '5^B'),
	(17, 'mattias.veronese', '*8DD195C168B0FAF6F5A4D1201ED5CFF8DD138C18', 0, '5^B'),
	(18, 'mirko.borsatto', '*3B912BFC5153A72768C43F63DDE0B8518ADE77E1', 0, '5^B'),
	(19, 'piergiorgio.toniolo', '*2BE73019D606D03C29BC8FC6879FCDF2E9873FBF', 0, '5^B'),
	(20, 'riccardo.castiello', '*9DBFA548CE1F070DC2BFE021E00B254B2B155368', 0, '5^B'),
	(21, 'ruben.dotta', '*8E67958CE68C096A62385C8F0A65406917E581C4', 0, '5^B'),
	(22, 'simone.moretto', '*A98F3C5A4241AAF5C343A3B89613F4AC32DAD465', 0, '5^B'),
	(23, 'simone.turcato', '*BCD66636E0976BD412090DCAB15B2437ED9F5801', 0, '5^B'),
	(24, 'simone.vit', '*461347CC257206987F9AD8AFCE7295843BBB71AA', 0, '5^B'),
	(25, 'thomas.bertoncin', '*641A728883584670CE6704D43D8EF320D4EA57A7', 0, '5^B'),
	(26, 'tommaso.pierobon', '*C14632A99AC7ACEC4C08FB78B8C219D491020DD9', 0, '5^B'),
	(27, 'vesel.neziri', '*A38D8D8DE6B68F651351CB30EFF0CC600C3CE20F', 0, '5^B'),
	(28, 'alberto.barucco', '*BB540C2FCC431CDAEE7E7BA6D011C9D8F8FE59D9', 0, '1^A'),
	(29, 'andrea.pati', '*4C4374CFA1DEC495370705C94DB114E7D0FDD2EB', 0, '1^A'),
	(30, 'cristian.codognotto', '*18A9D03D6F155AEB294463926ACE83F5EBD0D1A6', 0, '1^A'),
	(31, 'davide.dimatteo', '*829B65C3E406B672509DCB1580E70E10A2E5B1E2', 0, '1^A'),
	(32, 'denis.carnielli', '*EBF5EB879BED5406D035DA62E05BB472D400E72A', 0, '1^A'),
	(33, 'dionisie.rotaru', '*82BC48F0EFBC6E477728E4AB02162FDDEE3BA195', 0, '1^A'),
	(34, 'edoardo.balzaro', '*507C7885A66A79097135C26155BE5034C5212057', 0, '1^A'),
	(35, 'edoardo.cattel', '*BEF47CF8C352459A8C07B065601F5DC21224F259', 0, '1^A'),
	(36, 'elir.argentini', '*7AE795ED98B002F62FF5D61F06FEEDB4E40FED21', 0, '1^A'),
	(37, 'gabrielpablo.callegari', '*3711C72ADE080D4D1B1F891233BE03D43EAA51BC', 0, '1^A'),
	(38, 'kevin.grimaldi', '*67B84DA29453B7037CD60A365EFB68FB7638C04C', 0, '1^A'),
	(39, 'leonardo.carlozamuner', '*ECE5FBA1D036D8A7E5102152E04A05B13F0FDD22', 0, '1^A'),
	(40, 'lorenzo.vendramini', '*A7894E9EB05490F96D6199805A5F59192FA1C90E', 0, '1^A'),
	(41, 'mario.camminatiello', '*680E7F29473A3571CD5A72DB3BCAB6BD30CF8EC8', 0, '1^A'),
	(42, 'matteo.perissinotto', '*6B9AF65D60E906E37CE4BDFBB0CACD0EE1800426', 0, '1^A'),
	(43, 'matteo.salmasi', '*FCA0DACB248275A682F15EDE0594CBDB5FFED85A', 0, '1^A'),
	(44, 'matthias.pasquon', '*E009B52DF53E14019B4AC5E6E9444E6185658A17', 0, '1^A'),
	(45, 'mattia.visentin', '*2E528A74F141DFF931DBA39AE587ABDDFAED3E51', 0, '1^A'),
	(46, 'nicolas.teso', '*A168F597A1D539837E0A52C8A1786767C0B3A189', 0, '1^A'),
	(47, 'omar.elhafdi', '*48D8586347BF82A97EF50687A36B0F9D26AEE297', 0, '1^A'),
	(48, 'pietro.prase', '*AFDAB1923B63D881A7FB6B1E26C430EF9FC4C0B4', 0, '1^A'),
	(49, 'redi.dhama', '*170B86028D35934201F78A754F3E8B63696752CC', 0, '1^A'),
	(50, 'roberto.busanello', '*142FAA6B49261255817A82C655573D5E3E26B4B0', 0, '1^A'),
	(51, 'thomas.simioni', '*4B6542ADB647C778BA6C768E8716548B93FFB94F', 0, '1^A'),
	(52, 'alexandro.truglia', '*430F83727D3AC2E625E9D232C3024B6501E04B35', 0, '1^B'),
	(53, 'atkeya.hossain', '*AE05FD8FF66E180DEEFE531BDE0153462186F274', 0, '1^B'),
	(54, 'dajana.saric', '*CD7EE407D81A377E6BED8A7650045051B9C06499', 0, '1^B'),
	(55, 'dario.bagolin', '*A6FF05A62BE8F935BA11645080D2ECCFF9530153', 0, '1^B'),
	(56, 'diego.rosiglioni', '*0DF58B2E871693F15655475532229E29C1531D3A', 0, '1^B'),
	(57, 'dylanjamespontino.dacawi', '*2C05DB873E29B26F6283D12B66895EF88A0591F7', 0, '1^B'),
	(58, 'francesco.naimoli', '*DC013E52B38F54A6586A76DC28FE868835186A24', 0, '1^B'),
	(59, 'gianmaria.presottin', '*91292C15595CA69E89EE731FC32356C757C91800', 0, '1^B'),
	(60, 'joele.buffolo', '*2C29B52E8A9A732D3FB883C068E969B6E318370D', 0, '1^B'),
	(61, 'marco.artuso', '*0B2336B647611860D3110AB5F14F9ABFFAADBF98', 0, '1^B'),
	(62, 'marco.nalesso', '*010B2327D18E71A4C8DF7026AD8BD1309BBF13A7', 0, '1^B'),
	(63, 'maria.maddalosso', '*25CDD6243E0B7AE56B0C386E002AD13E23D62B84', 0, '1^B'),
	(64, 'martina.marangoni', '*38E4EC3264840F0B0F60E3C1CB2FCE62B06D6176', 0, '1^B'),
	(65, 'mdmodifulislam.rahi', '*84B20F78B0F763E47688B62E6C7307852A085FEE', 0, '1^B'),
	(66, 'promi.uzzaman', '*359F1E6D0688DB38CC8D797E5A5AC1F974819656', 0, '1^B'),
	(67, 'riccardo.pramparo', '*D4B6936CC23A8043DD2B9F5A984C7DFB247FC6C1', 0, '1^B'),
	(68, 'riccardo.prataviera', '*207F96ACD4978BCA6616DA1DA0DE2E117861FBC3', 0, '1^B'),
	(69, 'rocco.vello', '*E8CA2D4E439708013A4AEB6FD4FB2736D6E82605', 0, '1^B'),
	(70, 'rosa.pavan', '*83A092BE69602DB43A6F3CD518452E868DDC5739', 0, '1^B'),
	(71, 'salvatore.battaglia', '*842FFCF4AE24FF7BA27B5E17789B7506F33932CE', 0, '1^B'),
	(72, 'samina.sayeda', '*39ADE0EF7263BCF657D3441FFD1B33694B6594C4', 0, '1^B'),
	(73, 'thomas.zanin', '*2287565F8D43A5431E26EF1BA24BF4813962477D', 0, '1^B'),
	(74, 'tommaso.bortoluzzo', '*945C42A92E74932618BA29431D71858A7453A446', 0, '1^B'),
	(75, 'tommaso.steffenel', '*ED4F03C0F0E392FEE28A3B1C8725933742FED392', 0, '1^B'),
	(76, 'aloake.khan', '*8FAC3E0F1003BD9D8CB58D1A9F2507AAD91AFC3D', 0, '1^C'),
	(77, 'angelosanto.ferrazzo', '*A8F3FCFCE6E65B7C5F603872DCB5F47A168330DB', 0, '1^C'),
	(78, 'daniele.vianello', '*9E0CDF4156F650640EF7BB72A3C4D01B031BCBCA', 0, '1^C'),
	(79, 'dmitry.litvinov', '*202B9DF85D2CD36D63D007888C99807B1E389BA8', 0, '1^C'),
	(80, 'edoardo.coppe', '*45EF0D8902FF0C586B8CCA25B310898D70FB45D8', 0, '1^C'),
	(81, 'filippo.soncin', '*A8C03F136617FF61A667C7121CF9F90403F7A6BE', 0, '1^C'),
	(82, 'flavio.zane', '*700F40A8156695A3D5DAEC1F24E7839A46A535C8', 0, '1^C'),
	(83, 'francesco.fiore', '*49BF221AD7AC7CF5E38BC713D678FDA12DF50EB7', 0, '1^C'),
	(84, 'guglielmo.bragato', '*BAAB02DE53D5BDE4F96BA1CB33DED83C543C4A1A', 0, '1^C'),
	(85, 'jinyu.lu', '*0114D3B2A8BCE66AC3CCD1EE87D10B8F9BF3833D', 0, '1^C'),
	(86, 'leonardo.andreuzza', '*8AE250346152C3EF70827DB6441E4145939163FF', 0, '1^C'),
	(87, 'lorenzo.pedron', '*A0F7334841875CBF79A2F537C37B304E41985232', 0, '1^C'),
	(88, 'lucaandrei.silivestru', '*5E079C06984A21832310367D036FC21F4C83D5DE', 0, '1^C'),
	(89, 'matteo.basso', '*C9B0A40E69A0218864C56E5B1B4E0848462EACAB', 0, '1^C'),
	(90, 'matteo.merotto', '*C3462366E9E5A888555894D47296E727F7F26741', 0, '1^C'),
	(91, 'mattia.bellezza', '*4D1CC385C8CFAA0FDC231D7618BD5E48CDFD8990', 0, '1^C'),
	(92, 'nicolaraul.battiston', '*B085569A1E4EE207DC29DDB43BA69CF3ABE0DB2C', 0, '1^C'),
	(93, 'nicolo.finotto', '*D6C8887C66FF359FF1A06E66501D4A21AF8260ED', 0, '1^C'),
	(94, 'pietro.gaballo', '*CAEDE99CEB3FA4BF5EBBBE5A17178C56E8F68811', 0, '1^C'),
	(95, 'pietroalessandro.bolognesi', '*7BC30DCB6944900DDCE0CB3E9330C5A22974C471', 0, '1^C'),
	(96, 'porak.hawlader', '*11388FA053FC1E933EB5AF6D134F2E71E63CC5F8', 0, '1^C'),
	(97, 'shimei.nie', '*24E33F1CB7000B8DE6D7DC23F9A62D7B4A1C4A79', 0, '1^C'),
	(98, 'simone.serafin', '*6223B8F0D666A1D58CE3AB6ED9A58A5A0DDFA535', 0, '1^C'),
	(99, 'alberto.carretta', '*95F4521CFB04BD886BEB580C6C8F7181A2AFE230', 0, '1^D'),
	(100, 'alessandro.cappelletto', '*346F3562E4B098236598F07CA40C24F4CE5F8C6E', 0, '1^D'),
	(101, 'angelo.nube', '*96DE41E41DEB68C959FFFB31EF8D100496616002', 0, '1^D'),
	(102, 'antonio.furlanetto', '*5F9DD7327DA7D3AEBDFD7866F78E5AB7D777C3A8', 0, '1^D'),
	(103, 'cristian.katia', '*A28BF5C5268E2E53ACFFAE9BC9863D46101E051E', 0, '1^D'),
	(104, 'davide.zanin', '*18F94CD76B1729539E84A8C7CB7E6A0887A081EF', 0, '1^D'),
	(105, 'enzo.polita', '*3E1754DD5FCC6617967858459174DB1315F30A32', 0, '1^D'),
	(106, 'giacomo.casetta', '*2811E689A025071180F7AD2FDB22FD8A50ED201B', 0, '1^D'),
	(107, 'giovanni.battistelli', '*C056FDCC7F7648DC9DB4497FA26406107825C561', 0, '1^D'),
	(108, 'haytham.samih', '*321D95999A20736A0B0FE90D549FB02BF3CD75AC', 0, '1^D'),
	(109, 'imam.hossain', '*AA53D1AAE5D6DA58E7E5B016A8B1A0D8566B0039', 0, '1^D'),
	(110, 'lorenzo.carnieletto', '*47F169B06A8EE94D7DC68BBBEEC3E81FD5658686', 0, '1^D'),
	(111, 'lorenzo.finotto', '*111E555EB58DCBE6271E5243CBCA04009490A40D', 0, '1^D'),
	(112, 'lorenzo.zanchettin', '*2C17669DE06F01EA7CD4E3DEC0D70E1C509B966A', 0, '1^D'),
	(113, 'luca.caldo', '*9406DA587E7BD98625A7B689AA05796183948A19', 0, '1^D'),
	(114, 'massimiliano.pasin', '*B909FC293BEBC8C8F7BC307DD7EA864AD97EE63C', 0, '1^D'),
	(115, 'mattia.furlan', '*02873BE3D15B0FF4C1CEBCFC8F8E3DAE479DB5A8', 0, '1^D'),
	(116, 'riccardo.tarantino', '*79497600554DDF52EA4AA676C63B2BD8FF7BB2FA', 0, '1^D'),
	(117, 'samuel.montagner', '*E328AACA5E9C3D1EA1A08D1F500484728EBF1F86', 0, '1^D'),
	(118, 'samuelegianmaria.bonan', '*605C6160670820C2EF434C9BFD781FE92903E902', 0, '1^D'),
	(119, 'stefano.dedin', '*5805CF135B525678497F5B5A5770F4C9B11931A3', 0, '1^D'),
	(120, 'stefano.primelli', '*F1330D4503B1E15F66D0D9A6E3463BC5F2622238', 0, '1^D'),
	(121, 'tommaso.michelin', '*93944E8C7CE3962C608CADCB12B3F056270B993F', 0, '1^D'),
	(122, 'valentino.voltan', '*B779F07FD0A5426D762F70781DAD3A2FE3A6A59B', 0, '1^D'),
	(123, 'alessandro.dirosa', '*EB4632EA856D01846CD743A70C14EC99BE507C18', 0, '1^F'),
	(124, 'alessandro.tolfo', '*A356CCD9D2AF7F9BA9FD5FB032AA5A6B9F111295', 0, '1^F'),
	(125, 'alessio.pantarotto', '*412A6D6599C6E994CDC3E36506CBEA550875B3F9', 0, '1^F'),
	(126, 'andrea.varischetti', '*56ED6DD5D454FE63045665A1BCD3197005C738EC', 0, '1^F'),
	(127, 'angelo.zanin', '*F9E2669B56994D6C8E897F330FC7584093D18EC9', 0, '1^F'),
	(128, 'antonio.gaudino', '*AF472E9E6D3969787F559EAE65F03ABA8CF23D8A', 0, '1^F'),
	(129, 'azizibryassen.eslamaliabdel', '*4AD13E64FC855AC4E1AEC55E192EDC4FF637C1B5', 0, '1^F'),
	(130, 'davide.trevisan', '*4DDFEB284C399366666B29D3EDE7ED5A8FA8D59C', 0, '1^F'),
	(131, 'eros.marson', '*0EC367C62013E8CEB03F014E7E6B7F68C2E722F9', 0, '1^F'),
	(132, 'giovanni.cicutto', '*A759DF5BD7F40DB587DAC485BBE5F67952EDBF48', 0, '1^F'),
	(133, 'giovanni.trefusio', '*CF9B2C39C1683D1A142C28FFB2F862618D6863EF', 0, '1^F'),
	(134, 'ivan.illotta', '*87DF0BC4D55609F328F07B962534F4998BFB0E68', 0, '1^F'),
	(135, 'leonardo.tosi', '*232C267441DCD80997DE3FDCC9EC3CB97F99B3FE', 0, '1^F'),
	(136, 'lorenzo.cerchier', '*307A7D4E3359D74E62610C10ACD3B86F6CA93E51', 0, '1^F'),
	(137, 'marco.geretto', '*BB45B2E379FCA1712F8C61A90D86B6BC36E47285', 0, '1^F'),
	(138, 'matteo.dalberton', '*19B2E8EB19321417EA687C990434337479EAE935', 0, '1^F'),
	(139, 'matteo.sforzin', '*02A7C2A849D235B4EAAEADB8E01F1F2F43474EF7', 0, '1^F'),
	(140, 'michele.favarofiorini', '*65DDA4C4405EB8B602539A45A934B8D13A1458DC', 0, '1^F'),
	(141, 'riccardo.moretto', '*49BFB91495305142C399D40277A3FA6D84ECAA29', 0, '1^F'),
	(142, 'samet.osmani', '*2549EFDF0CD4E76CCACD64EC4AC129CA3C0246D4', 0, '1^F'),
	(143, 'umberto.ferro', '*BC32E80D17FCCF374A5387B5E6211E2E505D3F7E', 0, '1^F'),
	(144, 'xin.lin', '*F3842BD52836B6B41C23D8FE1E6A3B8C00DB54A3', 0, '1^F'),
	(145, 'yassin.biriri', '*3A1106B1FD8F8615BDD126A7B6BC8D923E9C4DC2', 0, '1^F'),
	(146, 'yassin.charroufi', '*AB864B9075CDE0129C1E450402B7012A2D954C12', 0, '1^F'),
	(147, 'alessandro.ierardi', '*205A4020277A0F305CEEBB70F6B84E2B6717CAB7', 0, '1^G'),
	(148, 'alinemanuel.ionel', '*BB16639CCCD336EDFF043A0646F50F6442BFF50F', 0, '1^G'),
	(149, 'anamul.chowdhury', '*700F292ED1CC3E916A0BA7855F21EE2634CA034A', 0, '1^G'),
	(150, 'andrea.battagliarin', '*987A0DFC08AA8A324B1850CA6875F0069759E229', 0, '1^G'),
	(151, 'christian.pacilio', '*0BFE514B62F26101479CC013CF86FE1B435981C4', 0, '1^G'),
	(152, 'filippo.pacquola', '*D8BEFD63A4A3989093CABEE4D5797944F95FBA9A', 0, '1^G'),
	(153, 'francesco.mezzapelle', '*E96B8756CB8101628C1D6F8C50DE8C23B7846FE9', 0, '1^G'),
	(154, 'gianmaria.carbone', '*3B8676FC4408B3D187ECFA63A9E1369D6BD03F0C', 0, '1^G'),
	(155, 'giovanni.dicaprio', '*6D477FB367C2EB15CC3E12C4DDDBFE6446CC306D', 0, '1^G'),
	(156, 'harjot.singh', '*0EC556A4B348175A0B03566B17BD924339041F9B', 0, '1^G'),
	(157, 'lorenzo.camolese', '*81BD2F4FE9D0B46C4D86C363B4CD1922D1EC161A', 0, '1^G'),
	(158, 'lorenzo.maranesi', '*F17C59DF2109EEA04FE09E351D9A3858049B0830', 0, '1^G'),
	(159, 'luca.zamuner', '*C39EE19404B147ABD6A8D12F03F585129C0CB98D', 0, '1^G'),
	(160, 'maksim.miljkovic', '*5F2EF87E3AEEAFBAC7518AA3BF5B3531A02BED3E', 0, '1^G'),
	(161, 'marco.montagner', '*DADB924003E7F131FA30595A12ED8E90BCE2710C', 0, '1^G'),
	(162, 'marco.trevisan', '*AEF6132DE92A1F0967DD2C0B0D2A4068AB0B849A', 0, '1^G'),
	(163, 'mattia.conti', '*CADD875C81498F549286C9750F563EFBBB5CEBDC', 0, '1^G'),
	(164, 'nico.cristofoletti', '*CFB3F32AF9E51B69106F14D66F1ABDDA9E1BDB6E', 0, '1^G'),
	(165, 'paolo.maglieri', '*684D29921262486D529D8320AD2847E93047FE35', 0, '1^G'),
	(166, 'sergio.dasilvacorreia', '*514D622C998775F3357E352EC95AB3E2480BC9A4', 0, '1^G'),
	(167, 'simone.lorenzon', '*2530FACFB51A0E1A3CC38FF3A12D5673075DE0A5', 0, '1^G'),
	(168, 'simone.vidal', '*76094C7466EFC9A09CF6C219475ABE8948302752', 0, '1^G'),
	(169, 'tommaso.calabresi', '*39CC7583B92A2E033A11CB3CBDE61D1A254EF974', 0, '1^G'),
	(170, 'wassim.bensalah', '*B4AED5B5BF813999690BF9A775BBA694A5D6EC58', 0, '1^G'),
	(171, 'alessio.delsorbo', '*AB0C0ED73483FF2A8107938DBC249976ABDBBF39', 0, '1^H'),
	(172, 'alex.forcolin', '*A2298B4E8C60B3B9FE354FB365F3F7FC8881F40F', 0, '1^H'),
	(173, 'amine.sersif', '*0E27AB980B872F532E618B9ACA7EC683FE49577A', 0, '1^H'),
	(174, 'andrea.morodettorocco', '*AEFBBBA47DB1675F8C096BB5FC8C31E3EA4F8FEE', 0, '1^H'),
	(175, 'anes.mersimoski', '*87969310D50C88FFA5551DA52EAA02800827F0CE', 0, '1^H'),
	(176, 'cesare.uliana', '*D03AC57DB6A9E2E2D7DE6E917613CE5F35227512', 0, '1^H'),
	(177, 'daniel.difolco', '*2DD3FD0DD81C37641E1C157F25907A885B1B892B', 0, '1^H'),
	(178, 'davide.simondo', '*1557D9C45C21649DDBFE12C5319275CA17FF166E', 0, '1^H'),
	(179, 'enrico.fantin', '*7B50BAC8A3EF0F6CC9B839C005FE478FB7D001D8', 0, '1^H'),
	(180, 'enrico.negretto', '*EDFBA86B2AF3FCC58BB40AB190CD3880DDF2A54D', 0, '1^H'),
	(181, 'filippo.bottan', '*855CD480524659277FA3AA1E531403CAFB43E9A3', 0, '1^H'),
	(182, 'filippo.lucchetta', '*16C27606928D50B2B6BA372085C48EC7218F3941', 0, '1^H'),
	(183, 'francesco.sala', '*D7886DDF825537692B123217FD2FA79A1F12E698', 0, '1^H'),
	(184, 'gianluca.cappelli', '*7C26F17C4E0723DBF7A646FEB56F05E076C89B80', 0, '1^H'),
	(185, 'gioele.vazzola', '*50188628530C4AD27B9D00B4623532BC8EA57DEE', 0, '1^H'),
	(186, 'giuseppe.tigani', '*ECAB8405628233117958BA18A2E20A700AD73858', 0, '1^H'),
	(187, 'leonardo.rosada', '*4BD4E0EED79D99E6E0528C37B9F3FAF3A43E841B', 0, '1^H'),
	(188, 'luca.frasson', '*02361AE06623C7BFD3BEFA359FE64BBCDC2B6941', 0, '1^H'),
	(189, 'luca.sgorlon', '*B55600EEBFD6567922DE22ADF6ED3C0BE4CB8CFD', 0, '1^H'),
	(190, 'luca.zambon', '*8B7E5A46E0F3C9563638C78DB2B4160BD9DC79B3', 0, '1^H'),
	(191, 'luis.jaupi', '*87C8A37F3375C46911A7064E57C5F0BB32D65FAD', 0, '1^H'),
	(192, 'michael.badocco', '*E83B95A317A1412FEA604E25B717BA6E5315F28C', 0, '1^H'),
	(193, 'raul.masetti', '*8E73F340FFFDADDD620BEED1DF425E0268A440E5', 0, '1^H'),
	(194, 'alessandro.presotto', '*246A1D7DB6D762B7A9A5C77F46FBA356B00097BC', 0, '1^I'),
	(195, 'alessia.delaini', '*8F7E12AB77892105CAE33CC1F93E4E6426F0FEB2', 0, '1^I'),
	(196, 'alessia.paludetto', '*B401CDF2577D78836AB93FFFF231EA874A85AD03', 0, '1^I'),
	(197, 'alessio.digioia', '*064E119402BF11B400C52D388D4B8C6C4AAB84B3', 0, '1^I'),
	(198, 'alexey.fetisov', '*2FA841E769B12EDB553CD5FDC05421D12456AD7B', 0, '1^I'),
	(199, 'amal.morfi', '*AED5E75C26728542637DDC358817084AFA95404C', 0, '1^I'),
	(200, 'angela.zanatta', '*105BC2EF6697BF1E8CDE9E0CB4F5E83C3BB1DB0E', 0, '1^I'),
	(201, 'angelica.gobbo', '*3BF9A9041B9C86762B3A4D5C7F639D7EF81C46E0', 0, '1^I'),
	(202, 'anna.bragato', '*45DA279F3EC4F625AFB18B518D1C7DEA281C23F7', 0, '1^I'),
	(203, 'aurora.montagner', '*03C252014533835EB470E736033182D9CE49D565', 0, '1^I'),
	(204, 'caterina.bergo', '*9E9D2BA54D4EC467ED93465BED379281C52547C0', 0, '1^I'),
	(205, 'dario.tiepolato', '*F978245149AC5E084259C36169E64C675DB7F9AD', 0, '1^I'),
	(206, 'elena.chimento', '*BB22396619027FC42875A60664F3F712A4B3F4F9', 0, '1^I'),
	(207, 'elena.fusco', '*DFFB942C03E24A51A58F2A1023013F6AFAB996B0', 0, '1^I'),
	(208, 'elisa.enzo', '*ECAE31B718801E83C69A4EB07A38BC054C3483AC', 0, '1^I'),
	(209, 'filippo.inzirillo', '*08AA4AB1757135A90C565A9DBEE1D665DF6511F1', 0, '1^I'),
	(210, 'gabriele.gasparini', '*404D6346AFF96C7D7E917576E141855533CA5068', 0, '1^I'),
	(211, 'lorenzo.cusin', '*E0CBC6E4046A55D38B513B016269AC68FDB030C6', 0, '1^I'),
	(212, 'lorenzo.volpato', '*0682DCE98E4A38A15BBED911B72CDACCD368881B', 0, '1^I'),
	(213, 'matteo.costanzo', '*1B590C0E4B270EFC794A69079FA3B24ECC378FB0', 0, '1^I'),
	(214, 'nicolo.barbiero', '*E4EAD8500B8CAC0BB93F128040BEED90B2818B9E', 0, '1^I'),
	(215, 'patrik.tubiana', '*F620405B99FA9B88551DD0D8BB9C2F16FB52BD2E', 0, '1^I'),
	(216, 'prastut.karki', '*7DC362E3A7D0808094E1EC145B5E585DE266E740', 0, '1^I'),
	(217, 'renee.simonetti', '*F6C484DD2107B5B3B106E3EF56274206E97B6C0C', 0, '1^I'),
	(218, 'teodor.bazon', '*4834861F7CA5F472402DEE21C1578C90BBE5D6C3', 0, '1^I'),
	(219, 'tommaso.mazzotto', '*1130DC3201D1261D8ACB7D4A8DDE00666A2FCB4A', 0, '1^I'),
	(220, 'uyiosabarry.edokpaigbe', '*007A40E0D67CC975E69F53D13F2D803204DEDBBF', 0, '1^I'),
	(221, 'alessandro.favaro', '*F0FB4D6260E3DDF10CE2DC3C5FF17BAAFAEC079E', 0, '1^L'),
	(222, 'alessia.cadamuro', '*801C1EDA3C4866F2166CBFFDB6F8CC9224878989', 0, '1^L'),
	(223, 'alex.trevisan', '*52F5B9A8C804BDE9D2B675B4554DC44D0B31783A', 0, '1^L'),
	(224, 'alice.dallafrancesca', '*EC47D34F40E40AB3C0B4AD1F50D85884641B332F', 0, '1^L'),
	(225, 'christian.contarin', '*41550BA7ACE43D846A4EDBBA5F9C32C16796FF9C', 0, '1^L'),
	(226, 'christianioan.tudor', '*F7220462F7C8EB8EA37E8ABBA5A57DE9C4999D4D', 0, '1^L'),
	(227, 'davide.bodi', '*2AB07B71A1CD590762494673C4EB8AC0C4E1B8F3', 0, '1^L'),
	(228, 'francesco.caravello', '*7F6CAB3CD78AC1323041811C30012563940E6E1C', 0, '1^L'),
	(229, 'giacomo.bortolotto.1', '*BE973EF87E4E20F4FC022D1A9883C11F69E628B9', 0, '1^L'),
	(230, 'giacomo.bortolotto.2', '*00156351080EE04B68C8120616CB100F8E36110A', 0, '1^L'),
	(231, 'giovanni.marconit', '*D775557531A95684BCBE58CDE201797A2173D251', 0, '1^L'),
	(232, 'lorenzo.sgro', '*0A9F2B4B1E1A1D6521E0BB2764A825D3069495E7', 0, '1^L'),
	(233, 'manuel.falcier', '*8FC0C8F2A2DBA90167F3F958E53EFD6A8F703780', 0, '1^L'),
	(234, 'massimo.rizzetto', '*0C6BC48DCCBF35D2C58EEDC500C9F97C16CEE5C9', 0, '1^L'),
	(235, 'nicola.midena', '*E00446D887FEAEB185986015C5A7DAE66C6EE365', 0, '1^L'),
	(236, 'nicolas.bonfante', '*77763678FDF4D54292166602B641DB2FCAB2C354', 0, '1^L'),
	(237, 'noemi.zottino', '*CE3E1F906516CB79E0C7B1BE84D70B3E93F5BF04', 0, '1^L'),
	(238, 'pamela.civitavecchia', '*59E225DB0B95A9F11043877FF8F528B831725D6C', 0, '1^L'),
	(239, 'pietro.pavan', '*C6F5A967E6F180D9F22D2EB59E5FE92622C94BDB', 0, '1^L'),
	(240, 'rachele.amadio', '*23443B2A93232320C0DD184D751646B3D5D354EA', 0, '1^L'),
	(241, 'sebastiano.trevisiol', '*8E2EE9493258736C690750B5CFB28FCC23169009', 0, '1^L'),
	(242, 'simone.callegari', '*0DC70317B71A7147950A700C7F38154D55DDCF5D', 0, '1^L'),
	(243, 'simone.prizzon', '*B5964C4479EB113B8A76BB79476C0ED5E9791FC3', 0, '1^L'),
	(247, 'sdfs', '*ABC72C508BE3FA4C57DF4213B3705586FB137B79', 0, '5^L'),
	(248, 'wf', '*67EFACC9B3744F01F63B50D65B04523B736384F5', 0, '5^L'),
	(249, 'scsfrf', '*00C96D7BA415A99AAE231357FA516C0E287DF324', 0, '5^L'),
	(250, 'btbwg', '*50A7588546A877724E1624B923193116FC64D709', 0, '5^L'),
	(251, 'tm,y65m', '*7CF9B4B5FFEFC535F71D19086164EBB650522B82', 0, '5^L'),
	(252, 'k,8', '*B63F053625A9FE89B18D17EE8DD017C293A0111A', 0, '5^L'),
	(253, 'ooooooooooooooooo', '*E4F4983462ADEA368E6ADC91FC395788DF768594', 0, '1^A');
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

-- Dump della struttura di trigger azurebits.hash_pwd_doc_ins
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER hash_pwd_doc_ins
BEFORE INSERT
ON docenti
FOR EACH ROW 
SET new.password = PASSWORD(new.password)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dump della struttura di trigger azurebits.hash_pwd_doc_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER hash_pwd_doc_upd
BEFORE UPDATE
ON docenti
FOR EACH ROW 
SET new.password = PASSWORD(new.password)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dump della struttura di trigger azurebits.hash_pwd_stud_ins
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER hash_pwd_stud_ins
BEFORE INSERT
ON studenti
FOR EACH ROW 
SET new.password = PASSWORD(new.password)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dump della struttura di trigger azurebits.hash_pwd_stud_upd
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER hash_pwd_stud_upd
BEFORE UPDATE
ON studenti
FOR EACH ROW 
SET new.password = PASSWORD(new.password)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
