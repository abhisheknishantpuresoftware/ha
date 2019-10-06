#!/usr/bin/env bash
echo Store initial started!

PATH=/config/custom_components

if [ -d /home/homeassistant/.homeassistant ]; then
  echo Running on Home Assistant
  PATH=/home/homeassistant/.homeassistant/custom_components
else
  echo Running on Hass.io
  PATH=/config/custom_components
fi

if [ ! -d $PATH ]; then
    mkdir $PATH
fi

if [ ! -d $PATH/hacs ]; then
  echo Copying files...
  cp -R hacs-*/custom_components/hacs $PATH
fi

#Modify const.py file to add our repository
if ! grep -qs "Community Store" $PATH/hacs/const.py; then
    echo "will mod const.py"
    sed -i 's/\"Community\"/\"Community Store\"/g' $PATH/hacs/const.py
    sed -i 's/alpha-c-box/store/g' /config/hacs/const.py
fi

#echo "Mod config"
#if ! grep -qs "hacs:" /config/configuration.yaml; then
#	echo "hacs:" >> /config/configuration.yaml
#	echo "  token:" >> /config/configuration.yaml
#	echo "You need to add github token in configuration.yaml"
#else
#    echo configuration.yaml is correctly configured!
#fi

echo Done!