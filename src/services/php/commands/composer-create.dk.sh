#!/usr/bin/env bash

TEMP_PATH=/tmp/composer-create
PROJECT_PATH=${DRAKY_PHP_CONTAINER_ROOT}

COLOR_RESET='\033[0m'
COLOR_GREEN='\033[0;92m'
COLOR_RED='\033[0;91m'

ARGS=(
  -i
)

if [ -z "$1" ]; then
  printf "%b\nERROR: Package as an argument is required\n%b" "${COLOR_RED}" "${COLOR_RESET}"
  exit 1;
fi

docker run "${ARGS[@]}" --rm -w="${DRAKY_PHP_CONTAINER_ROOT}" -u="${DRAKY_HOST_UID}:${DRAKY_HOST_GID}" -v "${DRAKY_PROJECT_ROOT}:${DRAKY_PHP_CONTAINER_ROOT}:cached,rw" "$DRAKY_COMPOSER_IMAGE" sh -s << EOF
composer create-project --ignore-platform-reqs "$@" "${TEMP_PATH}"

for file in "$PROJECT_PATH"/*; do
   if [ -f "$TEMP_PATH/\${file##*/}" ]; then
      printf "%b\nERROR: Conflicting files exist in the project\n%b" "${COLOR_RED}" "${COLOR_RESET}"
      cleanup
      exit 1
   fi
done

cp -rnP ${TEMP_PATH}/. "${PROJECT_PATH}"

printf "%b\nSUCCESS: Project has been created.\n%b" "${COLOR_GREEN}" "${COLOR_RESET}"
EOF
