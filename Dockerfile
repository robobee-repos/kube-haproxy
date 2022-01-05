FROM haproxy:2.5
USER root
RUN set -eux; \
\
savedAptMark="$(apt-mark showmanual)"; \
apt-get update && apt-get install -y --no-install-recommends \
  libcap2-bin \
; \
rm -rf /var/lib/apt/lists/*; \
apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
RUN setcap CAP_NET_BIND_SERVICE=+eip /usr/local/sbin/haproxy
USER haproxy
