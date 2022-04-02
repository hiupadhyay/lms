/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.7.21-log : Database - lms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE = ''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS */`lms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lms`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author`
(
    `author_id` int(10) NOT NULL AUTO_INCREMENT,
    `name`      varchar(100) DEFAULT NULL,
    PRIMARY KEY (`author_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `author` */

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book`
(
    `ISBN`      varchar(13)   NOT NULL,
    `title`     varchar(1000) NOT NULL,
    `cover`     varchar(100)  NOT NULL,
    `publisher` varchar(100)  NOT NULL,
    `pages`     varchar(10)   NOT NULL,
    `available` tinyint(1)    NOT NULL DEFAULT '1',
    PRIMARY KEY (`ISBN`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `book` */

insert into `book`(`ISBN`, `title`, `cover`, `publisher`, `pages`, `available`)
values ('663', 'Kalil', 'Stoeck', 'kstoeckie@hhs.gov', '663', 127),
       ('664', 'Dion', 'Reyna', 'dreynaif@dion.ne.jp', '664', 127),
       ('666', 'Fiona', 'Unitt', 'funittih@zimbio.com', '666', 127),
       ('667', 'Yank', 'Leggatt', 'yleggattii@foxnews.com', '667', 127),
       ('668', 'Cherye', 'Jirek', 'cjirekij@army.mil', '668', 127),
       ('672', 'Lowrance', 'Crone', 'lcronein@reference.com', '672', 127),
       ('673', 'Robina', 'Pogosian', 'rpogosianio@usda.gov', '673', 127),
       ('674', 'Gardener', 'Tinsey', 'gtinseyip@adobe.com', '674', 127),
       ('675', 'Philippine', 'Renton', 'prentoniq@prweb.com', '675', 127),
       ('676', 'Lyman', 'Scarlan', 'lscarlanir@hhs.gov', '676', 127),
       ('677', 'Ruthann', 'Fernley', 'rfernleyis@state.gov', '677', 127),
       ('680', 'Bruce', 'Radley', 'bradleyiv@google.com', '680', 127),
       ('681', 'Baldwin', 'Warbey', 'bwarbeyiw@imgur.com', '681', 127),
       ('682', 'Lazar', 'Denham', 'ldenhamix@liveinternet.ru', '682', 127),
       ('683', 'Chloe', 'McMurraya', 'cmcmurrayaiy@biblegateway.com', '683', 127),
       ('684', 'Katuscha', 'Airlie', 'kairlieiz@marriott.com', '684', 127),
       ('685', 'Evelyn', 'Paladini', 'epaladinij0@usnews.com', '685', 127),
       ('686', 'Quintus', 'Cacacie', 'qcacaciej1@qq.com', '686', 127),
       ('687', 'Iormina', 'Cheetham', 'icheethamj2@walmart.com', '687', 127),
       ('688', 'Laurena', 'Fitzjohn', 'lfitzjohnj3@msu.edu', '688', 127),
       ('689', 'Marve', 'Cavalier', 'mcavalierj4@wsj.com', '689', 127),
       ('690', 'Lee', 'Ganter', 'lganterj5@cargocollective.com', '690', 127),
       ('691', 'Brew', 'Mougenel', 'bmougenelj6@purevolume.com', '691', 127),
       ('692', 'Birk', 'Cullnean', 'bcullneanj7@blog.com', '692', 127),
       ('693', 'Pearl', 'Kahane', 'pkahanej8@netlog.com', '693', 127),
       ('694', 'Marten', 'Menco', 'mmencoj9@slashdot.org', '694', 127),
       ('695', 'Nikolia', 'Bassingham', 'nbassinghamja@techcrunch.com', '695', 127),
       ('696', 'Kincaid', 'Entwhistle', 'kentwhistlejb@hhs.gov', '696', 127),
       ('697', 'Linus', 'Van Der Weedenburg', 'lvanderweedenburgjc@hexun.com', '697', 127),
       ('700', 'Sig', 'Handlin', 'shandlinjf@sun.com', '700', 127),
       ('701', 'Royal', 'McNuff', 'rmcnuffjg@barnesandnoble.com', '701', 127),
       ('702', 'Clemmy', 'Morehall', 'cmorehalljh@msu.edu', '702', 127),
       ('703', 'Erin', 'Gascar', 'egascarji@t-online.de', '703', 127),
       ('704', 'Dede', 'Libri', 'dlibrijj@merriam-webster.com', '704', 127),
       ('705', 'Fremont', 'Jencken', 'fjenckenjk@adobe.com', '705', 127),
       ('706', 'Gawen', 'Acosta', 'gacostajl@census.gov', '706', 127),
       ('707', 'Meyer', 'Pyer', 'mpyerjm@drupal.org', '707', 127),
       ('708', 'Conan', 'Bassindale', 'cbassindalejn@prnewswire.com', '708', 127),
       ('709', 'Vail', 'McHugh', 'vmchughjo@alexa.com', '709', 127),
       ('710', 'Benjamin', 'Goode', 'bgoodejp@github.com', '710', 127),
       ('711', 'Shae', 'Sheasby', 'ssheasbyjq@yellowbook.com', '711', 127),
       ('712', 'Salem', 'Chaffey', 'schaffeyjr@hao123.com', '712', 127),
       ('713', 'Randolph', 'Tomashov', 'rtomashovjs@ihg.com', '713', 127),
       ('714', 'Waverley', 'Greenhalgh', 'wgreenhalghjt@wisc.edu', '714', 127),
       ('715', 'Bowie', 'Sleightholme', 'bsleightholmeju@yandex.ru', '715', 127),
       ('716', 'Sherill', 'Meindl', 'smeindljv@mapquest.com', '716', 127),
       ('717', 'Herrick', 'Snailham', 'hsnailhamjw@yahoo.com', '717', 127),
       ('718', 'Annie', 'Birchwood', 'abirchwoodjx@boston.com', '718', 127),
       ('719', 'Hailey', 'Simonnin', 'hsimonninjy@slideshare.net', '719', 127),
       ('720', 'Thorn', 'Ancell', 'tancelljz@example.com', '720', 127),
       ('721', 'Alyda', 'Padfield', 'apadfieldk0@t-online.de', '721', 127),
       ('722', 'Theda', 'Sushams', 'tsushamsk1@bbb.org', '722', 127),
       ('723', 'Heidi', 'Swyne', 'hswynek2@sciencedaily.com', '723', 127),
       ('724', 'Jennifer', 'Antoniades', 'jantoniadesk3@theguardian.com', '724', 127),
       ('725', 'Carlie', 'Gruby', 'cgrubyk4@blogspot.com', '725', 127),
       ('726', 'Zulema', 'Winckles', 'zwincklesk5@mit.edu', '726', 127),
       ('727', 'Antonina', 'Stryde', 'astrydek6@tuttocitta.it', '727', 127),
       ('728', 'Bailie', 'Nussen', 'bnussenk7@nsw.gov.au', '728', 127),
       ('729', 'Derrick', 'Stealey', 'dstealeyk8@mac.com', '729', 127),
       ('730', 'Israel', 'Blankhorn', 'iblankhornk9@hp.com', '730', 127),
       ('731', 'Lisha', 'Absolon', 'labsolonka@taobao.com', '731', 127),
       ('732', 'Dorothee', 'McFarlane', 'dmcfarlanekb@phpbb.com', '732', 127),
       ('733', 'Petronille', 'Gopsill', 'pgopsillkc@state.tx.us', '733', 127),
       ('734', 'Lara', 'Deaville', 'ldeavillekd@tiny.cc', '734', 127),
       ('735', 'Kerri', 'Roan', 'kroanke@example.com', '735', 127),
       ('736', 'Becka', 'Pinor', 'bpinorkf@amazon.de', '736', 127),
       ('737', 'Lanni', 'Tape', 'ltapekg@eventbrite.com', '737', 127),
       ('738', 'Darci', 'Alstead', 'dalsteadkh@stanford.edu', '738', 127),
       ('739', 'Dene', 'Kleinerman', 'dkleinermanki@statcounter.com', '739', 127),
       ('740', 'Aleda', 'Brotherton', 'abrothertonkj@tumblr.com', '740', 127),
       ('741', 'Winn', 'Gonnin', 'wgonninkk@gov.uk', '741', 127),
       ('742', 'Berkly', 'Botger', 'bbotgerkl@canalblog.com', '742', 127),
       ('743', 'Suzanne', 'Rickaert', 'srickaertkm@oracle.com', '743', 127),
       ('744', 'Tristan', 'Gwyer', 'tgwyerkn@umn.edu', '744', 127),
       ('745', 'Fredi', 'Oxenden', 'foxendenko@indiatimes.com', '745', 127),
       ('746', 'Gabriella', 'Sprott', 'gsprottkp@ask.com', '746', 127),
       ('747', 'Fanchette', 'Adame', 'fadamekq@bbc.co.uk', '747', 127),
       ('748', 'Dyane', 'O\'Gormley', 'dogormleykr@tumblr.com', '748', 127),
       ('749', 'Aloysia', 'Cromley', 'acromleyks@psu.edu', '749', 127),
       ('750', 'Ellsworth', 'O\'Shea', 'eosheakt@answers.com', '750', 127),
       ('751', 'Garrot', 'Brinson', 'gbrinsonku@narod.ru', '751', 127),
       ('752', 'Gaylord', 'Melhuish', 'gmelhuishkv@g.co', '752', 127),
       ('753', 'Hurlee', 'McCombe', 'hmccombekw@phoca.cz', '753', 127),
       ('754', 'Alfreda', 'Alleburton', 'aalleburtonkx@odnoklassniki.ru', '754', 127),
       ('755', 'Elfie', 'Arsmith', 'earsmithky@dropbox.com', '755', 127),
       ('756', 'Suzanne', 'Caldwell', 'scaldwellkz@latimes.com', '756', 127),
       ('757', 'Emmet', 'Pattemore', 'epattemorel0@arstechnica.com', '757', 127),
       ('758', 'Giuditta', 'Cowlishaw', 'gcowlishawl1@virginia.edu', '758', 127),
       ('759', 'Iorgo', 'Danilyuk', 'idanilyukl2@prweb.com', '759', 127),
       ('760', 'Ardyce', 'Gerrit', 'agerritl3@vkontakte.ru', '760', 127),
       ('761', 'Dasha', 'Gopsell', 'dgopselll4@ocn.ne.jp', '761', 127),
       ('762', 'Berton', 'Weich', 'bweichl5@kickstarter.com', '762', 127),
       ('763', 'Judah', 'Mariot', 'jmariotl6@opensource.org', '763', 127),
       ('764', 'Giorgia', 'Coulthurst', 'gcoulthurstl7@omniture.com', '764', 127),
       ('765', 'Kleon', 'Kantor', 'kkantorl8@disqus.com', '765', 127),
       ('766', 'Clayson', 'Semiraz', 'csemirazl9@vimeo.com', '766', 127),
       ('767', 'Verney', 'Thrift', 'vthriftla@seattletimes.com', '767', 127),
       ('768', 'Karmen', 'Tuohy', 'ktuohylb@mtv.com', '768', 127),
       ('769', 'Gil', 'Bestwick', 'gbestwicklc@illinois.edu', '769', 127),
       ('770', 'Reece', 'Barefoot', 'rbarefootld@cdbaby.com', '770', 127),
       ('771', 'Eugene', 'Vannah', 'evannahle@skype.com', '771', 127),
       ('772', 'Lukas', 'Leving', 'llevinglf@booking.com', '772', 127),
       ('773', 'Othilie', 'Scawn', 'oscawnlg@reference.com', '773', 127),
       ('774', 'Jasun', 'Louca', 'jloucalh@reuters.com', '774', 127),
       ('775', 'Deloris', 'Klawi', 'dklawili@ted.com', '775', 126),
       ('776', 'Ezechiel', 'Hopkynson', 'ehopkynsonlj@gravatar.com', '776', 125),
       ('777', 'Tomasina', 'Balding', 'tbaldinglk@sourceforge.net', '777', 124),
       ('778', 'Haven', 'Zylberdik', 'hzylberdikll@webnode.com', '778', 123),
       ('779', 'Maurizia', 'Duddan', 'mduddanlm@ning.com', '779', 122),
       ('780', 'Calla', 'Cape', 'ccapeln@state.tx.us', '780', 121),
       ('781', 'Eberto', 'O\'Kenny', 'eokennylo@vimeo.com', '781', 120),
       ('782', 'Nobie', 'Johananoff', 'njohananofflp@wordpress.com', '782', 119),
       ('783', 'Ringo', 'Element', 'relementlq@nationalgeographic.com', '783', 118),
       ('784', 'Shannon', 'Parks', 'sparkslr@symantec.com', '784', 117),
       ('785', 'Katine', 'Corsor', 'kcorsorls@vinaora.com', '785', 116),
       ('786', 'Andy', 'Dominichelli', 'adominichellilt@bloglovin.com', '786', 115),
       ('787', 'Cornie', 'Jelley', 'cjelleylu@technorati.com', '787', 114),
       ('788', 'Garrard', 'Stubbe', 'gstubbelv@bbc.co.uk', '788', 113),
       ('789', 'Kora', 'Dunkerly', 'kdunkerlylw@tmall.com', '789', 112),
       ('790', 'Bobette', 'Spruce', 'bsprucelx@ucsd.edu', '790', 111),
       ('791', 'Rowan', 'Krystek', 'rkrystekly@opensource.org', '791', 110),
       ('792', 'Cati', 'Boate', 'cboatelz@so-net.ne.jp', '792', 109),
       ('793', 'Vinny', 'Craggs', 'vcraggsm0@indiegogo.com', '793', 108),
       ('794', 'Glynn', 'Faiers', 'gfaiersm1@sciencedaily.com', '794', 107),
       ('795', 'Vivianne', 'Brislawn', 'vbrislawnm2@wordpress.org', '795', 106),
       ('796', 'Sly', 'Blowing', 'sblowingm3@timesonline.co.uk', '796', 105),
       ('797', 'Pat', 'Addy', 'paddym4@homestead.com', '797', 104),
       ('798', 'Ardys', 'Croisdall', 'acroisdallm5@indiatimes.com', '798', 103),
       ('799', 'Guilbert', 'Haylands', 'ghaylandsm6@soundcloud.com', '799', 102),
       ('800', 'Tymothy', 'Gudgen', 'tgudgenm7@miibeian.gov.cn', '800', 101),
       ('801', 'Rubin', 'Marchant', 'rmarchantm8@jigsy.com', '801', 100),
       ('802', 'Camila', 'Twitchett', 'ctwitchettm9@bbb.org', '802', 99),
       ('803', 'Ariel', 'Lohden', 'alohdenma@ehow.com', '803', 98),
       ('804', 'Karrah', 'Osburn', 'kosburnmb@examiner.com', '804', 97),
       ('805', 'Angelico', 'Pibsworth', 'apibsworthmc@pagesperso-orange.fr', '805', 96),
       ('806', 'Desmund', 'Berfoot', 'dberfootmd@blogs.com', '806', 95),
       ('807', 'Dorthea', 'Bagster', 'dbagsterme@imgur.com', '807', 94),
       ('808', 'Shoshanna', 'Brobak', 'sbrobakmf@wikispaces.com', '808', 93),
       ('809', 'Corey', 'Nicklin', 'cnicklinmg@state.gov', '809', 92),
       ('810', 'Jolene', 'Murphey', 'jmurpheymh@feedburner.com', '810', 91),
       ('811', 'Alva', 'Pulteneye', 'apulteneyemi@usatoday.com', '811', 90),
       ('812', 'Sapphire', 'Paolucci', 'spaoluccimj@mozilla.org', '812', 89),
       ('813', 'Farris', 'Knibb', 'fknibbmk@examiner.com', '813', 88),
       ('814', 'Gabriel', 'Pakenham', 'gpakenhamml@smugmug.com', '814', 87),
       ('815', 'Hilliary', 'Apple', 'happlemm@pcworld.com', '815', 86),
       ('816', 'Marley', 'Heighway', 'mheighwaymn@uiuc.edu', '816', 85),
       ('817', 'Dare', 'McClunaghan', 'dmcclunaghanmo@merriam-webster.com', '817', 84),
       ('818', 'Cecile', 'Castagnaro', 'ccastagnaromp@cbslocal.com', '818', 83),
       ('819', 'Crysta', 'Slimon', 'cslimonmq@auda.org.au', '819', 82),
       ('820', 'Del', 'Nabarro', 'dnabarromr@51.la', '820', 81),
       ('821', 'Silvano', 'Rodders', 'sroddersms@timesonline.co.uk', '821', 80),
       ('822', 'Con', 'MacIan', 'cmacianmt@samsung.com', '822', 79),
       ('823', 'Fredek', 'Flowitt', 'fflowittmu@cdbaby.com', '823', 78),
       ('824', 'Ripley', 'Dick', 'rdickmv@google.pl', '824', 77),
       ('825', 'Retha', 'Kempshall', 'rkempshallmw@sogou.com', '825', 76),
       ('826', 'Queenie', 'Darleston', 'qdarlestonmx@infoseek.co.jp', '826', 75),
       ('827', 'Eduardo', 'Spottiswood', 'espottiswoodmy@dell.com', '827', 74),
       ('828', 'Georgianne', 'Bickers', 'gbickersmz@jimdo.com', '828', 73),
       ('829', 'Hervey', 'Mallatratt', 'hmallatrattn0@slashdot.org', '829', 72),
       ('830', 'Cele', 'Pavia', 'cpavian1@hhs.gov', '830', 71),
       ('831', 'Essy', 'Dirkin', 'edirkinn2@google.com.br', '831', 70),
       ('832', 'Afton', 'Stolze', 'astolzen3@usa.gov', '832', 69),
       ('833', 'Paige', 'Aulsford', 'paulsfordn4@cyberchimps.com', '833', 68),
       ('834', 'Arlyne', 'Prydden', 'apryddenn5@tmall.com', '834', 67),
       ('835', 'Ruperto', 'Smedley', 'rsmedleyn6@oracle.com', '835', 66),
       ('836', 'Nona', 'Haddrell', 'nhaddrelln7@yale.edu', '836', 65),
       ('837', 'Ange', 'Milesap', 'amilesapn8@wix.com', '837', 64),
       ('838', 'Patty', 'Hazelby', 'phazelbyn9@ucsd.edu', '838', 63),
       ('839', 'Morgan', 'Scarman', 'mscarmanna@parallels.com', '839', 62),
       ('840', 'Benson', 'Alvarado', 'balvaradonb@yellowpages.com', '840', 61),
       ('841', 'Ivett', 'Ryan', 'iryannc@google.es', '841', 60),
       ('842', 'Andreas', 'Simko', 'asimkond@squarespace.com', '842', 59),
       ('843', 'Samantha', 'Lammin', 'slamminne@home.pl', '843', 58),
       ('844', 'Dannie', 'Dingivan', 'ddingivannf@latimes.com', '844', 57),
       ('845', 'Ermanno', 'Burnhams', 'eburnhamsng@sogou.com', '845', 56),
       ('846', 'Diane-marie', 'Rableau', 'drableaunh@bloomberg.com', '846', 55),
       ('847', 'Cynthia', 'Goodlud', 'cgoodludni@nsw.gov.au', '847', 54),
       ('848', 'Rawley', 'Grabeham', 'rgrabehamnj@plala.or.jp', '848', 53),
       ('849', 'Franni', 'Nannizzi', 'fnannizzink@plala.or.jp', '849', 52),
       ('850', 'Enoch', 'Bassano', 'ebassanonl@studiopress.com', '850', 51),
       ('851', 'Dimitry', 'Tight', 'dtightnm@stumbleupon.com', '851', 50),
       ('852', 'Cornie', 'Agus', 'cagusnn@goo.ne.jp', '852', 49),
       ('853', 'Hazel', 'Clemanceau', 'hclemanceauno@smugmug.com', '853', 48),
       ('854', 'Theodosia', 'Gilders', 'tgildersnp@answers.com', '854', 47),
       ('855', 'Carly', 'Diver', 'cdivernq@shareasale.com', '855', 46),
       ('856', 'Caty', 'Berthelmot', 'cberthelmotnr@vinaora.com', '856', 45),
       ('857', 'Bernelle', 'Buckam', 'bbuckamns@123-reg.co.uk', '857', 44),
       ('858', 'Lanae', 'Olligan', 'lolligannt@etsy.com', '858', 43),
       ('859', 'Hermie', 'Touson', 'htousonnu@nature.com', '859', 42),
       ('860', 'Luz', 'Flintoff', 'lflintoffnv@weibo.com', '860', 41),
       ('861', 'Yetta', 'Dallimare', 'ydallimarenw@seattletimes.com', '861', 40),
       ('862', 'Barbaraanne', 'Stratz', 'bstratznx@marketwatch.com', '862', 39),
       ('863', 'Thedrick', 'Groomebridge', 'tgroomebridgeny@squarespace.com', '863', 38),
       ('864', 'Caren', 'Leishman', 'cleishmannz@dyndns.org', '864', 37),
       ('865', 'Lynea', 'Escale', 'lescaleo0@ihg.com', '865', 36),
       ('866', 'Nannette', 'Matusovsky', 'nmatusovskyo1@github.io', '866', 35),
       ('867', 'Dominic', 'Childes', 'dchildeso2@wordpress.org', '867', 34),
       ('868', 'Ripley', 'Grevel', 'rgrevelo3@friendfeed.com', '868', 33),
       ('869', 'Denys', 'Monan', 'dmonano4@mac.com', '869', 32),
       ('870', 'Lewiss', 'Alpin', 'lalpino5@youtube.com', '870', 31),
       ('871', 'Georgeanna', 'Huttley', 'ghuttleyo6@ted.com', '871', 30),
       ('872', 'Karyl', 'Jeffrey', 'kjeffreyo7@rambler.ru', '872', 29),
       ('873', 'Selena', 'Rattenbury', 'srattenburyo8@nasa.gov', '873', 28),
       ('874', 'Martin', 'Dirkin', 'mdirkino9@examiner.com', '874', 27),
       ('875', 'Nonah', 'Abrahamian', 'nabrahamianoa@google.com.hk', '875', 26),
       ('876', 'Marven', 'Waby', 'mwabyob@cocolog-nifty.com', '876', 25),
       ('877', 'Salomo', 'Ordish', 'sordishoc@mozilla.com', '877', 24),
       ('878', 'Ashley', 'Seckom', 'aseckomod@drupal.org', '878', 23),
       ('879', 'Ross', 'Bardill', 'rbardilloe@bbc.co.uk', '879', 22),
       ('880', 'Lester', 'Jockle', 'ljockleof@prlog.org', '880', 21),
       ('881', 'Stephi', 'Sussams', 'ssussamsog@ebay.co.uk', '881', 20),
       ('882', 'Montgomery', 'Seawell', 'mseawelloh@edublogs.org', '882', 19),
       ('883', 'Adair', 'Yvon', 'ayvonoi@hostgator.com', '883', 18),
       ('884', 'Dulciana', 'Juste', 'djusteoj@wix.com', '884', 17),
       ('885', 'Shamus', 'Glendza', 'sglendzaok@myspace.com', '885', 16),
       ('886', 'Kiersten', 'Seeborne', 'kseeborneol@instagram.com', '886', 15),
       ('887', 'Bendite', 'Colebourne', 'bcolebourneom@people.com.cn', '887', 14),
       ('888', 'Lloyd', 'Le Sieur', 'llesieuron@alibaba.com', '888', 13),
       ('890', 'Calvin', 'Blint', 'cblintop@weather.com', '890', 11),
       ('891', 'Adria', 'Yeoman', 'ayeomanoq@yale.edu', '891', 10),
       ('892', 'Abby', 'Sporrij', 'asporrijor@timesonline.co.uk', '892', 9),
       ('893', 'Laurent', 'Lintot', 'llintotos@reddit.com', '893', 8),
       ('894', 'Mahmud', 'Stollwerck', 'mstollwerckot@accuweather.com', '894', 7),
       ('895', 'Allsun', 'Dimitriades', 'adimitriadesou@amazon.co.jp', '895', 6),
       ('896', 'Valeda', 'Norsister', 'vnorsisterov@netlog.com', '896', 5),
       ('897', 'Verla', 'Chifney', 'vchifneyow@usatoday.com', '897', 4),
       ('898', 'Adriana', 'Collishaw', 'acollishawox@github.io', '898', 3),
       ('899', 'Ethyl', 'Hanway', 'ehanwayoy@is.gd', '899', 2),
       ('900', 'Marie-ann', 'Glendenning', 'mglendenningoz@ed.gov', '900', 1),
       ('901', 'Padraig', 'Coatham', 'pcoathamp0@cornell.edu', '901', 0),
       ('902', 'Addy', 'Ballefant', 'aballefantp1@taobao.com', '902', -1),
       ('903', 'Arther', 'Bessom', 'abessomp2@freewebs.com', '903', -2),
       ('904', 'Cyrillus', 'Hasser', 'chasserp3@scientificamerican.com', '904', -3),
       ('905', 'Emmerich', 'Haysham', 'ehayshamp4@mapy.cz', '905', -4),
       ('906', 'Christoper', 'De Ortega', 'cdeortegap5@forbes.com', '906', -5),
       ('907', 'Kele', 'Cavet', 'kcavetp6@va.gov', '907', -6),
       ('908', 'Ellerey', 'Ablott', 'eablottp7@uiuc.edu', '908', -7),
       ('909', 'Tiphany', 'Jeaneau', 'tjeaneaup8@buzzfeed.com', '909', -8),
       ('910', 'Esme', 'Hellyar', 'ehellyarp9@addthis.com', '910', -9),
       ('911', 'Blisse', 'Redhouse', 'bredhousepa@answers.com', '911', -10),
       ('912', 'Codie', 'Upstone', 'cupstonepb@nymag.com', '912', -11),
       ('913', 'Rani', 'Southon', 'rsouthonpc@drupal.org', '913', -12),
       ('922', 'Stephanie', 'Hasker', 'shaskerpl@ycombinator.com', '922', -21),
       ('923', 'Antonina', 'Shedd', 'asheddpm@imageshack.us', '923', -22),
       ('924', 'Richmound', 'Pincott', 'rpincottpn@psu.edu', '924', -23),
       ('925', 'Alie', 'Ledster', 'aledsterpo@soup.io', '925', -24),
       ('926', 'Leisha', 'Keyworth', 'lkeyworthpp@elpais.com', '926', -25),
       ('927', 'Terri', 'Longbottom', 'tlongbottompq@engadget.com', '927', -26),
       ('928', 'Jacinta', 'Gantlett', 'jgantlettpr@weather.com', '928', -27),
       ('929', 'Carol-jean', 'Furmston', 'cfurmstonps@redcross.org', '929', -28),
       ('930', 'Barbaraanne', 'Honisch', 'bhonischpt@comcast.net', '930', -29),
       ('931', 'Andris', 'Blasiak', 'ablasiakpu@webeden.co.uk', '931', -30),
       ('932', 'Colleen', 'Tynnan', 'ctynnanpv@elpais.com', '932', -31),
       ('933', 'Saw', 'Glasscoe', 'sglasscoepw@unblog.fr', '933', -32),
       ('934', 'Harvey', 'Ghidini', 'hghidinipx@chron.com', '934', -33),
       ('935', 'Jakie', 'Sworder', 'jsworderpy@acquirethisname.com', '935', -34),
       ('936', 'Si', 'Vispo', 'svispopz@newsvine.com', '936', -35),
       ('968', 'Donnie', 'Arno', 'darnoqv@go.com', '968', -67),
       ('969', 'Shelia', 'Skillen', 'sskillenqw@wix.com', '969', -68),
       ('970', 'Dewitt', 'Allsup', 'dallsupqx@wix.com', '970', -69),
       ('971', 'Edee', 'Kraut', 'ekrautqy@myspace.com', '971', -70),
       ('972', 'Elianora', 'Videler', 'evidelerqz@cyberchimps.com', '972', -71),
       ('973', 'Gretna', 'Smylie', 'gsmylier0@independent.co.uk', '973', -72),
       ('974', 'Simone', 'Moses', 'smosesr1@bravesites.com', '974', -73),
       ('975', 'Gerome', 'Di Francesco', 'gdifrancescor2@arizona.edu', '975', -74),
       ('990', 'Ian', 'Laxon', 'ilaxonrh@examiner.com', '990', -89),
       ('991', 'Agnese', 'Kretschmer', 'akretschmerri@pen.io', '991', -90),
       ('992', 'Drud', 'Gimlet', 'dgimletrj@icio.us', '992', -91),
       ('998', 'Temple', 'Pawle', 'tpawlerp@mit.edu', '998', -97),
       ('999', 'Mack', 'Gaspero', 'mgasperorq@umn.edu', '999', -98);

/*Table structure for table `book_author` */

DROP TABLE IF EXISTS `book_author`;

CREATE TABLE `book_author`
(
    `author_id` int(10)      NOT NULL,
    `isbn`      varchar(200) NOT NULL,
    PRIMARY KEY (`author_id`, `isbn`),
    KEY `book_author_isbn_fk` (`isbn`),
    CONSTRAINT `author_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
    CONSTRAINT `book_author_isbn_fk` FOREIGN KEY (`isbn`) REFERENCES `book` (`ISBN`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `book_author` */

/*Table structure for table `borrower` */

DROP TABLE IF EXISTS `borrower`;

CREATE TABLE `borrower`
(
    `card_id` int(10)      NOT NULL AUTO_INCREMENT,
    `ssn`     varchar(20)  NOT NULL,
    `bname`   varchar(100) NOT NULL,
    `address` varchar(100) NOT NULL,
    `phone`   varchar(20)  NOT NULL,
    PRIMARY KEY (`card_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `borrower` */

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence`
(
    `next_val` bigint(20) DEFAULT NULL
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8;

/*Data for the table `hibernate_sequence` */

insert into `hibernate_sequence`(`next_val`)
values (1);

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details`
(
    `booking_id`   varchar(80) NOT NULL,
    `ISBN`         varchar(10) NOT NULL,
    `booking_date` date        NOT NULL,
    `quantity`     varchar(20) NOT NULL,
    PRIMARY KEY (`booking_id`, `ISBN`, `booking_date`, `quantity`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `order_details` */

insert into `order_details`(`booking_id`, `ISBN`, `booking_date`, `quantity`)
values ('ff80808162bf9a0d0162bf9c93490006', '662', '2018-04-13', '662'),
       ('ff80808162bf9a0d0162bf9dfc8a0008', '663', '2018-04-13', '663'),
       ('ff80808162bf9a0d0162bf9e029e0009', '664', '2018-04-13', '664');

CREATE TABLE `user`
(
    `id`       varchar(255) NOT NULL,
    `address`  varchar(255) DEFAULT NULL,
    `dob`      varchar(255) DEFAULT NULL,
    `name`     varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8mb3;


/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
