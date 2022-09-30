#!/usr/bin/env bash
# Script to configure Nginx

apt-get update
apt-get install -y nginx

echo "Hello World!" > /var/www/html/index.html
echo "Resource not available" > /var/www/html/404.html
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

printf %s "server {
	listen 80 default_sever;
	listen [::]:80 default_server;
	root /var/www/html;
	index index html index.htm

	error_page 404 /404.html;
	location /404 {
		root /var/www/html;
		internal;
	}
}" > /etc/nginx/sites-available/default

service nginx restart
