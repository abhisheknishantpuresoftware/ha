#!/bin/bash
set -ev


if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "This build is a pull request, aborting distribution script."
    exit 0
fi

if [ -z "$TRAVIS_TAG" ]; then

    echo "No tag found."
    if [ "$TRAVIS_BRANCH" != "master" ]; then
        echo "Not on master branch. Aborting distribution script"
        exit 0
    fi
    echo "Untagged push to master branch. Pushing zigbee2mqtt image to Docker with tag 'test'."

    # distribute zigbee2mqtt with tag test
    docker run -it --rm --privileged --name "${ADDON_NAME}" \
        -v ~/.docker:/root/.docker \
        -v "$(pwd)":/docker \
        hassioaddons/build-env:latest \
        --target "${ADDON_NAME}" \
        --tag-test \
        --push \
        --amd64 \
        --from "homeassistant/{arch}-base" \
        --author "${AUTHOR}" \
        --doc-url "${GITHUB_URL}" \
        --login "${DOCKER_USERNAME}" \
        --password "${DOCKER_PASSWORD}" \
        --parallel
else
    echo "Tagged build found. Pushing zigbee2mqtt image to Docker with tag 'latest'."

    docker run -it --rm --privileged --name "${ADDON_NAME}" \
        -v ~/.docker:/root/.docker \
        -v "$(pwd)":/docker \
        hassioaddons/build-env:latest \
        --target "${ADDON_NAME}" \
        --tag-latest \
        --push \
        --amd64 \
        --from "homeassistant/{arch}-base" \
        --author "${AUTHOR}" \
        --doc-url "${GITHUB_URL}" \
        --login "${DOCKER_USERNAME}" \
        --password "${DOCKER_PASSWORD}" \
        --parallel
fi
echo "Docker built and publish successful."