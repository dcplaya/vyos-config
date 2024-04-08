#!/bin/vbash

# Container networks
set container network containers description 'Network for VyOS containers'
set container network containers prefix '10.0.0.0/24'


# cloudflare-ddns
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value "er1.device.${SECRET_DOMAIN},vpn.${SECRET_DOMAIN},ipv4.${SECRET_DOMAIN}"
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value 'America/Los_Angeles'
set container name cloudflare-ddns environment PGID value "1000"
set container name cloudflare-ddns environment PUID value "1000"
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.11.0'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# dnsdist
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'America/Los_Angeles'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.3'
set container name dnsdist memory '0'
set container name dnsdist network containers address '10.0.0.4'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'

# haproxy
set container name haproxy cap-add 'net-bind-service'
set container name haproxy description 'HAProxy For Home Network'
set container name haproxy image 'haproxy:2.8.3'
set container name haproxy memory '4096'
set container name haproxy network containers address '10.0.0.102'
set container name haproxy restart 'always'
set container name haproxy shared-memory '1024'
set container name haproxy volume certs destination '/etc/ssl/live'
set container name haproxy volume certs mode 'ro'
set container name haproxy volume certs source '/config/containers/lego-auto'
set container name haproxy volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name haproxy volume config source '/config/containers/haproxy/config/haproxy.cfg'
set container name haproxy volume config mode 'ro'
set container name haproxy volume maps destination '/usr/local/etc/haproxy/maps'
set container name haproxy volume maps source '/config/containers/haproxy/config/maps'
set container name haproxy volume maps mode 'ro'

# lego-auto
set container name lego-auto allow-host-networks
set container name lego-auto environment CF_DNS_API_TOKEN value "${SECRET_CLOUDFLARE_CERT_TOKEN}"
set container name lego-auto environment LA_CACHDIR value '/certs/.cache'
set container name lego-auto environment LA_DATADIR value '/certs'
set container name lego-auto environment LA_DOMAINS value "*.${SECRET_DOMAIN} *.cluster-1.${SECRET_DOMAIN} *.cluster-2.${SECRET_DOMAIN} *.server.${SECRET_DOMAIN} *.s3.${SECRET_DOMAIN} *.containers.${SECRET_DOMAIN} *.ceph.${SECRET_DOMAIN} *.mgmt.${SECRET_DOMAIN}"
set container name lego-auto environment LA_EMAIL value "${SECRET_EMAIL}"
set container name lego-auto environment LA_PROVIDER value 'cloudflare'
set container name lego-auto environment TZ value 'America/Los_Angeles'
set container name lego-auto restart 'on-failure'
set container name lego-auto image 'ghcr.io/bjw-s/lego-auto:v0.3.0'
set container name lego-auto memory '0'
set container name lego-auto restart 'no'
set container name lego-auto shared-memory '0'
set container name lego-auto volume certs destination '/certs'
set container name lego-auto volume certs mode 'rw'
set container name lego-auto volume certs source '/config/containers/lego-auto'

# lldap
set container name lldap cap-add 'net-bind-service'
set container name lldap description 'LLDAP Server '
set container name lldap environment LLDAP_HTTP_PORT value '80'
set container name lldap environment LLDAP_IGNORED_USER_ATTRIBUTES value '[ enable, expire, comment, keys ]'
set container name lldap environment LLDAP_JWT_SECRET value "${SECRET_LLDAP_JWT_SECRET}"
set container name lldap environment LLDAP_LDAPS_OPTIONS__CERT_FILE value '/certs/cert.pem'
set container name lldap environment LLDAP_LDAPS_OPTIONS__ENABLED value 'true'
set container name lldap environment LLDAP_LDAPS_OPTIONS__KEY_FILE value '/certs/privkey.pem'
set container name lldap environment LLDAP_LDAP_BASE_DN value "dc=${SECRET_LLDAP_DC_SECRET},dc=com"
set container name lldap environment LLDAP_LDAP_PORT value '389'
set container name lldap environment LLDAP_LDAP_USER_PASS value "${SECRET_LLDAP_LDAP_USER_PASS}"
set container name lldap environment TZ value 'America/Los_Angeles'
set container name lldap environment UID value '0'
set container name lldap image 'ghcr.io/lldap/lldap:v0.5.0-alpine'
set container name lldap network containers address '10.0.0.253'
set container name lldap volume certs destination '/certs'
set container name lldap volume certs mode 'ro'
set container name lldap volume certs source '/config/containers/lego-auto'
set container name lldap volume data destination '/data'
set container name lldap volume data source '/config/containers/lldap/config'

# node-exporter
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/host/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.7.0'
set container name node-exporter memory '0'
set container name node-exporter allow-host-networks
set container name node-exporter restart 'on-failure'
set container name node-exporter shared-memory '0'
set container name node-exporter volume procfs source '/proc'
set container name node-exporter volume procfs destination '/host/proc'
set container name node-exporter volume procfs mode 'ro'
set container name node-exporter volume rootfs source '/'
set container name node-exporter volume rootfs destination '/host/rootfs'
set container name node-exporter volume rootfs mode 'ro'
set container name node-exporter volume sysfs source '/sys'
set container name node-exporter volume sysfs destination '/host/sys'
set container name node-exporter volume sysfs mode 'ro'

# powerdns admin web-ui
set container name powerdns-admin description 'PowerDNS Admin Web UI'
set container name powerdns-admin environment BIND_ADDRESS value '0.0.0.0'
set container name powerdns-admin environment PORT value '80'
set container name powerdns-admin environment SECRET_KEY value "${SECRET_POWERDNS_ADMIN_SECRET_KEY}"
set container name powerdns-admin environment SQLALCHEMY_DATABASE_URI value 'sqlite:////database/powerdns-admin.db'
set container name powerdns-admin image 'powerdnsadmin/pda-legacy:v0.3'
set container name powerdns-admin network containers address '10.0.0.32'
set container name powerdns-admin volume config destination '/data'
set container name powerdns-admin volume config source '/config/containers/powerdns/admin'
set container name powerdns-admin volume powerdns-db destination '/database'
set container name powerdns-admin volume powerdns-db source '/config/containers/powerdns/authoritative'

# powerdns authoritative
set container name powerdns-authoritative cap-add 'net-bind-service'
set container name powerdns-authoritative command '--launch=gsqlite3 --local-address=0.0.0.0 --local-port=53 --webserver=yes --webserver-address=0.0.0.0 --webserver-port=8081'
set container name powerdns-authoritative description 'PowerDNS Authoritative Server'
set container name powerdns-authoritative environment PDNS_AUTH_API_KEY value "${SECRET_POWERDNS_API_AUTH}"
set container name powerdns-authoritative image 'powerdns/pdns-auth-48:4.8.4'
set container name powerdns-authoritative network containers address '10.0.0.30'
set container name powerdns-authoritative volume config destination '/var/lib/powerdns'
set container name powerdns-authoritative volume config source '/config/containers/powerdns/authoritative'
set container name powerdns-authoritative volume pdns destination '/etc/powerdns/pdns.conf'
set container name powerdns-authoritative volume pdns source '/config/containers/powerdns/authoritative/pdns.conf'

# powerdns recursor
set container name powerdns-recursor cap-add 'net-bind-service'
set container name powerdns-recursor command "--forward-zones-file=/config/forward-zones-file --local-address=0.0.0.0 --local-port=53 --export-etc-hosts=yes --export-etc-hosts-search-suffix=${SECRET_DOMAIN} --trace=no --refresh-on-ttl-perc=10 --max-cache-ttl=300"
set container name powerdns-recursor description 'PowerDNS Recursor Server'
set container name powerdns-recursor image 'powerdns/pdns-recursor-48:4.8.5'
set container name powerdns-recursor network containers address '10.0.0.31'
set container name powerdns-recursor volume config destination '/config'
set container name powerdns-recursor volume config source '/config/containers/powerdns/recursor'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.4'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

# unifi
set container name unifi description 'Unifi Controller'
set container name unifi environment PGID value '102'
set container name unifi environment PUID value '1002'
set container name unifi environment RUNAS_UID0 value 'false'
set container name unifi environment TZ value 'America/Los_Angeles'
set container name unifi image 'ghcr.io/goofball222/unifi:8.0.28'
set container name unifi memory '0'
set container name unifi network containers address '10.0.0.220'
set container name unifi restart 'on-failure'
set container name unifi shared-memory '0'
set container name unifi volume certs destination '/usr/lib/unifi/cert'
set container name unifi volume certs mode 'rw'
set container name unifi volume certs source '/config/containers/lego-auto'
set container name unifi volume data destination '/usr/lib/unifi/data'
set container name unifi volume data mode 'rw'
set container name unifi volume data source '/config/containers/unifi/config'

# LibreNMS
set container name librenms cap-add 'net-admin'
set container name librenms cap-add 'net-raw'
set container name librenms environment CACHE_DRIVER value 'redis'
set container name librenms environment DB_HOST value '10.0.0.42'
set container name librenms environment DB_PASSWORD value "${SECRET_LIBRENMS_DB_PASSWORD}"
set container name librenms environment DB_TIMEOUT value '60'
set container name librenms environment DB_USER value 'librenms'
set container name librenms environment LIBRENMS_WEATHERMAP value 'false'
set container name librenms environment MAX_INPUT_VARS value '1000'
set container name librenms environment MEMORY_LIMIT value '256M'
set container name librenms environment OPCACHE_MEM_SIZE value '128'
set container name librenms environment REDIS_HOST value '10.0.0.43'
set container name librenms environment SESSION_DRIVER value 'redis'
set container name librenms environment TZ value 'America/Los_Angeles'
set container name librenms environment UPLOAD_MAX_SIZE value '16M'
set container name librenms environment APP_KEY value "${SECRET_LIBRENMS_APP_KEY}"
set container name librenms host-name 'librenms'
set container name librenms image 'librenms/librenms:24.2.0'
set container name librenms network containers address '10.0.0.41'
set container name librenms volume data destination '/data'
set container name librenms volume data mode 'rw'
set container name librenms volume data source '/config/containers/librenms/config'
# LibreNMS Database
set container name librenms-db command 'mysqld --innodb-file-per-table=1 --lower-case-table-names=0 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci'
set container name librenms-db environment MYSQL_ALLOW_EMPTY_PASSWORD value 'true'
set container name librenms-db environment MYSQL_DATABASE value 'librenms'
set container name librenms-db environment MYSQL_PASSWORD value "${SECRET_LIBRENMS_DB_PASSWORD}"
set container name librenms-db environment MYSQL_USER value 'librenms'
set container name librenms-db environment TZ value 'America/Los_Angeles'
set container name librenms-db image 'mariadb:10.5'
set container name librenms-db network containers address '10.0.0.42'
set container name librenms-db volume config destination '/var/lib/mysql'
set container name librenms-db volume config mode 'rw'
set container name librenms-db volume config source '/config/containers/librenms/database'
# LibreNMS Dispatcher
set container name librenms-dispatcher allow-host-networks
set container name librenms-dispatcher cap-add 'net-raw'
set container name librenms-dispatcher cap-add 'net-admin'
set container name librenms-dispatcher environment DB_HOST value '10.0.0.42'
set container name librenms-dispatcher environment DB_PASSWORD value "${SECRET_LIBRENMS_DB_PASSWORD}"
set container name librenms-dispatcher environment DB_TIMEOUT value '60'
set container name librenms-dispatcher environment DB_USER value 'librenms'
set container name librenms-dispatcher environment DISPATCHER_NODE_ID value 'dispatcher1'
set container name librenms-dispatcher environment REDIS_HOST value '10.0.0.43'
set container name librenms-dispatcher environment SIDECAR_DISPATCHER value '1'
set container name librenms-dispatcher environment TZ value 'America/Los_Angeles'
set container name librenms-dispatcher host-name 'librenms-dispatcher'
set container name librenms-dispatcher image 'librenms/librenms:24.2.0'
set container name librenms-dispatcher volume config destination '/data'
set container name librenms-dispatcher volume config mode 'rw'
set container name librenms-dispatcher volume config source '/config/containers/librenms/config'
# LibreNMS Redis
set container name librenms-redis environment TZ value 'America/Los_Angeles'
set container name librenms-redis image 'redis:5.0-alpine'
set container name librenms-redis network containers address '10.0.0.43'




# onepassword-connect
# set container name onepassword-connect disable
# set container name onepassword-connect image 'docker.io/1password/connect-api:1.7.2'
# set container name onepassword-connect environment TZ value 'Europe/Amsterdam'
# set container name onepassword-connect memory '0'
# set container name onepassword-connect network containers address '10.5.0.5'
# set container name onepassword-connect shared-memory '0'
# set container name onepassword-connect volume credentials source '/config/secrets/1password-credentials.json'
# set container name onepassword-connect volume credentials destination '/home/opuser/.op/1password-credentials.json'
# set container name onepassword-connect volume credentials mode 'ro'
# set container name onepassword-connect volume data source '/tmp/onepassword/data'
# set container name onepassword-connect volume data destination '/home/opuser/.op/data'
# set container name onepassword-connect volume data mode 'rw'
# 
# # onepassword-sync
# set container name onepassword-sync disable
# set container name onepassword-sync image 'docker.io/1password/connect-sync:1.7.2'
# set container name onepassword-sync environment TZ value 'Europe/Amsterdam'
# set container name onepassword-sync memory '0'
# set container name onepassword-sync shared-memory '0'
# set container name onepassword-sync network containers address '10.5.0.6'
# set container name onepassword-sync volume credentials source '/config/secrets/1password-credentials.json'
# set container name onepassword-sync volume credentials destination '/home/opuser/.op/1password-credentials.json'
# set container name onepassword-sync volume credentials mode 'ro'
# set container name onepassword-sync volume data source '/tmp/onepassword/data'
# set container name onepassword-sync volume data destination '/home/opuser/.op/data'
# set container name onepassword-sync volume data mode 'rw'
# 
# # matchbox
# set container name matchbox disable
# set container name matchbox arguments '-address=0.0.0.0:80 -log-level=debug'
# set container name matchbox cap-add 'net-bind-service'
# set container name matchbox image 'quay.io/poseidon/matchbox:v0.10.0'
# set container name matchbox memory '0'
# set container name matchbox network containers address '10.0.0.99'
# set container name matchbox shared-memory '0'
# set container name matchbox volume matchbox-data destination '/var/lib/matchbox'
# set container name matchbox volume matchbox-data mode 'rw'
# set container name matchbox volume matchbox-data propagation 'private'
# set container name matchbox volume matchbox-data source '/config/containers/matchbox/data'
# 