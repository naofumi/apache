FROM httpd:latest

COPY htdocs/ /usr/local/apache2/htdocs/

COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
