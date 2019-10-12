#!/usr/bin/env bash
echo Store initial started!

CONFIG_PATH=/home/homeassistant/.homeassistant

if [ -d $CONFIG_PATH ]; then
  echo Running on Home Assistant
else
  echo Running on Hass.io
  CONFIG_PATH=/config
fi


if [ ! -d $CONFIG_PATH/custom_components/hacs ]; then
  echo Copying files...
  tar xzvf /hacs.tar.gz
  cp -R hacs*/custom_components $CONFIG_PATH
  rm -rdf hacs*
fi

if ! grep -qs "hacs:" $CONFIG_PATH/configuration.yaml; then
  echo "Auto edit configuration.yaml"
	# shellcheck disable=SC2129
	echo "hacs:" >> $CONFIG_PATH/configuration.yaml
	echo "  token:" >> $CONFIG_PATH/configuration.yaml
  echo "  sidepanel_title: Community Store" >> $CONFIG_PATH/configuration.yaml
  echo "  sidepanel_icon: mdi:store" >> $CONFIG_PATH/configuration.yaml
	echo "You will need to add github token in configuration.yaml"
else
    echo configuration.yaml is correctly configured!
fi

echo Done!