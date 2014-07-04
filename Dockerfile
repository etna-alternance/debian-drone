FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y locales
RUN locale-gen --no-purge en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y socat
