ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
RUN curl -s https://api.github.com/repos/custom-components/hacs/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/' | xargs -I {} curl -sL -o "/hacs.tar.gz" "https://github.com/custom-components/hacs/archive/{}.tar.gz"

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]