# firefox-standalone-docker
A standalone firefox instance in a docker container working on arm

## Setup
``` bash
$ docker build -t armsel . 
$ docker run -d -p 4444:4444 armsel
```