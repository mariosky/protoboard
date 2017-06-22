FROM python:2.7.13-alpine

ENV PYTHONUNBUFFERED 1

RUN apk update && apk --update  add git postgresql-dev gcc python-dev g++

RUN mkdir /code
ADD . /code/
WORKDIR /code
RUN pip install -r requirements.txt

