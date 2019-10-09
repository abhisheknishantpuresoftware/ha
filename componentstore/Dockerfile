ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
#ENV HACS_VERSION=0.15.0
#ENV ARCHIVE=hacs-$HACS_VERSION

# Copy data for add-on

RUN curl -s https://api.github.com/repos/custom-components/hacs/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | curl -sL -o "/hacs.tar.gz" "https://github.com/custom-components/hacs/archive/{}.tar.gz" && \
  tar xzvf "/hacs.tar.gz" && \
  cp -R hacs-*/custom_components/hacs /$ARCHIVE


COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]