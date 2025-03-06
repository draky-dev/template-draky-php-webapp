#!/usr/bin/env sh

TEMP_PATH=/tmp/composer-create
PROJECT_PATH=${DRAKY_PHP_CONTAINER_ROOT}

COLOR_RESET='\033[0m'
COLOR_GREEN='\033[0;92m'
COLOR_RED='\033[0;91m'

composer create-project "$@" "${TEMP_PATH}"

cleanup() {
  rm -r ${TEMP_PATH}
}

for file in "$PROJECT_PATH"/*; do
   if [ -f "$TEMP_PATH/${file##*/}" ]; then
      printf "%b\nERROR: Conflicting files exist in the project%b" "${COLOR_RED}" "${COLOR_RESET}"
      cleanup
      exit 1
   fi
done

cp -rnP ${TEMP_PATH}/* "${PROJECT_PATH}"
cleanup

printf "%b\nSUCCESS: Project has been created.%b" "${COLOR_GREEN}" "${COLOR_RESET}"
