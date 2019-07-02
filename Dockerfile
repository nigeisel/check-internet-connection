FROM python:3.6-jessie

RUN mkdir /app
WORKDIR app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY plot.py ./

RUN python3 plot.py
