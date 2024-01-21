#!/usr/bin/env bash

docker run -it --rm -w=/var/node -u="$(id -u "${USER}"):$(id -g "${USER}")" -v "${DRAKY_PROJECT_ROOT}/${NODE_PACKAGE_JSON_PATH}:/var/node/:cached,rw" "${NODE_DOCKER_IMAGE}" "$@"
