#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR && \
docker-compose up -d --build

echo -n "Wait for setting up MySQL"
for i in {0..60}; do
    if ! mysqladmin ping -h127.0.0.1 -P3314 -uroot --silent; then
        :
    else
        echo 'OK!'
        exit 0
    fi
    echo -n '.'
    sleep 1
done
echo "Timeout!"
exit 1
