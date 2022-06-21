FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.16-amd64
LABEL org.sandbox.language="csharp"
RUN apk update && apk --update  add git python3 py3-pip
RUN pip3 install redis
COPY ./sandbox /home/sandbox
RUN cd /home/sandbox && dotnet new xunit -o test_csharp 
