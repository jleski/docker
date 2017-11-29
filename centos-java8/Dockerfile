#
# Centos Base image with Oracle JDK 8
#
# Forked from https://github.com/nimmis/docker-java-centos
#

FROM jleskinen/centos
MAINTAINER "Jaakko Leskinen" <jaakko.leskinen@gmail.com>

ARG javaver="8u151"
ARG javaurl="b14"
ARG javahome="jdk1.8.0_151"
LABEL java-version="jdk-${javaver}"

RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/${javaver}-${javaurl}/jdk-${javaver}-linux-x64.rpm" && \
yum localinstall -y jdk-${javaver}-linux-x64.rpm && \
rm -f jdk-${javaver}-linux-x64.rpm && \
yum clean all

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/${javahome}

WORKDIR /

ENV container docker
CMD ["/usr/sbin/init"]
