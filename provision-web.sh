#!/bin/bash

#UPDATE UBUNTU
sudo apt-get update;
apt-get -f install
 
#Install Packages
##nginx
sudo apt-get install nginx nano git gcc htop --yes

#write vhosts Angular project nodejs
VHOST_ANGULAR="/etc/nginx/conf.d/angular.conf"
sudo rm -rf ${VHOST_ANGULAR};

sudo cat << 'EOF' > ${VHOST_ANGULAR}
server {
	listen       80;
	server_name  webstrator.local;

	root         /var/www;
	index index.html;

	access_log  /var/log/nginx/access-criatip.log;
	error_log  /var/log/nginx/error-criatip.log;

	location / {
		root    /var/www;
		index   index.html;
		proxy_pass http://localhost:9000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
	}
}
EOF

#write vhosts Angular nodejs grunt livereload
VHOST_LIVERELOAD="/etc/nginx/conf.d/livereload.conf"
sudo rm -rf ${VHOST_LIVERELOAD};

sudo cat << 'EOF' > ${VHOST_LIVERELOAD}
server {
    listen       80;
    server_name  live.webstrator.local;

    root         /var/www;
    index index.html;

    access_log  /var/log/nginx/access-criatip.log;
    error_log  /var/log/nginx/error-criatip.log;

    location / {
        root    /var/www;
        index   index.html;
        proxy_pass http://localhost:35729;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
    }
}
EOF


sudo /etc/init.d/nginx restart; 

#NodeJS
sudo apt-get update -y
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install python-software-properties -y
sudo apt-add-repository ppa:chris-lea/node.js -y 
sudo apt-get update -y

sudo apt-get install nodejs build-essential libssl-dev -y 
sudo apt-get autoremove -y
sudo apt-get update -y 
sudo npm install -y
sudo npm install -g yo
sudo npm install -g yo bower grunt grunt-cli gulp
sudo npm install -g generator-angular

sudo npm update