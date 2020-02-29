<div align="center">
<h1>Zigbee2mqtt Hass.io Add-on</h1>
<div style="display: flex; justify-content: center;">
  <a style="margin-right: 0.5rem;" href="https://travis-ci.org/homematevn/ha">
    <img src="https://img.shields.io/travis/homematevn/ha.svg?style=flat-square&logo=travis">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/armhf-yes-green.svg">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/aarch64-yes-green.svg">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/amd64-yes-green.svg">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/i386-yes-green.svg">
  </a>
</div>
<br>
</div>

## Configuration

The following table describes all necessary options. To run this add-on, you must set the **required (bold)** parameters via the Hass.io user interface. 
See the [zigbee2mqtt docs](https://www.zigbee2mqtt.io/information/configuration.html) for other options.

|Parameter|Type|Default|Description|
|---------|----|--------|-----------|
|`devices`|string|devices.yaml|Device-specific file. See information below.|
|`groups`|string|groups.yaml|Group file. See information below.|
|`permit_join`|**bool**|false|Set `true` when you setup new devices - make sure you set it back to `false` when done. Or create [frontend pairing](https://github.com/homematevn/ha/blob/master/zigbee2mqtt/PAIRING.md)|
|`mqtt/server`|**string**|mqtt://core-mosquitto|The MQTT server address. Make sure you include the protocol. Depending on your configuration, the MQTT server URL will need to include the port, typically `1883` or `8883` for SSL communications. For example, `mqtt://homeassistant:1883`.|
|`mqtt/base_topic`|**string**|zigbee2mqtt|Prefix for your MQTT topic|
|`mqtt/user`|**string**|mqtt|Your MQTT username, if set.|
|`mqtt/password`|**string**|mqtt|Your MQTT Password, if set.|
|`mqtt/client_id`|string| |MQTT ClientID|
|`serial/port`|**string**|/dev/ttyAMA1|Module communication's port. To find out the port, go to Hass.io > System > Host system > Show Hardware|
|`pan_id`|2 byte|0x1a62|Change pan_id to separate with others network|
|`channel`|int|11|Change channel to avoid interference with other network. Should use only channels: 11, 15, 20, 25. Changing this require re-pairing all devices|
|`rtscts`|bool|false|Must set to `false` if you are using CC2530|
|`network_key`|**list(int)**|[1,2,..16]|8 Int number. Encryption key will improve security. See [more detail](https://www.zigbee2mqtt.io/how_tos/how_to_secure_network.html). Leave this option empty if you don't want to use a network key. Changing this requires repairing of all devices.|


#### Device-specific Configuration
If you are using groups or device-specific settings, you must provide the paths to these files in `devices` & `groups` options.
Zigbee2mqtt allows certain [device-specific configuration options](https://www.zigbee2mqtt.io/configuration/device_specific_configuration.html). 
The configuration file is located at `/share/zigbee2mqtt` on Hass.io host.

---

## Working with Zigbee modules
- Zigbee module needed a modified ZHA firmware in order to work. The flashing progress will not covered in this document.

- CC2530 module: UART must be enable before use. Instruction [here](https://github.com/homematevn/ha/blob/master/zigbee2mqtt/UART.md). Port usually are /dev/ttyS0 (pi3) or /dev/ttyAMA1 (pi4). 

- CC2531 module (USB): Port usually are /dev/USB0. To find the port, go to Hass.io > System > Host system > Show Hardware

---

# Pairing

#### Enable Paring (Simple way): 
Set `permit_join` in configuration to **true**, then restart the add-on. Change back to **false** when you finish.

#### Add button to frontend to control Enable Pairing (Advanced):
[Information here](https://github.com/homematevn/ha/blob/master/zigbee2mqtt/PAIRING.md)

### Supported Devices and device pairing Instruction
[Information here](https://www.zigbee2mqtt.io/information/supported_devices.html)

---
### Updating the Add-on and `zigbee2mqtt` Library

The stable, versioned zigbee2mqtt can be updated using the standard Hass.io update functionality. This add-on will be updated with bug fixes and as the underlying `zigbee2mqtt` library is updated.

----
### Issues

If you find any issues with the addon, please check the [issue tracker](https://github.com/danielwelch/hassio-zigbee2mqtt/issues) for similar issues before creating one. If your issue is regarding specific devices or, more generally, an issue that arises after zigbee2mqtt has successfully started, it should likely be reported in the [zigbee2mqtt issue tracker](https://github.com/Koenkk/zigbee2mqtt/issues)

Feel free to create a PR for fixes and enhancements. 

## Credits
- [danielwelch](https://github.com/danielwelch)
- [ciotlosm](https://github.com/ciotlosm)
- [Koenkk](https://github.com/Koenkk) for [zigbee2mqtt](https://github.com/Koenkk/zigbee2mqtt)
