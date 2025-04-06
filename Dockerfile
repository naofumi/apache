FROM httpd:latest AS base

RUN apt-get update -qq

# Install base packages
RUN apt-get install -y cpanminus make gcc python3-pip python3-venv libssl-dev

# Clean up after package installation
RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install Perl packages
RUN cpanm --notest install CGI && \
    cpanm --notest install JSON && \
    cpanm --notest install YAML::XS && \
    cpanm --notest install LWP::UserAgent  && \
    cpanm --notest install LWP::Protocol::https


# Install Python packages in the /py_env environment
RUN python3 -m venv /py_env && \
    . /py_env/bin/activate && \
    pip install pyyaml && \
    pip install requests

# Ensure the virtual environment's Python is prioritized
ENV PATH="/py_env/bin:$PATH"

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

