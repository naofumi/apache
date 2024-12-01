# Apache on Kamal

## Site features

* Deployment is built using Vite
  * Allows compiling of things like React
  * Adds digests for cache expiration
* Kamal deployment
  * Healthcheck is required on `/up` 
* Development using Apache
  * Use Apache during development. Don't use Vite server.
    * Vite server does not have the same behaviors nor features as Apache. (e.g., handling of trailing slashes)
  * Vite is used for build only.
  * Contents of `/htdocs` are managed by Vite.
* CGI is available on `/cgi-bin`

## Apache Configuration

* Apache configuration available at `conf/httpd.conf`

## Development environment

* At the project root, run the Apache server with `docker compose up`
* `cd` to `vite-project`
* `npm run build-watch` to automatically build the Vite project and generate files for `/htdocs`
* The site is available on http://localhost:8080

## Deploy

1. Run `bin/integrate` and confirm the page on `http://localhost:8080`
2. Commit the changes to Git 
3. Run `kamal deploy`

## Todo

* Build Vite inside Docker so that we don't have to commit the build files to Git.
