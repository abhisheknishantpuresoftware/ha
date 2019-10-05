ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV HACS_VERSION=0.15.0
ENV ARCHIVE=hacs-$HACS_VERSION

# Copy data for add-on

RUN curl -sL -o "/$ARCHIVE.tar.gz" \
  "https://github.com/custom-components/hacs/archive/$HACS_VERSION.tar.gz" && \
  tar xzvf "/$ARCHIVE.tar.gz" && \
  cp -R hacs-*/custom_components/hacs /config/


COPY run.sh /config
#COPY hacs /hacs

#RUN chmod a+x /run.sh

#CMD [ "/run.sh" ]