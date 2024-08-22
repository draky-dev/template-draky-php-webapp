#!/usr/bin/env bash

docker run -it --rm -w=/var/node -u="${DRAKY_HOST_UID}:${DRAKY_HOST_GID}" -v "${DRAKY_PROJECT_ROOT}/${NODE_PACKAGE_JSON_PATH}:/var/node/:cached,rw" -p"${NODE_WEBPACK_LIVE_RELOAD_PORT}:35729 "${NODE_DOCKER_IMAGE}" "$@"
