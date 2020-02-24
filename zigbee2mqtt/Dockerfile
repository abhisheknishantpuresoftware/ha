#  curl -s https://api.github.com/repos/Koenkk/zigbee2mqtt/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/' | xargs -I {} curl -sL -o "/zigbee2mqtt.tar.gz" "https://github.com/Koenkk/zigbee2mqtt/archive/{}.tar.gz" && \
#  tar xzvf /zigbee2mqtt.tar.gz && \
#  mv "$(find / -name 'zigbee2mqtt*' -type d)" /zigbee2mqtt && \
ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

RUN apk add --update --no-cache curl jq nodejs npm \
    python2 make gcc g++ linux-headers udev git && \
  git clone -b master --single-branch --depth 1 https://github.com/Koenkk/zigbee2mqtt.git /zigbee2mqtt && \
  cd /zigbee2mqtt && \
  npm install --unsafe-perm -g pm2 && \
  npm install --unsafe-perm debounce
  #debounce fast-deep-equal
  #git-last-commit js-yaml mkdir-recursive moment && \
  #npm install --unsafe-perm mqtt object-assign-deep rimraf semver winston

#  apk del make gcc g++ python2 linux-headers udev && \
#  rm -rf docs test images scripts data docker LICENSE README.md update.sh

COPY run.sh "/zigbee2mqtt/run.sh"
WORKDIR "/zigbee2mqtt"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]