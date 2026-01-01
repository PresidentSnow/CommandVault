FROM ubuntu:24.04

ARG APACHE_UID=118
ARG APACHE_GID=118
ARG APACHE_USER=apache_user

# Install Apache and essential tools
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        apache2-utils \
        curl \
        vim \
        libapache2-mod-php \
        php \
        php-cli \
        php-common \
        php-mysql \
        php-gd \
        php-curl \
        php-mbstring \
        php-xml \
        php-zip \
        php-json \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN groupadd -g ${APACHE_GID} ${APACHE_USER} && \
    useradd -u ${APACHE_UID} -g ${APACHE_GID} \
    -s /usr/sbin/nologin -M -d /nonexistent \
    ${APACHE_USER}

# Enable Apache modules
RUN a2enmod rewrite ssl headers deflate php8.3

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

# Monitoring
HEALTHCHECK --interval=30s --timeout=3s --start-period=30s --retries=3 \
    CMD curl -f http://localhost || exit 1

USER ${APACHE_USER}
WORKDIR /var/www/html
EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]