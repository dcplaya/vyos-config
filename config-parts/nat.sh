#!/bin/vbash

set nat destination rule 10 description 'Port Forward: HTTP/HTTPS/SpiceViewer to 10.0.0.102 (HAProxy hosted on VyOS)'
set nat destination rule 10 destination port '80,443,3128'
set nat destination rule 10 inbound-interface name 'eth1'
set nat destination rule 10 protocol 'tcp'
set nat destination rule 10 translation address '10.0.0.102'

# Port forward SSH
set nat destination rule 20 description 'Port Forward: SSH to Workhorse 10.200.0.101'
set nat destination rule 20 destination port '22'
set nat destination rule 20 inbound-interface name 'eth1'
set nat destination rule 20 protocol 'tcp_udp'
set nat destination rule 20 translation address '10.200.0.101'

# Port forward Plex
set nat destination rule 30 description 'Port Forward: Plex/32400 to 10.200.1.53'
set nat destination rule 30 destination port '32400'
set nat destination rule 30 inbound-interface name 'eth1'
set nat destination rule 30 protocol 'tcp'
set nat destination rule 30 translation address '10.200.1.53'

set nat source rule 100 description 'NAT Reflection For LAN'
set nat source rule 100 outbound-interface name 'eth1'
set nat source rule 100 source group network-group 'internal_lan_networks'
set nat source rule 100 translation address 'masquerade'

set nat source rule 5000 description 'masquerade for LAN -> WAN'
set nat source rule 5000 outbound-interface name 'eth1'
set nat source rule 5000 protocol 'all'
set nat source rule 5000 translation address 'masquerade'
