SET NAMES UTF8;
DROP DATABASE IF EXISTS yougou;
CREATE DATABASE yougou CHARSET=UTF8;
USE yougou;

/*************用户表************/
DROP TABLE IF EXISTS  yg_user;
CREATE TABLE yg_user(
  uid int(11) PRIMARY KEY auto_increment,
  uname varchar(32) default NULL,
  upwd varchar(32) default NULL,
  email varchar(64) default NULL,
  phone varchar(16) default NULL,
  avatar varchar(128) default NULL,
  user_name varchar(32) default NULL,
  gender int(11) default NULL,
  integral varchar(32),
  grade varchar(32)
);

INSERT INTO yg_user VALUES('1', '18435176394', '123456', 'root@qq.com', '13511011000', 'image/avatar/default.png', '阿南', '0','102','普通会员');
INSERT INTO yg_user VALUES('2', '15633656422', '123456', 'tom@qq.com', '13501234568', 'image/avatar/default.png', '阿冬', '1','204','普通会员');
INSERT INTO yg_user VALUES('3', '18435176393', '123456', 'ryj@qq.com', '18435176394', 'image/avatar/default.png', '阿秋', '1','303','普通会员');

/***************轮播广告表***************/
CREATE TABLE yg_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,	
  img VARCHAR(128),           #图片路径
  title VARCHAR(64),          #图片描述
  href VARCHAR(128)           #图片链接
);

INSERT INTO yg_carousel VALUES(null,'image/index/banner1.jpg','轮播广告商品1','#');
INSERT INTO yg_carousel VALUES(null,'image/index/banner2.jpg','轮播广告商品2','#');
INSERT INTO yg_carousel VALUES(null,'image/index/banner3.jpg','轮播广告商品3','#');
INSERT INTO yg_carousel VALUES(null,'image/index/banner4.jpg','轮播广告商品4','#');
INSERT INTO yg_carousel VALUES(null,'image/index/banner5.jpg','轮播广告商品5','#');
INSERT INTO yg_carousel VALUES(null,'image/index/banner6.jpg','轮播广告商品6','#');

/****************产品模块******************/

#商品分类
CREATE TABLE yg_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

INSERT INTO yg_product_family VALUES(null,'男鞋');
INSERT INTO yg_product_family VALUES(null,'女鞋');
INSERT INTO yg_product_family VALUES(null,'运动');
INSERT INTO yg_product_family VALUES(null,'户外');
INSERT INTO yg_product_family VALUES(null,'童装');
INSERT INTO yg_product_family VALUES(null,'箱包');
INSERT INTO yg_product_family VALUES(10,'新品');

#商品详情
CREATE TABLE yg_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,
  pname VARCHAR(128),         #商品名称
  class VARCHAR(64),          #商品分类
  title VARCHAR(128),         #所属品牌
  price DECIMAL(10,2),        #现价
  cost_price DECIMAL(10,2),   #原价
  spec VARCHAR(32),           #规格
  color VARCHAR(64),          #颜色
  is_onsale BOOLEAN,          #是否促销中
  pic VARCHAR(128),           #列表图片
  FOREIGN KEY(fid) REFERENCES yg_product_family(fid)
);

INSERT INTO yg_product VALUES
(1,'10','adidas阿迪达斯2018男子FAB POLO衫CV8321','POLO衫','阿迪达斯','119','199','M','白色','1','image/pics/adidas/md/100912842_01_m.jpg'),
(2,'10','adidas阿迪达斯2018男子DAM GK UP圆领短T恤CV9969','T恤','阿迪达斯','349','699','XXL','黑色','1','image/pics/adidas/md/100914811_01_m.jpg'),
(3,'10','adidas阿迪达斯2018新款男子运动系列T恤CD4863','T恤','阿迪达斯','356','589','XXL','白色','1','image/pics/adidas/md/100523041_01_m.jpg'),
(4,'10','adidas阿迪达斯2018新款男子运动系列针织长裤B47218','长裤','阿迪达斯','349','669','XXL','黑色','1','image/pics/adidas/md/100527126_01_m.jpg'),
(5,'10','adidas阿迪达斯2018年新款男子ESSENTIALS系列短袖T桖B47356','T桖','阿迪达斯','269','579','XXL','白色','1','image/pics/adidas/md/100536494_01_m.jpg'),

(null,'3','NIKE耐克2018男子AS M NK DRY PANT TEAM WOVEN长裤','长裤','耐克','119','199','M','白色','1','image/pics/nike/md/100532442_01_mb.jpg'),
(null,'3','NIKE耐克2018年新款男子AS M NK FC TEE SWSH FLAGT恤','T恤','耐克','119','199','L','白色','1','image/pics/nike/md/100916754_01_mb.jpg'),
(null,'3','Nike耐克2018年新款男子AS M NSW COUNTRY TEE-CNT恤','T恤','耐克','119','199','XL','白色','1','image/pics/nike/md/100972418_01_mb.jpg'),
(null,'3','NIKE耐克2018年新款男子AS RISE GRAPHIC SHORT短裤','短裤','耐克','179','249','M','黑色','0','image/pics/nike/md/100699992_01_mb.jpg'),
(null,'3','NIKE耐克2018年新款男子AS M NSW TEE JDI SWOOSH NEWT恤','T恤','耐克','179','249','L','黑色','0','image/pics/nike/md/100111636_01_mb.jpg'),

(null,'3','PUMA彪马 2018新款男子基础系列短裤59309401','短裤','彪马','179','249','XL','黑色','0','image/pics/puma/md/100545661_01_mb.jpg'),
(null,'3','PUMA彪马 2018新款男子基础系列T恤85118901','POLO衫','彪马','129','169','M','白色','0','image/pics/puma/md/100968375_01_mb.jpg'),
(null,'3','PUMA彪马 2018新款女子SL9长裤85305901','长裤','彪马','129','169','X','白色','0','image/pics/puma/md/100968260_01_mb.jpg'),
(null,'3','PUMA彪马 2018新款男子基础系列T恤85316906','T恤','彪马','129','169','X','白色','0','image/pics/puma/md/100968353_01_mb.jpg'),
(null,'3','PUMA彪马 2018新款男子基础系列T恤85318001','T恤','彪马','349','699','XL','黑色','0','image/pics/puma/md/100967994_01_mb.jpg'),

(null,'3','CONVERSE/匡威 2018新款男子T恤10007844-A04','T恤','匡威','349','699','XXL','黑色','0','image/pics/converse/md/100884776_01_mb.jpg'),
(null,'3','CONVERSE/匡威 2018新款男子T恤10008088-A02','T恤','匡威','519','869','L','白色','0','image/pics/converse/md/100969511_01_mb.jpg'),
(null,'3','CONVERSE/匡威 2018新款男子T恤10007861-A01','T恤','匡威','519','869','XL','白色','0','image/pics/converse/md/100969546_01_mb.jpg'),
(null,'3','CONVERSE/匡威 2018新款男子Knitwear短裤10007533-A01','短裤','匡威','519','869','XXL','白色','0','image/pics/converse/md/100969566_01_mb.jpg'),
(null,'3','CONVERSE/匡威 2018新款男子CONST恤10008082-A02','T恤','匡威','349','699','XXL','黑色','0','image/pics/converse/md/100969527_01_mb.jpg'),

(null,'3','2018年延续款MEXICO 66 SLIP-ON系列中性休闲鞋','休闲鞋','鬼冢虎','534','999','XXL','黑色','0','image/pics/onitsukatiger/md/99953573_01_mb.jpg'),
(null,'3','新品延续款MEXICO 66系列中性休闲鞋THL7C2-9401','休闲鞋','鬼冢虎','559','899','XL','白色','0','image/pics/onitsukatiger/md/100043797_01_mb.jpg'),
(null,'3','2018新款中性TIGER CORSAIR休闲鞋D7J4L-0196','休闲鞋','鬼冢虎','435','435','M','白色','0','image/pics/onitsukatiger/md/100918531_01_mb.jpg'),
(null,'3','2018新款中性LOGO短袖T恤OKT130-9001','T恤','鬼冢虎','435','435','L','白色','0','image/pics/onitsukatiger/md/100870166_01_mb.jpg'),
(null,'3','2018新款延续款中性SERRANO系列运动休闲鞋D109L-0142','休闲鞋','鬼冢虎','435','435','XL','白色','0','image/pics/onitsukatiger/md/100434760_01_mb.jpg'),

(null,'3','阿迪三叶草2018男子TREFOIL T-SHIRT圆领短T恤CW0710','T恤','三叶草','349','699','XXL','白色','0','image/pics/adidasoriginals/md/100915295_01_mb.jpg'),
(null,'3','阿迪三叶草2018男子BB BENNY TEE短袖T恤CF3101','T恤','三叶草','349','699','XXL','黑色','0','image/pics/adidasoriginals/md/100968957_01_mb.jpg'),
(null,'3','阿迪三叶草2018男子OVERSIZED TEE短袖T恤CW1211','T恤','三叶草','349','699','XXL','黑色','0','image/pics/adidasoriginals/md/100973744_01_mb.jpg'),
(null,'3','阿迪三叶草2018男子3-STRIPES SHORT短裤CW2980','短裤','三叶草','139','199','M','白色','1','image/pics/adidasoriginals/md/100979192_01_mb.jpg'),
(null,'3','阿迪三叶草2018男子SHORTS短裤CZ1756','短裤','三叶草','139','199','L','白色','1','image/pics/adidasoriginals/md/100982134_01_mb.jpg'),

(null,'2','2018夏专柜新款玫红针织毛线布女拖鞋BQF32BT8','拖鞋','百丽','139','199','XL','白色','1','image/pics/Belle/md/100508708_01_mb.jpg'),
(null,'2','2018夏季新款白/黑人造革细高跟露趾一字式扣带女凉鞋BVI37BL8','凉鞋','百丽','149','199','M','白色','1','image/pics/Belle/md/100546839_01_mb.jpg'),
(null,'2','2018夏专柜同款白/深兰绒布女凉鞋BNL34BL7','凉鞋','百丽','149','199','L','白色','1','image/pics/Belle/md/100979837_01_mb.jpg'),
(null,'2','2018夏季专柜新款羊绒皮革一字带粗跟印花女凉鞋BPFE8BL8','凉鞋','百丽','149','199','XL','白色','1','image/pics/Belle/md/100979925_01_mb.jpg'),
(null,'2','2018夏季专柜同款黑色羊绒皮革女皮凉鞋BLA30BL7','凉鞋','百丽','175','279','L','黑色','0','image/pics/Belle/md/100982215_01_mb.jpg'),

(null,'2','2018夏专柜同款布面时尚优雅高跟女凉鞋9VN24BL8','凉鞋','思加图','349','699','XXL','黑色','0','image/pics/staccato/md/100514658_01_mb.jpg'),
(null,'2','2018年夏季专柜同款黑色羊绒皮革铆钉装饰女皮凉鞋9O914BL8','凉鞋','思加图','239','409','XXL','黑色','0','image/pics/staccato/md/100698387_01_mb.jpg'),
(null,'2','2018夏专柜同款羊绒镶钻低跟女凉鞋JI11DBL8','凉鞋','思加图','185','299','S','黑色','0','image/pics/staccato/md/100698406_01_mb.jpg'),
(null,'2','2018夏季专柜同款白色女皮凉鞋K2101BL7','凉鞋','思加图','185','299','M','黑色','0','image/pics/staccato/md/100698483_01_mb.jpg'),
(null,'2','2018年春季专柜同款黑色羊绒皮简约女凉鞋9YD07AK8','凉鞋','思加图','185','299','L','黑色','0','image/pics/staccato/md/100921275_01_mb.jpg'),

(null,'2','夏专柜同款杏色羊绒皮时尚优雅粗跟女凉鞋AO821BL7','凉鞋','天美意','185','299','XL','黑色','0','image/pics/teenmix/md/100506500_01_mb.jpg'),
(null,'2','夏专柜同款米色山羊皮罗马风多条带粗高跟女凉鞋6X903BL7','凉鞋','天美意','185','299','XL','黑色','0','image/pics/teenmix/md/100506503_01_mb.jpg'),
(null,'2','天美意夏专柜同款黑色猪皮时尚闪钻女凉鞋6Z916BL7','凉鞋','天美意','259','399','L','黑色','0','image/pics/teenmix/md/100514757_01_mb.jpg'),
(null,'2','2018春专柜同款灰色羊绒皮尖头粗高跟女凉鞋AR411AK8','凉鞋','天美意','259','399','XL','黑色','0','image/pics/teenmix/md/100787609_01_mb.jpg'),
(null,'2','2018夏专柜同款黑色时尚字母厚底休闲风女凉鞋AR281BL8','凉鞋','天美意','259','399','XL','黑色','0','image/pics/teenmix/md/100911828_01_mb.jpg'),

(null,'2','2018夏专柜同款灰色羊皮绒面珍珠金属一字带女皮凉鞋S2018BL8','凉鞋','他她','259','399','XL','黑色','0','image/pics/tata/md/100509226_01_mb.jpg'),
(null,'2','2018夏杏色羊皮绒面通勤一字带粗跟女皮凉鞋S2A05BL8','凉鞋','他她','259','399','XL','黑色','0','image/pics/tata/md/100885002_01_mb.jpg'),
(null,'2','2018夏专柜同款浅杏/金牛皮拼接布休闲坡跟女凉鞋2NTC1BL7','凉鞋','他她','259','399','XL','黑色','0','image/pics/tata/md/100885004_01_mb.jpg'),
(null,'2','2018夏专柜同款米色羊皮珍珠水钻一字带粗跟女皮凉鞋2USB9BL8','凉鞋','他她','259','399','XL','黑色','0','image/pics/tata/md/100910427_01_mb.jpg'),
(null,'2','2018夏黑色羊皮绒面通勤一字带粗跟女皮凉鞋S2A05BL8','凉鞋','他她','259','399','XL','黑色','0','image/pics/tata/md/100910690_01_mb.jpg'),

(null,'2','2018夏新专柜同款灰色珍珠粗高跟OL通勤优雅秀气女凉鞋5-107BL8','凉鞋','拔佳','259','399','XL','黑色','0','image/pics/bata/md/100910477_01_mb.jpg'),
(null,'2','2018夏新专柜同款米色淑女编织包头高跟中空玛丽珍女凉鞋AD315BK8','凉鞋','拔佳','259','399','XL','黑色','0','image/pics/bata/md/100910520_01_mb.jpg'),
(null,'2','2018夏新专柜同款灰色坡跟羊绒皮革女凉鞋636-6BL8','凉鞋','拔佳','259','399','XL','黑色','0','image/pics/bata/md/100916069_01_mb.jpg'),
(null,'2','2018夏新专柜同款米白色时尚粗高跟OL通勤胎牛皮革女凉拖鞋','凉鞋','拔佳','159','399','XL','黑色','0','image/pics/bata/md/100916092_01_mb.jpg'),
(null,'2','2018夏新专柜同款杏色牛皮革时尚拼色粗高跟女凉鞋40-20BL8','凉鞋','拔佳','249','399','XL','黑色','0','image/pics/bata/md/100918396_01_mb.jpg'),

(null,'2','2018夏季专柜同款黑色人造革/羊皮编织镂空条带坡跟纯色舒适女凉鞋HKX05BL','凉鞋','暇步士','229','399','XL','黑色','0','image/pics/HPuppies/md/100500327_01_mb.jpg'),
(null,'2','暇步士2018夏季专柜同款白色牛皮革女凉鞋HIV10BL7','凉鞋','暇步士','249','399','XL','黑色','0','image/pics/HPuppies/md/100500331_01_mb.jpg'),
(null,'2','暇步士2018专柜同款夏季白色羊皮革平跟女凉鞋HLT01BL7','凉鞋','暇步士','159','399','XL','黑色','0','image/pics/HPuppies/md/100500367_01_mb.jpg'),
(null,'2','暇步士2018夏季专柜同款铆钉T型潮酷松糕跟女凉鞋Z1G01BL7','凉鞋','暇步士','269','399','XL','黑色','0','image/pics/HPuppies/md/100500375_01_mb.jpg'),
(null,'2','暇步士2018夏季专柜同款银色羊皮平跟时尚舒适女凉鞋HLC05BL7','凉鞋','暇步士','259','399','XL','黑色','0','image/pics/HPuppies/md/100500379_01_mb.jpg');

#商品图片
CREATE TABLE yg_product_pic (
  p_pid int(16)  PRIMARY KEY ,
  pid int(16),
  sm varchar(128),
  md varchar(128),
  lg varchar(128)
);

#添加商品图片
INSERT INTO yg_product_pic VALUES
('0', '1', 'image/pics/adidas/sm/100912842_01_t.jpg', 'image/pics/adidas/md/100912842_01_m.jpg', 'image/pics/adidas/lg/100912842_01_l.jpg'),
('1', '1', 'image/pics/adidas/sm/100912842_02_t.jpg', 'image/pics/adidas/md/100912842_02_m.jpg', 'image/pics/adidas/lg/100912842_11_b.jpg'),
('2', '1', 'image/pics/adidas/sm/100912842_03_t.jpg', 'image/pics/adidas/md/100912842_03_m.jpg', 'image/pics/adidas/lg/100912842_12_b.jpg'),
('3', '1', 'image/pics/adidas/sm/100912842_04_t.jpg', 'image/pics/adidas/md/100912842_04_m.jpg', 'image/pics/adidas/lg/100912842_13_b.jpg'),
('4', '1', 'image/pics/adidas/sm/100912842_05_t.jpg', 'image/pics/adidas/md/100912842_05_m.jpg', 'image/pics/adidas/lg/100912842_14_b.jpg'),
('5', '1', 'image/pics/adidas/sm/100912842_06_t.jpg', 'image/pics/adidas/md/100912842_06_m.jpg', 'image/pics/adidas/lg/100912842_15_b.jpg'),
('6', '1', 'image/pics/adidas/sm/100912842_07_t.jpg', 'image/pics/adidas/md/100912842_07_m.jpg', 'image/pics/adidas/lg/100912842_16_b.jpg'),

('7', '3', 'image/pics/adidas/sm/100523041_01_t.jpg', 'image/pics/adidas/md/100523041_01_m.jpg', 'image/pics/adidas/lg/100523041_01_l.jpg'),
('8', '3', 'image/pics/adidas/sm/100523041_02_t.jpg', 'image/pics/adidas/md/100523041_02_m.jpg', 'image/pics/adidas/lg/100523041_02_l.jpg'),
('9', '3', 'image/pics/adidas/sm/100523041_03_t.jpg', 'image/pics/adidas/md/100523041_03_m.jpg', 'image/pics/adidas/lg/100523041_03_l.jpg'),
('10', '3', 'image/pics/adidas/sm/100523041_04_t.jpg', 'image/pics/adidas/md/100523041_04_m.jpg', 'image/pics/adidas/lg/100523041_04_l.jpg'),
('11', '3', 'image/pics/adidas/sm/100523041_05_t.jpg', 'image/pics/adidas/md/100523041_05_m.jpg', 'image/pics/adidas/lg/100523041_05_l.jpg'),
('12', '3', 'image/pics/adidas/sm/100523041_06_t.jpg', 'image/pics/adidas/md/100523041_06_m.jpg', 'image/pics/adidas/lg/100523041_06_l.jpg'),
('13', '3', 'image/pics/adidas/sm/100523041_07_t.jpg', 'image/pics/adidas/md/100523041_07_m.jpg', 'image/pics/adidas/lg/100523041_07_l.jpg'),

('14', '2', 'image/pics/adidas/sm/100914811_01_t.jpg', 'image/pics/adidas/md/100914811_01_m.jpg', 'image/pics/adidas/lg/100914811_01_l.jpg'),
('15', '2', 'image/pics/adidas/sm/100914811_02_t.jpg', 'image/pics/adidas/md/100914811_02_m.jpg', 'image/pics/adidas/lg/100914811_02_l.jpg'),
('16', '2', 'image/pics/adidas/sm/100914811_03_t.jpg', 'image/pics/adidas/md/100914811_03_m.jpg', 'image/pics/adidas/lg/100914811_03_l.jpg'),
('17', '2', 'image/pics/adidas/sm/100914811_04_t.jpg', 'image/pics/adidas/md/100914811_04_m.jpg', 'image/pics/adidas/lg/100914811_04_l.jpg'),
('18', '2', 'image/pics/adidas/sm/100914811_05_t.jpg', 'image/pics/adidas/md/100914811_05_m.jpg', 'image/pics/adidas/lg/100914811_05_l.jpg'),
('19', '2', 'image/pics/adidas/sm/100914811_06_t.jpg', 'image/pics/adidas/md/100914811_06_m.jpg', 'image/pics/adidas/lg/100914811_06_l.jpg'),
('20', '2', 'image/pics/adidas/sm/100914811_07_t.jpg', 'image/pics/adidas/md/100914811_07_m.jpg', 'image/pics/adidas/lg/100914811_07_l.jpg'),

('21', '5', 'image/pics/adidas/sm/100536494_01_t.jpg', 'image/pics/adidas/md/100536494_01_m.jpg', 'image/pics/adidas/lg/100536494_01_l.jpg'),
('22', '5', 'image/pics/adidas/sm/100536494_02_t.jpg', 'image/pics/adidas/md/100536494_02_m.jpg', 'image/pics/adidas/lg/100536494_02_l.jpg'),
('23', '5', 'image/pics/adidas/sm/100536494_03_t.jpg', 'image/pics/adidas/md/100536494_03_m.jpg', 'image/pics/adidas/lg/100536494_03_l.jpg'),
('24', '5', 'image/pics/adidas/sm/100536494_04_t.jpg', 'image/pics/adidas/md/100536494_04_m.jpg', 'image/pics/adidas/lg/100536494_04_l.jpg'),
('25', '5', 'image/pics/adidas/sm/100536494_05_t.jpg', 'image/pics/adidas/md/100536494_05_m.jpg', 'image/pics/adidas/lg/100536494_05_l.jpg'),
('26', '5', 'image/pics/adidas/sm/100536494_06_t.jpg', 'image/pics/adidas/md/100536494_06_m.jpg', 'image/pics/adidas/lg/100536494_06_l.jpg'),
('27', '5', 'image/pics/adidas/sm/100536494_07_t.jpg', 'image/pics/adidas/md/100536494_07_m.jpg', 'image/pics/adidas/lg/100536494_07_l.jpg'),

('28', '4', 'image/pics/adidas/sm/100527126_01_t.jpg', 'image/pics/adidas/md/100527126_01_m.jpg', 'image/pics/adidas/lg/100527126_01_l.jpg'),
('29', '4', 'image/pics/adidas/sm/100527126_02_t.jpg', 'image/pics/adidas/md/100527126_02_m.jpg', 'image/pics/adidas/lg/100527126_02_l.jpg'),
('30', '4', 'image/pics/adidas/sm/100527126_03_t.jpg', 'image/pics/adidas/md/100527126_03_m.jpg', 'image/pics/adidas/lg/100527126_03_l.jpg'),
('31', '4', 'image/pics/adidas/sm/100527126_04_t.jpg', 'image/pics/adidas/md/100527126_04_m.jpg', 'image/pics/adidas/lg/100527126_04_l.jpg'),
('32', '4', 'image/pics/adidas/sm/100527126_05_t.jpg', 'image/pics/adidas/md/100527126_05_m.jpg', 'image/pics/adidas/lg/100527126_05_l.jpg'),
('33', '4', 'image/pics/adidas/sm/100527126_06_t.jpg', 'image/pics/adidas/md/100527126_06_m.jpg', 'image/pics/adidas/lg/100527126_06_l.jpg'),
('34', '4', 'image/pics/adidas/sm/100527126_07_t.jpg', 'image/pics/adidas/md/100527126_07_m.jpg', 'image/pics/adidas/lg/100527126_07_l.jpg');

#购物车条目
CREATE TABLE yg_cart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,           #用户编号
  pid INT,           #商品编号
  count INT,         #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);


#用户订单
CREATE TABLE yg_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
);



















