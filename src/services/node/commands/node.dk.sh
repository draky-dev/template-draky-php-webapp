#!/usr/bin/env bash

ARGS=(
  -i
)

if [[ "$NONINTERACTIVE" != 1 ]]; then
  ARGS+=(-t)
  ARGS+=(-p"35729:35729")
fi

docker run "${ARGS[@]}" --rm -w=/var/node -u="${DRAKY_HOST_UID}:${DRAKY_HOST_GID}" -v "${DRAKY_PROJECT_ROOT}/${NODE_PACKAGE_JSON_PATH}:/var/node:cached,rw" "${NODE_DOCKER_IMAGE}" "$@"