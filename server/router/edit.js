'use strict'
var express = require('express');
var router = express.Router();
const mysql = require('mysql');
const con = mysql.createConnection({
  host:'localhost',
  user:'root',
  password:'',
  database:'myapp'
})

router.post('/edit_submit', (req, res) => {
  console.log(req, res);
})