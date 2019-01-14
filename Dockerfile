FROM python:3.5-jessie
MAINTAINER Joshua Gorospe <joshua.gorospe@gmail.com>

USER root

# Un-comment the following two lines if you are not running this container in Amazon ECS or in Kubernetes.
#RUN mkdir /rfw
#COPY ./Workshop-Examples /rfw

# Customize sources for apt-get
RUN  echo "deb http://deb.debian.org/debian jessie main contrib non-free\n" > /etc/apt/sources.list \
  && echo "deb http://deb.debian.org/debian jessie-updates main contrib non-free\n" >> /etc/apt/sources.list \
  && echo "deb http://security.debian.org/ jessie/updates main contrib non-free\n" >> /etc/apt/sources.list \
  && echo "deb http://ftp.debian.org/debian jessie-backports main\n" >> /etc/apt/sources.list

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update --fix-missing -y && apt-get install --no-install-recommends -y && apt-get -y upgrade \
    apt-utils \
    ca-certificates \
    gcc \
    make \
    git \
    git-core \
    gettext \
&& mv /usr/bin/envsubst /usr/local/sbin/envsubst

RUN apt-get update && apt-get install --no-install-recommends -y
RUN apt-get -y upgrade

# Install Python 3, update pip3, and install all Robot Framework libraries
RUN apt-get update --fix-missing -y \
  && apt-get install python3 -y \
  && apt-get install python3-pip -y \
  && python3 -m pip install pip --upgrade \
  && python3 -m pip install wheel \
  && python3 -m pip install robotframework \
  && pip3 install requests \
  && pip3 install -U robotframework-requests \
  && pip3 install pyyaml \
  && apt-get clean -y \
  && apt-get update --fix-missing -y \
  && apt-get install build-essential libssl-dev libffi-dev -y \
  && pip3 install -U robotframework-pabot

RUN apt-get install -y \
  wget \
  curl \
  libcurl3

RUN git clone https://gitlab.com/akihe/radamsa.git && cd radamsa && make && make install

# Install Newman, a Postman CLI tool
RUN curl -sL https://deb.nodesource.com/setup_8.x --retry 2 | bash
RUN apt-get install -y nodejs && npm install -g newman && npm install crapify -g && npm i newman && npm install --save newman-reporter-text

# Includes minimal runtime used for executing non GUI Java programs
RUN apt-get -y update \
  && apt-get -y install \
    ca-certificates-java \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
RUN apt-get -y update \
  && apt-get -y install \
    openjdk-7-jre-headless \
  && sed -i 's/securerandom\.source=file:\/dev\/random/securerandom\.source=file:\/dev\/urandom/' \
    ./usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security

RUN curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq --retry 2 \
  && chmod +x /usr/local/bin/jq \
  && git clone https://github.com/course-hero/slacktee.git \
  && chmod +x ./slacktee/install.sh \
  && touch /root/.slacktee \
  && bash ./slacktee/install.sh /usr/bin

# Check for new versions on http://graphwalker.github.io
RUN wget http://graphwalker.github.io/content/archive/graphwalker-cli-3.4.2.jar \
  && cp graphwalker-cli-3.4.2.jar /usr/bin/ \
  && chmod +x /usr/bin/graphwalker-cli-3.4.2.jar

EXPOSE 9000

ADD commands-running-inside-a-docker-container.sh /usr/local/bin/commands-running-inside-a-docker-container.sh
RUN chmod +x /usr/local/bin/commands-running-inside-a-docker-container.sh
