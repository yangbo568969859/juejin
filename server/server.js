// 'use strict'
// const express = require('express');
// const server = express();
// const port = 18088;

// const mysql = require('mysql');
// const bodyParser = require('body-parser');

// // 登录路由
// const login=require('./router/login')
// // 首页路由
// const home = require('./router/home')
// // 编辑文章 写文章路由
// const edit = require('./router/edit')

// const con = mysql.createConnection({
//   host: 'localhost',
//   user: 'root',
//   password: '',
//   database: 'myapp'
// })


// server.use(express.static('./public'));
// server.use(bodyParser.json());

// server.use('/api/login', login);

// server.listen(port);


const express = require('express');
const request = require('request');
const server = express();
const port = 4446;
const path = require('path');
const mysql = require('mysql');
const bodyparser = require('body-parser');
const router = express.Router();
const con = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  pass: '',
  database: 'myapp',
})

const githubConfig = {
  // 客户id
  client_ID: 'e0354015017ebd32facf',
  // 客户密匙
  client_Secret: '01b7cb550616e99480886ca231fbdbe0681d9b56',
  // 获取access_token
  // eg: https://github.com/login/oauth/access_token?client_id=&client_secret=
  access_token_url: 'https://github.com/login/oauth/access_token',
  // 获取用户信息
  user_info_url: 'https://api.github.com/user?',
  // 回调地址
  redirect_uri: 'http://localhost:8888/api/git_login'
}

server.use(bodyparser.json());
server.use(express.static('./public'));
server.get('/', (req, res) => {
  res.sendFile(path.resolve('./index.html'));
});
// 登录账号验证
server.post('/api/login', (req, res) => {
  let sql = 'select  user_name, user_nickname, user_image, user_phone from my_user where user_phone=? and user_password=?';
  con.query(sql, [req.body.phone, req.body.password], (err, result) => {
    if (err) {
      res.json({ successful: false, message: '错误' })
    } else {
      if (result.length === 0) {
        res.json({ successful: false, message: '账号或密码错误' });
      } else {
        res.json({
          successful: true,
          message: '登陆成功',
          data: result[0]
        });
        // let sql = 'select * from store where uid=? ';
        // con.query(sql, [result[0].id], (err, r) => {
        //   if (r.length) {
        //     res.json({ code: 2, message: '登陆成功', data: result[0], active: true });
        //   } else {
        //     res.json({ code: 2, message: '登陆成功', data: result[0], active: false });
        //   }
        // })
      }
    }
  })
})
server.get('/api/login', (req, res) => {
  let sql = 'select  user_name, user_nickname, user_image, user_phone from my_user where user_phone=? and user_password=?';
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})
server.get('/api/git_login', (req, res, next) => {
  var param = req.query || req.params;
  var code = param.code || '';
  if (code == '') {
    res.end(JSON.stringify({
      msg: '请传入正确的参数',
      status: 103
    }));
    return;
  }
  request({
    url: githubConfig.access_token_url,
    form: {
      client_id: githubConfig.client_ID,
      client_secret: githubConfig.client_Secret,
      code: code,
      redirect_uri: githubConfig.redirect_uri
    }
  },
  function (error, response, body) {
    if (!error && response.statusCode == 200) {
      var urlStr = githubConfig.user_info_url + body;
      request({
        url: urlStr,
        headers: {
          'User-Agent': 'zhuming3834'
        }
      },
      function (error, response, resbody) {
        if (!error) {
          res.json({
            msg: '获取成功',
            status: 100,
            data: JSON.parse(resbody)
          })
          // res.end(JSON.stringify({
          //   msg: '获取成功',
          //   status: 100,
          //   data: JSON.parse(resbody)
          // }));
        } else {
          res.json({
            msg: '获取用户信息失败',
            status: 102,
          })
          // res.end(JSON.stringify({
          //   msg: '获取用户信息失败',
          //   status: 102
          // }));
        }
      })
    } else {
      res.json({
        msg: '获取用户信息失败',
        status: 101,
      })
      // res.end(JSON.stringify({
      //   msg: '获取用户信息失败',
      //   status: 101
      // }));
    }
  })
})

// 注册账号检测
server.post('/api/register', (req, res) => {
  let sql = 'insert into user (account,pass) values (?,?)'
  con.query(sql, [req.body.account, req.body.pass], (err, result) => {
    if (err) {
      if (err.message.startsWith('ER_DUP_ENTRY')) {
        res.json({ code: 4, message: '账号已存在' });
      }
    } else {
      res.json({ code: 2, message: 'ok' });
    }
  })
})

// 获取类目
server.post('/api/category', (req, res) => {
  let sql = 'select * from categorylist'
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取关注标签
server.get('/api/subscribe', (req, res) => {
  let sql = 'select id, title, createdAt, updatedAt, color, icon, background, showOnNav, isSubscribe, entryCount, subscribersCount, isCategory from categorylist'
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取未关注标签
server.get('/api/subscribed', (req, res) => {
  let sql = 'select id, title, createdAt, updatedAt, color, icon, background, showOnNav, isSubscribe, entryCount, subscribersCount, isCategory from categorylist where isSubscribe = 1'
  con.query(sql, (err, result) => {
    if (!err) {
      // result.data.forEach(v => {
      //   v.isSubscribe = v.isSubscribe?true:false;
      // })
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取订阅列表
server.get('/api/subscribecode', (req, res) => {
  let sql = 'select id, title, icon, isSubscribe from subscribe'
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

//  获取banner列表
server.get('/api/bannerlist', (req, res) => {
  let sql = 'select id, author, content, screenshot, title, url, summaryInfo, lastCommentTime from bannerlist'
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取活动列表
server.get('/api/eventslist', (req, res) => {
  let sql = 'select _id,eventUrl,title,userId,startTime,endTime,city,cityAlias,screenshot,showBanner,bannerStartTime,bannerEndTime,createdAt,updatedAt,category from eventslist'
  con.query(sql, (err, result) => {
    if (!err) {
      // result.data.forEach(v => {
      //   v.isSubscribe = v.isSubscribe?true:false;
      // })
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取城市列表
server.get('/api/citylist', (req, res) => {
  let sql = 'select id, cityName, weight, cityAlias from citylist';
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取git库列表
server.get('/api/customrepos', (req, res) => {
  let sql = 'select id, objectId, userId, userName, userUrl, userAvatarUrl, repoName, description, language, stars, fork, url, pushedAt, createdAt, updatedAt, localCreatedAt, localUpdatedAt from customrepos';
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取用户信息
server.get('/api/getusermessage', (req, res) => {
  let sql = 'select id, type, url, title, author_name from usermessage';
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})

// 获取推荐列表
server.get('/api/recommendlist', (req, res) => {
  let sql = 'select checked, id, title, content, excerpt_new, comment_count, voteup_count, thanks_count, actors_name, actors_url, author_name, author_url, author_headline, author_avatar_url, action_text_tpl, thumbnail from recommendlist';
  con.query(sql, (err, result) => {
    if (!err) {
      res.json({
        successful: true,
        data: result
      })
    }
  })
})


// 用户
// 用户登录  通过验证码登录（有账号登录，没有账号注册登录）
server.post('/api/get_c_user_login', (req, res) => {
  if (req.body.check == '111111') {
    let sql = 'select * from c_user where account=?'
    con.query(sql, [req.body.account], (err, result) => {
      if (result.length) {
        res.json({ code: 2, data: result[0].id, message: 'ok' })
      } else {
        let sql = 'insert into c_user (account) values (?)'
        con.query(sql, [req.body.account], (err, r) => {
          if (!err) {
            res.json({ code: 2, data: r.insertId, message: '注册成功' })
          }
        })
      }
    })
  }
})
// 个人中心获取电话号码
server.get('/api/get_c_user_account', (req, res) => {
  let sql = 'select * from c_user where id=?'
  con.query(sql, [req.query.id], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})

// 用户注册
server.post('/api/register_c_user', (req, res) => {
  if (req.body.check == '111111') {
    let sql = 'insert into c_user (account,pass) values (?,?)'
    con.query(sql, [req.body.account, req.body.pass], (err, r) => {
      if (!err) {
        if (r.length) {
          res.json({ code: 4, data: r.affectedRows, message: '已经注册' });
        } else {
          res.json({ code: 2, data: r.affectedRows, message: 'ok' });
        }
      } else {
        console.log(err.message);
      }
    })
  }
})
// 用户地址submit
server.post('/api/submit_address', (req, res) => {
  let sql = 'insert into c_user_address (uid,name,phone,address) values (?,?,?,?)'
  con.query(sql, [req.body.uid, req.body.name, req.body.phone, req.body.address], (err, result) => {
    if (!err) {
      res.json({ code: 2, data: result.affectedRows, message: 'ok' });
    }
  })
})
// 用户地址列表
server.get('/api/get_address', (req, res) => {
  let sql = 'select * from c_user_address where uid=?'
  con.query(sql, [req.query.uid], (err, result) => {
    if (!err) {
      res.json({ code: 2, data: result, message: 'ok' })
    }
  })
})
// 用户设置默认地址
server.get('/api/set_default', (req, res) => {
  let sql = 'update c_user_address set is_default=0 where uid=?'
  con.query(sql, [req.query.uid], (err, result) => {
    if (!err) {
      let sql = 'update c_user_address set is_default=1 where id= ?'
      con.query(sql, [req.query.id], (err, r) => {
        if (!err) {
          res.json({ code: 2, data: r[0], message: 'ok' })
        }
      })
    }
  })
})
// 结算页面地址显示
server.get('/api/show_address_jiesuan', (req, res) => {
  let sql = 'select * from c_user_address where uid=? and is_default=1'
  con.query(sql, [req.query.uid], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})

// 商家
// 展示goods表
server.get('/api/get_goods_by_cid', (req, res) => {
  let sql = 'select * from goods where cid=?'
  con.query(sql, [req.query.cid], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})
// 点击进入goods详情
server.get('/api/get_goods_byid', (req, res) => {
  let sql = 'select * from goods where id=?'
  con.query(sql, [req.query.id], (err, result) => {
    if (!err) {
      res.json(result);
      // res.json({code:2,data:result,message:'ok'});
    }
  })
})
// 通过goods 的id 来查找商店信息
server.get('/api/get_store_by_goodsid', (req, res) => {
  let sql = "select * from store where id = ?"
  con.query(sql, [req.query.id], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})
// 获取商店信息
server.get('/api/get_store', (req, res) => {
  let sql = 'select * from store where id=?'
  con.query(sql, [req.query.id], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})
// /api/get_store_by_fenlei_id  通过分类id获取商店列表
server.get('/api/get_store_by_fenlei_id', (req, res) => {
  let sql = 'select * from store where fenlei_id=?'
  con.query(sql, [req.query.fenlei_id], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})
// 获取商家的所有goods
server.get('/api/get_goods_bysid', (req, res) => {
  let sql = 'select * from goods where sid=?'
  con.query(sql, [req.query.sid], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})
// 通过传过来的sid 来确定id对应的商店信息
server.get('/api/get_storeinfo_by_id', (req, res) => {
  let sql = 'select * from store where id=?'
  con.query(sql, [req.query.id], (err, result) => {
    if (!err) {
      res.json(result);
    }
  })
})

server.listen(4446, () => {
  console.log(`服务器启动在${port}端口`);
})
