FROM debian

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
RUN apt-get install -y build-essential autoconf zlib1g zlib1g-dev
RUN apt-get install -y socat
RUN apt-get install -y wget curl

ADD git-1.7.5.4 /tmp/git

RUN cd /tmp/git && \
    make NO_CURL=1 NO_MSGFMT=YesPlease NO_TCLTK=YesPlease NO_GETTEXT=YesPlease prefix=/usr/local install
