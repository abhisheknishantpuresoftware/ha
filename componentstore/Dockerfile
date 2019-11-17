ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
RUN curl -s https://api.github.com/repos/hacs/integration/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/' | xargs -I {} curl -o "/hacs.zip" -sL "https://github.com/hacs/integration/releases/download/{}/hacs.zip"

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]