#!/usr/bin/env bash
echo Store initial started!

HACS_PATH=/config/custom_components

if [ -d /home/homeassistant/.homeassistant ]; then
  echo Running on Home Assistant
  HACS_PATH=/home/homeassistant/.homeassistant/custom_components
else
  echo Running on Hass.io
  HACS_PATH=/config/custom_components
fi

if [ ! -d $HACS_PATH ]; then
    mkdir $HACS_PATH
fi

if [ ! -d $HACS_PATH/hacs ]; then
  echo Copying files...
  cp -R hacs-*/custom_components/hacs $HACS_PATH
fi

#Modify const.py file to add our repository
#if ! grep -qs "Community Store" $HACS_PATH/hacs/const.py; then
#    echo "will mod const.py"
#    sed -i 's/\"Community\"/\"Community Store\"/g' $HACS_PATH/hacs/const.py
#    sed -i 's/alpha-c-box/store/g' HACS_PATH/hacs/const.py
#fi

#echo "Mod config"
#if ! grep -qs "hacs:" /config/configuration.yaml; then
#	echo "hacs:" >> /config/configuration.yaml
#	echo "  token:" >> /config/configuration.yaml
#	echo "You need to add github token in configuration.yaml"
#else
#    echo configuration.yaml is correctly configured!
#fi

echo Done!