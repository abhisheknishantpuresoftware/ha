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


if ! grep -qs "hacs:" /config/configuration.yaml; then
  echo "Auto edit configuration.yaml"
	# shellcheck disable=SC2129
	echo "hacs:" >> /config/configuration.yaml
	echo "  token:" >> /config/configuration.yaml
  echo "  sidepanel_title: Community Store" >> /config/configuration.yaml
  echo "  sidepanel_icon: mdi:store" >> /config/configuration.yaml
	echo "You will need to add github token in configuration.yaml"
else
    echo configuration.yaml is correctly configured!
fi

echo Done!