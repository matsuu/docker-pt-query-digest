FROM alpine:latest

ARG VERSION=3.0.9
ARG ARCH=x86_64

ADD https://www.percona.com/downloads/percona-toolkit/${VERSION}/binary/tarball/percona-toolkit-${VERSION}_${ARCH}.tar.gz /
RUN \
  apk update && \
  apk add perl perl-dbd-mysql && \
  apk add --virtual=build make && \
  tar zxf /percona-toolkit-${VERSION}_${ARCH}.tar.gz && \
  ( \
    cd percona-toolkit-${VERSION} && \
    perl Makefile.PL && \
    make && \
    make install \
  ) && \
  rm -rf percona-toolkit-${VERSION}_${ARCH}.tar.gz percona-toolkit-${VERSION} && \
  apk del --purge build

ENTRYPOINT ["pt-query-digest"]
