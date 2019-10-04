# Hass.io Component Store

![Logo][logo]

An easy-to-use web app for managing `custom components` and `custom cards`.

It can help you download and update elements.

It can also help you discover new awesome stuff.

***
## Installation
**You need to use Hass.io version 0.98.0 or newer for this to work.**

1. Install the **Component Store** add-on. Instructions [here](https://www.home-assistant.io/hassio/installing_third_party_addons/)
Repository URL: `https://github.com/ttvt/hassio`
2. Enable `Auto update` option, then start the "Component Store" add-on. 
3. The installation process will modify `configuration.yaml` file automatically, do not delete:
```yaml
hacs:
  token: !secret my_github_access_token
```
4. [Get a GitHub Personal Access Token have a look here.](https://github.com/ttvt/hassio/blob/master/componentstore/docs/token.md)
5. Add my_github_access_token to secret.yaml file
```yaml
my_github_access_token: "GitHub Personal Access Token"
```
6. Restart Home Assistant


## Update
**NOTICE**: Components installed manual or outside this store will not be mananged in component store.

**Component Store** will be updated itself automatically if you enable `Auto update` option. However, you will need to restart Home Assistant to apply the update.

*Store Content* will refresh: At startup or every 500 minutes after HA startup.

*Installed element* will be checked for updates: At startup or every 30 minutes after HA startup.

## Startup
During the startup there will be a progressbar indicating that it's scanning for known repositories. This is completely normal, and you can still use it while it's working. 

***
# Note for developers
If you want to share components or plugins, don't hesitate let us know.

### Licenses
Additional licenses for third-party components of this addon are available as part of the [LICENSE.md](https://github.com/ttvt/hassio/blob/master/componentstore/docs/LICENSE.md) file.

[logo]: https://github.com/ttvt/hassio/raw/master/componentstore/logo.png