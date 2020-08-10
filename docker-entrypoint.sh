#!/bin/bash

set -ex

bash -c "while true; do curator_cli --host $ELASTICSEARCH_HOST $ELASTICSEARCH_CURATOR_ARGS delete_indices --filter_list "'\[\{\"filtertype\":\"age\",\"source\":\"creation_date\",\"direction\":\"older\",\"unit\":\"days\",\"unit_count\":\"'$OLDER_THAN_IN_DAYS'\"\},\{\"filtertype\":\"pattern\",\"kind\":\"prefix\",\"value\":\"logstash-\"\}\]'"; set -e; sleep $(( 60*60*INTERVAL_IN_HOURS )); set +e; done"

# As argument is not related to curator,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
