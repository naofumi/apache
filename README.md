# Apache on Kamal

## Site features

* The path `/` connects to `htdocs/index.html`
* We have a healthcheck on path `/up` implemented at `htdocs/up/index.html`
* `/cgi-bin/perl.cgi` connects to `cgi-bin/perl.cgi`

## Configuration

* Apache configuration available at `conf/httpd.conf`

## Run Development environment

The pages under `htdocs` are generated using Vite.

* CD to `vite-project`
* `npm run dev` to start up the Vite development environment.
* Monitor the page on http://localhost:5173

## Run Integration environment

1. Start the Apache server with `docker compose`
2. Run `bin/integrate`
   1. This will build the vite project into `/htdocs` 
3. Confirm the page on `http://localhost:8080`

## Deploy

1. Run `bin/integrate` and confirm the page on `http://localhost:8080`
2. Commit the changes to Git 
3. Run `kamal deploy`

## Todo

* Build Vite inside Docker so that we don't have to commit the build files to Git.
