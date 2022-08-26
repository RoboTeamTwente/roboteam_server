FROM node:14-alpine

RUN apk update && \
    apk upgrade && \
    apk add git

RUN npm install -g ember-cli

RUN git clone https://github.com/RoboTeamTwente/roboteam_website.git

WORKDIR roboteam_website

RUN npm install

RUN ember build --environment production

CMD rm -rf /website/* && cp -r dist/* /website
