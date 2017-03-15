#!/bin/bash
NOMAD_VERSION="$1"
[ -z "$NOMAD_VERSION" ] && echo 'Usage: build.sh <NOMAD VERSION>' >&2 && exit 1

relpath="$(dirname $0)"
[ -n "$relpath" ] && cd "$relpath"

docker build -t bedouin-builder --build-arg "NOMAD_VERSION=$NOMAD_VERSION" . &&
  docker run --rm bedouin-builder | docker build -t "compellon/nomad-bedouin:$NOMAD_VERSION" -
