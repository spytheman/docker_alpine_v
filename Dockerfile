FROM alpine:3.10

LABEL maintainer="Delyan Angelov <delyan@bulsynt.org>"

ENV VVV /opt/vlang
ENV PATH $VVV:$PATH

RUN mkdir -p $VVV

WORKDIR $VVV

RUN apk --update --no-cache  add  --virtual vvvdeps \
             git make upx gcc \
             musl-dev \
             openssl-dev sqlite-dev \
             libx11-dev glfw-dev freetype-dev
             
RUN ln -s $VVV/v /usr/bin/v

ONBUILD COPY . .

CMD ["make", "all", "selfcompile"]
CMD ["/opt/vlang/v", "--version"]
CMD ["/opt/vlang/v", "test", "v"]
