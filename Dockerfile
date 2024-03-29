FROM debian:buster

LABEL AUTHOR Jacob White <jake@jwhite.network>

ENV DEBIAN_FRONTEND noninteractive

RUN ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && echo "Etc/UTC" > /etc/timezone \
    && apt-get update -qq \
    && apt-get upgrade -qq \
    && apt-get install texlive-full biber python-pygments gnuplot -qq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]