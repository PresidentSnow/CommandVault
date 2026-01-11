FROM ubuntu:24.04

ARG APACHE_UID=118
ARG APACHE_GID=118
ARG APACHE_USER=apache_user

# Install Apache and essential tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        apache2 \
        apache2-utils \
        libapache2-mod-php \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        php \
        php-common \
        php-mysql \
        php-curl \
        php-mbstring \
        php-xml \
        php-zip \
        php-gd \
        php-cli \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN groupadd -r -g ${APACHE_GID} ${APACHE_USER} && \
    useradd -r -u ${APACHE_UID} -g ${APACHE_GID} \
    -s /usr/sbin/nologin -M -d /nonexistent \
    ${APACHE_USER}

# Enable Apache modules
RUN a2enmod rewrite ssl headers deflate

# Create directory for SSL certificates
RUN mkdir -p /etc/apache2/ssl && \
    chown -R ${APACHE_USER}:${APACHE_USER} /etc/apache2/ssl

# Configure apache user for use the new user
RUN echo "export APACHE_RUN_USER=${APACHE_USER}" >> /etc/apache2/envvars && \
    echo "export APACHE_RUN_GROUP=${APACHE_USER}" >> /etc/apache2/envvars

# Copy web content
COPY ./html/ /var/www/html/

# Set proper permissions
RUN chown -R ${APACHE_USER}:${APACHE_USER} /var/www/html
RUN chmod -R 755 /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

WORKDIR /var/www/html
EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]