# firefox-standalone-docker
A standalone firefox instance in a docker container working on arm

## Setup
Build the [geckodriver](https://firefox-source-docs.mozilla.org/testing/geckodriver/ARM.html)

Clone the repo

Copy the driver into the repo folder
``` bash
$ docker build -t armsel . 
$ docker run -d -p 4444:4444 armsel
```