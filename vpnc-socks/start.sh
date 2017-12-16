#!/bin/bash
# start vpn
DNS_DEFAULT=8.8.8.8
DNS=${DNS:=DNS_DEFAULT}
vpnc myvpn --local-port 0
if [ $? -eq 0 ]; then
    cp /etc/resolv.conf /tmp/resolv.conf.new
    sed -i "s/nameserver .*/nameserver ${DNS}/g" /tmp/resolv.conf.new
    cp /tmp/resolv.conf.new /etc/resolv.conf && rm /tmp/resolv.conf.new
    # start sshd and ssh socks tunnel in the background with supervisor
    /usr/bin/supervisord --nodaemon --configuration /etc/supervisord.conf
fi
cp /etc/resolv.conf /tmp/resolv.conf.new
sed -i "s/nameserver .*/nameserver ${DNS_DEFAULT}/g" /tmp/resolv.conf.new
cp /tmp/resolv.conf.new /etc/resolv.conf && rm /tmp/resolv.conf.new
# kill vpn process, container is shutting down
vpnc-disconnect
killall vpnc