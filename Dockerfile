FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /work
ADD sources.list /etc/apt/sources.list
ADD preferences /etc/apt/preferences
RUN apt-get -y update
RUN apt-get -y install devscripts
RUN apt-get -y build-dep libnice10
RUN apt-get -y source libnice10 -t unstable
RUN mkdir /build
