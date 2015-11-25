#!/bin/bash
set -e

chown -R elastic:elastic /data

if [ "$1" = '/elasticsearch/bin/elasticsearch' ]; then
    exec gosu elastic "$@"
fi

exec "$@"
