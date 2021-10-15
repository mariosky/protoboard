FROM alpine:3.6
ENV ALPINE_VERSION=3.6

LABEL org.sandbox.language="python"

RUN apk update && apk --update  add git python3 py3-pip
RUN pip3 install redis
RUN pip3 install tap.py
COPY ./sandbox /home/sandbox