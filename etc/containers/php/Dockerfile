FROM php:8.2-fpm

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

WORKDIR /var/www/html/code

# Install dependencies
RUN apt-get update && apt-get install -y \
        libzip-dev \
        libmcrypt-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libonig-dev \
        libicu-dev \
        libevent-dev \
        uuid-dev \
        librabbitmq-dev \
        libssh-dev \
        libgeoip-dev \
        libmemcached-dev \
        librdkafka-dev \
        openssl \
        openssh-server \
        nano \
        git \
        libpng-dev \
        libxml2-dev \
        && rm -rf /var/lib/apt/lists/*

# Install PHP build dependencies
RUN apt-get install -y $PHPIZE_DEPS

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) iconv \
        && docker-php-ext-install pcntl \
        && docker-php-ext-configure intl \
        && docker-php-ext-install intl \
        && docker-php-ext-enable intl \
        && docker-php-ext-install opcache \
        && docker-php-ext-enable opcache \
        && docker-php-ext-install mbstring \
        && docker-php-ext-enable mbstring \
        && docker-php-ext-install zip \
        && docker-php-ext-enable zip \
        && docker-php-ext-install gd \
        && docker-php-ext-enable gd \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-enable pdo_mysql \
        && docker-php-ext-install bcmath \
        && docker-php-ext-enable bcmath

# Install php-soap
RUN apt-get update && apt-get install -y libxml2-dev \
    && docker-php-ext-install soap \
    && rm -rf /var/lib/apt/lists/*

# Install xdebug via PECL
#RUN pecl install xdebug && \
#    docker-php-ext-enable xdebug

# Install php-rdkafka via PECL
RUN pecl install rdkafka && \
    docker-php-ext-enable rdkafka

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create user and configure PHP-FPM
RUN groupadd --gid ${GID} rta \
    && useradd --gid ${GID} --uid ${UID} rta \
    && sed -i "s/user = www-data/user = rta/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i "s/group = www-data/group = rta/g" /usr/local/etc/php-fpm.d/www.conf

# Switch to non-root user
USER rta
