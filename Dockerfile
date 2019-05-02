FROM alpine:3.9

ARG ELASTICSEARCH_CURATOR_VERSION
ENV ELASTICSEARCH_CURATOR_VERSION ${ELASTICSEARCH_CURATOR_VERSION:-5.7.5}

RUN apk --no-cache --update add py2-pip bash && \
  pip install --upgrade pip && \
  pip install elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENV INTERVAL_IN_HOURS=24
ENV OLDER_THAN_IN_DAYS=30
ENV ELASTICSEARCH_HOST=elasticsearch
ENV ELASTICSEARCH_CURATOR_ARGS=

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["sh", "-c", "curator_cli"]
