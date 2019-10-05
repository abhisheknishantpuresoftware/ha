#!/bin/bash
set -ev

echo "Running local build test."

# build zigbee2mqtt
docker run -it --rm --privileged --name "${ADDON_NAME}" \
    -v ~/.docker:/root/.docker \
    -v "$(pwd)":/docker \
    hassioaddons/build-env:latest \
    --target "${ADDON_NAME}" \
    --tag-test \
    --amd64 \
    --from "homeassistant/{arch}-base" \
    --author "Viet Tien <ttvtien@gmail.com>" \
    --doc-url "${GITHUB_URL}" \
    --parallel
