# RoboTeam Server
The RoboTeam server hosts the RoboTeam website, Wiki, Bitwarden server and the Future Factory website. To organize this, docker containers are used to separate all different images and dependencies. In general only a few scripts need to be used to keep everything running.

## Containers
### Nginx
The Nginx container is the overarching container. This either directly hosts a website (as is the case for the RoboTeam website) or redirects to a container (as is the case for the Wiki, Bitwarden and the Future Factory Website). This is all defined in the `nginx/conf.d` folder.
#### roboteamtwente.nl
The RoboTeam website is build by the Website container. It is then directly served from the folder that results from building.
### Website
The website is directly build from the [repository](https://github.com/RoboTeamTwente/roboteam_website). To rebuild the website, the `rebuild-website.sh` script can be ran. It will automatically rebuild the full website, which may take a while but makes sure all dependencies are updated to reflect the repository.
### Wiki
The Wiki is using the docker container `lscr.io/linuxserver/dokuwiki:latest`. Most of it is automatically configured, and the relevant configuration files are automatically saved in `wiki/config`.
### Bitwarden
The Bitwarden container uses `vaultwarden/server` as base, and is mostly automatically configured.
### Certbot
To get HTTPS certificates certbot is used. This is attached to the Nginx container such that it can automatically create the certificates and renew them using the script `renew-certificates.sh`. On the server this runs as a cronjob. To create a certificate for a new website you can use `docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d subdomain.roboteamtwente.nl`.
### Future Factory Website
The future factory website is served using a container. It is directly build from the [repository](https://github.com/RoboTeamTwente/future_factory_website)
and has both a production and a beta version. At the moment of writing they do share the same database. Hence be careful with any data changes, since they will affect the production database.

#### Database
In order to run the website a [PostgreSQL](https://www.postgresql.org/) database is used.