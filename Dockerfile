FROM httpd:latest AS base


# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build gems and node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl build-essential git node-gyp pkg-config python-is-python3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install JavaScript dependencies
ARG NODE_VERSION=22.2.0
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    rm -rf /tmp/node-build-master

# Install node modules
COPY vite-project ./vite-project
RUN cd vite-project && npm install && npm run build
RUN rm -rf node_modules

# Final stage for app image
FROM base

# Copy local files
COPY cgi-bin/ /usr/local/apache2/cgi-bin/
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# Copy built artifacts: htdoc contents
COPY --from=build /usr/local/apache2/htdocs/ /usr/local/apache2/htdocs/
