FROM debian:buster

LABEL AUTHOR Jacob White <jake@jwhite.network>

ENV DEBIAN_FRONTEND noninteractive
ENV PATH=$PATH:/opt/TinyTeX/bin/x86_64-linux/

RUN apt-get update -qq && apt-get install -qq perl wget libfontconfig1

RUN wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh -s - --admin --no-path \
    && mv ~/.TinyTeX /opt/TinyTeX \
    && (/opt/TinyTeX/bin/*/tlmgr path add || true) \
    && tlmgr install xetex oberdiek epstopdf && fmtutil-sys --all

WORKDIR /data
VOLUME ["/data"]