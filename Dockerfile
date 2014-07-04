FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen --no-purge en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN sudo apt-get update
RUN sudo apt-get upgrade -y
RUN sudo apt-get install -y build-essential
RUN sudo apt-get install -y git
RUN sudo apt-get install -y socat
RUN sudo apt-get install -y nodejs
