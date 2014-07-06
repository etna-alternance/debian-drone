FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list
RUN apt-get update
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
RUN apt-get install -y build-essential
RUN apt-get install -t squeeze-backports -y git
RUN apt-get install -y socat
RUN apt-get install -y wget curl
