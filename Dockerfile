FROM alpine:latest

ARG BRANCH=3.x

RUN \
  apk update && \
  apk add perl perl-dbd-mysql && \
  apk add --virtual=build git go make && \
  git clone https://github.com/percona/percona-toolkit.git && \
  ( \
    cd percona-toolkit && \
    git checkout ${BRANCH} && \
    perl Makefile.PL && \
    make && \
    make install \
  ) && \
  rm -rf percona-toolkit && \
  apk del --purge build

ENTRYPOINT ["pt-query-digest"]
