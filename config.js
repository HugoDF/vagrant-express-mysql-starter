module.exports = () => {
  require('dotenv').config();
  PORT = process.env.PORT || 3000;

  dbOptions = {
    host: 'localhost',
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    port: 3306,
    database: process.env.DB_NAME 
  }
  return {
    PORT,
    dbOptions
  }
}
