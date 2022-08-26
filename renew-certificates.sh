#!/bin/bash
dir=$PWD
cd "$(dirname "$0")/docker"

/usr/local/bin/docker-compose run --rm certbot renew
/usr/local/bin/docker-compose restart nginx

cd "$dir"
