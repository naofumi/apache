# Apache on Kamal

## Purpose

A lot of the websites that we build aren't "web apps" but simple information or promotion sites.
In many cases, just hosting static files is enough.
Web hosting services like Amplify satisfy this need, but you can also just use Apache.

This site if for these kinds of sites.
Additionally, similar to how these sites often use serverless functions for minimal interactivity,
we provide similar features through SSI and CGI.

Deployment is done using Kamal, and we also have a Cloudflare CDN in front of it.

1. Host static websites
2. Minimal dynamic features: CGI scripts with SSI – Perl and Python are available.
3. Asset server (instead of hosting on S3)

## Site features

* Kamal deployment
  * Healthcheck is available on `/up`
* Put HTML and asset files in `/htdoc` 
* CGI is available on `/cgi-bin`
* SSI is enabled

## Apache Configuration

* The Apache configuration is available at `conf/httpd.conf`

## Development environment

* In the project root, run the Apache server with `docker compose up`
* The site is available on http://localhost:8080

* If you have changed `conf/httpd.conf`, then you need to rebuild the Dockerfile so in this case, run the Apache Server with `docker compose up --build`

## Deploy

1. Commit changes to Git
2. Run `kamal deploy`
