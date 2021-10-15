FROM mcr.microsoft.com/dotnet/sdk:3.1-alpine3.13
LABEL org.sandbox.language="csharp"
RUN apk update && apk --update  add git python3 py3-pip
RUN pip3 install redis
RUN pip3 install tap.py
COPY ./sandbox /home/sandbox

