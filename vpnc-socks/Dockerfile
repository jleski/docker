FROM phusion/baseimage:0.9.16
MAINTAINER "Jaakko Leskinen" <jaakko.leskinen@gmail.com>

# define package versions and variables
ARG GOSU_REPO=https://github.com/tianon/gosu/releases/download/1.10
ARG GOSU_SHA=8068f973713558e750b5cbe74e2c5a40d6aeb631
ARG GOSU_PKG=gosu-amd64

# setup env variables
ENV APP_USER=vpn

RUN apt-get update -y -qq \
 && apt-get install -y -qq vpnc iproute2 supervisor dnsutils netcat \
# Clean up
 && apt-get autoremove -y -qq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && cp /usr/share/zoneinfo/Europe/Helsinki /etc/localtime

# copy supervisor configs
ADD supervisord.conf /etc/
ADD supervisord_sshd.conf /etc/supervisor/conf.d/sshd.conf
ADD supervisord_socks.conf /etc/supervisor/conf.d/socks.conf

# copy vpn profile config
ADD vpnc.conf /etc/vpnc/myvpn.conf

# create user & ssh key
RUN useradd -m -s /bin/bash ${APP_USER} \
 && echo "vpn:vpn" | chpasswd \
 && ssh-keygen -A \
 && mkdir -p /home/${APP_USER}/.ssh/ \
 && chmod 700 /home/${APP_USER}/.ssh/ \
 && chown ${APP_USER}.${APP_USER} /home/${APP_USER}/.ssh \
 && sudo -u ${APP_USER} ssh-keygen -t rsa -P "" -f /home/${APP_USER}/.ssh/id_rsa \
 && cat /home/${APP_USER}/.ssh/id_rsa.pub > /home/${APP_USER}/.ssh/authorized_keys \
 && chown ${APP_USER}.${APP_USER} /home/${APP_USER}/.ssh/* -R

# Setup gosu for easier command execution
RUN curl -OL ${GOSU_REPO}/${GOSU_PKG} 2>/dev/null \
&& echo "${GOSU_SHA}  ${GOSU_PKG}" | sha1sum -c \
&& mv ${GOSU_PKG} /usr/local/bin/gosu \
&& chmod +x /usr/local/bin/gosu

#ENTRYPOINT
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD "/start.sh"
