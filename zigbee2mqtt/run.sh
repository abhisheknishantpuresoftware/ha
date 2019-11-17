#!/bin/bash

CONFIG_PATH=/data/options.json
DATA_PATH=/config/zigbee2mqtt

ZIGBEE_DEBUG=$(jq --raw-output ".zigbee_debug // empty" $CONFIG_PATH)
ZIGBEE_DEVICES=$(jq --raw-output ".zigbee_devices // empty" $CONFIG_PATH)

# Create config file
echo "new version"
mkdir -p $DATA_PATH
echo "homeassistant: true" >> $DATA_PATH/configuration.yaml

# Parse config
cat "$CONFIG_PATH" | jq 'del(.zigbee_debug)' | jq 'del(.zigbee_devices)' > $DATA_PATH/configuration.yaml

if [[ ! -z "$ZIGBEE_DEBUG" ]]; then
    echo "[Info] Zigbee debug logging enabled."
    DEBUG="zigbee-herdsman*"
fi

if [[ ! -z "$ZIGBEE_DEVICES" ]]; then
    echo "[Info] Searching for custom devices file in zigbee2mqtt data path..."
    if [[ -f "$DATA_PATH"/devices.js ]]; then
        cp -f "$DATA_PATH"/devices.js ./node_modules/zigbee-herdsman-converters/devices.js
    else
        echo "[Error] File $DATA_PATH/devices.js not found! Starting with default devices.js"
    fi
fi

ZIGBEE2MQTT_DATA="$DATA_PATH" pm2-runtime start npm -- start
