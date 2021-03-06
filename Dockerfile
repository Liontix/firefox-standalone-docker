FROM navikey/raspbian-buster
# FROM ubuntu:bionic
# FROM openjdk:11

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# downloading the required packages

RUN apt-get update && apt-get install -y \
    fonts-liberation libappindicator3.1 libasound2 libatk-bridge2.0-0 \
    libnspr4 libnss3 lsb-release xdg-utils libxss1 libdbus-glib-1-2 software-properties-common

RUN apt-get upgrade -y
RUN apt-get install -y libc6 
# RUN apt install -y gcc-arm-linux-gnueabihf libc6-armhf-cross libc6-dev-armhf-cross

RUN apt-get install -y curl unzip wget libgbm1 openjdk-11-jdk-headless \
    xvfb 

# copy the arm geckodriver (that you have build yourself)

COPY geckodriver geckodriver

RUN mv geckodriver /usr/local/bin/

RUN dpkg --configure -a

RUN apt-get install -y firefox-esr

# downloading the standalone selenium server jar

RUN wget https://selenium-release.storage.googleapis.com/3.9/selenium-server-standalone-3.9.1.jar

RUN geckodriver --version

# starting a virtual display with xvfb and running the standalone instance

ENTRYPOINT xvfb-run -a --server-args="-screen 0 1280x800x24 -ac -nolisten tcp -dpi 96 +extension RANDR" java -jar selenium-server-standalone-3.9.1.jar