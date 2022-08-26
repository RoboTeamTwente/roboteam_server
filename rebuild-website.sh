#!/bin/bash
dir=$PWD
cd "$(dirname "$0")/docker"

docker-compose build --no-cache website
docker-compose run website

cd "$dir"
