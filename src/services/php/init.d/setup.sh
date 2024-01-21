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
