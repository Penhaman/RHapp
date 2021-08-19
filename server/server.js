const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const path = require('path');
const mysql = require('mysql');
/*const routes =  require('./src/routes');*/

const app = express();
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'user',
    password: 'password'
});
connection.connect(function(e){
    if(e) throw e;
    console.log('Connected!')
})
  
const port = process.env.PORT || 5000;
