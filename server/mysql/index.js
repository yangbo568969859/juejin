'use strict'
const mysql = require('mysql');

// 链接数据库
const con = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'myapp'
})
module.exports=con;