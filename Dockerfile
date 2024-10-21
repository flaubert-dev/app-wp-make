FROM wordpress:6.6-php8.2
RUN docker-php-ext-install pdo_mysql mysqli
