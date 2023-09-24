NAME = draky-webapp-example

ifndef VERSION
	override VERSION = local-build
endif

ROOT = $(shell pwd -P)

# Version processed.
VER = $(shell echo ${VERSION} | sed 's/^v//g')

.ONESHELL:
.PHONY: $(MAKECMDGOALS)
SHELL = /bin/bash

BIN_PATH = ${ROOT}/bin
DIST_PATH = ${ROOT}/dist/${NAME}
SRC_PATH = ${ROOT}/src

DIST_PATH_ADDONS = ${DIST_PATH}/addons

ADDON_ENTRYPOINT_VERSION = 0.6.0
ADDON_ENTRYPOINT_URL = https://github.com/draky-dev/draky-entrypoint/releases/download/v${ADDON_ENTRYPOINT_VERSION}/draky-entrypoint.tar.xz
ADDON_ENTRYPOINT_PATH = ${DIST_PATH_ADDONS}/draky-entrypoint

install_build_dependencies_alpine:
	apk add bash gettext

build:
	[ ! -d "${DIST_PATH}" ] || rm -r ${DIST_PATH}
	mkdir -p ${DIST_PATH}
	cp -R ${SRC_PATH}/. ${DIST_PATH}/
	TEMPLATE_VERSION=${VER} TEMPLATE_ID=${NAME} ./bin/template-renderer.sh -t ./template.dk.yml.template -o ${DIST_PATH}/template.dk.yml
	mkdir -p ${ADDON_ENTRYPOINT_PATH}
	wget -qO- ${ADDON_ENTRYPOINT_URL} | tar xv -J -C ${ADDON_ENTRYPOINT_PATH}
