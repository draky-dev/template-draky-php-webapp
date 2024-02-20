#!/usr/bin/env sh

# NOTE: You can also prepare your own image with all these extensions included.

echo "Installing extensions."

# redis
if php -m | grep -q ^redis; then
  echo "'redis' extension is already enabled"
  else
  apk add --no-cache pcre-dev zlib-dev libpng-dev $PHPIZE_DEPS && \
      pecl update-channels && \
      pecl install redis && \
      docker-php-ext-enable redis
fi

# gd
if php -m | grep -q ^gd; then
  echo "'gd' extension is already enabled"
  else
  docker-php-ext-install gd
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

# Install composer.
COMPOSER_PATH='/usr/local/bin/composer'
if [ -f "$COMPOSER_PATH" ]; then
  echo "composer is already installed"
  else
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  mv composer.phar "$COMPOSER_PATH"
fi
