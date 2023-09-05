#!/bin/bash
dir=$PWD
cd "$(dirname "$0")/docker"

docker-compose build --no-cache future_factory_website
docker-compose up -d future_factory_website
docker-compose exec -it docker_future_factory_website_1 python manage.py collectstatic --no-input
docker-compose restart nginx

cd "$dir"
