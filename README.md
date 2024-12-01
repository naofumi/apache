# Apache on Kamal

## Site features

* Deployment files are built using Vite
  * Allows compiling of React
  * Adds digests for cache expiration
* Kamal deployment
  * Healthcheck is required on `/up` 
* Development using Apache
  * Use Apache during development. Don't use Vite server.
    * Vite server does not have the same behaviors nor features as Apache. (e.g., handling of trailing slashes)
  * Vite is used for build only.
* CGI is available on `/cgi-bin`

## Apache Configuration

* Apache configuration available at `conf/httpd.conf`

## Development environment

* At the project root, run the Apache server with `docker compose up`
* `cd` to `vite-project`
* `npm run build-watch` to automatically build the Vite project and generate files for `/htdocs`
* The site is available on http://localhost:8080

## Adding new HTML pages

* As of present, new HTML pages need to be added to `vite.config.js` manually.

## Deploy

1. Commit changes to Git
2. Run `kamal deploy`

## Notes

* Contents of `/htdocs` are managed by Vite.
   * Do not commit this to Git (it is included in `.gitignore`)
   * Do not edit the contents of this directory. Vite will override any changes.
