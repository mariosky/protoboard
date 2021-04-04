## sandbox-csharp

A docker container based on debian for running  c# for running exercises in sandbox.

It includes:

* mono, Nunit
* sandbox worker

## Working with this container

Build
`docker build -t mariosky/sandbox-csharp sandbox-csharp/`

Run Interactively
`docker run -t -i mariosky/sandbox-csharp /bin/sh