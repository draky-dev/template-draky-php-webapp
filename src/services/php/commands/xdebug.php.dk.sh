#!/usr/bin/env sh

if [ "${1}" != 'enable' ] && [ "${1}" != 'disable' ] && [ "${1}" != 'status' ]; then
  echo "$0: This script supports only arguments 'enable', 'disable' or 'status'." >&2
  exit 1
fi

DOCKER_XDEBUG_PATH='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'

if [ ! -f "$DOCKER_XDEBUG_PATH" ]; then
  echo "Didn't find XDebug configuration at '$DOCKER_XDEBUG_PATH'." >&2
  exit 1
fi

if [ "${1}" = 'disable' ]; then
  sed -Ei 's/^zend_extension/;zend_extension/g' ${DOCKER_XDEBUG_PATH} && kill -USR2 1
  echo "XDebug is disabled"
fi

if [ "${1}" = 'enable' ]; then
  sed -Ei 's/^;zend_extension/zend_extension/g' ${DOCKER_XDEBUG_PATH} && kill -USR2 1
  echo "XDebug is enabled"
fi

if [ "${1}" = 'status' ]; then
  if grep -q ';zend_extension' "${DOCKER_XDEBUG_PATH}"; then
    echo "XDebug is disabled"
    else
    echo "XDebug is enabled"
  fi
fi
