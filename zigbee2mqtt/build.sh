#!/bin/bash
set -ev

if [ -z "${TRAVIS_TAG}" ]; then
    echo "Untagged build found. Testing building zigbee2mqtt with tag 'test'."
    # build zigbee2mqtt
    docker run -it --rm --privileged --name "${ADDON_NAME}" \
        -v ~/.docker:/root/.docker \
        -v "$(pwd)":/docker \
        hassioaddons/build-env:latest \
        --target "${ADDON_NAME}" \
        --tag-test \
        --aarch64 \
        --from "homeassistant/{arch}-base" \
        --author "${AUTHOR}" \
        --doc-url "${GITHUB_URL}" \
        --login "${DOCKER_USERNAME}" \
        --password "${DOCKER_PASSWORD}" \
        --parallel
else
    echo "New git tagged build found. Testing building zigbee2mqtt with tag 'latest'."
    docker run -it --rm --privileged --name "${ADDON_NAME}" \
        -v ~/.docker:/root/.docker \
        -v "$(pwd)":/docker \
        hassioaddons/build-env:latest \
        --target "${ADDON_NAME}" \
        --tag-latest \
        --aarch64 \
        --from "homeassistant/{arch}-base" \
        --author "${AUTHOR}" \
        --doc-url "${GITHUB_URL}" \
        --login "${DOCKER_USERNAME}" \
        --password "${DOCKER_PASSWORD}" \
        --parallel \
        --arg COMMIT "${TRAVIS_COMMIT}"
fi
echo "Local Docker build successful."
