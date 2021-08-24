const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const path = require('path');
const mysql = require('mysql2');
const routes =  require('./src/routes');

const app = express();
const connection = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'user',
    password: 'password',
    database: 'RHApp'
    
});
connection.connect(function(err){
    if(err){
      console.log('Error connecting to Db');
      return;
    }
    console.log('Connection established');
  });

const port = process.env.PORT || 5000;


app.use(cors());
app.use(cookieParser());
app.use(express.json());
app.use(routes);

app.listen(port,function(){
  console.log(`Server up and running on port ${port}`)
});