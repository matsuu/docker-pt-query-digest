FROM alpine:latest

ADD http://percona.com/get/percona-toolkit.tar.gz /
RUN \
  apk update && \
  apk add perl perl-dbd-mysql && \
  apk add --virtual=build make && \
  tar zxf /percona-toolkit.tar.gz && \
  ( \
    cd percona-toolkit-* && \
    perl Makefile.PL && \
    make && \
    make install \
  ) && \
  rm -rf percona-toolkit* && \
  apk del --purge build

ENTRYPOINT ["pt-query-digest"]
