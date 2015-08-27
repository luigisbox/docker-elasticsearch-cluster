#!/bin/bash
set -e

chown -R elasticsearch:elasticsearch /data

if [ "$1" = '/elasticsearch/bin/elasticsearch' ]; then
    exec gosu elasticsearch "$@"
fi

exec "$@"
