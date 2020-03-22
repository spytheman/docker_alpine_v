FROM alpine:3.10

LABEL maintainer="Delyan Angelov <delyan@bulsynt.org>"

WORKDIR /opt/vlang

ENV VVV  /opt/vlang
ENV PATH /opt/vlang:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p /opt/vlang && ln -s /opt/vlang/v /usr/bin/v

RUN apk --no-cache  add  --virtual vvvdeps \
  git make upx gcc \
  musl-dev \
  openssl-dev sqlite-dev \
  libx11-dev glfw-dev freetype-dev

RUN apk --no-cache add --virtual sdl2deps sdl2-dev sdl2_ttf-dev sdl2_mixer-dev sdl2_image-dev valgrind
