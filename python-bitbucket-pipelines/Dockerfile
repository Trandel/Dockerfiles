FROM python:3.5.1

MAINTAINER Tomasz Trznadel @trandel

RUN apt-get update && apt-get install -y zip && \
pip install boto3==1.3.0 && apt-get autoremove -y && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
