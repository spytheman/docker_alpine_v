FROM alpine:3.10

LABEL maintainer="Delyan Angelov <delyan@bulsynt.org>"

ENV VVV /opt/vlang
ENV PATH $VVV:$PATH
WORKDIR $VVV

RUN apk add git make upx gcc musl-dev openssl-dev sqlite-dev libx11-dev glfw-dev freetype-dev

RUN ln -s $VVV/v /usr/local/bin/v

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
