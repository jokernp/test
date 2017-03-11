# SQL Manager 2007 for MySQL 4.2.1.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : books


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `books`
    CHARACTER SET 'gbk'
    COLLATE 'gbk_chinese_ci';

USE `books`;

#
# Structure for the `books` table : 
#

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `type` varchar(20) default NULL,
  `name` varchar(40) default NULL,
  `author` varchar(40) default NULL,
  `press` varchar(30) default NULL,
  `price` int(11) default NULL,
  `time` varchar(20) default NULL,
  `number` int(11) default NULL,
  `remark` varchar(60) default NULL,
  `state` int(11) default NULL,
  `js` varchar(199) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Structure for the `borrow` table : 
#

CREATE TABLE `borrow` (
  `username` varchar(20) NOT NULL default '',
  `id` int(11) NOT NULL default '0',
  `time` varchar(20) default NULL,
  PRIMARY KEY  (`username`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Structure for the `users` table : 
#

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(16) default NULL,
  `name` varchar(20) default NULL,
  `tel` varchar(12) default NULL,
  `level` tinyint(4) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for the `books` table  (LIMIT 0,500)
#

INSERT INTO `books` (`id`, `type`, `name`, `author`, `press`, `price`, `time`, `number`, `remark`, `state`, `js`) VALUES 
  (1,'小说','谢谢你离开我','张小娴','起点',30,'2013.03.23',0,'由于本书为新书，借出后如果丢失，全价赔偿。',0,'好书，特别推荐。'),
  (2,'小说','三国演义','罗贯中','未知',56,'2013.02.13',27,'本书为珍藏版，请同学好好保管。',1,'中国四大名著之一。'),
  (3,'小说','海底两万里','凡尔纳','译林出版社',22,'2012.10.23',8,'中文版',1,'科幻巨作。'),
  (4,'小说','沉默的羔羊','托马斯-哈里斯','译林出版社',22,'2013.02.12',5,'中文版',1,'对人性的深刻思考。'),
  (5,'传记','乔布斯的秘密','立安德-康尼','地震出版社',32,'2013.02.12',3,'中文版',1,'苹果伟大CEO乔布斯成功的秘密。\r\n'),
  (6,'传记','你若安好，便是晴天','白落梅','中国华侨出版社',24,'2012.09.23',5,'你若安好，便是晴天。',1,'跟随白落梅，一起走进一个爱情世界。'),
  (7,'传记','肖邦传','贝尔纳-加沃蒂','上海人民出版社',35,'2013.02.12',1,'中文版',1,'伟大音乐家肖邦传记。'),
  (8,'计算机','Java2实用教程','耿祥义','清华大学出版社',40,'2012.10.01',3,'适合已经初步了解JAVA的人学习。',1,'详细介绍Java的实际应用。'),
  (9,'计算机','玩转Andoroid','一得','电子工业出版社',49,'2013.02.12',0,'详尽介绍Andoroid。',0,'作者为资深安卓开发人员，详尽的介绍了Andoroid的开发。'),
  (10,'传记','比尔盖茨商道全书','张祥斌','吉林大学出版社',27,'2013.01.23',0,'比尔盖茨成功之道。',0,'《比尔·盖茨商道全书(最新经典精华版)》将为您详细讲述比尔·盖茨如何从一个一名不文的文弱书生走向全球首富的成功之道。'),
  (11,'计算机','代码大全','史蒂夫','电子工业出版社',99,'2012.10.23',1,'本书比较稀少，请借书同学尽快阅读并归还。',1,'作者将这本经典著作全新演绎，融入了最前沿的实践技术，加入了上百个崭新的代码示例，充分展示了软件构建的艺术性和科学性。'),
  (12,'计算机','JSP使用教程','耿祥义','清华大学出版社',26,'2013.02.12',12,'JSP基本教程',1,'包含JSP基本知识，适合初学者。'),
  (13,'童话绘本','阿狸-永远站','Hans','吉林出版集团',36,'2013.03.26',1,'阿狸第二部',1,'阿狸系列，第二部。'),
  (14,'教学','离散数学','编写组','清华大学出版社',18,'2012.02.14',12,'离散数学',1,'大学离散数学推荐用书。'),
  (15,'小说','遮天','辰东','起点',66,'2013.02.13',1,'玄幻小说中的佳作',1,'起点“坑神”---辰东最新力作。'),
  (16,'小说','星辰变','我吃西红柿','起点',56,'2011.02.13',1,'玄幻小说',1,'我吃西红柿巅峰之作---星辰变'),
  (17,'教学','高等数学','清华编写组','清华大学出版社',25,'2012.02.13',11,'高等数学第一册',1,'大学高等数学教学用书'),
  (18,'教学','高等数学2','清华编写组','清华大学出版社',25,'2012.03.12',12,'高等数学第二册',1,'大学高等数学教学用书'),
  (19,'教学','新视野大学英语1','编写组','未知',32,'2013.02.12',16,'大学英语第一册',1,'大学英语教学推荐用书'),
  (20,'教学','新视野大学英语2','编写组','未知',23,'2013.02.13',11,'大学英语第二册',1,'大学英语教学推荐用书'),
  (21,'童话绘本','阿狸-梦之城堡','Hans','吉林出版集团',36,'2013.03.26',1,'阿狸系列第一部',1,'治愈系童话绘本第一部。'),
  (22,'计算机','Java','未知','未知',30,'2013.03.10',1,'java学习必备',1,'适合java初学者'),
  (444,'sdf','dsf','dfs','gdf',1,'2013.03.10',4,'dsf',1,'dsf');

COMMIT;

#
# Data for the `borrow` table  (LIMIT 0,500)
#

INSERT INTO `borrow` (`username`, `id`, `time`) VALUES 
  ('2424242242',16,'2013.03.09'),
  ('555',13,'2013.02.12'),
  ('aaa',6,'2012.05.12'),
  ('pis',5,'2013.02.14'),
  ('zhl',7,'2013.02.13');

COMMIT;

#
# Data for the `users` table  (LIMIT 0,500)
#

INSERT INTO `users` (`username`, `password`, `name`, `tel`, `level`) VALUES 
  ('111111','555555','不明白','2323',1),
  ('2424242242','456346','efge','55555',NULL),
  ('aaa','123','fa','133',1),
  ('aaaa','111111','无知','234',0),
  ('aaaaaa','111111','没\0','111111',0),
  ('bbb','111111','无名','123',1),
  ('jjj','111111','dsf','324',1),
  ('pis','123456','a','132',1),
  ('qqq','123456','啊','23',0),
  ('sdf','111111','电风扇','234',0),
  ('zhl','111111','天下','1232',1);

COMMIT;

