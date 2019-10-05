#!/usr/bin/env bash
#echo Store initial started!
#
#if [ ! -d /config/custom_components ]; then
#    mkdir /config/custom_components
#fi
#
#if [ ! -d /config/custom_components/hacs ]; then
#    mkdir /config/custom_components/hacs
#fi
#
#
#echo Downloading source....
#wget https://github.com/custom-components/hacs/archive/0.13.3.tar.gz
#echo Extracting...
#tar -xzvf *.tar.gz
#
#echo Copying files...
#cp -R hacs-*/custom_components/hacs /config/custom_components

##Modify const.py file to add our repository
#if ! grep -qs "Component Store" /config/custom_components/hacs/const.py; then
#    echo "will mod const.py"
#    sed -i 's/\"Community\"/\"Component Store\"/g' /config/custom_components/hacs/const.py
#    sed -i 's/alpha-c-box/store/g' /config/custom_components/hacs/const.py
#fi


#if ! grep -qs "MagnetVN/smartir" /config/custom_components/hacs/const.py; then
#    echo "will mod repo"
#    sed -i 's/\"integration\": [/a         \"MagnetVN/zing_mp3\",' /config/custom_components/hacs/const.py
#    sed 's/\"integration\": [/a         \"MagnetVN/smartir\",' /config/custom_components/hacs/const.py
#fi

echo "Mod config"
if ! grep -qs "hacs:" /config/configuration.yaml; then
	echo "hacs:" >> /config/configuration.yaml
	echo "  token:" >> /config/configuration.yaml
	echo "  sidepanel_title: Component Store" >> /config/configuration.yaml
    echo "  sidepanel_icon: mdi:store" >> /config/configuration.yaml
	echo "You need to add github token in configuration.yaml"
else
    echo configuration.yaml is correctly configured!
fi

echo Done!