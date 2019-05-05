SET NAMES UTF8;
DROP DATABASE IF EXISTS lg;
CREATE DATABASE lg CHARSET=UTF8;
USE lg;


/**商品规格**/
CREATE TABLE lg_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**商品**/
CREATE TABLE lg_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #商品编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  p_price DECIMAL(10,2),        #原价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色
  brand VARCHAR(64),          #品牌

  category VARCHAR(32),       #所属分类
  details VARCHAR(1024),      #产品详细说明
  img VARCHAR(MAX),           #产品图片

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**商品图片**/
CREATE TABLE lg_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE lg_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE lg_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE lg_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE lg_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE lg_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE lg_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  images VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE lg_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**品牌**/
INSERT INTO lg_laptop_family VALUES
(NULL,'阿玛尼'),
(NULL,'迪奥'),
(NULL,'KIKO'),
(NULL,'海澜之家'),
(NULL,'兰蔻'),
(NULL,'无印良品'),
(NULL,'花花公子'),
(NULL,'爱马仕'),
(NULL,'makeupforever'),
(NULL,'丝芙兰');

/**商品**/
/*
#自动编号
#商品编号
#主标题
#副标题
#价格
#服务承诺
#规格/颜色
#商品名称
#所属分类
#产品详细说明*/
INSERT INTO lg_laptop VALUES
(NULL,1,'来自世界纯净奶源地','Aptamil新西兰爱他美 金装爱他美婴儿配方奶粉 3段 900克 6罐装 1-2岁适用',810,560,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'900克 6罐装','Aptamil新西兰爱他美','婴儿用品','<images alt="" class="" src="images/m-title/xnf.jpg">','2019-04-21',1434,true),

(NULL,2,'Apple 苹果 MacBook Air 13.3英寸 2017款 128G(i5/8GB/MQD32CH/A)','提升办公品质 紧跟时尚步伐 可开个人及公司发票 【下方服务可选购69元延保服务一年】',
6488.00,6928.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'13.3英寸 2017款 128G(i5/8GB/MQD32CH/A)','Apple 苹果','电子产品','<images alt="" class="" src="images/m-title/dn.jpg">','2019-04-21',1532,true),

(NULL,3,'Apple 苹果 iPhone8 Plus (A1864) 64GB 移动联通电信4G手机 国内行货','【国行正品可开票】这就是iPhone8 Plus，美在智慧！经典双面全玻璃面板回归，支持无线充电（*无线充电器需单独购买）！【下方服务可选购169元的延保服务一年】',
4688.00,5699.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'13.3英寸 2017款 128G(i5/8GB/MQD32CH/A)','Apple 苹果','电子产品','<images alt="" class="" src="images/m-title/iphone.jpg">','2019-04-21',1532,true),

(NULL,4,'skinature 思肤秀 24K黄金金箔胜肽高浓缩精华液 100毫升','24K纯黄金与胜肽精华的创新结合！可以将营养成分均匀的传到皮肤表层，提高皮肤的吸收效率，涂抹后，轻轻按摩就会瞬间吸收。大容量100毫升！适合各种肤质，收缩毛孔，淡斑，紧致，强推！不贵哦~',
198.00,299.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'100毫升','skinature 思肤秀','护肤','<images alt="" class="" src="images/m-title/sk.jpg">','2019-04-21',1532,true),

(NULL,5,'【99元2盒】【税费补贴】JMsolution肌司研水光蜂蜜面膜、珍珠面膜三部曲、水光针剂急救补水面膜10片/盒',
'（保价7天，如有差价请联系客服退差价，发货以选择规格为准，不支持备注下单）采用了蜂胶为主要成分，同时还配合透明质酸、三种多肽等成分，可以解决仙女们肌肤干燥、粗糙、暗沉和松弛等四重问题，有效恢复肌肤的',
69.00,168.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'10片/盒','JMsolution肌司研','面膜','<images alt="" class="" src="images/m-title/jm.jpg">','2019-04-21',4324,true),

(NULL,6,'【网易自营 品牌授权 两盒装】妆蕾 RAY 蚕丝面膜 金色10片+银色10片 共20片.net防伪查验','一不小心发现的一款超好用的面膜——妆蕾 RAY 面膜！可以看到好多人推荐哦！这款泰国的Ray面膜首先是价格便宜到不行，相比韩国那些面膜性价比更高，而且非常好用，揭下面膜后者的一点都不粘~只有水润~',
115.00,308.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'金色10片+银色10片 共20片','妆蕾RAY','面膜','<images alt="" class="" src="images/m-title/ray.jpg">','2019-04-21',4324,true),

(NULL,7,'2支装 Freeplus 芙丽芳丝 净润洗面霜 100克 人见人爱','平价氨基酸洁面的杰出代表！人见人爱，超高评价的洁面产品！温和洁面，洗后不干燥，当你不知道买什么洁面的时候，就选它吧',
218.00,318.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','2支装 100克','Freeplus 芙丽芳丝','面膜','<images alt="" class="" src="images/m-title/fr.jpg">','2019-04-21',4324,true),

(NULL,8,'【领券满199减20】herbacin 贺本清 小甘菊经典手霜 75毫升/支 2支装','【新老包装随机发货】德国百年经典护手霜，贺本清 小甘菊经典手霜，拯救你干枯粗糙的双手，小甘菊精华高端不贵，你不爱它，手会爱它~',
35.00,55.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','75毫升/支 2支装','herbacin 贺本清','护手霜','<images alt="" class="" src="images/m-title/hb.jpg">','2019-04-21',4324,true),

(NULL,9,'LΛNEIGE 兰芝 雪纱丝柔防晒新款隔离霜 30毫升','兰芝雪纱丝柔隔离，轻薄不闷痘，轻松隔绝外界污染物，SPF25防晒值，满足日常防晒需要。三个色号方便不同底妆需求，紫隔可修饰暗黄，提亮肤色；绿隔可修饰泛红痘印，改善肤色；蓝隔可矫正肤色，展现清透裸感美肌。',
149.00,158.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','30毫升','LΛNEIGE 兰芝','隔离霜','<images alt="" class="" src="images/m-title/lg.jpg">','2019-04-21',4324,true),

(NULL,10,'AGE20`s 爱纪二十之 爱敬 精华遮瑕粉底 正装12.5克+替换装12.5克','高保精华气垫，补水和遮瑕的有效结合，能使气垫粉饼的妆感更加自然清透，塑造无暇美肌，流动水精华混合遮瑕，使脸部不卡纹不拔干，带来水嫩光泽的明亮肌理。',
178.00,300.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','正装12.5克+替换装12.5克','AGE20`s 爱纪二十','粉底','<images alt="" class="" src="images/m-title/aj.jpg">','2019-04-21',4324,true),

(NULL,11,'【干皮亲妈法国大宝】Embryolisse 保湿妆前隔离霜','平价干皮真爱妆前乳！法国超模都爱用哟。添加多重保湿滋养精华成分，妆前乳、保湿霜、睡眠面膜三位一体，轻松搞定肌肤干燥、不抓粉、起皮状况，为粉底加持水润buff，给你细嫩水漾美肌。',
79.00,89.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','75克','Embryolisse','隔离霜','<images alt="" class="" src="images/m-title/em.jpg">','2019-04-21',4324,true),

(NULL,12,'【张柏芝同款】BIODERMA 贝德玛 舒妍温和保湿卸妆水 500毫升 粉水 中干皮肤','全球热门的天然成分卸妆水，天然成份，粉水适合中、干、敏感皮使用，不管是多厚重的妆容都能轻松一擦就干净，卸妆、焕肤、补水，一步到位！',
169.00 ,182.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'500毫升','BIODERMA 贝德玛','卸妆水','<images alt="" class="" src="images/m-title/bem.jpg">','2019-04-21',4324,true),

(NULL,13,'【2件装】SHISEIDO 资生堂 UNO 男士洗面奶 黑炭控油型 130克','黑炭清洁黑科技，一扫肌肤黑势力，控油保湿两不误！遇水后会产生细胍又丰富的泡沫,能够深入毛孔，有效告别附着在毛孔內的污垢，还原洁净美肌，甘油等成分具有吸水作用，恢复肌肤的张力令肌肤时刻水润~',
35.00,110.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','130克','SHISEIDO 资生堂 UNO','男士洗面奶','<images alt="" class="" src="images/m-title/uno.jpg">','2019-04-21',4324,true),

(NULL,14,'Aveeno 艾维诺 婴儿天然燕麦无香料保湿润肤霜 227克','【品牌直采】Aveeno 艾惟诺 婴儿天然燕麦滋润保湿润肤乳，天然燕麦胶质，不含香精，敏感肌也适用的保湿乳，温和呵护宝宝的娇嫩肌肤。全家人也同样适用~',
130.00,218.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','227克*2','Aveeno 艾维诺','润肤霜','<images alt="" class="" src="images/m-title/ave.jpg">','2019-04-21',4324,true),

(NULL,15,'LG ON THE BODY樱花滋润+甜蜜爱恋香水 500毫升/瓶 沐浴露组合','【新老包装交替，随机发货】“国民妹妹”秀智推荐款！传承韩国古方配方，打造Q弹、水灵、细滑、白嫩的肌肤。独特香氛，让肌肤享受SPA级的天然呵护。原来肌肤可以如此嫩白诱人~！',
55.00,64.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','500毫升/瓶','LG ON THE BODY','沐浴露组合','<images alt="" class="" src="images/m-title/lgo.jpg">','2019-04-21',4324,true),

(NULL,16,'Ryo 吕 红吕染烫修复损伤洗发水+护发素 500毫升/瓶 2瓶装','【新春特别版，与页面包装略有不同，请以收到实物为准】韩国国民热捧洗发水，明星都在用，代购海淘一度断货的吕来啦，洗护套装让修复功能加倍。',
68.00,75.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','500毫升/瓶','Ryo 吕','洗发护发','<images alt="" class="" src="images/m-title/ryo.jpg">','2019-04-21',4324,true),

(NULL,17,'考拉工厂店 简约北欧风长绒棉四件套','选用新疆长绒棉（又称海岛棉），纤维柔长，触感柔软，弹性良好，富有光泽及对染料的高亲和力，所织布料色彩亮丽鲜明。',
298.00,318.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','四件套','工厂店','被套被单','<images alt="" class="" src="images/m-title/cr.jpg">','2019-04-21',4324,true),

(NULL,18,'unicharm 尤妮佳 Silcot省1/2化妆水化妆棉 40枚 四盒装','很贵很贵的化妆水，怎么能都被化妆棉吃了？湿敷省水必备，小仙女化妆台标配，轻轻撕开，一张变两片，柔软轻盈如羽毛。用两张就可以贴满全脸，为妹子省下超过一半的化妆水，全脸湿敷也不心疼money了！',
58.00,78.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','40枚 四盒装','unicharm 尤妮佳','化妆棉','<images alt="" class="" src="images/m-title/uni.jpg">','2019-04-21',4324,true),

(NULL,19,'乐购工厂店 真空超轻弹跳盖保温杯500毫升','采用食品医用级316不锈钢、塑胶、硅胶材质，环保安全，弹跳盖式设计，轻松便捷，简约纯色外观，时尚大气（PS：新老包装随机发货）。',
99.00,109.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','500毫升','乐购工厂店','保温杯','<images alt="" class="" src="images/m-title/bw.jpg">','2019-04-21',4324,true),

(NULL,20,'【国行保修】dyson 戴森 Supersonic 电吹风机HD01紫红色','集中气流设计让吹发更快；内置温度计防烫很温柔；马达转速非凡所以更安静；颜值简直逆天！别说你还不想带它回家哦～ ',
2950.00 ,2999.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','HD01紫红色','dyson 戴森','家用电器','<images alt="" class="" src="images/m-title/dy.jpg">','2019-04-21',4324,true),

(NULL,21,'【国行保修】dyson 戴森 Supersonic 电吹风机HD01紫红色','集中气流设计让吹发更快；内置温度计防烫很温柔；马达转速非凡所以更安静；颜值简直逆天！别说你还不想带它回家哦～ ',
2950.00 ,2999.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','HD01紫红色','dyson 戴森','家用电器','<images alt="" class="" src="images/m-title/dy.jpg">','2019-04-21',4324,true),

(NULL,22,'Apple 苹果 AirPods 蓝牙无线耳机（MMEF2CH/A）','Apple W1 芯片让AirPods可以轻松配对您的iPhone7/8/X手机。 正牌Apple无线耳机，满满的黑科技，在不同设备之间流畅转换，是时候更新您的iPhone耳机了。',1199.00,1299.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','MMEF2CH/A','Apple AirPods','电子产品','<images alt="" class="" src="images/m-title/air.jpg">','2019-04-21',4324,true),

(NULL,23,'Adidas阿迪达斯2019新款男款短袖T恤新款透气圆领运动休闲男士T恤运动服','棉布料，柔软透气',89.00,99.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','件','Adidas','服装','<images alt="" class="" src="images/m-title/adi.jpg">','2019-04-21',4324,true),

(NULL,24,'Adidas阿迪达斯2019春夏款女子短袖男女情侣休闲运动透气圆领男女半袖T恤CV7026','运动型格 超值低价',99.00,109.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','件','Adidas','服装','<images alt="" class="" src="images/m-title/adin.jpg">','2019-04-21',4324,true),

(NULL,25,'【明星同款 亮白神器】PDC 碧迪皙 Wafood Made 酒粕面膜 170克','亮白好物快GET！代购狂扫货，好用到一度抢到手软也抢不到的热门款面膜。来自熊本部长家乡的熊本酒粕为主打成分，一扫肌肤废旧角质，焕亮暗沉无光，据说用过就能白哟~',115.00,129.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','170克','PDC 碧迪皙','面膜','<images alt="" class="" src="images/m-title/pdc.jpg">','2019-04-21',4324,true),

(NULL,26,'【吴昕同款】Kracie 肌美精 超浸透3D化保湿面膜组合装 4片*3盒（玻尿酸+紧致+焕白） 保税仓发货','无限回购一生推！大脸妹子走过路过别错过，3D立体剪裁，紧贴面部无死角，下巴也能享受到水润照顾。多到溢出的精华液，给肌肤源源不断直达肌底的水分活力，丰盈饱满细纹拜拜嘞~批次不同外包装略有不同',119.00,408.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','4片*3盒','Kracie 肌美精','面膜','<images alt="" class="" src="images/m-title/Kracie.jpg">','2019-04-21',4324,true),

(NULL,27,'【3盒装】MEDIHEAL 美迪恵尔 N.M.F针剂水库保湿面膜 新版 10片/盒 补水网红','韩国畅销品牌可莱丝面膜，平价补水战斗机，一次就让你爱上它！精华多到以为面膜纸是附加的，整张脸都感觉在面膜纸下舒展开了，敷完气色非常地棒，润润的不假滑，敏感肌也能安心使用的补水面膜~',149.00,169.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','10片/盒','MEDIHEAL 美迪恵尔','面膜','<images alt="" class="" src="images/m-title/Mediheal.jpg">','2019-04-21',4324,true),

(NULL,28,'【李佳琦推荐】Swisse 麦卢卡蜂蜜面膜 70克 清洁去角质 舒缓保湿紧肤','保湿紧肤 天然的可吸收面膜，富含麦卢卡蜂蜜、炭和高岭土，它的优质配方可纯净肌肤，给肌肤带来去油且滋润的感受。 ',82.00,85.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','10片/盒','Swisse 麦卢卡蜂蜜面膜','面膜','<images alt="" class="" src="images/m-title/Swisse.jpg">','2019-04-21',4324,true),

(NULL,29,'【现货！热销明星同款】Bb Laboratories 复活草水润修护面膜膏 175g','众多明星推荐的好货~拥有多重澎湃水能量，满满的复活草精华和浓稠补水因子海藻糖，可以帮助肌肤储存自身数百倍的水分，水嫩满分！当面膜接触肌肤的瞬间，就可以快速渗透，并修护肌肤保湿屏障，保持肌肤24小时的水润~',225.00,248.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','175g','Bb Laboratories 复活草水润修护面膜膏','面膜','<images alt="" class="" src="images/m-title/Bb.jpg">','2019-04-21',4324,true),

(NULL,30,'【现货！热销明星同款】Bb Laboratories 复活草水润修护面膜膏 175g','众多明星推荐的好货~拥有多重澎湃水能量，满满的复活草精华和浓稠补水因子海藻糖，可以帮助肌肤储存自身数百倍的水分，水嫩满分！当面膜接触肌肤的瞬间，就可以快速渗透，并修护肌肤保湿屏障，保持肌肤24小时的水润~',225.00,248.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','175g','Bb Laboratories 复活草水润修护面膜膏','面膜','<images alt="" class="" src="images/m-title/Bb.jpg">','2019-04-21',4324,true),

(NULL,31,'【张韶涵同款】MERBLISS 婚纱水分涂层纤薄面膜 25克/片 5片装','即时补水，提亮肤色，水润光滑，比一般面膜超10的精华吸收能力，温柔触感如裸肤一般的紧贴力，重要之日，需要特别的护肤，为疲惫的肌肤提供休息，覆上水润润的水分，帮助肌肤补水。',45.00,55.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','25克/片 5片装','MERBLISS','面膜','<images alt="" class="" src="images/m-title/Merbliss.jpg">','2019-04-21',4324,true),

(NULL,32,'Papa recipe 春雨 蜂蜜补水保湿面膜 25克/片 10片装 当红爆款','【新老包装随机发货】干皮超爱秋冬必备！一位医生爸爸推出的连敏感肌肤、孕妇都可以用的护肤品!含有一箭双雕的复合精华（CLOD COMPLEX），无论是温和性还是滋润程度，都让你惊喜到感叹！让你滋润到挤出水！',90.00,129.00,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','25克/片 10片装','Papa recipe','面膜','<images alt="" class="" src="images/m-title/recipe.jpg">','2019-04-21',4324,true);

/**笔记本电脑图片**/
INSERT INTO lg_laptop_pic VALUES
(NULL, 1, 'images/xl/nf_1.jpg','images/mnf_1.jpg','images/l/nf_1.jpg'),
(NULL, 1, 'images/xl/nf_2.jpg','images/ml/nf.jpg','images/l/nf_2.jpg'),
(NULL, 2, 'images/xl/dn_1.jpg','images/dn_1.jpg','images/l/dn_1.jpg'),
(NULL, 3, 'images/xl/iphone_1.jpg','images/iphone_1.jpg','images/l/iphone_1.jpg'),
(NULL, 4, 'images/xl/sk_1.jpg','images/sk_1.jpg','images/l/sk_1.jpg'),
(NULL, 4, 'images/xl/sk_2.jpg','images/sk_2.jpg','images/l/sk_2.jpg'),
(NULL, 4, 'images/xl/sk_3.jpg','images/sk_3.jpg','images/l/sk_3.jpg'),
(NULL, 5, 'images/xl/jm_1.jpg','images/jm_1.jpg','images/l/jm_1.jpg'),
(NULL, 5, 'images/xl/jm_2.jpg','images/jm_2.jpg','images/l/jm_2.jpg'),
(NULL, 5, 'images/xl/jm_3.jpg','images/jm_3.jpg','images/l/jm_3.jpg'),
(NULL, 5, 'images/xl/jm_4.jpg','images/jm_4.jpg','images/l/jm_4.jpg'),
(NULL, 5, 'images/xl/jm_5.jpg','images/jm_5.jpg','images/l/jm_5.jpg'),
(NULL, 5, 'images/xl/jm_6.jpg','images/jm_6.jpg','images/l/jm_6.jpg'),
(NULL, 6, 'images/xl/ray_1.jpg','images/ray_1.jpg','images/l/ray_1.jpg'),
(NULL, 6, 'images/xl/ray_2.jpg','images/ray_2.jpg','images/l/ray_2.jpg'),
(NULL, 6, 'images/xl/ray_3.jpg','images/ray_3.jpg','images/l/ray_3.jpg'),
(NULL, 6, 'images/xl/ray_4.jpg','images/ray_4.jpg','images/l/ray_4.jpg'),
(NULL, 6, 'images/xl/ray_5.jpg','images/ray_5.jpg','images/l/ray_5.jpg'),
(NULL, 7, 'images/xl/fr.jpg','images/ml/fr.jpg','images/l/fr.jpg'),
(NULL, 8, 'images/xl/hb_1.jpg','images/hb_1.jpg','images/l/hb_1.jpg'),
(NULL, 8, 'images/xl/hb_2.jpg','images/hb_2.jpg','images/l/hb_2.jpg'),
(NULL, 8, 'images/xl/hb_3.jpg','images/hb_3.jpg','images/l/hb_3.jpg'),
(NULL, 9, 'images/xl/lg_1.jpg','images/lg_1.jpg','images/l/lg_1.jpg'),
(NULL, 9, 'images/xl/lg_2.jpg','images/lg_2.jpg','images/l/lg_2.jpg'),
(NULL, 9, 'images/xl/lg_3.jpg','images/lg_3.jpg','images/l/lg_3.jpg'),
(NULL, 9, 'images/xl/lg_4.jpg','images/lg_4.jpg','images/l/lg_4.jpg'),
(NULL, 9, 'images/xl/lg_5.jpg','images/lg_5.jpg','images/l/lg_5.jpg'),
(NULL, 10, 'images/xl/aj.jpg','images/ml/aj.jpg','images/l/aj.jpg'),
(NULL, 11, 'images/xl/em_1.jpg','images/em_1.jpg','images/l/em_1.jpg'),
(NULL, 12, 'images/xl/em_2.jpg','images/em_2.jpg','images/l/em_2.jpg'),
(NULL, 13, 'images/xl/em_3.jpg','images/em_3.jpg','images/l/em_3.jpg'),
(NULL, 14, 'images/xl/em_4.jpg','images/em_4.jpg','images/l/em_4.jpg'),
(NULL, 15, 'images/xl/em_5.jpg','images/em_5.jpg','images/l/em_5.jpg'),
(NULL, 16, 'images/xl/bem_1.jpg','images/bem_1.jpg','images/l/bem_1.jpg'),
(NULL, 16, 'images/xl/bem_2.jpg','images/bem_2.jpg','images/l/bem_2.jpg'),
(NULL, 16, 'images/xl/bem_3.jpg','images/bem_3.jpg','images/l/bem_3.jpg'),
(NULL, 16, 'images/xl/bem_4.jpg','images/bem_4.jpg','images/l/bem_4.jpg'),
(NULL, 17, 'images/xl/ave_1.jpg','images/ave_1.jpg','images/l/ave_1.jpg'),
(NULL, 17, 'images/xl/ave_2.jpg','images/ave_2.jpg','images/l/ave_2.jpg'),
(NULL, 17, 'images/xl/ave_3.jpg','images/ave_3.jpg','images/l/ave_3.jpg'),
(NULL, 17, 'images/xl/ave_4.jpg','images/ave_4.jpg','images/l/ave_4.jpg'),
(NULL, 17, 'images/xl/ave_5.jpg','images/ave_5.jpg','images/l/ave_5.jpg'),
(NULL, 18, 'images/xl/lgo_1.jpg','images/lgo_1.jpg','images/l/lgo_1.jpg'),
(NULL, 18, 'images/xl/lgo_2.jpg','images/lgo_2.jpg','images/l/lgo_2.jpg'),
(NULL, 19, 'images/xl/ryo_1.jpg','images/ryo_1.jpg','images/l/ryo_1.jpg'),
(NULL, 19, 'images/xl/ryo_2.jpg','images/ryo_2.jpg','images/l/ryo_2.jpg'),
(NULL, 19, 'images/xl/ryo_3.jpg','images/ryo_3.jpg','images/l/ryo_3.jpg'),
(NULL, 20, 'images/xl/cr_1.jpg','images/cr_1.jpg','images/l/cr_1.jpg'),
(NULL, 20, 'images/xl/cr_2.jpg','images/cr_2.jpg','images/l/cr_2.jpg'),
(NULL, 20, 'images/xl/cr_3.jpg','images/cr_3.jpg','images/l/cr_3.jpg'),
(NULL, 20, 'images/xl/cr_4.jpg','images/cr_4.jpg','images/l/cr_4.jpg'),
(NULL, 21, 'images/xl/uni.jpg','images/ml/uni.jpg','images/l/uni.jpg'),
(NULL, 22, 'images/xl/bw_1.jpg','images/bw_1.jpg','images/l/bw_1.jpg'),
(NULL, 22, 'images/xl/bw_2.jpg','images/bw_2.jpg','images/l/bw_2.jpg'),
(NULL, 22, 'images/xl/bw_3.jpg','images/bw_3.jpg','images/l/bw_3.jpg'),
(NULL, 22, 'images/xl/bw_4.jpg','images/bw_4.jpg','images/l/bw_4.jpg'),
(NULL, 22, 'images/xl/bw_5.jpg','images/bw_5.jpg','images/l/bw_5.jpg'),
(NULL, 22, 'images/xl/bw_6.jpg','images/bw_6.jpg','images/l/bw_6.jpg'),
(NULL, 23, 'images/xl/dy_1.jpg','images/dy_1.jpg','images/l/dy_1.jpg'),
(NULL, 23, 'images/xl/dy_2.jpg','images/dy_2.jpg','images/l/dy_2.jpg'),
(NULL, 23, 'images/xl/dy_3.jpg','images/dy_3.jpg','images/l/dy_3.jpg'),
(NULL, 23, 'images/xl/dy_4.jpg','images/dy_4.jpg','images/l/dy_4.jpg'),
(NULL, 23, 'images/xl/dy_5.jpg','images/dy_5.jpg','images/l/dy_5.jpg'),
(NULL, 24, 'images/xl/air_1.jpg','images/air_1.jpg','images/l/air_1.jpg'),
(NULL, 24, 'images/xl/air_2.jpg','images/air_2.jpg','images/l/air_2.jpg'),
(NULL, 24, 'images/xl/air_3.jpg','images/air_3.jpg','images/l/air_3.jpg'),
(NULL, 24, 'images/xl/air_4.jpg','images/air_4.jpg','images/l/air_4.jpg'),
(NULL, 24, 'images/xl/air_5.jpg','images/air_5.jpg','images/l/air_5.jpg'),
(NULL, 25, 'images/xl/adi_1.jpg','images/adi_1.jpg','images/l/adi_1.jpg'),
(NULL, 25, 'images/xl/adi_2.jpg','images/adi_2.jpg','images/l/adi_2.jpg'),
(NULL, 25, 'images/xl/adi_3.jpg','images/adi_3.jpg','images/l/adi_3.jpg'),
(NULL, 25, 'images/xl/adi_4.jpg','images/adi_4.jpg','images/l/adi_4.jpg'),
(NULL, 25, 'images/xl/adi_5.jpg','images/adi_5.jpg','images/l/adi_5.jpg'),
(NULL, 26, 'images/xl/adin_1.jpg','images/adin_1.jpg','images/l/adin_1.jpg'),
(NULL, 26, 'images/xl/adin_2.jpg','images/adin_2.jpg','images/l/adin_2.jpg'),
(NULL, 26, 'images/xl/adin_3.jpg','images/adin_3.jpg','images/l/adin_3.jpg'),
(NULL, 26, 'images/xl/adin_4.jpg','images/adin_4.jpg','images/l/adin_4.jpg'),
(NULL, 26, 'images/xl/adin_5.jpg','images/adin_5.jpg','images/l/adin_5.jpg'),
(NULL, 27, 'images/xl/pdc.jpg','images/ml/pdc.jpg','images/l/pdc.jpg'),
(NULL, 28, 'images/xl/Kracie.jpg','images/ml/Kracie.jpg','images/l/Kracie.jpg'),
(NULL, 28, 'images/xl/Kracie_1.jpg','images/ml/Kracie_1.jpg','images/l/Kracie_1.jpg'),
(NULL, 28, 'images/xl/Kracie_2.jpg','images/ml/Kracie_2.jpg','images/l/Kracie_2.jpg'),
(NULL, 28, 'images/xl/Kracie_3.jpg','images/ml/Kracie_3.jpg','images/l/Kracie_3.jpg'),
(NULL, 29, 'images/xl/Mediheal.jpg','images/ml/Mediheal.jpg','images/l/Mediheal.jpg'),
(NULL, 29, 'images/xl/Mediheal_1.jpg','images/ml/Mediheal_1.jpg','images/l/Mediheal_1.jpg'),
(NULL, 29, 'images/xl/Mediheal_2.jpg','images/ml/Mediheal_2.jpg','images/l/Mediheal_2.jpg'),
(NULL, 29, 'images/xl/Mediheal_3.jpg','images/ml/Mediheal_3.jpg','images/l/Mediheal_3.jpg'),
(NULL, 30, 'images/xl/Swisse.jpg','images/ml/Swisse.jpg','images/l/Swisse.jpg'),
(NULL, 30, 'images/xl/Swisse_1.jpg','images/ml/Swisse_1.jpg','images/l/Swisse_1.jpg'),
(NULL, 30, 'images/xl/Swisse_2.jpg','images/ml/Swisse_2.jpg','images/l/Swisse_2.jpg'),
(NULL, 31, 'images/xl/Bb.jpg','images/ml/Bb.jpg','images/l/Bb_jpg.jpg'),
(NULL, 31, 'images/xl/Bb_1.jpg','images/ml/Bb_1.jpg','images/l/Bb_jpg_1.jpg'),
(NULL, 31, 'images/xl/Bb_2.jpg','images/ml/Bb_2.jpg','images/l/Bb_jpg_2.jpg'),
(NULL, 32, 'images/xl/Merbliss.jpg','images/ml/Merbliss.jpg','images/l/Merbliss.jpg'),
(NULL, 32, 'images/xl/Merbliss_1.jpg','images/ml/Merbliss_1.jpg','images/l/Merbliss_1.jpg'),
(NULL, 32, 'images/xl/Merbliss_2.jpg','images/ml/Merbliss_2.jpg','images/l/Merbliss_2.jpg'),
(NULL, 32, 'images/xl/Merbliss_3.jpg','images/ml/Merbliss_3.jpg','images/l/Merbliss_3.jpg');


/**用户信息**/
INSERT INTO lg_user VALUES
(NULL, '千玺宝宝', '123456', 'qx123@qq.com', '13501234567', '', '千玺', '1'),
(NULL, '王源宝宝', '123456', 'wy123@qq.com', '16481245448', '', '王源', '1'),
(NULL, '俊凯宝宝', '123456', 'jk@qq.com', '13501234569', '', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', '', '秦小雅', '0'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', '', '窦志强', '1'),
(NULL, 'yoyo', '123456', 'yoyo@qq.com', '13501234560', '', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO lg_index_carousel VALUES
(NULL, 'images/lb_1.png','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'images/lb_2.png',' ','product_details.html?lid=19'),
(NULL, 'images/lb_3.png','轮播广告商品3','lookforward.html'),
(NULL, 'images/lb_4.png','轮播广告商品4','lookforward.html'),
(NULL, 'images/lb_5.png','轮播广告商品5','lookforward.html'),
(NULL, 'images/lb_6.png','轮播广告商品6','lookforward.html'),
(NULL, 'images/lb_7.png','轮播广告商品7','lookforward.html'),
(NULL, 'images/lb_8.png','轮播广告商品8','lookforward.html'),
(NULL, 'images/lb_9.png','轮播广告商品9','lookforward.html');

/****首页商品****/
INSERT INTO lg_index_product VALUES
(NULL, 'Apple MacBook Air系列', '酷睿双核i5处理器|256GB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'images/03.jpg', 6988, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '小米Air 金属超轻薄', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD独立显卡', 'images/04.jpg', 3488, 'product_details.html?lid=5', 2, 2, 2),
(NULL, '联想E480C 轻薄系列', '酷睿双核i7处理器|256GB SSD|4GB内存|英特尔HD显卡680M', 'images/05.jpg', 5399, 'product_details.html?lid=9', 3, 3, 3),
(NULL, '华硕RX310 金属超极本', '酷睿双核i5处理器|512GB SSD|4GB内存|英特尔HD游戏级显卡', 'images/06.jpg', 4966, 'product_details.html?lid=13', 4, 4, 4),
(NULL, '联想小新700 电竞版游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'images/07.jpg', 6299, 'product_details.html?lid=17', 5, 5, 5),
(NULL, '戴尔灵越燃7000 轻薄窄边', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD显卡', 'images/08.jpg', 5199, 'product_details.html?lid=19', 6, 6, 6),
(NULL, '神州战神Z7M 高性价比游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD游戏机独立显卡', 'images/09.jpg', 5799, 'product_details.html?lid=38', 0, 0, 0);



