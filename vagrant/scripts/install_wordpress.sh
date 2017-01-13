#/bin/sh

sudo mkdir -p /var/www/html
sudo rm -r /var/www/html/*
sudo chown -R vagrant:vagrant /var/www/html/
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

wp core download --version=4.1
wp core config --dbname=wordpress --dbuser=root --dbpass=toor
wp db create
wp core install \
	--url=wordpress-exploit.dev \
	--title="Wordpress exploit" \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=info@wp-cli.org
wp plugin install /vagrant/files/plugin/download-manager.zip
wp plugin activate download-manager

sudo chmod a+w /var/www/html/wp-content/plugins -R
