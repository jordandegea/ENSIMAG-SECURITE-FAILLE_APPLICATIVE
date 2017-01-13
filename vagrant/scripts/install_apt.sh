#/bin/sh
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password toor"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password toor"
sudo apt-get install -y apache2 php5 php5-mysql mysql-server
sudo apt-get install -y curl
sudo service apache2 restart

