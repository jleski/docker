# Phusion Base Image
FROM phusion/baseimage
MAINTAINER "Jaakko Leskinen" <jaakko.leskinen@gmail.com>
ENV container docker

# set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime

ARG GOSU_REPO=https://github.com/tianon/gosu/releases/download/1.10
ARG GOSU_PKG=gosu-amd64
ARG GOSU_SHA=8068f973713558e750b5cbe74e2c5a40d6aeb631
ARG TINI_REPO=https://github.com/krallin/tini/releases/download/v0.16.1/
ARG TINI_PKG=tini-static-amd64
ARG TINI_SHA=d1cb5d71adc01d47e302ea439d70c79bd0864288

LABEL base-image="Phusion" \
      vendor="Jaakko Leskinen"

# install updates
RUN apt-get update -y -qq \
 && apt-get upgrade -y -qq \
 && apt-get dist-upgrade -y -qq

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fsSL ${TINI_REPO}/${TINI_PKG} -o /bin/tini && chmod +x /bin/tini \
 && echo "$TINI_SHA  /bin/tini" | sha1sum -c -

# Setup gosu for easier command execution
RUN curl -OL ${GOSU_REPO}/${GOSU_PKG} 2>/dev/null \
&& echo "${GOSU_SHA}  ${GOSU_PKG}" | sha1sum -c \
&& mv ${GOSU_PKG} /usr/local/bin/gosu \
&& chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/bin/tini", "--"]
CMD ["bash"]
