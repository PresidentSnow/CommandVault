FROM wordpress:latest

ARG WP_UID=115
ARG WP_GID=115
ARG WP_USER=wp_user

# Install PHP extensions and other tools
RUN apt-get update && apt-get install -y \
    nano \
    curl \
    wget \
    less \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create user and personalized
RUN groupadd -g ${WP_GID} ${WP_USER} && \
    useradd -u ${WP_UID} -g ${WP_GID} \
    -s /usr/sbin/nologin -M -d /nonexistent \
    ${WP_USER} && \
    mkdir -p /home/${WP_USER} && \
    chown -R ${WP_USER}:${WP_USER} /home/${WP_USER}

# Create base directories
RUN mkdir -p /var/www/html/wp-content/uploads \
    /var/www/html/wp-content/upgrade \
    /var/www/html/wp-content/cache \
    /var/www/html/wp-content/languages \
    /var/www/html/wp-content/backups && \
    chown -R ${WP_USER}:${WP_USER} /var/www/html && \
    chmod 755 /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

# Specific permissions
RUN chmod -R 775 /var/www/html/wp-content/uploads \
    /var/www/html/wp-content/upgrade \
    /var/www/html/wp-content/cache \
    /var/www/html/wp-content/backups && \
    find /var/www/html/wp-content/uploads \
        /var/www/html/wp-content/upgrade \
        /var/www/html/wp-content/cache \
        /var/www/html/wp-content/backups \
        -type d -exec chmod g+s {} \;

USER ${WP_USER}
WORKDIR /var/www/html
EXPOSE 80