#!/bin/bash
set -e

if [ -d ${SSH_KEYS_PATH} ]; then
    cp ${SSH_KEYS_PATH}/*.pem  /root
    chmod 400 /root/*.pem

    else
    echo "No SSH Keys"

fi

exec "$@"