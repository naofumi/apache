# Apache on Kamal

## Purpose

This is a static website hosted on Apache. We use SSI and CGI for interactivity.

Deployment is done using Kamal.

1. Host static websites
2. Minimal dynamic features: CGI scripts and SSI
3. Asset server for other websites (I use it instead of hosting assets on S3).

## Site features

* Kamal deployment
  * Healthcheck is available on `/up`
* Put HTML and asset files in `/htdoc` 
* CGI is available on `/cgi-bin`
* SSI is enabled

## CGI performance

Tests performed on site hosted on Sakura Internet VPS. No CDN for HTML files but proxied through Cloudflare.

As you can see, CGI can handle a significant number of concurrent requests just fine.

```shell
# Static HTML
ab -n 100 -c 20 http://apache.castle104.com/kanagawa-rb/about/ 
Requests per second:    194.09 [#/sec] (mean)
Time per request:       103.045 [ms] (mean)

# SSI only
ab -n 100 -c 20 http://apache.castle104.com/kanagawa-rb/
Requests per second:    196.29 [#/sec] (mean)
Time per request:       101.891 [ms] (mean)

# Python CGI vis SSI - parse data from text file
ab -n 100 -c 20 http://apache.castle104.com/kanagawa-rb/recaps/
Requests per second:    201.91 [#/sec] (mean)
Time per request:       99.052 [ms] (mean)
```

## Apache Configuration

* The Apache configuration is available at `conf/httpd.conf`

## Development environment

* In the project root, run the Apache server with `docker compose up`
* The site is available on http://localhost:8080

* If you have changed `conf/httpd.conf`, then you need to rebuild the Dockerfile so in this case, run the Apache Server with `docker compose up --build`

## Deploy

1. Commit changes to Git
2. Run `kamal deploy`

## Details of the Kanagawa.rb setup

The Kanagawa.rb site is mainly static content but has a few dynamic/interactive pages.

1. The Recaps page is dynamically generated from a YAML file using CGI and SSI.
2. The main page has a footer that can be shared among pages with SSI. SSI allows us to ensure consistency across different pages.
3. The inquiry page has a form that is submitted to a CGI script, which then sends a Slack message server-side via the Slack webhooks API.
