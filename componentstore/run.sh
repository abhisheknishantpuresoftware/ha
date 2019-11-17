#!/usr/bin/env bash
echo Store initial started!

CONFIG_PATH=/home/homeassistant/.homeassistant

if [ -d $CONFIG_PATH ]; then
  echo Running on Home Assistant
else
  echo Running on Hass.io
  CONFIG_PATH=/config
fi

if [ ! -d $CONFIG_PATH/custom_components ]; then
  mkdir $CONFIG_PATH/custom_components
fi

if [ ! -d $CONFIG_PATH/custom_components/hacs ]; then
  mkdir $CONFIG_PATH/custom_components/hacs
  echo Copying files...
  unzip /hacs.zip -d $CONFIG_PATH/custom_components/hacs
  echo HACS installation is completed. You can now uninstall this addon!
fi
echo Done!