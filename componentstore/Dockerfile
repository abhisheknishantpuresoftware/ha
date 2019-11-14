ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
RUN curl -s https://api.github.com/repos/hacs/integration/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/' | xargs -I {} curl -sL -o "/hacs.tar.gz" "https://github.com/hacs/integration/archive/{}.tar.gz"

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]