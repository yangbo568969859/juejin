'use strict'
var express = require('express');
var router = express.Router();
const mysql = require('mysql');
// 链接数据库
const con = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'myapp'
});

router.get('/check_account', (req, res)=>{
  var account = req.body.account,
    password = req.body.password;
  let sql = "select * from my_user where user_name=?";
  con.query(sql, [account, password], (err, result)=>{
    if (err) {
      res.json({ code: 4, message: err.message });
    } else {
      if (result.length>0) {
        res.json({ code: 4, message: '账号已存在/该手机号已注册' })
      } else {

      }
    }
  })
})
module.exports = router;
