# Docker_environment

Repo for manage the Docker images, containers and his environment.

* Tips for docker containers:

  * Create docker users:
    To create a non user without privileges, for specific service or
    docker container. You can run this command for create new user:

    This is just an example; the '115' (UID) can be whatever you want, BUT it's important that it's in the range of 100-999 and not already use by another service or user in your system. On the other hand, the 'wp_user' (username) follows the same rule; it can be whatever you want, but it mustn't already be used by others in your system.

        sudo adduser --system --uid 115 \
            --no-create-home \
            --group \
            --home /var/empty \
            --shell /usr/sbin/nologin \
            wp_user

    If you don't have the 'adduser' command and only have 'useradd', refer to the following syntax:

        sudo useradd -r -u 115 -M -U -d /var/empty -s /usr/sbin/nologin wp_user

    *pd*: use the same UID and GID inside and outside of docker container

  * Create backup of docker containers:
    Steps for save the data from docker containers with mysqldump.

    1. Run the 'sudo docker compose up -d' command if you don't have started the containers yet.

    2. Run the following commands for save all data:

        * Use this command if you want to save all data:

            * docker exec [db_container] mysqldump -u root -p"${MYSQL_ROOT_PWD}" --all-databases > backup.sql

        * Or use this command if you just want to save a specific database:

            * docker exec [db_container] mysqldump -u ${MYSQL_USERD} -p"${MYSQL_PWD}" ${MYSQL_DBD} > my_db.sql

    3. And that's all. You can now either stop the containers or continue with your work.

## Container for Wordpress

* If there's problem with this:

    'The theme directory "twentytwentyfive" does not exist.
    Error: The themes directory is either empty or does not
    exist. Please check your installation.'

  * Do this steps:

    1. docker exec -u root -it wp_app bash

    2. ls -la /var/www/html/wp-content/themes/

    3. apt-get update && apt-get install -y wget

    4. cd /tmp
    5. wget https://wordpress.org/latest.tar.gz

    6. tar -xzf latest.tar.gz

    7. cp -r wordpress/wp-content/themes/* /var/www/html/wp-content/themes/

    8. chown -R [wp_user]:[wp_user] /var/www/html/wp-content/themes/

    9. ls -la /var/www/html/wp-content/themes/

* For change the language of the Wordpress, follow this steps:

    1. Enter the docker container.

    2. Access to the '/var/www/html/wp-content/languages' and if it doesn't exist, created it.

    3. After that, enter in to the folder and execute this:

        wget https://downloads.wordpress.org/translation/core/5.9/es_ES.zip

        Change the '5.9' for whichever version you want or 'es_ES' for whichever language you want.

    4. Decompress the file with unzip.

    5. Remove the .zip file.

    6. rm es_ES.zip

    7. Add in the file '/var/www/html/wp-config.php' INSIDE of the docker container this line:
    define('WPLANG', 'es_ES');

    *IMPORTANT*: put this line BEFORE this line: '/*That's all, stop editing! Happy publishing.*/'

## Container for Apache

* Steps for create SSL certificate:

    1. cd ssl (if the 'ssl' folder doesn't exist, create it)

    2. openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout server.key -out server.crt \
        -subj "/C=EN/ST=London/L=London/O=Test/CN=localhost"

    3. chmod 644 server.crt && chmod 600 server.key

    *pd*: the 'C=', 'ST=', 'L=', 'O=' and 'CN=' values can be whatever you want.
