# vpnc-socks

Just a simple docker container running socks proxy and vpnc under supervisor.

VPNC will prompt for password. Make sure you attach to the container for logging in to the vpn.

# Usage:

## 1. Create vpnc.conf file with contents (YMMV):
```sh
IPSec gateway xxxxxxxxxxxx
IPSec ID xxxxxxxxxxxx
IPSec secret xxxxxxxxxxxx
NAT Traversal Mode natt
IKE Authmode psk
Xauth username xxxxxxxxxxxx
```

## 2. Build the container image:

```sh
./build.sh
```

## 3. Run the container passing default and tunneled DNS server:
```sh
docker run --rm -it -p 1080:1080 --privileged --dns 8.8.8.8 -e DNS=192.168.10.1 jleskinen/vpnc-socks
```

## 4. Configure your browser

Open your browser settings and configure SOCKS proxy:
```sh
localhost:1080
```


# Author

Jaakko Leskinen <jaakko.leskinen@gmail.com>