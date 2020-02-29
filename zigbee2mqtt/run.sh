#!/bin/bash

CONFIG_PATH=/data/options.json
DATA_PATH=/share/zigbee2mqtt

ZIGBEE_DEBUG=$(jq --raw-output ".zigbee_debug // empty" $CONFIG_PATH)
ZIGBEE_DEVICES=$(jq --raw-output ".zigbee_devices // empty" $CONFIG_PATH)
ZIGBEE_PORT=$(jq --raw-output ".port // empty" $CONFIG_PATH)

# Create config directory
mkdir -p $DATA_PATH

# Modify config
cat "$CONFIG_PATH" | jq 'del(.zigbee_debug)' | jq 'del(.zigbee_devices)' | jq '. + {"homeassistant": true}' > $DATA_PATH/configuration.yaml

#Script to check device port
echo Zigbee port
echo $ZIGBEE_PORT
if [ ! -f $ZIGBEE_PORT ] ; then
   echo Zigbee device port not found. Please check your device and config
   echo Will now stop!
   exit
fi

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

ZIGBEE2MQTT_DATA="$DATA_PATH" DEBUG="$DEBUG" pm2-runtime start npm -- start
