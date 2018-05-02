DROP TABLE IF EXISTS my_user;
CREATE TABLE my_user(
  user_id INT (10) PRIMARY KEY auto_increment,
  user_name  VARCHAR (255),
  user_nickname VARCHAR (255),
  user_image VARCHAR (255),
  user_phone  BIGINT (12),
  user_password VARCHAR (255),
  company VARCHAR (255),
  jobTitle VARCHAR (255),
  blogAddress VARCHAR (255),
  createdAt DATETIME,
  followersCount INT (12),
  followeesCount INT (12),
  selfDescription VARCHAR (255),
  collectedEntriesCount INT (12),
  totalCollectionsCount INT (12)
)DEFAULT charset=utf8;
INSERT INTO my_user
  (user_id, user_name, user_nickname, user_image, user_phone, user_password,company,jobTitle,blogAddress,createdAt,followersCount,followeesCount,selfDescription,collectedEntriesCount,totalCollectionsCount)
VALUES
  (1, '杨博', '我爱前端', 'https://avatars2.githubusercontent.com/u/35511395?v=4', 18404905852, '123456','妈妈网','前端攻城狮','https://ljf0113.github.io/','2016-03-05 00:00:00', 12343,1233,'希望变为一只不弄懂细节不开心星人~',123,221),
  (2, '张三', '我爱java', 'https://avatars2.githubusercontent.com/u/35511395?v=4', 15669052865, '123456','爸爸网','后端攻城狮','https://ljf0113.github.io/','2016-03-05 00:00:00', 11112,11,'希望变为一只不弄懂细节不开心星人~',11,131),
  (3, '李四', '我爱php', 'https://avatars2.githubusercontent.com/u/35511395?v=4', 18404905853, '123456','爷爷网','java攻城狮','https://ljf0113.github.io/','2016-03-05 00:00:00', 1212,133,'希望变为一只不弄懂细节不开心星人~',23,123);

-- 类目列表
DROP TABLE IF EXISTS categoryList;
CREATE TABLE categoryList(
  id INT (10) PRIMARY KEY auto_increment,
  name VARCHAR (255),
  title VARCHAR (255),
  createdAt DATETIME,
  updatedAt DATETIME,
  isSubscribe TINYINT,
  color VARCHAR (255),
  background VARCHAR (255),
  showOnNav  TINYINT,
  isCategory  TINYINT,
  entryCount INT (10),
  subscribersCount INT (10),
  icon VARCHAR (255)
)DEFAULT charset=utf8;

INSERT INTO categoryList
  (id,name,title,createdAt,updatedAt,isSubscribe,color,background,showOnNav,isCategory,entryCount,subscribersCount,icon)
VALUES
  (1,'Android', 'android', '2018-03-05 00:00:00', '2018-03-05 00:00:00', false,'#616161','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/0d614af263aa63aa6a77.png'),
  (2,'前端', 'frontend', '2018-03-05 00:00:00', '2018-03-05 00:00:00', true,'#60ADFF','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/bac28828a49181c34110.png'),
  (3,'iOS', 'ios', '2018-03-05 00:00:00', '2018-03-05 00:00:00', false,'#616161','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/0d614af263aa63aa6a77.png'),
  (4,'产品', 'product', '2018-03-05 00:00:00', '2018-03-05 00:00:00', false,'#616161','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/0d614af263aa63aa6a77.png'),
  (5,'设计', 'design', '2018-03-05 00:00:00', '2018-03-05 00:00:00', false,'#616161','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/0d614af263aa63aa6a77.png'),
  (6,'阅读', 'read', '2018-03-05 00:00:00', '2018-03-05 00:00:00', false,'#616161','',false,false,123,1231,'https://lc-mhke0kuv.cn-n1.lcfile.com/0d614af263aa63aa6a77.png');

DROP TABLE IF EXISTS eventsList;
CREATE TABLE eventsList(
  _id INT (10) PRIMARY KEY auto_increment,
  eventUrl VARCHAR (255),
  title VARCHAR (255),
  userId INT (10),
  startTime DATETIME,
  endTime DATETIME,
  city VARCHAR (255),
  cityAlias VARCHAR (255),
  screenshot VARCHAR (255),
  showBanner VARCHAR (255),
  bannerStartTime DATETIME,
  bannerEndTime DATETIME,
  createdAt DATETIME,
  updatedAt DATETIME,
  category  VARCHAR (255)
)DEFAULT charset=utf8;

INSERT INTO eventsList
  (_id,eventUrl,title,userId,startTime,endTime,city,cityAlias,screenshot,showBanner,bannerStartTime,bannerEndTime,createdAt,updatedAt,category)
VALUES
  (1, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou', 'https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (2, 'http:\/\/www.huodongxing.com\/event\/5430095868200', '架构师技术私享会——极光开发者沙龙', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '深圳', 'shenzhen', 'https:\/\/user-gold-cdn.xitu.io\/1520416926521de10265445ef33e1c1e80f3bf7b9346b.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (3, 'http:\/\/bj.huodongxing.com\/event\/7429208843300', '【移动战略说•第七期】前端开发技术专场', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '北京', '北京', 'https:\/\/user-gold-cdn.xitu.io\/1520567877431af9e9843917e8ba2500b1ebe358267ff.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (4, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou', 'https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (5, 'http:\/\/www.huodongxing.com\/event\/5430095868200', '架构师技术私享会——极光开发者沙龙', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '深圳', 'shenzhen', 'https:\/\/user-gold-cdn.xitu.io\/1520416926521de10265445ef33e1c1e80f3bf7b9346b.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (6, 'http:\/\/bj.huodongxing.com\/event\/7429208843300', '【移动战略说•第七期】前端开发技术专场', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '北京', '北京','https:\/\/user-gold-cdn.xitu.io\/1520567877431af9e9843917e8ba2500b1ebe358267ff.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (7, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou', 'https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (8, 'http:\/\/www.huodongxing.com\/event\/5430095868200', '架构师技术私享会——极光开发者沙龙', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '深圳', 'shenzhen', 'https:\/\/user-gold-cdn.xitu.io\/1520416926521de10265445ef33e1c1e80f3bf7b9346b.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (9, 'http:\/\/bj.huodongxing.com\/event\/7429208843300', '【移动战略说•第七期】前端开发技术专场', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '北京', '北京', 'https:\/\/user-gold-cdn.xitu.io\/1520567877431af9e9843917e8ba2500b1ebe358267ff.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (10, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou','https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (11, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou','https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (12, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou','https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12'),
  (13, 'http:\/\/d2forum.alibaba-inc.com\/developer2018#\/index?_k=u4k1qb', '阿里巴巴 D2 开发者大会', 551, '2018-03-05 00:00:00', '2018-03-05 00:00:00', '杭州', 'hangzhou','https:\/\/user-gold-cdn.xitu.io\/152032054503893748113014562978b32bcd432320669.jpg', 1, '2018-03-12 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '12');

-- 城市列表
DROP TABLE IF EXISTS cityList;
CREATE TABLE cityList(
  id INT (10) PRIMARY KEY AUTO_INCREMENT,
  cityName VARCHAR (255),
  cityAlias VARCHAR (255),
  weight VARCHAR (255)
)default charset = utf8;
INSERT INTO cityList
  (id, cityName, cityAlias, weight)
VALUES
  (1, '南京', 'nanjing', 0),

  (2, '武汉', 'wuhan', 0),

  (3, '海外', 'overseas', 0),

  (4, '苏州', 'suzhou', 0),

  (5, '成都', 'chengdu', 0),

  (6, '重庆', 'chongqing', 0),

  (7, '厦门', 'xiamen', 0),

  (8, '西安', 'xian', 0);

DROP TABLE IF EXISTS CustomRepos;
CREATE TABLE CustomRepos(
  id INT (10) PRIMARY KEY auto_increment,
  objectId INT (10),
  userId INT (10),
  userName VARCHAR (255),
  userUrl VARCHAR (255),
  userAvatarUrl VARCHAR (255),
  repoName VARCHAR (255),
  description VARCHAR (255),
  language VARCHAR (255),
  stars INT (10),
  fork INT (10),
  url VARCHAR(255),
  pushedAt DATETIME,
  createdAt DATETIME,
  updatedAt DATETIME,
  localCreatedAt DATETIME,
  localUpdatedAt DATETIME
)DEFAULT charset=utf8;
INSERT INTO CustomRepos
  (id, objectId, userId, userName, userUrl, userAvatarUrl, repoName, description, language, stars, fork, url, pushedAt, createdAt, updatedAt, localCreatedAt, localUpdatedAt)
VALUES
  (1, 127124988, 35511315, 'numaverse', 'https://github.com/numaverse', 'https://avatars2.githubusercontent.com/u/35511395?v=4','numaverse-gateway', 'A federated social network, built on Ethereum and IPFS.', 'Ruby', 23, 21, 'https://github.com/numaverse/numaverse-gateway', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (2, 1271249843, 35511325, 'UltimateHackers', 'https://github.com/UltimateHackers', 'https://avatars2.githubusercontent.com/u/26716802?v=4','Diggy', 'Extract enpoints from apk files.', 'Shell', 123, 12, 'https://github.com/UltimateHackers/Diggy', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-08 00:00:00','2018-03-05 00:00:00' ),
  (3, 1271249834, 35511335, 'calio', 'https://github.com/calio', 'https://avatars3.githubusercontent.com/u/233995?v=4','lua-capnproto', 'Lua-capnp is a pure lua implementation of capnproto based on luajit.', 'Lua', 333, 11, 'https://github.com/calio/lua-capnproto', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-10 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (4, 127124985, 35511345, 'kutlugsahin', 'https://github.com/kutlugsahin', 'https://avatars3.githubusercontent.com/u/4080691?v=4','react-smooth-dnd', 'react wrapper components for smooth-dnd', 'JavaScript', 5523, 121, 'https://github.com/kutlugsahin/react-smooth-dnd', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (5, 127124988, 35511315, 'numaverse', 'https://github.com/numaverse', 'https://avatars2.githubusercontent.com/u/35511395?v=4','numaverse-gateway', 'A federated social network, built on Ethereum and IPFS.', 'Ruby', 23, 21, 'https://github.com/numaverse/numaverse-gateway', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-12 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (6, 1271249843, 35511325, 'UltimateHackers', 'https://github.com/UltimateHackers', 'https://avatars2.githubusercontent.com/u/26716802?v=4','Diggy', 'Extract enpoints from apk files.', 'Shell', 123, 12, 'https://github.com/UltimateHackers/Diggy', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-05-05 00:00:00','2018-03-05 00:00:00' ),
  (7, 1271249834, 35511335, 'calio', 'https://github.com/calio', 'https://avatars3.githubusercontent.com/u/233995?v=4','lua-capnproto', 'Lua-capnp is a pure lua implementation of capnproto based on luajit.', 'Lua', 333, 11, 'https://github.com/calio/lua-capnproto', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (8, 127124985, 35511345, 'kutlugsahin', 'https://github.com/kutlugsahin', 'https://avatars3.githubusercontent.com/u/4080691?v=4','react-smooth-dnd', 'react wrapper components for smooth-dnd', 'JavaScript', 5523, 121, 'https://github.com/kutlugsahin/react-smooth-dnd', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (9, 127124988, 35511315, 'numaverse', 'https://github.com/numaverse', 'https://avatars2.githubusercontent.com/u/35511395?v=4','numaverse-gateway', 'A federated social network, built on Ethereum and IPFS.', 'Ruby', 23, 21, 'https://github.com/numaverse/numaverse-gateway', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (10, 1271249843, 35511325, 'UltimateHackers', 'https://github.com/UltimateHackers', 'https://avatars2.githubusercontent.com/u/26716802?v=4','Diggy', 'Extract enpoints from apk files.', 'Shell', 123, 12, 'https://github.com/UltimateHackers/Diggy', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (11, 1271249834, 35511335, 'calio', 'https://github.com/calio', 'https://avatars3.githubusercontent.com/u/233995?v=4','lua-capnproto', 'Lua-capnp is a pure lua implementation of capnproto based on luajit.', 'Lua', 333, 11, 'https://github.com/calio/lua-capnproto', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (12, 127124985, 35511345, 'kutlugsahin', 'https://github.com/kutlugsahin', 'https://avatars3.githubusercontent.com/u/4080691?v=4','react-smooth-dnd', 'react wrapper components for smooth-dnd', 'JavaScript', 5523, 121, 'https://github.com/kutlugsahin/react-smooth-dnd', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (13, 127124988, 35511315, 'numaverse', 'https://github.com/numaverse', 'https://avatars2.githubusercontent.com/u/35511395?v=4','numaverse-gateway', 'A federated social network, built on Ethereum and IPFS.', 'Ruby', 23, 21, 'https://github.com/numaverse/numaverse-gateway', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (14, 1271249843, 35511325, 'UltimateHackers', 'https://github.com/UltimateHackers', 'https://avatars2.githubusercontent.com/u/26716802?v=4','Diggy', 'Extract enpoints from apk files.', 'Shell', 123, 12, 'https://github.com/UltimateHackers/Diggy', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (15, 1271249834, 35511335, 'calio', 'https://github.com/calio', 'https://avatars3.githubusercontent.com/u/233995?v=4','lua-capnproto', 'Lua-capnp is a pure lua implementation of capnproto based on luajit.', 'Lua', 333, 11, 'https://github.com/calio/lua-capnproto', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (16, 127124985, 35511345, 'kutlugsahin', 'https://github.com/kutlugsahin', 'https://avatars3.githubusercontent.com/u/4080691?v=4','react-smooth-dnd', 'react wrapper components for smooth-dnd', 'JavaScript', 5523, 121, 'https://github.com/kutlugsahin/react-smooth-dnd', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (17, 127124988, 35511315, 'numaverse', 'https://github.com/numaverse', 'https://avatars2.githubusercontent.com/u/35511395?v=4','numaverse-gateway', 'A federated social network, built on Ethereum and IPFS.', 'Ruby', 23, 21, 'https://github.com/numaverse/numaverse-gateway', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (18, 1271249843, 35511325, 'UltimateHackers', 'https://github.com/UltimateHackers', 'https://avatars2.githubusercontent.com/u/26716802?v=4','Diggy', 'Extract enpoints from apk files.', 'Shell', 123, 12, 'https://github.com/UltimateHackers/Diggy', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (19, 1271249834, 35511335, 'calio', 'https://github.com/calio', 'https://avatars3.githubusercontent.com/u/233995?v=4','lua-capnproto', 'Lua-capnp is a pure lua implementation of capnproto based on luajit.', 'Lua', 333, 11, 'https://github.com/calio/lua-capnproto', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' ),
  (20, 127124985, 35511345, 'kutlugsahin', 'https://github.com/kutlugsahin', 'https://avatars3.githubusercontent.com/u/4080691?v=4','react-smooth-dnd', 'react wrapper components for smooth-dnd', 'JavaScript', 5523, 121, 'https://github.com/kutlugsahin/react-smooth-dnd', '2018-03-05 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-03-05 00:00:00','2018-03-05 00:00:00' );

-- 文章表
DROP TABLE IF EXISTS entrylist;
CREATE TABLE entrylist(
  id INT (10) PRIMARY KEY auto_increment,
  collectionCount INT (10) NOT NULL,
  commentsCount INT (10) NOT NULL,
  updatedAt DATETIME NOT NULL,
  createdAt DATETIME NOT NULL,
  originalUrl VARCHAR (255) NOT NULL,
  screenshot VARCHAR (255) NOT NULL,
  content VARCHAR (255) NOT NULL,
  title VARCHAR (255) NOT NULL,
  summaryInfo VARCHAR (255) NOT NULL,
  viewsCount VARCHAR (255) NOT NULL,
  hot VARCHAR (255) NOT NULL,
  type VARCHAR (255) NOT NULL,
  isCollected VARCHAR (255) NOT NULL,
  username VARCHAR (255) NOT NULL
)DEFAULT charset=utf8;
INSERT INTO CustomRepos
  (id, collectionCount, commentsCount, updatedAt, createdAt, originalUrl, screenshot, content, title, summaryInfo, viewsCount, hot, type, isCollected, username)
VALUES
  ()
-- 语言表
DROP TABLE IF EXISTS subscribe;
CREATE TABLE subscribe(
  id INT (10) PRIMARY KEY auto_increment,
  icon VARCHAR (255),
  isSubscribe VARCHAR (255),
  title VARCHAR (255),
)DEFAULT charset=utf8;
INSERT INTO subscribe
  (id, icon, isSubscribe, title)
VALUES
  (1, 'https://lc-mhke0kuv.cn-n1.lcfile.com/52ffa0829ab10a3651c3.png', false, 'Ruby'),
  (2, 'https://lc-mhke0kuv.cn-n1.lcfile.com/7699e23cbe687eed8c38.png', false, 'PHP'),
  (3, 'https://lc-mhke0kuv.cn-n1.lcfile.com/7b5c3eb591b671749fee.png', false, 'Vue.js'),
  (4, 'https://lc-mhke0kuv.cn-n1.lcfile.com/66de0c4eb9d10130d5bf.png', false, 'CSS'),
  (5, 'https://lc-mhke0kuv.cn-n1.lcfile.com/5d70fd6af940df373834.png', false, 'JavaScript'),
  (6, 'https://lc-mhke0kuv.cn-n1.lcfile.com/71d968ea2fde62410b19.png', false, 'Objective-C'),
  (7, 'https://lc-mhke0kuv.cn-n1.lcfile.com/f8ee3cd45f949a546263.png', false, 'Java'),
  (8, 'https://lc-mhke0kuv.cn-n1.lcfile.com/648863629bc4a18fb04c.png', false, 'C'),
  (9, 'https://lc-mhke0kuv.cn-n1.lcfile.com/664bb393774ec8ebb7cc.png', false, 'C++'),
  (10, 'https://lc-mhke0kuv.cn-n1.lcfile.com/b51a1dacf9bb7883defe.png', false, 'Python'),
  (11, 'https://lc-mhke0kuv.cn-n1.lcfile.com/eb7ab66be4c2898b5aa9.png', false, 'Swift'),
  (12, 'https://lc-mhke0kuv.cn-n1.lcfile.com/0fe863b6a0949306fcc1.png', false, 'TypeScript'),
  (13, 'https://lc-mhke0kuv.cn-n1.lcfile.com/9979306cd7d324ca5a27.png', false, 'Kotlin'),
  (14, 'https://lc-mhke0kuv.cn-n1.lcfile.com/64c2d72886ee7d6163c6.png', false, 'Lua'),
  (15, 'https://lc-mhke0kuv.cn-n1.lcfile.com/e663fa6cfb28df3fa493.png', false, 'SQL'),
  (16, 'https://lc-mhke0kuv.cn-n1.lcfile.com/2c56635623a5553905ce.png', false, 'Shell');

-- banner列表
DROP TABLE IF EXISTS bannerList;
CREATE TABLE bannerList(
  id INT (10) PRIMARY KEY auto_increment,
  author VARCHAR (255),
  content VARCHAR (1000),
  screenshot VARCHAR (255),
  title VARCHAR (255),
  url VARCHAR (255),
  summaryInfo VARCHAR (1000),
  lastCommentTime  DATETIME
)DEFAULT charset=utf8;
INSERT INTO  bannerList
  (id, author, content, screenshot, title, url, summaryInfo, lastCommentTime)
VALUES
  (1, 'yangsir', 'TensorFlow Docs 是由掘金翻译计划实时维护的 TensorFlow 官方文档中文版，维护者由全球各大公司开发人员和各著名高校研究者及学生组成。欢迎大家加入维护团队，欢迎提 Issue 和 PR。 此外还有前段时间 Google 官方推出的 机器学习速成课程。 答：…', 'https:\/\/user-gold-cdn.xitu.io\/2018\/3\/23\/162525357df32b02?w=640&h=400&f=jpeg&s=96336', 'TensorFlow 官方文档中文版发布啦（持续维护）', '', 'TensorFlow Docs 是由掘金翻译计划实时维护的 TensorFlow 官方文档中文版，维护者由全球各大公司开发人员和各著名高校研究者及学生组成。欢迎大家加入维护团队，欢迎提 Issue 和 PR。 此外还有前段时间 Google 官方推出的 机器学习速成课程。 答：网上有各种版本的 T...', '2018-03-31 00:00:00'),
  (2, 'kthh', 'SwiftNIO is a cross-platform asynchronous event-driven network application framework for rapid development of maintainable high performance', null, 'SwiftNIO-Event-driven network application framework', '', 'SwiftNIO is a cross-platform asynchronous event-driven network application framework for rapid development of maintainable high performance protocol ...', '2018-03-14 00:00:00'),
  (133, 'sfewr', 'JarsLink (原名Titan) 是一个基于JAVA的模块化开发框架，它提供在运行时动态加载模块（一个JAR包）、卸载模块和模块间调用的API。', null, 'JarsLink：阿里巴巴出品的基于 Java 的模块化开发框架', '', 'JarsLink (原名Titan) 是一个基于JAVA的模块化开发框架，它提供在运行时动态加载模块（一个JAR包）、卸载模块和模块间调用的API。 目前蚂蚁金服微贷事业部几个系统和几十个模块已经使用JarsLink框架。 提供了通用灵活的API让系统和模块进行交互。 JarsLink is re...', '2018-03-31 00:00:00'),
  (4, 'erwe', 'mpvue 是一个使用 Vue.js 开发小程序的前端框架。框架基于 Vue.js 核心，mpvue 修改了 Vue.js 的 runtime 和 compiler 实现，使其可以运行在小程序环境中，从而为小程序开发引入了整套 Vue.js 开发体验。', 'https:\/\/user-gold-cdn.xitu.io\/2018\/3\/9\/16206607fa64e9d8?w=460&h=460&f=png&s=33495', 'mpvue - 美团点评开源的基于 Vue 的微信小程序前端框架', '', '是一个使用 Vue.js 开发小程序的前端框架。框架基于 核心， 修改了 的 runtime 和 compiler 实现，使其可以运行在小程序环境中，从而为小程序开发引入了整套 开发体验。 美团旗下小程序： 和 ，此外，正有一大批小程序正在接入中。 我们精心准备了一个简单的 五分钟上手教程 方便', '2018-03-31 00:00:00'),
  (5, '34324', '一个支持动态解析XML布局的库，通过这个库，可以动态渲染类似下面的布局, DynamicView会缓存视图结构，不会重复解析XML。\n根节点SN属性是必须要设置的，不同的布局要保证不同，视图结构的缓存以此属性为Key。\n节点的名称是我们需要自定义控件的类名，属性是定义的类的s…', 'https:\/\/user-gold-cdn.xitu.io\/2018\/3\/23\/162525357df32b02?w=640&h=400&f=jpeg&s=96336', '一个支持动态解析XML布局的库，轻量，好用', '', 'null', '2018-03-31 00:00:00');

DROP TABLE IF EXISTS articlesList;
CREATE TABLE articlesList(
  id INT (10) PRIMARY KEY auto_increment,
  html VARCHAR (10000),
  title VARCHAR (255),
  img VARCHAR (255),
  createdAt DATETIME
)DEFAULT charset=utf8;

-- 消息提示
DROP TABLE IF EXISTS userMessage;
CREATE TABLE userMessage(
  id INT (12) PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR (255) NOT NULL,
  url VARCHAR (255) NOT NULL,
  title VARCHAR (255) NOT NULL,
  author_name VARCHAR (255) NOT NULL
)DEFAULT charset = utf8;

INSERT INTO userMessage
  (id, type, url, title, author_name)
VALUES
  (1, 'question', 'http://www.zhihu.com/api/v4/questions/266361327', '你在自己的职业生涯当中都经历过哪些「诱惑和考验」，你又是如何抵挡的？', '小韩'),
  (2, 'article', 'http://www.zhihu.com/api/v4/questions/266361327', '编写小而美函数的艺术', '卢睿韬'),
  (3, 'question', 'http://www.zhihu.com/api/v4/questions/266361327', '前端调用 GraphQL API，从未如此方便！', '侯锋'),
  (4, 'article', 'http://www.zhihu.com/api/v4/questions/266361327', '你在自己的职业生涯当中都经历过哪些「诱惑和考验」，你又是如何抵挡的？', '小韩'),
  (5, 'question', 'http://www.zhihu.com/api/v4/questions/266361327', '你在自己的职业生涯当中都经历过哪些「诱惑和考验」，你又是如何抵挡的？', '小韩');

-- 推荐列表
DROP TABLE IF EXISTS recommendList;
CREATE TABLE recommendList(
  id INT (12) PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR (255) NOT NULL,
  content TEXT (65535) NOT NULL,
  excerpt_new TEXT (65535) NOT NULL,
  comment_count INT (12) NOT NULL,
  voteup_count INT (12) NOT NULL,
  thanks_count INT (12) NOT NULL,
  actors_name VARCHAR (255) NOT NULL,
  actors_url VARCHAR (255) NOT NULL,
  author_name VARCHAR (255) NOT NULL,
  author_url VARCHAR (255) NOT NULL,
  author_headline VARCHAR (255) NOT NULL,
  author_avatar_url VARCHAR (255) NOT NULL,
  action_text_tpl VARCHAR (255) NOT NULL,
  thumbnail VARCHAR (255) NOT NULL
)DEFAULT charset=utf8;
INSERT INTO recommendList
  (id, title, content, excerpt_new, comment_count, voteup_count, thanks_count, actors_name, actors_url, author_name, author_url, author_headline, author_avatar_url, action_text_tpl, thumbnail)
VALUES
  (
    1,
    '那些曾经轰动一时的新闻事件，都有哪些后续发展？',
    '最狗血，12岁当爹，13岁竟然发现被绿。<br><figure><img src=\"https://pic1.zhimg.com/v2-95e01727cce0774237d0949f4e9d45a3_b.jpg\" data-rawwidth=\"750\" data-rawheight=\"1024\" class=\"origin_image zh-lightbox-thumb\" width=\"750\" data-original=\"https://pic1.zhimg.com/v2-95e01727cce0774237d0949f4e9d45a3_r.jpg\"></figure><br>估计很多人看过这张照片，几年前这个13岁的少年被称为“英国最年轻的爸爸”。当年Alfie住在英国的Lower Dicker，同村有个比他大两岁的女孩叫Chantelle。<br><br>他俩刚认识的时候男孩12岁，女孩14岁。两个人很合得来，总在一起玩耍，有时男孩去女孩家过夜，有时女孩来男孩家过夜，家长也没多想。但是他们居然真的发生了一些不可描述的事情......<br><br>四个月后Chantelle突然对男孩说：“我怀孕了，孩子是你的。”12岁的Alfie震惊了，他虽然根本不知道成为父亲意味着什么，但却为女孩保守秘密，还努力承担责任，陪着女孩看医生。<br><br>然后直到女孩Chantelle临盆前一个月Alfie的妈妈才知道这个消息。再然后孩子出生了，是个女孩。13岁的Alfie立刻成了英国最年轻的爸爸。<br><br>       然而，这只是故事的开始......<br><br>不知道怎么当爸爸的Alfie只知道他在看到孩子的第一眼就喜欢上了她。他喜欢一直这么抱着她。<br><br>Alfie尽心尽责的做个好爸爸，给女儿喂奶、换尿布，他甚至连自己喜欢的电脑游戏都不玩了。<br><br>抱着孩子的感觉好像真的非常美妙?!几年后小男孩Alfie才真正知道这意味着什么。虽然Alfie自己还是个孩子，但他很喜欢这个女儿，也尽最大的努力想要照顾好她。但是新闻报道后这个狗血剧开始有了新发展。<br><br>13岁的Alfie“喜当英国最年轻爹”的新闻爆出之后不久，马上就有七个男生表示自己和Chantelle也有过性行为，还有两个男生坚持他们才是这孩子的亲生父亲。<br><br>更加巧合的是有个男生长得和这孩子非常的像，Alfie听到这些真是怒了，他认为这七个愚蠢的男生都在说谎，既然这么多人在造谣，那就做个亲子鉴定好了。Alfie的妈妈也很支持他。<br><br>然而亲子鉴定的结果显示这娃不是Alfie的，她的亲生父亲真的是之前来认亲的一个男生——15岁的Tyler Barker。<br><br>Alfie彻底崩溃了，他躲在家里大哭，更糟的是在发现Alfie不是亲生父亲后，Chantelle一家就搬家了，把孩子也带走了。见不到宝宝的Alfie什么也做不了，也不去上学，感觉世界崩塌了。<br><br>15岁的Tyler Barker在拿到鉴定书的那一刻也是彻底蒙了，他说真希望从来没遇见过Chantelle。<br><br>然而这故事还没完，没过多久，Chantelle父母的一个朋友爆料说：13岁的Alfie当爸爸完全是事先策划好被人设套陷害的，他只是一场骗钱行动的牺牲品!因为Chantelle父母知道，如果孩子父亲是13岁的Alfie那肯定是个轰动世界的大新闻并且通过把自己女儿的这个故事卖给媒体发财。<br><br>这个当年只有13岁的男孩在短短的一年经历了过山车一般的人生。如今已经成年的Alfie只想用自己的故事告诉所有未成年人——不要重蹈他的覆辙。<br><br>18岁的Alfie在接受采访时表示：“在那么小的年纪发生性行为真的毁了我的人生，前一秒还在打游戏，后一秒突然就当爹了。这是我一生最大的错，我连中学毕业证都没拿到就离开学校了。”<br>Alfie说：“我一直没工作。不管走到哪都有人认识我，虽然孩子不是我的，但最年轻爸爸的标签我甩不掉。有孩子也许很开心，但当你18岁时就完全不是同一种心情了。”(原作者微博po主‘’英国那些事‘’)<br><br><figure><img src=\"https://pic1.zhimg.com/v2-dbcd944b879c9505f3b8d6a4a614958e_b.jpg\" data-rawwidth=\"750\" data-rawheight=\"570\" class=\"origin_image zh-lightbox-thumb\" width=\"750\" data-original=\"https://pic1.zhimg.com/v2-dbcd944b879c9505f3b8d6a4a614958e_r.jpg\"></figure><br><figure><img src=\"https://pic3.zhimg.com/v2-4eb3b9da22bc5f57f335cc6cc2ab27b0_b.jpg\" data-rawwidth=\"750\" data-rawheight=\"496\" class=\"origin_image zh-lightbox-thumb\" width=\"750\" data-original=\"https://pic3.zhimg.com/v2-4eb3b9da22bc5f57f335cc6cc2ab27b0_r.jpg\"></figure>',
    '最狗血，12岁当爹，13岁竟然发现被绿。 估计很多人看过这张照片，几年前这个13岁的少年被称为“英国最年轻的爸爸”。当年Alfie住在英国的Lower Dicker，同村有个比他大两岁的女孩叫Chantelle。 他俩刚认识的时候男孩12岁，女孩14岁。两个人很合得来，总在一起玩…',
    255,
    123,
    11,
    '互联网',
    'https://api.zhihu.com/topics/19550415',
    '雨亦奇',
    'https://api.zhihu.com/people/14bf746b5c6a28a776ed8b1a57917b86',
    '小月',
    'https://pic1.zhimg.com/aadd7b895_s.jpg',
    '来自话题: ',
    'https://pic2.zhimg.com/50/v2-e815f88995129af9b1896fa0589b4f00_200x112.jpg'
  ),
  (
    2,
    '生物识别技术登录将很快推向网络，密码或将逐渐减少使用',
    '<p></p><a class=\"video-box\" href=\"http://link.zhihu.com/?target=https://www.zhihu.com/video/967518522569703424\" target=\"_blank\" data-video-id=\"\" data-video-playable=\"true\" data-name=\"\" data-poster=\"https://pic3.zhimg.com/80/v2-ae5e1a2d889b44c65b6c908939c24f3a_b.jpg\" data-lens-id=\"967518522569703424\">              <img class=\"thumbnail\" src=\"https://pic3.zhimg.com/80/v2-ae5e1a2d889b44c65b6c908939c24f3a_b.jpg\"><span class=\"content\">                <span class=\"title\"><span class=\"z-ico-extern-gray\"></span><span class=\"z-ico-extern-blue\"></span></span>                <span class=\"url\"><span class=\"z-ico-video\"></span>https://www.zhihu.com/video/967518522569703424</span>              </span>            </a><p></p><p>周二，包括微软、谷歌、火狐等顶级浏览器厂商在内的组织和企业宣布了一项新的里程碑式的标准——WebAuthn。该标准将简化Web开发人员向其网站添加额外登录方法的过程，从而更好地保护消费者的帐户和数据安全。</p><p><b>通过WebAuthn，用户无需密码，使用指纹数据，硬件令牌（hardware token）或应用程序（APP）即可轻松访问服务。</b></p><p><br></p><figure><img src=\"https://pic2.zhimg.com/v2-e0f05eb79ec301c5fd139e9e0915d95d_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"558\" data-rawheight=\"315\" data-watermark=\"\" data-original-src=\"\" data-watermark-src=\"\" data-private-watermark-src=\"\" class=\"origin_image zh-lightbox-thumb\" width=\"558\" data-original=\"https://pic2.zhimg.com/v2-e0f05eb79ec301c5fd139e9e0915d95d_r.jpg\"></figure><p><br></p><p>“对于用户来说，会有一个自然的过渡。现在大家已经对用手指或脸部“解锁”手机和个人电脑习以为常，而且也更方便，”参与建立该标准的FIDO联盟执行董事Brett McDowell表示。</p><p>“他们今天使用的“解锁”功能将很快允许他们登录所有喜爱的网站。”例如eBay和PayPal已经宣布支持该项标准。</p><p><b>密码是网络安全的弱点之一。</b></p><p>黑客可能会盗用目标的密码并登录其帐户，或者从一次数据泄露中获取密码，并将其用于破解另一个网站的帐户。</p><p>Web身份验证（WebAuthn）登录标准将使潜在的任何网站或在线服务使用APP或生物特征识别作为登录方法，而不再使用密码。</p><p><br></p><figure><img src=\"https://pic3.zhimg.com/v2-ec7908e113196dc9d1085c056032b2d5_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"558\" data-rawheight=\"316\" data-watermark=\"\" data-original-src=\"\" data-watermark-src=\"\" data-private-watermark-src=\"\" class=\"origin_image zh-lightbox-thumb\" width=\"558\" data-original=\"https://pic3.zhimg.com/v2-ec7908e113196dc9d1085c056032b2d5_r.jpg\"></figure><p><br></p><p>目前WebAuthn身份验证已经在Mozilla的火狐浏览器中提供，并将在未来几个月内推广到微软的Edge和谷歌Chrome，Opera也承诺支持WebAuthn。</p><p>“我们无法在时间表上肯定任何细节。Chrome支持FIDO和WebAuthn计划，我们希望在2018年晚些时候实现这一功能，”Google的身份和安全产品经理Christiaan Brand在一封电子邮件中表示。</p><p>微软也在一份声明中称，它将“致力于在Edge中增加对WebAuthn的支持。你可以通过加入Windows Insider计划来获得更早的访问权限，并关注Windows Insider Program博客以获取最新信息。”</p><p>至于苹果，Safari、Mail和App Store使用的浏览器引擎Webkit背后的团队最近成立了一个相关的工作组。未来Safari同样会支持WebAuthn，现在 iOS上的本地应用程序已经可以使用来自FIDO的认证工具。</p><p>这里的关键是程序开发人员能轻松接受并扩大该标准的使用，同时兼容不同品牌的浏览器。</p><p>如果网站开发者想要利用这个新标准，他们可以开始将JavaScript API的支持加入登录功能中。</p><p>“这很容易，因为已经有开源和商业服务器可用，”Google的开发人员补充说。</p><p>另一个难题是：消费者实际登录网站时，需要某种设备或应用程序辅助。</p><p>考虑到这一点，“本月晚些时候，谷歌和微软都在向各自的生态系统展示FIDO2。所有Windows 10设备都将通过其Windows Hello身份验证套件具备此功能。大多数Android版本可能很快就会通过Android Fingerprint API发挥作用。</p><p>当然，就像任何网络安全一样，研究人员仍会围绕WebAuthn寻找其漏洞。例如最近发现Chrome中的一项称为WebUSB的功能，可能会让黑客窃取用于登录服务的硬件令牌生成的代码。</p><p><br></p><figure><img src=\"https://pic1.zhimg.com/v2-b680678b380800d7ec66225f92dd2c4d_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"558\" data-rawheight=\"465\" data-watermark=\"\" data-original-src=\"\" data-watermark-src=\"\" data-private-watermark-src=\"\" class=\"origin_image zh-lightbox-thumb\" width=\"558\" data-original=\"https://pic1.zhimg.com/v2-b680678b380800d7ec66225f92dd2c4d_r.jpg\"></figure><p><br></p><p>WebAuthn标准至今已经筹备了3年多，<b>相信在未来一两年内将很快实现用指纹识别登录你的邮箱。</b></p><p><br></p><a href=\"http://link.zhihu.com/?target=http://www.wttech.org/\" data-draft-node=\"block\" data-draft-type=\"link-card\" data-image=\"https://pic3.zhimg.com/v2-39d097f670477b2619366643ec1fcc5a_ipico.jpg\" data-image-width=\"150\" data-image-height=\"150\" class=\" wrap external\" target=\"_blank\" rel=\"nofollow noreferrer\">WTT资讯-最新科技资讯，实时网安信息</a><figure><img src=\"https://pic4.zhimg.com/v2-91bf6184731dd82569ea585eae0808b0_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"600\" data-rawheight=\"368\" data-watermark=\"\" data-original-src=\"\" data-watermark-src=\"\" data-private-watermark-src=\"\" class=\"origin_image zh-lightbox-thumb\" width=\"600\" data-original=\"https://pic4.zhimg.com/v2-91bf6184731dd82569ea585eae0808b0_r.jpg\"></figure><p>欢迎关注我们：</p><p><a href=\"https://www.zhihu.com/people/e4b4cee7b40937dd5b3c9afd105e527d\" class=\"internal\">@W-Pwn</a> </p>',
    '周二，包括微软、谷歌、火狐等顶级浏览器厂商在内的组织和企业宣布了一项新的里程碑式的标准——WebAuthn。该标准将简化Web开发人员向其网站添加额外登录方法的过程，从而更好地保护消费者的帐户和数据安全。 通过WebAuthn，用户无需密码，使用指纹数据，硬件令…',
    255,
    123,
    11,
    '媒体',
    'https://api.zhihu.com/topics/19550415',
    '杨博',
    'https://api.zhihu.com/people/14bf746b5c6a28a776ed8b1a57917b86',
    '小样',
    'https://pic1.zhimg.com/aadd7b895_s.jpg',
    '来自话题: ',
    'https://pic1.zhimg.com/50/v2-95e01727cce0774237d0949f4e9d45a3_200x112.jpg'
  ),
  (
    3,
    '纹身师拒绝麻醉，其实是为了不害你',
    '<p>很多人咬咬牙准备接受大面积图案后，</p><p>在做图的某个时刻都会提出一个要求，</p><p><b>“ 师傅，我不行了，想用麻药 ”</b></p><figure><img src=\"https://pic1.zhimg.com/v2-1adaac05cc6e5a56f91dca2e0f0148a7_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"564\" data-rawheight=\"563\" class=\"origin_image zh-lightbox-thumb\" width=\"564\" data-original=\"https://pic1.zhimg.com/v2-1adaac05cc6e5a56f91dca2e0f0148a7_r.jpg\"></figure><p>当然！</p><p>大部分情况下，你会被拒绝。<br></p><h2><b>纹身师拒绝给你用麻药？是为了不害你！</b></h2><figure><img src=\"https://pic1.zhimg.com/v2-d29e2ceb0dcd101f4e1dcc3829d8654e_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"564\" data-rawheight=\"846\" class=\"origin_image zh-lightbox-thumb\" width=\"564\" data-original=\"https://pic1.zhimg.com/v2-d29e2ceb0dcd101f4e1dcc3829d8654e_r.jpg\"></figure><p>纹身就是痛定思痛的抉择，</p><p><b>“ 不疼的纹身不叫纹身叫鸡汤 ”</b> </p><p>接下来告诉你为什么</p><p><br></p><p>正常纹身后，皮肤毛孔处于张开状态，敷麻皮肤表皮会出现毛孔<b>堵塞现象</b>，会直接影响恢复<b>周期加长</b>。</p><p><br></p><p>麻药更会使皮肤<b>表皮硬化</b>，皮肤失去原有弹性和韧性，针无法刺过表皮层，加大上色难度。</p><figure><img src=\"https://pic1.zhimg.com/v2-8e9cccea9804f84391cb3233ce70b199_b.gif\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"493\" data-rawheight=\"302\" data-thumbnail=\"https://pic1.zhimg.com/v2-8e9cccea9804f84391cb3233ce70b199_b.jpg\" class=\"origin_image zh-lightbox-thumb\" width=\"493\" data-original=\"https://pic1.zhimg.com/v2-8e9cccea9804f84391cb3233ce70b199_r.gif\"></figure><p>皮肤也会比平时更加红肿，这些状况都会误导纹身师，影响纹身做图力度力度易<b>造成皮损</b>。</p><p><br></p><p>皮损的后果就是：恢复慢、结痂厚、晕色、甚至增生。如果客人不注意保养，还会严重掉色。</p><figure><img src=\"https://pic4.zhimg.com/v2-07ab2abfe42873bdce8193ed7188b489_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"564\" data-rawheight=\"787\" class=\"origin_image zh-lightbox-thumb\" width=\"564\" data-original=\"https://pic4.zhimg.com/v2-07ab2abfe42873bdce8193ed7188b489_r.jpg\"></figure><p>而这种不匀称掉色，很难再通过补色变好看。目前国家已有禁用麻药通知 ，使用麻醉剂产品是要执照的，麻醉剂在我国属于处方药，只有职业医师取得。</p><p><br></p><p><b>麻醉药品和第一类精神药品的 ，处方资格后才可以通过正规渠道购货 。</b></p><figure><img src=\"https://pic4.zhimg.com/v2-afd1a5aa12606d4765fb17439c4ece46_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"564\" data-rawheight=\"851\" class=\"origin_image zh-lightbox-thumb\" width=\"564\" data-original=\"https://pic4.zhimg.com/v2-afd1a5aa12606d4765fb17439c4ece46_r.jpg\"></figure><p>结合以上成效纹身成效问题！能上麻醉的的纹身店，他是什么渠道得来的麻药？这样的产品用在皮肤上？不是心大，是自杀！</p><figure><img src=\"https://pic3.zhimg.com/v2-bcc9efddbc83b15d9ad8e812ff3076f4_b.jpg\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"475\" data-rawheight=\"488\" class=\"origin_image zh-lightbox-thumb\" width=\"475\" data-original=\"https://pic3.zhimg.com/v2-bcc9efddbc83b15d9ad8e812ff3076f4_r.jpg\"></figure><p>关于纹身，不管，管外界如何。</p><p>纹身师始终坚持拒绝使用麻药！</p><p><br></p><p>麻药纹身的必需品，痛楚的过程是纹身的价值之一。</p><p>较大面积的图案，都是进行多次然后完工。</p><p>再美的花也要等待，才能尽情绽放。</p><p><br></p><p>纹身没有别人说的那么疼，</p><p>就算痛，也是纹身存在的价值。</p><p>纹身是不要麻醉的，这辈子都不要麻醉的。</p>',
    '很多人咬咬牙准备接受大面积图案后， 在做图的某个时刻都会提出一个要求， “ 师傅，我不行了，想用麻药 ” 当然！ 大部分情况下，你会被拒绝。 纹身师拒绝给你用麻药？是为了不害你！ 纹身就是痛定思痛的抉择， “ 不疼的纹身不叫纹身叫鸡汤 ” 接下来告诉你为…',
    255,
    123,
    11,
    '前端开发',
    'https://api.zhihu.com/topics/19550415',
    '匿名用户',
    'https://api.zhihu.com/people/14bf746b5c6a28a776ed8b1a57917b86',
    '小气',
    '',
    '热门内容, 来自: ',
    ''
  );

-- 定制语言
DROP TABLE IF EXISTS subscribeCodeStatus;
CREATE TABLE subscribeCodeStatus(
  id INT (12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR (255) NOT NULL,
  img VARCHAR (255) NOT NULL,
  checked VARCHAR (255) NOT NULL
)DEFAULT charset=utf8;

INSERT INTO subscribeCodeStatus
(id, title, img, checked)
VALUES
(1, 'Vue', '/static/img/tags-lang1.png', 'false'),
(2, 'JavaScript', '/static/img/tags-lang2.png', 'false'),
(3, 'C++', '/static/img/tags-lang3.png', 'false'),
(4, 'SQL', '/static/img/tags-lang4.png', 'false'),
(5, 'PHP', '/static/img/tags-lang5.png', 'false'),
(6, 'CSS', '/static/img/tags-lang6.png', 'false'),
(7, 'JAVA', '/static/img/tags-lang7.png', 'false'),
(8, 'C', '/static/img/tags-lang8.png', 'false'),
(9, 'Python', '/static/img/tags-lang9.png', 'false');

DROP TABLE IF EXISTS repoList;
CREATE TABLE repoList(
  id INT (12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  userName VARCHAR (255) NOT NULL,
  userUrl VARCHAR (255) NOT NULL,
  userAvatarUrl VARCHAR (255) NOT NULL,
  repoName VARCHAR (255) NOT NULL,
  description VARCHAR (255) NOT NULL,
  language VARCHAR (255) NOT NULL,
  languages VARCHAR (255) NOT NULL,
  stars VARCHAR (255) NOT NULL,
  fork VARCHAR (255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO subscribeCodeStatus
  (id, userId, userName, userUrl, userAvatarUrl, repoName, description, language, languages, stars, fork, url, createdAt, updatedAt)
VALUES
  (1, 12, 'Rich-Harris', 'https://github.com/Rich-Harris', '/static/img/tags-lang9.png', 'port-authority', 'Utilities for dealing with ports in Node apps', 'TypeScript', '', '22', '44', 'https://github.com/Rich-Harris/port-authority', '2018-03-05 00:00:00', '2018-03-05 00:00:00');


select a.taobao_tid, a.order_min_id, a.pay_time, a.buyer_nick, a.bill_refund, sum(b.sell_number) as sell_number, b.sell_price, b.sell_express_fee, b.refund_num, b.refund_fee, b.seller_return_msg, b.delivery_return_msg, b.refund_created, b.refund_reason, b.outer_id, b.product_brand_id
from cdb_order_taobao a, cdb_order_product b
where a.taobao_tid=b.taobao_tid and a.sell_shop=b.sell_shop and a.exclude_state!='shuadan' and a.return_nosend_num>0 and b.refund_trade_status in ('WAIT_SELLER_SEND_GOODS','TRADE_CLOSED') and b.refund_status='SUCCESS' and a.pay_time>='2018-02-25 00:00:00' and a.pay_time<='2018-03-27 23:59:59' and a.sell_shop='木木兔鞋类专营店'
group by a.taobao_tid,b.outer_id
order by a.pay_time desc

select a.taobao_tid, a.order_min_id, a.pay_time, a.buyer_nick, a.bill_refund, sum(b.sell_number) as sell_number, b.sell_price, b.sell_express_fee, b.refund_num, b.refund_fee, b.seller_return_msg, b.delivery_return_msg, b.refund_created, b.refund_reason, b.outer_id, b.product_brand_id
from cdb_order_taobao a, cdb_order_product b
where a.taobao_tid=b.taobao_tid and a.sell_shop=b.sell_shop and a.exclude_state!='shuadan' and a.return_nosend_num>0 and b.refund_trade_status in ('WAIT_SELLER_SEND_GOODS','TRADE_CLOSED') and b.refund_status='SUCCESS' and a.pay_time>='2018-02-25 00:00:00' and a.pay_time<='2018-03-27 23:59:59' and a.sell_shop='木木兔鞋类专营店'
group by a.taobao_tid,b.outer_id
order by a.pay_time desc

select sell_shop, taobao_tid, order_min_id, end_time, trade_status, sell_number, pay_time, sell_price, sell_express_fee, bill_money
from cdb_order_taobao
where exclude_state='shuadan' and exclude_type=1 and trade_status='TRADE_FINISHED' and pay_time>='2018-02-25 00:00:00' and pay_time<='2018-03-27 23:59:59' and sell_shop='木木兔鞋类专营店'
order by pay_time desc