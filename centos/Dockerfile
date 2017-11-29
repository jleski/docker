# CentOS 7 Base Image
FROM centos:7
MAINTAINER "Jaakko Leskinen" <jaakko.leskinen@gmail.com>
ENV container docker

RUN ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime

ARG GOSU_REPO=https://github.com/tianon/gosu/releases/download/1.10
ARG GOSU_PKG=gosu-amd64
ARG GOSU_SHA=8068f973713558e750b5cbe74e2c5a40d6aeb631
ARG TINI_REPO=https://github.com/krallin/tini/releases/download/v0.16.1/
ARG TINI_PKG=tini-static-amd64
ARG TINI_SHA=7d00da20acc5c3eb21d959733917f6672b57dabb

LABEL base-image="CentOS 7" \
      vendor="Jaakko Leskinen"

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
