echo -e "\nSet MySQL default creds"

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password defaultPassword'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password defaultPassword'

echo -e "\nAdd repositories for nginx and node"

sudo add-apt-repository -y ppa:nginx/stable
sudo wget -qO- https://deb.nodesource.com/setup_6.x | sudo bash -
# this is run as part of the nodesource setup sudo apt-get update

echo -e "\nInstall toolchain"

sudo apt-get install -y make g++ libssl-dev git

echo -e "\nInstall dependencise"

sudo apt-get install -y nginx
sudo apt-get install -y nodejs
sudo apt-get install -y mysql-server

echo -e "\nSetup nginx"

sudo cp /var/www/express-mysql-starter/infra/nginx.conf /etc/nginx/sites-available/app.conf
sudo chmod 644 /etc/nginx/sites-available/app.conf
sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
sudo service nginx restart

echo -e "\nSetup app"

cd /var/www/express-mysql-starter

npm i

echo -e "\nCreate database"

npm run migrate db:create express-mysql-starter -- --env=setup

echo -e "\nMigrate database"

npm run migrate up

echo "\\nSetup PM2"

sudo npm i -g pm2
sudo su -c "env PATH=$PATH:/usr/bin pm2 startup linux -u vagrant --hp /home/vagrant"
pm2 start ./infra/pm2_run_app.json
pm2 save

