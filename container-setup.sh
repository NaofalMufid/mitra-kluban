#!/bin/bash

set -e

if [[ "$OSTYPE" == "darwin"* ]]; then

  if hash docker 2>/dev/null; then
    CONTAINER_RUNTIME=docker
  else

    echo "Error! We could not find docker on your Mac!"
    echo "Please install Docker for Mac:"
    echo "https://docs.docker.com/docker-for-mac/install/"

    exit 1

  fi

  if hash docker-compose 2>/dev/null; then
    CONTAINER_COMPOSE=docker-compose
  else

    echo "Error! We could not find a docker-compose on your Mac!"
    echo "Please install Docker for Mac:"
    echo "https://docs.docker.com/docker-for-mac/install/"

    exit 1

  fi

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

  if hash docker 2>/dev/null; then
    CONTAINER_RUNTIME=docker
  else

    echo "Error! We could not find a container runtime on your Linux install!"
    echo "https://docs.docker.com/engine/install/ubuntu/"

    exit 1

  fi

  if hash docker 2>/dev/null; then
    CONTAINER_COMPOSE=docker-compose
  else

    echo "Error! We could not find ${CONTAINER_COMPOSE} on your Linux install!"
    echo "https://github.com/containers/podman-compose#installation"

    exit 1

  fi

else

  echo "Oof! Sorry! This OS is unsupported! :("

fi

if [ "${CONTAINER_RUNTIME}" = "docker" ]; then

  echo "Depending on your hardware specs, the initial setup can take"
  echo "5 to 10 minutes. Please stand by..."
  sleep 10

  docker-compose up

fi
