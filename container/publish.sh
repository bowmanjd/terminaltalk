#!/bin/sh

DATE_TAG=$(date "+%Y%m%d-%H%M%S")

podman build -t alpine-cposc -t ghcr.io/bowmanjd/alpine-cposc:latest -t ghcr.io/bowmanjd/alpine-cposc:$DATE_TAG .

if ! podman login ghcr.io --get-login >/dev/null 2>&1; then
  echo "Not logged in to ghcr.io. Please login:"
  podman login ghcr.io -u bowmanjd
fi

podman push ghcr.io/bowmanjd/alpine-cposc:latest
podman push ghcr.io/bowmanjd/alpine-cposc:$DATE_TAG
