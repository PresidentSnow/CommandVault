FROM ubuntu:22.04

# Install Apache and essential tools
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        apache2-utils \
        curl \
        vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite ssl headers deflate

# Create directory for SSL certificates
RUN mkdir -p /etc/apache2/ssl

# Copy web content
COPY ./html/ /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

WORKDIR /var/www/html
EXPOSE 80 443