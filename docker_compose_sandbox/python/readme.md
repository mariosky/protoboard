## sandbox-python

A docker container based on alpine for running python exercises in sandbox.

It includes:

* python, tap.py
* sandbox worker

## Working with this container

Build
`docker build -t mariosky/sandbox-python sandbox-python/`

Run Interactively
`docker run -t -i mariosky/sandbox-python /bin/sh`