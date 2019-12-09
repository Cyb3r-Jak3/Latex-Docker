FROM alpine:latest

RUN apk add --no-cache \
        wget \
        && wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

WORKDIR /data
VOLUME ["/data"]