FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8 fr_FR.UTF-8

ENV HOME /root
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ Europe/Paris

RUN apt-get upgrade -y
RUN apt-get install -y build-essential autoconf subversion
RUN apt-get install -y wget curl openssl socat mysql-client python
RUN apt-get install -y zlib1g zlib1g-dev libssl-dev libcurl4-openssl-dev libexpat1-dev gettext

ADD git-1.7.5.4 /tmp/git

RUN cd /tmp/git && \
    make NO_TCLTK=YesPlease prefix=/usr/local all && \
    make NO_TCLTK=YesPlease prefix=/usr/local install
