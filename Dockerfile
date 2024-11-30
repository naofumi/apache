FROM httpd:latest

COPY htdocs/ /usr/local/apache2/htdocs/
COPY cgi-bin/ /usr/local/apache2/cgi-bin/

COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf

