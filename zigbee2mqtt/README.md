<div align="center">
<img src="https://github.com/HomeMateVN/ha/raw/master/images/zigbee2mqtt.png"/>
<h1>Zigbee2mqtt Hass.io Add-on</h1>
<div style="display: flex; justify-content: center;">
  <a style="margin-right: 0.5rem;" href="https://travis-ci.org/homematevn/zigbee2mqtt">
    <img src="https://img.shields.io/travis/homematevn/zigbee2mqtt.svg?style=flat-square&logo=travis">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/armhf-yes-green.svg">
  </a>
  <a style="margin-left: 0.5rem;" href="">
    <img src="https://img.shields.io/badge/armv7-yes-green.svg">
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

The following table describes all necessary options. To run this add-on, you must set the **required (bold)** parameters via the Hass.io user interface. See the [zigbee2mqtt docs](https://www.zigbee2mqtt.io/configuration/configuration.html) and the [default configuration file](https://github.com/Koenkk/zigbee2mqtt/blob/master/data/configuration.yaml) for more information.

|Parameter|Type|Default|Description|
|---------|----|--------|-----------|
|`data_path`|**string**|/share/zigbee2mqtt|Set this to the path you'd like the add-on to persist data. Must be within the `/share` directory.|
|`devices`|string|devices.yaml|Device-specific file. See information below.|
|`groups`|string|groups.yaml|Group file. See information below.|
|`homeassistant`|**bool**|true|Set `true` if you want MQTT autodiscovery. See [Integrating with Home Assistant](https://www.zigbee2mqtt.io/integration/home_assistant.html) for details.|
|`permit_join`|**bool**|false|Set `true` when you setup new devices - make sure you set it back to `false` when done. Or alternative [runtime pairing](https://github.com/danielwelch/hassio-zigbee2mqtt#pairing)|
|`mqtt/server`|**string**|mqtt://localhost|The MQTT server address. Make sure you include the protocol.|
|`mqtt/base_topic`|**string**|zigbee2mqtt|Prefix for your MQTT topic|
|`mqtt/user`|string| |Your MQTT username, if set.|
|`mqtt/password`|string| |Your MQTT Password, if set.|
|`mqtt/client_id`|string| |MQTT ClientID|
|`serial/port`|**string**|/dev/ttyUSB0|Port for your CC2531 stick.|
|`serial/disable_led`|bool|no|Disable the LED of your CC2531 stick.|
|`advanced/pan_id`|string|no|Optional ZigBee pan ID|
|`channel`|int|no|Optional Zigbee Channel|
|`log_level`|enum|no|Set to `debug`, `info`, `warn`, or `error`. Defaults to `info`. The log level for zigbee-shepherd and zigbee2mqtt. See [the wiki](https://www.zigbee2mqtt.io/how_tos/how_to_debug.html) for more information.|
|`rtscts`|bool|no|RTS / CTS Hardware Flow Control for serial port. Must set to `false` if you connect CC2530 direct to UART port|
|`network_key`|**list(int)**|yes|Specify an encryption key for your zigbee network. See [this section of the Zigbee2mqtt docs](https://www.zigbee2mqtt.io/how_tos/how_to_secure_network.html) for more details and example usage. Leave this option empty (i.e. leave the default) if you don't want to use a network key. Note that changing this requires repairing of all device connections. Hex values are not supported, only integer values (although hex values can be used by manually editing your `configuration.yaml` file and disabling `overwrite`).|

- Depending on your configuration, the MQTT server URL will need to include the port, typically `1883` or `8883` for SSL communications. For example, `mqtt://homeassistant:1883`.
- To find out which serial ports you have exposed go to **Hass.io > System > Host system > Show Hardware**

#### Modifying zigbee2mqtt's `configuration.yaml`
In some cases, you may wish to modify zigbee2mqtt's `configuration.yaml` file directly. The `configuration.yaml` file used by this add-on can be modified within the data directory specified via the add-on configuration (see above). By default, the configuration file is saved to `/share/zigbee2mqtt/configuration.yaml` on your Hass.io host. 

#### Device-specific Configuration
If you are using groups or device-specific settings, you must use seperate files, and provide the paths to these files in their corresponding config options.
Zigbee2mqtt allows certain [device-specific configuration options](https://www.zigbee2mqtt.io/configuration/device_specific_configuration.html). Filename can be configured in the add-on via `devices`& `groups`. Example device-specific configuration entry, adapted from the Zigbee2mqtt docs:

```yaml
'0x00158d0001d82999':
  friendly_name: "my_occupancy_sensor"
  retain: true
```

---
### Pairing

#### Easy way

Set `permit_join` in configuration to *true*, then restart the addon. Change back to *false* when you finish.

#### Recommended way 

[Information here](https://github.com/ttvt/hassio/blob/master/zigbee2mqtt/PAIRING.md)

### Device pairing Instruction

[Information here](https://www.zigbee2mqtt.io/information/supported_devices.html)

---
### Updating the Add-on and `zigbee2mqtt` Library

The stable, versioned zigbee2mqtt can be updated using the standard Hass.io update functionality within the user interface. This add-on will be updated with bug fixes and as the underlying `zigbee2mqtt` library is updated.

If you have reinstalled the add-on and believe that the latest version has not been installed, try removing the repository before reinstalling.

----
### Issues

If you find any issues with the addon, please check the [issue tracker](https://github.com/danielwelch/hassio-zigbee2mqtt/issues) for similar issues before creating one. If your issue is regarding specific devices or, more generally, an issue that arises after zigbee2mqtt has successfully started, it should likely be reported in the [zigbee2mqtt issue tracker](https://github.com/Koenkk/zigbee2mqtt/issues)

Feel free to create a PR for fixes and enhancements. 

## Credits
- [danielwelch](https://github.com/danielwelch)
- [ciotlosm](https://github.com/ciotlosm)
- [Koenkk](https://github.com/Koenkk) for [zigbee2mqtt](https://github.com/Koenkk/zigbee2mqtt)
