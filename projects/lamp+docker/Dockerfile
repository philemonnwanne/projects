FROM php:8.2-fpm

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.lock and composer.json
COPY ./laravel-src/composer.lock ./laravel-src/composer.json /var/www/laravel-src/

# Set working directory and install application dependencies
WORKDIR /var/www/laravel-src/

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mysqli pcntl bcmath gd

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# copy everything in the project into the container
COPY ./laravel-src/ /var/www/laravel-src/

# Copy existing application directory permissions
COPY --chown=laravel-src:laravel-src . /var/www/laravel-src/

# Change current user to www-data
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]