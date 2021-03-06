FROM ubuntu:16.04

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates


RUN apt-get install -y wget python3.5 python3-pip git

RUN python3.5 -m pip install kubernetes tornado aiohttp pymongo --ignore-installed 
ADD . /ktqueue
WORKDIR /ktqueue

RUN python3.5 -m pip install -r requirements.txt 
CMD python3 /ktqueue/server.py

EXPOSE 8080
