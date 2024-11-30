# Apache on Kamal

## Site features

* The path `/` connects to `htdocs/index.html`
* We have a healthcheck on path `/up` implemented at `htdocs/up/index.html`
* `/cgi-bin/perl.cgi` connects to `cgi-bin/perl.cgi`

## Configuration

* Apache configuration available at `conf/httpd.conf`

## Local development

* Start up local dev environment with `docker compose up`
   * Connect to `http://localhost:8080` 
