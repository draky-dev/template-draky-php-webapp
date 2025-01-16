#!/usr/bin/env sh

mysql -uroot "$@" < /dev/stdin
