# Apache on Kamal

## Purpose

1. Host static websites
2. Use CGI scripts
3. Asset server (instead of hosting on S3)

## Site features

* Kamal deployment
  * Healthcheck is available on `/up`
* Put HTML and asset files in `/htdoc` 
* CGI is available on `/cgi-bin`

## Apache Configuration

* Apache configuration available at `conf/httpd.conf`

## Development environment

* At the project root, run the Apache server with `docker compose up`
* The site is available on http://localhost:8080

## Deploy

1. Commit changes to Git
2. Run `kamal deploy`
