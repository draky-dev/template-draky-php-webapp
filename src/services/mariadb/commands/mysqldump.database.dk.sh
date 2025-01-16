#!/usr/bin/env sh

mysqldump -uroot "$@" < /dev/stdin
