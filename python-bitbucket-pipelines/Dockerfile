FROM python:3.5.1

MAINTAINER Tomasz Trznadel @trandel

RUN apt-get update
# required for packaging up the application
RUN apt-get install -y zip
# required for codedeploy_deploy.py
RUN pip install boto3==1.3.0
