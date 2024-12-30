FROM httpd:latest AS base

# Install Perl packages
RUN apt-get update -qq && \
    apt-get install -y cpanminus make gcc&& \
	cpanm --notest install CGI && \
	cpanm --notest install JSON

# Clean up after package installation
RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Throw-away build stage to reduce size of final image
FROM base AS build

## Install packages needed to build gems and node modules
#RUN apt-get update -qq && \
#    apt-get install --no-install-recommends -y curl build-essential git node-gyp pkg-config python-is-python3
#
## Clean up after package installation
#RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Final stage for app image
FROM base

# Copy local files
COPY cgi-bin/ /usr/local/apache2/cgi-bin/
COPY htdocs/ /usr/local/apache2/htdocs/
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf

