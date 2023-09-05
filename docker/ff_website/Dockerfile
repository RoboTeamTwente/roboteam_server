FROM node:19

RUN git clone https://github.com/RoboTeamTwente/future_factory_website.git
WORKDIR future_factory_website

WORKDIR static
RUN npm install
RUN npm start build
WORKDIR ..

FROM python:3.10
COPY --from=0 ./future_factory_website ./future_factory_website
WORKDIR future_factory_website

ENV DEBUG FALSE
ENV BETA FALSE

RUN pip install -r requirements.txt
RUN python3 manage.py collectstatic --clear --no-input
