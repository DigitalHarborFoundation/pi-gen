#!/bin/bash

apt-get install nginx
mkdir -p /var/www/piportal/html
wget --force-directories --no-parent https://dev.d2d45d2e8yuplw.amplifyapp.com/sitemap.xml --output-document - | egrep -o "https?://[^<]+" | wget -rkpNi - -P /var/www/piportal/html
mv /var/www/piportal/html/piportal.digitalharbor.org/* /var/www/piportal/html/ && rm -rf /var/www/piportal/html/piportal.digitalharbor.org
mv files/nginx.conf.sample /etc/nginx/nginx.conf
mv files/default.sample /etc/nginx/sites-available/default
service nginx reload
