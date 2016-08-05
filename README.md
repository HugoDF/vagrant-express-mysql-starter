# Vagrant Express MySQL Starter

## Set up

`git clone` the repository.

`cd express-mysql-starter`

`npm install`

`cp .env.example .env`

`vagrant up` (this takes some time since we're spinning up a new Ubuntu virtual machine with Node/MySQL)

You should now be able to access `http://192.168.10.11/` and see `Welcome to express-mysql-starter`.

Add `192.168.10.11 express-starter.local` to `/etc/hosts` to be able to access the app at `http://express-start.local`.

Next we need to set up the database:

`vagrant ssh` to ssh into the box

`npm run migrate up` will migrate database with `DB_NAME` to the latest schema.

## Technology

- Express
- MySQL
- db-migrate (for database migrations)
- Node v6
- Vagrant/VirtualBox (Ubuntu 14.04)
- PM2 (process management)

## `infra`

The `infra` folder contains the setup script (`init.sh`), and the PM2 and nginx configs.

## `config.js`

Use a require of `config.js` to use this function to get config variables.
