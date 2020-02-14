# Hass.io Component Store

![Logo][logo]

HACS gives you a powerful UI to handle downloads of custom needs.
This add-on is just a short way to install [hacs](https://hacs.xyz). 

***
## Installation
1. Add the repository URL via the Hassio Add-on Store Tab: **https://github.com/homematevn/ha**
2. Install and start the `Component Store` add-on from HomeMateVN Repository. You only need to start one time. Uninstall it after success start.
3. Get a GitHub Personal Access Token [instruction here](https://hacs.xyz/docs/configuration/pat). Copy it (Ctrl+C)
4. Configure HACS [instruction here](https://hacs.xyz/docs/configuration/basic)

**Note**: You need to use Hass.io version 0.98.0 or newer for this to work.

### Update
**NOTICE**: Components installed manual or outside this store will not be managed in component store.

**Component Store** can update itself inside the store. You will need to restart Home Assistant to apply the update.

*Store Content* will refresh: At startup or every 500 minutes after HA startup.

*Installed element* will be checked for updates: At startup or every 30 minutes after HA startup.

### Startup
During the startup there will be a progressbar indicating that it's scanning for known repositories. This is completely normal, and you can still use it while it's working. 

***
### Licenses
Additional licenses for third-party components of this addon are available as part of the [LICENSE.md](https://github.com/homematevn/ha/blob/master/componentstore/docs/LICENSE.md) file.
### Credits
- [Home Assistant Component Store](https://hacs.xyz)

[logo]: https://github.com/HomemateVN/ha/raw/master/componentstore/icon.png