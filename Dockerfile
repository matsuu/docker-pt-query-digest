FROM alpine:latest

ARG VERSION=3.0.6

ADD https://www.percona.com/downloads/percona-toolkit/${VERSION}/binary/tarball/percona-toolkit-${VERSION}_x86_64.tar.gz /
RUN \
  apk update && \
  apk add perl perl-dbd-mysql && \
  apk add --virtual=build make && \
  tar zxf /percona-toolkit-${VERSION}_x86_64.tar.gz && \
  ( \
    cd percona-toolkit-${VERSION} && \
    perl Makefile.PL && \
    make && \
    make install \
  ) && \
  rm -rf percona-toolkit-${VERSION}.tar.gz percona-toolkit-${VERSION} && \
  apk del --purge build

ENTRYPOINT ["pt-query-digest"]
