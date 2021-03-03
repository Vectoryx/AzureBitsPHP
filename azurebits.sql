CREATE DATABASE /*!32312 IF NOT EXISTS*/ azurebits /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE azurebits;

DROP TABLE IF EXISTS classi;
CREATE TABLE `classi` (
  `id_classe` varchar(5) NOT NULL,
  `indirizzo` varchar(20) DEFAULT NULL,
  `anno_scolastico` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS docenti;
CREATE TABLE `docenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `hasLoggedOnce` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS docenti_classi;
CREATE TABLE `docenti_classi` (
  `id_docente` int(11) NOT NULL,
  `id_classe` varchar(5) NOT NULL,
  KEY `id_docente` (`id_docente`),
  KEY `id_classe` (`id_classe`),
  CONSTRAINT `docenti_classi_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`ID`),
  CONSTRAINT `docenti_classi_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS materie;
CREATE TABLE `materie` (
  `nome` varchar(29) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS materia_docente;
CREATE TABLE `materia_docente` (
  `id_docente` int(11) DEFAULT NULL,
  `id_materia` varchar(29) DEFAULT NULL,
  KEY `id_docente` (`id_docente`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `materia_docente_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materie` (`nome`),
  CONSTRAINT `materia_docente_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS domande;
CREATE TABLE `domande` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testo` varchar(150) DEFAULT NULL,
  `img_url` varchar(50) DEFAULT NULL,
  `punteggio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `creatore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `domande_ibfk_1` FOREIGN KEY (`creatore`) REFERENCES `docenti` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS risposte;
CREATE TABLE `risposte` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testo` varchar(150) DEFAULT NULL,
  `correzione` varchar(10) DEFAULT NULL,
  `img_url` varchar(50) DEFAULT NULL,
  `id_domanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_domanda` (`id_domanda`),
  CONSTRAINT `risposte_ibfk_1` FOREIGN KEY (`id_domanda`) REFERENCES `domande` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS studenti;
CREATE TABLE `studenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `hasLoggedOnce` tinyint(1) DEFAULT 0,
  `id_classe` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_classe` (`id_classe`),
  CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS test;
CREATE TABLE `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(30) DEFAULT NULL,
  `tempo` time DEFAULT NULL,
  `voto_massimo` int(11) DEFAULT NULL,
  `attivo` int(11) DEFAULT NULL,
  `penalita` int(11) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `creatore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`creatore`) REFERENCES `docenti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS studenti_test;
CREATE TABLE `studenti_test` (
  `id_studente` int(11) DEFAULT NULL,
  `id_test` int(11) DEFAULT NULL,
  KEY `id_studente` (`id_studente`),
  KEY `id_test` (`id_test`),
  `voto` FLOAT DEFAULT NULL,
  CONSTRAINT `studenti_test_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`ID`),
  CONSTRAINT `studenti_test_ibfk_2` FOREIGN KEY (`id_test`) REFERENCES `test` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS test_domande;
CREATE TABLE `test_domande` (
  `id_test` int(11) DEFAULT NULL,
  `id_domande` int(11) DEFAULT NULL,
  KEY `id_domande` (`id_domande`),
  KEY `id_test` (`id_test`),
  CONSTRAINT `test_domande_ibfk_1` FOREIGN KEY (`id_domande`) REFERENCES `domande` (`ID`),
  CONSTRAINT `test_domande_ibfk_2` FOREIGN KEY (`id_test`) REFERENCES `test` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




INSERT INTO argomenti(titolo) VALUES('programmazzione a oggetti'),('tipi di dato');

INSERT INTO classi(id_classe,indirizzo,anno_scolastico) VALUES('1^A','biennio','2020'),('1^B','biennio','2020'),('1^C','biennio','2020'),('1^D','biennio','2020'),('1^F','biennio','2020'),('1^G','biennio','2020'),('1^H','biennio','2020'),('1^I','biennio','2020'),('1^L','biennio','2020'),('2^A','biennio','2020'),('2^B','biennio','2020'),('2^C','biennio','2020'),('2^D','biennio','2020'),('2^E','biennio','2020'),('2^F','biennio','2020'),('2^G','biennio','2020'),('2^H','biennio','2020'),('2^I','biennio','2020'),('2^L','biennio','2020'),('3^A','informatica','2020'),('3^B','informatica','2020'),('3^C','informatica','2020'),('3^D','informatica','2020'),('3^E','automazione','2020'),('3^F','automazione','2020'),('3^H','automazione','2020'),('3^I','grafica','2020'),('3^L','grafica','2020'),('3^M','grafica','2020'),('4^A','informatica','2020'),('4^B','informatica','2020'),('4^D','informatica','2020'),('4^E','automazione','2020'),('4^F','automazione','2020'),('4^H','automazione','2020'),('4^I','grafica','2020'),('4^L','grafica','2020'),('5^A','informatica','2020'),('5^B','informatica','2020'),('5^Ca','automazione','2020'),('5^Ci','informatica','2020'),('5^F','automazione','2020'),('5^H','grafica','2020'),('5^I','grafica','2020'),('5^L','grafica','2020');

INSERT INTO docenti(ID,username,password,hasLoggedOnce,admin) VALUES(1,'admin','Admin',1,1),(57,'stefano.maschio','402dkhqx',0,0),(58,'stefania.bonetto','459vimly',0,0),(59,'silvano.monastero','531qudbw',0,0),(60,'sergio.cicogna','529tettb',0,0),(61,'sabrina.susanna','196eswnr',0,0),(62,'rodolfo.murador','383rdsbf',0,0),(63,'roberto.simionato','216rdjtt',0,0),(64,'roberto.rossi','294cjsgf',0,0),(65,'roberto.mariuzzo','234tlomb',0,0),(66,'roberto.marcuzzo','252valtr',0,0),(67,'roberto.lopresti','756mqehf',0,0),(68,'roberta.pivetta','120lbhyy',0,0),(69,'roberta.caputo','320yovbc',0,0),(70,'rino.cuccurullo','772gciyn',0,0),(71,'pietro.fantuzzi','930fkjtu',0,0),(72,'piera.isgro','834klhuk',0,0),(73,'patrizia.zangirolami','783mkfwr',0,0),(74,'pasquale.falcone','596berrl',0,0),(75,'paola.turchi','964smrmp',0,0),(76,'paola.milanese','640ivveu',0,0),(77,'morena.depoli','167vjftp',0,0),(78,'monica.petteno','309wgvga',0,0),(79,'miriam.rossi','351brrvc',0,0),(80,'mirco.segatello','653xijqt',0,0),(81,'maurizio.trevisan','400kkklh',0,0),(82,'maurizio.niero','126oqrhp',0,0),(83,'massimo.ramon','764dijec',0,0),(84,'marzio.zorzi','664rfgxg',0,0),(85,'marika.polloni','302xadjr',0,0),(86,'mariella.piazzolla','873uyfmh',0,0),(87,'marialuisa.tonin','895rmvkd',0,0),(88,'marialoretta.pavan','155ycchs',0,0),(89,'mariagrazia.castorina','328rtrln',0,0),(90,'mariaantonietta.sartorel','802buwpu',0,0),(91,'lucia.zecchin','345nkwkt',0,0),(92,'lucia.perissinotto','783clrwh',0,0),(93,'luca.bortoletto','154vfbif',0,0),(94,'lorenzo.rigoletto','135mnpav',0,0),(95,'lodovico.gottardi','992afpmg',0,0),(96,'isabella.passi','392nkyhi',0,0),(97,'giuseppina.ditizio','680wulfm',0,0),(98,'giorgio.jovinelli','500dqytk',0,0),(99,'gianluigi.dariol','368plfdu',0,0),(100,'gemma.capovilla','299fsimm',0,0),(101,'gaetano.daluiso','897jfqks',0,0),(102,'gabriella.pivesso','463scakw',0,0),(103,'franco.silecchia','702vxavw',0,0),(104,'francesco.branca','876dqhtv',0,0),(105,'franca.gressini','767lnmli',0,0),(106,'flavio.voltolina','Linux',1,0),(107,'fabrizio.vendramin','142vrbjm',0,0),(108,'fabio.ferrari','776cykfb',0,0),(109,'fabio.causarano','129spwyf',0,0),(110,'erica.basso','368wyiad',0,0),(111,'elisa.macchion','201qvcrb',0,0),(112,'egidio.fantuzzi','458vxdyt',0,0),(113,'donatella.pavanello','387fsyxg',0,0),(114,'domenico.rizzo','912xocnv',0,0),(115,'diego.furlan','577xecdf',0,0),(116,'diego.depieri','161ypttg',0,0),(117,'daniele.slepoi','472ggpsx',0,0),(118,'cristinamaria.cibin','625ocrlu',0,0),(119,'claudia.vazzoler','957rfien',0,0),(120,'cesare.cusan','394hegtv',0,0),(121,'caterina.fregonese','866nplcl',0,0),(122,'caterina.cattai','760runkg',0,0),(123,'carmen.granzotto','995xurwk',0,0),(124,'carmen.berbigli','936rgwan',0,0),(125,'bernardo.ciniglio','640cudqw',0,0),(126,'beatrice.hitthaler','281fnamf',0,0),(127,'barbara.laporta','876qlqqu',0,0),(128,'barbara.carrer','677toots',0,0),(129,'arturo.locastro','453ynebh',0,0),(130,'arrigo.vidotto','661cveqr',0,0),(131,'antonio.trinco','890cpaig',0,0),(132,'antonio.moretto','532aoomc',0,0),(133,'antonella.pighin','860xpbdl',0,0),(134,'anna.peretti','501eovvl',0,0),(135,'angela.zottarel','814fslbs',0,0),(136,'angela.bonomo','774ysaju',0,0),(137,'andrea.trevisan','972slfmm',0,0),(138,'alessandra.celeghin','463dwfdn',0,0),(139,'aldogiulio.delmastro','533eowxx',0,0),(140,'alberto.zorzi','773bkmrt',0,0),(141,'alberto.farci','210mnwmo',0,0),(142,'adriano.varagnolo','449mtidf',0,0),(151,'leonardo','736jims',0,0);

INSERT INTO docenti_classi(id_docente,id_classe) VALUES(151,'1^A'),(151,'1^B'),(151,'1^C'),(151,'1^D');


INSERT INTO materie(nome) VALUES('Gestione Progetto'),('Informatica'),('Inglese'),('Italiano'),('Matematica'),('Religione'),('Scienze motorie e sportive'),('Sistemi e Reti'),('Storia'),('TPSIT');


INSERT INTO studenti(ID,username,password,hasLoggedOnce,id_classe) VALUES(1,'alice.trevisiol','451sgds',0,'5^B'),(2,'angelo.denadai','denadei',1,'5^B'),(3,'carlo.zamuner','carlocci',1,'5^B'),(5,'ciprian.agafitei','769hlirb',0,'5^B'),(6,'daniele.pontillo','320yqcee',0,'5^B'),(7,'daniele.pravato','300uevnr',0,'5^B'),(8,'davide.facco','719ttbal',0,'5^B'),(9,'fabio.foltran','474aetub',0,'5^B'),(10,'francesco.ceron','287okkpf',0,'5^B'),(11,'giovanni.basso','321fxbwe',0,'5^B'),(12,'giovanni.tedesco','382dhulc',0,'5^B'),(13,'giuseppe.blundo','171prlvb',0,'5^B'),(14,'leonardo.montagner','Leo',1,'5^B'),(15,'lorenzo.costa','328ewunl',0,'5^B'),(16,'matteo.faedda','951oqxic',0,'5^B'),(17,'mattia.pravato','697xslde',0,'5^B'),(18,'mattias.veronese','633ifqrm',0,'5^B'),(19,'mirko.borsatto','451rsxae',0,'5^B'),(20,'piergiorgio.toniolo','195bqndg',0,'5^B'),(21,'riccardo.castiello','795demyh',0,'5^B'),(22,'ruben.dotta','798ykcgw',0,'5^B'),(23,'simone.moretto','528rtoqq',0,'5^B'),(24,'simone.turcato','241oredf',0,'5^B'),(25,'simone.vit','841wkhdi',0,'5^B'),(26,'thomas.bertoncin','368nspyl',0,'5^B'),(27,'tommaso.pierobon','562wbkbp',0,'5^B'),(28,'vesel.neziri','789vxhxj',0,'5^B'),(30,'alberto.barucco',NULL,0,'1^A'),(31,'andrea.pati',NULL,0,'1^A'),(32,'cristian.codognotto',NULL,0,'1^A'),(33,'davide.dimatteo',NULL,0,'1^A'),(34,'denis.carnielli',NULL,0,'1^A'),(35,'dionisie.rotaru',NULL,0,'1^A'),(36,'edoardo.balzaro',NULL,0,'1^A'),(37,'edoardo.cattel',NULL,0,'1^A'),(38,'elir.argentini',NULL,0,'1^A'),(39,'gabrielpablo.callegari',NULL,0,'1^A'),(40,'kevin.grimaldi',NULL,0,'1^A'),(41,'leonardo.carlozamuner',NULL,0,'1^A'),(42,'lorenzo.vendramini',NULL,0,'1^A'),(43,'mario.camminatiello',NULL,0,'1^A'),(44,'matteo.perissinotto',NULL,0,'1^A'),(45,'matteo.salmasi',NULL,0,'1^A'),(46,'matthias.pasquon',NULL,0,'1^A'),(47,'mattia.visentin',NULL,0,'1^A'),(48,'nicolas.teso',NULL,0,'1^A'),(49,'omar.elhafdi',NULL,0,'1^A'),(50,'pietro.prase',NULL,0,'1^A'),(51,'redi.dhama',NULL,0,'1^A'),(52,'roberto.busanello',NULL,0,'1^A'),(53,'thomas.simioni',NULL,0,'1^A'),(54,'alexandro.truglia',NULL,0,'1^B'),(55,'atkeya.hossain',NULL,0,'1^B'),(56,'dajana.saric',NULL,0,'1^B'),(57,'dario.bagolin',NULL,0,'1^B'),(58,'diego.rosiglioni',NULL,0,'1^B'),(59,'dylanjamespontino.dacawi',NULL,0,'1^B'),(60,'francesco.naimoli',NULL,0,'1^B'),(61,'gianmaria.presottin',NULL,0,'1^B'),(62,'joele.buffolo',NULL,0,'1^B'),(63,'marco.artuso',NULL,0,'1^B'),(64,'marco.nalesso',NULL,0,'1^B'),(65,'maria.maddalosso',NULL,0,'1^B'),(66,'martina.marangoni',NULL,0,'1^B'),(67,'mdmodifulislam.rahi',NULL,0,'1^B'),(68,'promi.uzzaman',NULL,0,'1^B'),(69,'riccardo.pramparo',NULL,0,'1^B'),(70,'riccardo.prataviera',NULL,0,'1^B'),(71,'rocco.vello',NULL,0,'1^B'),(72,'rosa.pavan',NULL,0,'1^B'),(73,'salvatore.battaglia',NULL,0,'1^B'),(74,'samina.sayeda',NULL,0,'1^B'),(75,'thomas.zanin',NULL,0,'1^B'),(76,'tommaso.bortoluzzo',NULL,0,'1^B'),(77,'tommaso.steffenel',NULL,0,'1^B'),(78,'aloake.khan',NULL,0,'1^C'),(79,'angelosanto.ferrazzo',NULL,0,'1^C'),(80,'daniele.vianello',NULL,0,'1^C'),(81,'dmitry.litvinov',NULL,0,'1^C'),(82,'edoardo.coppe',NULL,0,'1^C'),(83,'filippo.soncin',NULL,0,'1^C'),(84,'flavio.zane',NULL,0,'1^C'),(85,'francesco.fiore',NULL,0,'1^C'),(86,'guglielmo.bragato',NULL,0,'1^C'),(87,'jinyu.lu',NULL,0,'1^C'),(88,'leonardo.andreuzza',NULL,0,'1^C'),(89,'lorenzo.pedron',NULL,0,'1^C'),(90,'lucaandrei.silivestru',NULL,0,'1^C'),(91,'matteo.basso',NULL,0,'1^C'),(92,'matteo.merotto',NULL,0,'1^C'),(93,'mattia.bellezza',NULL,0,'1^C'),(94,'nicolaraul.battiston',NULL,0,'1^C'),(95,'nicolo.finotto',NULL,0,'1^C'),(96,'pietro.gaballo',NULL,0,'1^C'),(97,'pietroalessandro.bolognesi',NULL,0,'1^C'),(98,'porak.hawlader',NULL,0,'1^C'),(99,'shimei.nie',NULL,0,'1^C'),(100,'simone.serafin',NULL,0,'1^C'),(101,'alberto.carretta',NULL,0,'1^D'),(102,'alessandro.cappelletto',NULL,0,'1^D'),(103,'angelo.nube',NULL,0,'1^D'),(104,'antonio.furlanetto',NULL,0,'1^D'),(105,'cristian.katia',NULL,0,'1^D'),(106,'davide.zanin',NULL,0,'1^D'),(107,'enzo.polita',NULL,0,'1^D'),(108,'giacomo.casetta',NULL,0,'1^D'),(109,'giovanni.battistelli',NULL,0,'1^D'),(110,'haytham.samih',NULL,0,'1^D'),(111,'imam.hossain',NULL,0,'1^D'),(112,'lorenzo.carnieletto',NULL,0,'1^D'),(113,'lorenzo.finotto',NULL,0,'1^D'),(114,'lorenzo.zanchettin',NULL,0,'1^D'),(115,'luca.caldo',NULL,0,'1^D'),(116,'massimiliano.pasin',NULL,0,'1^D'),(117,'mattia.furlan',NULL,0,'1^D'),(118,'riccardo.tarantino',NULL,0,'1^D'),(119,'samuel.montagner',NULL,0,'1^D'),(120,'samuelegianmaria.bonan',NULL,0,'1^D'),(121,'stefano.dedin',NULL,0,'1^D'),(122,'stefano.primelli',NULL,0,'1^D'),(123,'tommaso.michelin',NULL,0,'1^D'),(124,'valentino.voltan',NULL,0,'1^D'),(125,'alessandro.dirosa',NULL,0,'1^F'),(126,'alessandro.tolfo',NULL,0,'1^F'),(127,'alessio.pantarotto',NULL,0,'1^F'),(128,'andrea.varischetti',NULL,0,'1^F'),(129,'angelo.zanin',NULL,0,'1^F'),(130,'antonio.gaudino',NULL,0,'1^F'),(131,'azizibryassen.eslamaliabdel',NULL,0,'1^F'),(132,'davide.trevisan',NULL,0,'1^F'),(133,'eros.marson',NULL,0,'1^F'),(134,'giovanni.cicutto',NULL,0,'1^F'),(135,'giovanni.trefusio',NULL,0,'1^F'),(136,'ivan.illotta',NULL,0,'1^F'),(137,'leonardo.tosi',NULL,0,'1^F'),(138,'lorenzo.cerchier',NULL,0,'1^F'),(139,'marco.geretto',NULL,0,'1^F'),(140,'matteo.dalberton',NULL,0,'1^F'),(141,'matteo.sforzin',NULL,0,'1^F'),(142,'michele.favarofiorini',NULL,0,'1^F'),(143,'riccardo.moretto',NULL,0,'1^F'),(144,'samet.osmani',NULL,0,'1^F'),(145,'umberto.ferro',NULL,0,'1^F'),(146,'xin.lin',NULL,0,'1^F'),(147,'yassin.biriri',NULL,0,'1^F'),(148,'yassin.charroufi',NULL,0,'1^F'),(173,'alessandro.ierardi',NULL,0,'1^G'),(174,'alinemanuel.ionel',NULL,0,'1^G'),(175,'anamul.chowdhury',NULL,0,'1^G'),(176,'andrea.battagliarin',NULL,0,'1^G'),(177,'christian.pacilio',NULL,0,'1^G'),(178,'filippo.pacquola',NULL,0,'1^G'),(179,'francesco.mezzapelle',NULL,0,'1^G'),(180,'gianmaria.carbone',NULL,0,'1^G'),(181,'giovanni.dicaprio',NULL,0,'1^G'),(182,'harjot.singh',NULL,0,'1^G'),(183,'lorenzo.camolese',NULL,0,'1^G'),(184,'lorenzo.maranesi',NULL,0,'1^G'),(185,'luca.zamuner',NULL,0,'1^G'),(186,'maksim.miljkovic',NULL,0,'1^G'),(187,'marco.montagner',NULL,0,'1^G'),(188,'marco.trevisan',NULL,0,'1^G'),(189,'mattia.conti',NULL,0,'1^G'),(190,'nico.cristofoletti',NULL,0,'1^G'),(191,'paolo.maglieri',NULL,0,'1^G'),(192,'sergio.dasilvacorreia',NULL,0,'1^G'),(193,'simone.lorenzon',NULL,0,'1^G'),(194,'simone.vidal',NULL,0,'1^G'),(195,'tommaso.calabresi',NULL,0,'1^G'),(196,'wassim.bensalah',NULL,0,'1^G'),(197,'alessio.delsorbo',NULL,0,'1^H'),(198,'alex.forcolin',NULL,0,'1^H'),(199,'amine.sersif',NULL,0,'1^H'),(200,'andrea.morodettorocco',NULL,0,'1^H'),(201,'anes.mersimoski',NULL,0,'1^H'),(202,'cesare.uliana',NULL,0,'1^H'),(203,'daniel.difolco',NULL,0,'1^H'),(204,'davide.simondo',NULL,0,'1^H'),(205,'enrico.fantin',NULL,0,'1^H'),(206,'enrico.negretto',NULL,0,'1^H'),(207,'filippo.bottan',NULL,0,'1^H'),(208,'filippo.lucchetta',NULL,0,'1^H'),(209,'francesco.sala',NULL,0,'1^H'),(210,'gianluca.cappelli',NULL,0,'1^H'),(211,'gioele.vazzola',NULL,0,'1^H'),(212,'giuseppe.tigani',NULL,0,'1^H'),(213,'leonardo.rosada',NULL,0,'1^H'),(214,'luca.frasson',NULL,0,'1^H'),(215,'luca.sgorlon',NULL,0,'1^H'),(216,'luca.zambon',NULL,0,'1^H'),(217,'luis.jaupi',NULL,0,'1^H'),(218,'michael.badocco',NULL,0,'1^H'),(219,'raul.masetti',NULL,0,'1^H'),(220,'alessandro.presotto',NULL,0,'1^I'),(221,'alessia.delaini',NULL,0,'1^I'),(222,'alessia.paludetto',NULL,0,'1^I'),(223,'alessio.digioia',NULL,0,'1^I'),(224,'alexey.fetisov',NULL,0,'1^I'),(225,'amal.morfi',NULL,0,'1^I'),(226,'angela.zanatta',NULL,0,'1^I'),(227,'angelica.gobbo',NULL,0,'1^I'),(228,'anna.bragato',NULL,0,'1^I'),(229,'aurora.montagner',NULL,0,'1^I'),(230,'caterina.bergo',NULL,0,'1^I'),(231,'dario.tiepolato',NULL,0,'1^I'),(232,'elena.chimento',NULL,0,'1^I'),(233,'elena.fusco',NULL,0,'1^I'),(234,'elisa.enzo',NULL,0,'1^I'),(235,'filippo.inzirillo',NULL,0,'1^I'),(236,'gabriele.gasparini',NULL,0,'1^I'),(237,'lorenzo.cusin',NULL,0,'1^I'),(238,'lorenzo.volpato',NULL,0,'1^I'),(239,'matteo.costanzo',NULL,0,'1^I'),(240,'nicolo.barbiero',NULL,0,'1^I'),(241,'patrik.tubiana',NULL,0,'1^I'),(242,'prastut.karki',NULL,0,'1^I'),(243,'renee.simonetti',NULL,0,'1^I'),(244,'teodor.bazon',NULL,0,'1^I'),(245,'tommaso.mazzotto',NULL,0,'1^I'),(246,'uyiosabarry.edokpaigbe',NULL,0,'1^I'),(247,'alessandro.favaro',NULL,0,'1^L'),(248,'alessia.cadamuro',NULL,0,'1^L'),(249,'alex.trevisan',NULL,0,'1^L'),(250,'alice.dallafrancesca',NULL,0,'1^L'),(251,'christian.contarin',NULL,0,'1^L'),(252,'christianioan.tudor',NULL,0,'1^L'),(253,'davide.bodi',NULL,0,'1^L'),(254,'francesco.caravello',NULL,0,'1^L'),(255,'giacomo.bortolotto.1',NULL,0,'1^L'),(256,'giacomo.bortolotto.2',NULL,0,'1^L'),(257,'giovanni.marconit',NULL,0,'1^L'),(258,'lorenzo.sgro',NULL,0,'1^L'),(259,'manuel.falcier',NULL,0,'1^L'),(260,'massimo.rizzetto',NULL,0,'1^L'),(261,'nicola.midena',NULL,0,'1^L'),(262,'nicolas.bonfante',NULL,0,'1^L'),(263,'noemi.zottino',NULL,0,'1^L'),(264,'pamela.civitavecchia',NULL,0,'1^L'),(265,'pietro.pavan',NULL,0,'1^L'),(266,'rachele.amadio',NULL,0,'1^L'),(267,'sebastiano.trevisiol',NULL,0,'1^L'),(268,'simone.callegari',NULL,0,'1^L'),(269,'simone.prizzon',NULL,0,'1^L'),(272,'leonardo','498mhnk',0,'1^A');










