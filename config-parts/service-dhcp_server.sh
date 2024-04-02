#!/bin/vbash

# Global options
set service dhcp-server dynamic-dns-update
set service dhcp-server global-parameters "option ubnt.unifi-controller unifi-container.${SECRET_DOMAIN};"
set service dhcp-server global-parameters 'ddns-updates on;'
set service dhcp-server global-parameters 'option client-arch code 93 = unsigned integer 16;'
set service dhcp-server global-parameters "key rndc-key { algorithm hmac-md5; secret ${SECRET_RNDC_KEY}; };"
# Always send updates to the DNS server. When set to 'on', it will only send DNS updates when it thinks its needed
set service dhcp-server global-parameters 'update-optimization off;'
# Allows a new record with the same hostname to override the old one, even if the client's network interface MAC address is different
set service dhcp-server global-parameters 'update-conflict-detection off;'
# configures the server to respond to DHCP LeaseQuery messages
set service dhcp-server global-parameters 'allow client-updates;'
# Causes the DHCP server to perform DNS updates for clients when enabled
set service dhcp-server global-parameters 'update-static-leases on;'
set service dhcp-server listen-address '10.255.253.1'


# Cluster-1 VLAN
set service dhcp-server shared-network-name Cluster-1 authoritative
set service dhcp-server shared-network-name Cluster-1 description 'Cluster-1'
set service dhcp-server shared-network-name Cluster-1 name-server '10.0.0.4'
set service dhcp-server shared-network-name Cluster-1 ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Cluster-1 shared-network-parameters "zone cluster-1.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Cluster-1 shared-network-parameters "ddns-domainname &quot;cluster-1.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Cluster-1 shared-network-parameters 'zone 1.200.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Cluster-1 shared-network-parameters 'ddns-rev-domainname  &quot;1.200.10.in-addr.arpa.&quot;;'\

set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 default-router '10.200.1.1'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.50'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.32'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.33'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.34'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.35'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.36'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.37'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.38'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.39'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.40'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.41'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.42'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.43'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.44'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.45'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.46'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.47'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.48'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.49'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.51'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.52'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.53'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.54'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.55'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.56'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.57'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.58'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.59'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.60'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.61'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.62'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 exclude '10.200.1.63'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 lease '3600'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 range 0 start '10.200.1.100'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 range 0 stop '10.200.1.200'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp1.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.109'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp1.cluster-1.${SECRET_DOMAIN} mac-address '1c:69:7a:ae:55:58'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp2.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.108'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp2.cluster-1.${SECRET_DOMAIN} mac-address '1c:69:7a:ae:55:22'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp3.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.111'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping cp3.cluster-1.${SECRET_DOMAIN} mac-address '76:00:F6:96:C6:DF'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work1.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.118'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work1.cluster-1.${SECRET_DOMAIN} mac-address '72:f2:0d:00:ac:b4'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work2.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.130'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work2.cluster-1.${SECRET_DOMAIN} mac-address 'B2:85:37:24:EF:85'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work3.cluster-1.${SECRET_DOMAIN} ip-address '10.200.1.132'
set service dhcp-server shared-network-name Cluster-1 subnet 10.200.1.0/24 static-mapping work3.cluster-1.${SECRET_DOMAIN} mac-address '8E:EE:0B:19:F4:94'


# Cluster-2 VLAN
set service dhcp-server shared-network-name Cluster-2 authoritative
set service dhcp-server shared-network-name Cluster-2 description 'Cluster-2 Network'
set service dhcp-server shared-network-name Cluster-2 name-server '10.0.0.4'
set service dhcp-server shared-network-name Cluster-2 ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Cluster-2 shared-network-parameters "zone cluster-2.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Cluster-2 shared-network-parameters "ddns-domainname &quot;cluster-2.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Cluster-2 shared-network-parameters 'zone 2.200.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Cluster-2 shared-network-parameters 'ddns-rev-domainname  &quot;2.200.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name Cluster-2 subnet 10.200.2.0/24 default-router '10.200.2.1'
set service dhcp-server shared-network-name Cluster-2 subnet 10.200.2.0/24 lease '3600'
set service dhcp-server shared-network-name Cluster-2 subnet 10.200.2.0/24 range 0 start '10.200.2.100'
set service dhcp-server shared-network-name Cluster-2 subnet 10.200.2.0/24 range 0 stop '10.200.2.200'


# Corosync - Will be removed after proxmox nodes are retired
set service dhcp-server shared-network-name Corosync authoritative
set service dhcp-server shared-network-name Corosync description 'Proxmox Corosync Network. DHCP server isnt really needed but doing it as standard'
set service dhcp-server shared-network-name Corosync domain-name "corosync.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name Corosync name-server '10.0.0.4'
set service dhcp-server shared-network-name Corosync ntp-server '10.255.253.1'

set service dhcp-server shared-network-name Corosync subnet 10.199.9.0/24 range 0 start '10.199.9.100'
set service dhcp-server shared-network-name Corosync subnet 10.199.9.0/24 range 0 stop '10.199.9.200'


# Guest VLAN
set service dhcp-server shared-network-name Guest authoritative
set service dhcp-server shared-network-name Guest description 'Guest Network VLAN50'
set service dhcp-server shared-network-name Guest name-server '10.0.0.4'
set service dhcp-server shared-network-name Guest ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Guest shared-network-parameters "zone guest.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Guest shared-network-parameters "ddns-domainname &quot;guest.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Guest shared-network-parameters 'zone 50.10.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Guest shared-network-parameters 'ddns-rev-domainname  &quot;50.10.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name Guest subnet 10.10.50.0/24 default-router '10.10.50.1'
set service dhcp-server shared-network-name Guest subnet 10.10.50.0/24 domain-name "guest.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name Guest subnet 10.10.50.0/24 lease '3600'
set service dhcp-server shared-network-name Guest subnet 10.10.50.0/24 range 0 start '10.10.50.100'
set service dhcp-server shared-network-name Guest subnet 10.10.50.0/24 range 0 stop '10.10.50.200'


# Inter-VLAN VLAN
set service dhcp-server shared-network-name Inter-VLAN authoritative
set service dhcp-server shared-network-name Inter-VLAN description 'Needed For ISC Server To Listen For ALL Subnets'
set service dhcp-server shared-network-name Inter-VLAN name-server '10.0.0.4'
set service dhcp-server shared-network-name Inter-VLAN ntp-server '10.255.253.1'

set service dhcp-server shared-network-name Inter-VLAN subnet 10.255.253.0/24 lease '3600'
set service dhcp-server shared-network-name Inter-VLAN subnet 10.255.253.0/24 range 0 start '10.255.253.100'
set service dhcp-server shared-network-name Inter-VLAN subnet 10.255.253.0/24 range 0 stop '10.255.253.100'


# IoT VLAN
set service dhcp-server shared-network-name IoT authoritative
set service dhcp-server shared-network-name IoT description 'IoT VLAN100'
set service dhcp-server shared-network-name IoT name-server '10.0.0.4'
set service dhcp-server shared-network-name IoT ntp-server '10.255.253.1'
set service dhcp-server shared-network-name IoT shared-network-parameters "zone iot.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name IoT shared-network-parameters "ddns-domainname &quot;iot.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name IoT shared-network-parameters 'zone 100.10.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name IoT shared-network-parameters 'ddns-rev-domainname  &quot;100.10.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 default-router '10.10.100.1'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 domain-name "iot.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 lease '86400'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 range 0 start '10.10.100.100'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 range 0 stop '10.10.100.200'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 static-mapping vacuum01 mac-address 'b8:4d:43:9c:54:37'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 static-mapping vacuum01 static-mapping-parameters 'ddns-hostname vacuum01;'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 static-mapping zigbee-gateway mac-address '08:3a:f2:3b:16:b3'
set service dhcp-server shared-network-name IoT subnet 10.10.100.0/24 static-mapping zigbee-gateway static-mapping-parameters 'ddns-hostname zigbee-gateway;'


# LAN VLAN
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN description 'LAN / VLAN1 / Default VLAN / Untagged'
set service dhcp-server shared-network-name LAN name-server '10.0.0.4'
set service dhcp-server shared-network-name LAN ntp-server '10.255.253.1'
set service dhcp-server shared-network-name LAN shared-network-parameters "zone lan.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name LAN shared-network-parameters "ddns-domainname &quot;lan.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name LAN shared-network-parameters 'zone 1.10.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name LAN shared-network-parameters 'ddns-rev-domainname  &quot;1.10.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 default-router '10.10.1.1'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 domain-name "lan.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 lease '3600'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 range 0 start '10.10.1.100'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 range 0 stop '10.10.1.200'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping androidtv mac-address '48:b0:2d:13:04:d1'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping androidtv static-mapping-parameters 'ddns-hostname androidtv;'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping carasworklaptop ip-address '10.10.1.133'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping carasworklaptop mac-address '84:5c:f3:fa:ff:0f'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping powerwall01 mac-address '6c:30:2a:05:82:2e'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping powerwall01 static-mapping-parameters 'ddns-hostname powerwall01;'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping wallcharger01 mac-address '98:ed:5c:f0:b0:86'
set service dhcp-server shared-network-name LAN subnet 10.10.1.0/24 static-mapping wallcharger01 static-mapping-parameters 'ddns-hostname wallconnector01;'


# Management VLAN
set service dhcp-server shared-network-name Management authoritative
set service dhcp-server shared-network-name Management description 'Management'
set service dhcp-server shared-network-name Management domain-name "mgmt.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name Management name-server '10.0.0.4'
set service dhcp-server shared-network-name Management ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Management shared-network-parameters "zone mgmt.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Management shared-network-parameters "ddns-domainname &quot;mgmt.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Management shared-network-parameters 'zone 0.200.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Management shared-network-parameters 'ddns-rev-domainname  &quot;0.200.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 default-router '10.200.0.1'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 lease '3600'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 range 0 start '10.200.0.100'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 range 0 stop '10.200.0.200'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 static-mapping switch01 mac-address '78:45:58:be:a4:0a'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 static-mapping switch01 static-mapping-parameters 'ddns-hostname switch01;'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 static-mapping workhorse mac-address '56:56:ab:e7:cd:f1'
set service dhcp-server shared-network-name Management subnet 10.200.0.0/24 static-mapping workhorse static-mapping-parameters 'ddns-hostname workhorse;'


# Ceph VLAN
set service dhcp-server shared-network-name Ceph authoritative
set service dhcp-server shared-network-name Ceph description 'Ceph VLAN 2040'
set service dhcp-server shared-network-name Ceph name-server '10.0.0.4'
set service dhcp-server shared-network-name Ceph ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Ceph shared-network-parameters "zone ceph.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Ceph shared-network-parameters "ddns-domainname &quot;ceph.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Ceph shared-network-parameters 'zone 40.200.10.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Ceph shared-network-parameters 'ddns-rev-domainname  &quot;40.200.10.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 default-router '10.200.40.1'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 lease '3600'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 range 0 start '10.200.40.100'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 range 0 stop '10.200.40.200'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 static-mapping cp1.cluster-1.ceph.${SECRET_DOMAIN} mac-address '1c:69:7a:ae:55:58'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 static-mapping cp2.cluster-1.ceph.${SECRET_DOMAIN} mac-address '1c:69:7a:ae:55:22'
set service dhcp-server shared-network-name Ceph subnet 10.200.40.0/24 static-mapping cp3.cluster-1.ceph.${SECRET_DOMAIN} mac-address '1c:69:7a:ae:d4:c5'


# Server VLAN - Will be deleted
set service dhcp-server shared-network-name Servers authoritative
set service dhcp-server shared-network-name Servers description 'Old Server / Cluster Network'
set service dhcp-server shared-network-name Servers name-server '10.0.0.4'

set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 default-router '10.10.200.1'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 domain-name "server.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 lease '3600'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 range 0 start '10.10.200.100'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 range 0 stop '10.10.200.200'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 static-mapping UniFi ip-address '10.10.200.220'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 static-mapping UniFi mac-address '74:83:c2:70:e7:ad'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 static-mapping nas00 ip-address '10.10.200.240'
set service dhcp-server shared-network-name Servers subnet 10.10.200.0/24 static-mapping nas00 mac-address '98:fa:9b:9b:59:ea'


# Untrusted VLAN
set service dhcp-server shared-network-name Untrusted authoritative
set service dhcp-server shared-network-name Untrusted description 'Untrusted VLAN'
set service dhcp-server shared-network-name Untrusted name-server '10.0.0.4'
set service dhcp-server shared-network-name Untrusted ntp-server '10.255.253.1'
set service dhcp-server shared-network-name Untrusted shared-network-parameters "ddns-domainname &quot;untrusted.${SECRET_DOMAIN}.&quot;;"
set service dhcp-server shared-network-name Untrusted shared-network-parameters "zone untrusted.${SECRET_DOMAIN}. { primary 10.0.0.30; key rndc-key; }"
set service dhcp-server shared-network-name Untrusted shared-network-parameters 'zone 1.168.192.in-addr.arpa. { primary 10.0.0.30; key rndc-key; }'
set service dhcp-server shared-network-name Untrusted shared-network-parameters 'ddns-rev-domainname  &quot;1.168.192.in-addr.arpa.&quot;;'

set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 bootfile-server "netboot.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 default-router '192.168.1.1'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 lease '3600'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 range 0 start '192.168.1.100'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 range 0 stop '192.168.1.200'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters "if exists user-class and ( option user-class = &quot;iPXE&quot; ) { filename &quot;http://netboot.${SECRET_DOMAIN}/menu.ipxe&quot;; }"
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters "elsif option client-arch = encode-int ( 16, 16 ) { filename &quot;http://netboot.${SECRET_DOMAIN}/netboot.xyz.efi&quot;; option vendor-class-identifier &quot;HTTPClient&quot;; }"
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters '### PXE Netboot Pi'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters 'class &quot;rpi-pxe&quot; {'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters 'match if (('
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters '(binary-to-ascii(16,8,&quot;:&quot;,substring(hardware,1,3)) = &quot;d8:3a:dd&quot;)'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters ') and'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters '(option vendor-class-identifier = &quot;PXEClient:Arch:00000:UNDI:002001&quot;)'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters ');'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters 'filename &quot;netboot.xyz-rpi4-snp.efi&quot;;'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 subnet-parameters '}'
set service dhcp-server shared-network-name Untrusted subnet 192.168.1.0/24 tftp-server-name "netboot.${SECRET_DOMAIN}"


# VPN VLAN
set service dhcp-server shared-network-name VPN authoritative
set service dhcp-server shared-network-name VPN description 'VPN / Netmaker / Wireguard DHCP Server'
set service dhcp-server shared-network-name VPN name-server '10.0.0.4'
set service dhcp-server shared-network-name VPN ntp-server '10.255.253.1'

set service dhcp-server shared-network-name VPN subnet 10.230.0.0/24 default-router '10.230.0.1'
set service dhcp-server shared-network-name VPN subnet 10.230.0.0/24 domain-name "vpn.${SECRET_DOMAIN}"
set service dhcp-server shared-network-name VPN subnet 10.230.0.0/24 lease '3600'
set service dhcp-server shared-network-name VPN subnet 10.230.0.0/24 range 0 start '10.230.0.100'
set service dhcp-server shared-network-name VPN subnet 10.230.0.0/24 range 0 stop '10.230.0.200'
