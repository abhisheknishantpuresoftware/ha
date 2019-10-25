# Hass.io Component Store

![Logo][logo]

An easy-to-use Add-on for install and manage `custom components` and `custom cards`.

***
## Installation
1. Add the repository URL via the Hassio Add-on Store Tab: **https://github.com/homematevn/ha**
2. Install and start the `Component Store` add-on from HomeMateVN Repository. You only need to start one time 
3. Get a GitHub Personal Access Token [have a look here](https://github.com/homematevn/ha/blob/master/componentstore/docs/token.md). Add `github_access_token` to `secret.yaml` file
4. Restart Home Assistant

**Note**: The installation process will modify `configuration.yaml` file automatically, do not delete it.
**You need to use Hass.io version 0.98.0 or newer for this to work.**

### Update
**NOTICE**: Components installed manual or outside this store will not be mananged in component store.

**Component Store** can be updated inside the store. You will need to restart Home Assistant to apply the update.

*Store Content* will refresh: At startup or every 500 minutes after HA startup.

*Installed element* will be checked for updates: At startup or every 30 minutes after HA startup.

### Startup
During the startup there will be a progressbar indicating that it's scanning for known repositories. This is completely normal, and you can still use it while it's working. 

***
### Note for developers
If you want to share components or plugins, don't hesitate let us know.

### Licenses
Additional licenses for third-party components of this addon are available as part of the [LICENSE.md](https://github.com/homematevn/ha/blob/master/componentstore/docs/LICENSE.md) file.
### Credits
- [custom-components](https://github.com/custom-components/hacs)

[logo]: https://github.com/HomemateVN/ha/blob/master/componentstore/icon.png