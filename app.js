const express         = require('express');
const app             = express();

const config          = require('./config');
const { PORT, 
        dbOptions }   = config();

const bodyParser      = require('body-parser');

const mysql           = require('mysql');
const dbConnection    = require('express-myconnection');


// Set up middlewares
app.use(bodyParser.json());
app.use(dbConnection(mysql, dbOptions, 'request'));

app.get('/', (req, res, next) => {
  res.send('<div style="font-family:Helvetic, sans-serif; font-weight: 300">Welcome to express-mysql-starter</div>');
});

app.listen(PORT, () => {
  console.log(`Express-mysql-starter listening on port ${PORT}!`);
});
