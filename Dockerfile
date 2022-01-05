FROM haproxy:2.5
USER root
setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/haproxy
USER haproxy
