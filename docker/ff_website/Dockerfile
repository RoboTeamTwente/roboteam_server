FROM python:3.10

RUN git clone https://github.com/RoboTeamTwente/future_factory_website.git

WORKDIR future_factory_website

RUN pip install -r requirements.txt
RUN python3 manage.py collectstatic