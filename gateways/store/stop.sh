#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR && \
docker-compose stop # サービスを停止させる
docker-compose down # コンテナの停止、削除、さらにネットワーク、記憶領域を全て削除
