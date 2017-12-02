#
# Centos Base image with Oracle JDK 8
#
# Forked from https://github.com/nimmis/docker-java-centos
#

FROM jleskinen/centos
MAINTAINER "Jaakko Leskinen" <jaakko.leskinen@gmail.com>

ARG javaver="8u151"
ARG javaurl="b12"
ARG javahome="jdk1.8.0_151"
LABEL java-version="jdk-${javaver}"

RUN yum update -y -q && \
curl -C - -L -O -# -H "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/${javaver}-${javaurl}/e758a0de34e24606bca991d704f6dcbf/jdk-${javaver}-linux-x64.rpm" && \
yum localinstall -y jdk-${javaver}-linux-x64.rpm && \
rm -f jdk-${javaver}-linux-x64.rpm && \
yum clean all

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/${javahome}

WORKDIR /