#
# Phusion Base image with Oracle JDK 8
#
FROM jleskinen/phusion
MAINTAINER jaakko.leskinen@gmail.com

# Set label for the image
LABEL java-version="jdk8"

# Define commonly used JAVA_HOME and JRE_HOME variables
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV JRE_HOME /usr/lib/jvm/java-8-oracle/jre

# Install Oracle Java
RUN add-apt-repository ppa:webupd8team/java \
 && apt-get update -y -qq \
 && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
 && apt-get install oracle-java8-set-default -y -qq \
# Clean up
 && apt-get clean all \
 && rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*