#Connect cc2530 / cc2591 to Raspberry Pi

## Access Container Bash 
- Enter `root` on login screen
- Enter `login`
- Enter `docker exec -it homeassistant /bin/bash`

## Enable UART
- Raspberry Pi3: Add `dtoverlay=uart4` to the end file `/mnt/boot/config.txt`. 
Success enable UART, you will see /dev/ttyS0 in Hass.io > System > Host system > Show Hardware
- Raspberry Pi4: Add `enable_uart=1` to the end file `/mnt/boot/config.txt`
Success enable UART, you will see /dev/ttyAMA1 in Hass.io > System > Host system > Show Hardware

---
# Wiring
| CC2530 | Raspberry pi 3 | Raspberry pi 4 |
|--------|----------------|----------------|
| VCC | Pin 1 / 17 | Pin 1 / 17 |
| GND | Pin 6 / 20 | Pin 6 / 20 |
| P02 | Pin 8 |  Pin 24 |
| P03 | Pin 10 | BCM 21 |