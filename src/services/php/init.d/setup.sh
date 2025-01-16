#!/usr/bin/env sh

# NOTE: You can also prepare your own image with all these extensions included.

echo "Installing extensions."

# redis
if php -m | grep -q ^redis; then
  echo "'redis' extension is already enabled"
  else
  apk add --no-cache pcre-dev $PHPIZE_DEPS && \
      pecl update-channels && \
      pecl install redis && \
      docker-php-ext-enable redis
fi

# gd
if php -m | grep -q ^gd; then
  echo "'gd' extension is already enabled"
  else
  apk add --no-cache $PHPIZE_DEPS \
    freetype-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libpng-dev && \
    docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype && \
    docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd
fi

# OP Cache
if php -m | grep -q "^Zend OPcache"; then
  echo "'Zend OPcache' extension is already enabled"
  else
  docker-php-ext-install opcache
fi

# PDO
if php -m | grep -q ^PDO; then
  echo "'PDO' extension is already enabled"
  else
  docker-php-ext-install pdo
fi

# pdo_mysql
if php -m | grep -q ^pdo_mysql; then
  echo "'pdo_mysql' extension is already enabled"
  else
  docker-php-ext-install pdo_mysql
fi

# pdo_pgsql
if php -m | grep -q ^pdo_pgsql; then
  echo "'pdo_pgsql' extension is already enabled"
  else
  apk add --no-cache libpq-dev
  docker-php-ext-install pdo_pgsql
fi

# intl
if php -m | grep -q ^intl; then
  echo "'intl' extension is already enabled"
  else
  apk add --no-cache icu-dev
  docker-php-ext-install intl
fi

# zip
if php -m | grep -q ^zip; then
  echo "'zip' extension is already enabled"
  else
  apk add --no-cache libzip-dev
  docker-php-ext-install zip
fi

# xdebug
if php -m | grep -q ^Xdebug; then
  echo "'xdebug' extension is already enabled"
  else
  apk add --no-cache $PHPIZE_DEPS linux-headers
  pecl install "xdebug-${DRAKY_PHP_XDEBUG_VERSION}"
fi

# Install composer.
COMPOSER_PATH='/usr/local/bin/composer'
if [ -f "$COMPOSER_PATH" ]; then
  echo "composer is already installed"
  else
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  if [ "${DRAKY_PHP_COMPOSER_HASH_VERIFY}" -eq 1 ]; then
    php -r "if (hash_file('sha384', 'composer-setup.php') === '${DRAKY_PHP_COMPOSER_HASH}') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  fi
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  mv composer.phar "$COMPOSER_PATH"
fi

# git
# Required for some composer's operations
if command -v git; then
  echo "'git' is already installed"
  else
  apk add --no-cache git
fi