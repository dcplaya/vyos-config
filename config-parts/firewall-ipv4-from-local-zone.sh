#!/bin/vbash

#####################################
#  From Local (VyOS) Zone Traffic   #
#####################################
# Local Zone -> Guest Zone = Default block with standard rules from 100-140. Accept DHCP & NTP services
# Local Zone -> IoT Zone = Default block with standard rules from 100-140. Accept DHCP & NTP services & mDNS
# Local Zone -> Trusted Zone = Default block with standard rules from 100-140. Accept DHCP & NTP services & SSH & BGP & OSFP & wireguard
# Local Zone -> Untrusted Zone = Default block with standard rules from 100-140. Accept DHCP & NTP services
# Local Zone -> Container Zone = Default accept with standard rules from 100-140. Accept DNS services
# Local Zone -> WAN Zone = Default accept with standard rules from 100-140.

# Local Zone -> Guest Zone
# Default block with standard rules from 100-140. Accept DHCP & NTP services
set firewall ipv4 name local-to-guest default-action 'drop'
set firewall ipv4 name local-to-guest description 'From Local Zone to Guest Zone'
set firewall ipv4 name local-to-guest default-log

set firewall ipv4 name local-to-guest rule 100 action drop
set firewall ipv4 name local-to-guest rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-guest rule 100 log 
set firewall ipv4 name local-to-guest rule 100 protocol all
set firewall ipv4 name local-to-guest rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-guest rule 105 action drop
set firewall ipv4 name local-to-guest rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-guest rule 105 log 
set firewall ipv4 name local-to-guest rule 105 protocol all
set firewall ipv4 name local-to-guest rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-guest rule 110 action drop
set firewall ipv4 name local-to-guest rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-guest rule 110 log 
set firewall ipv4 name local-to-guest rule 110 protocol tcp_udp
set firewall ipv4 name local-to-guest rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-guest rule 120 action drop
set firewall ipv4 name local-to-guest rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-guest rule 120 log 
set firewall ipv4 name local-to-guest rule 120 protocol icmp
set firewall ipv4 name local-to-guest rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-guest rule 121 action drop
set firewall ipv4 name local-to-guest rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-guest rule 121 log 
set firewall ipv4 name local-to-guest rule 121 protocol icmp
set firewall ipv4 name local-to-guest rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-guest rule 122 action drop
set firewall ipv4 name local-to-guest rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-guest rule 122 log 
set firewall ipv4 name local-to-guest rule 122 protocol icmp
set firewall ipv4 name local-to-guest rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-guest rule 123 action drop
set firewall ipv4 name local-to-guest rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-guest rule 123 log 
set firewall ipv4 name local-to-guest rule 123 protocol icmp
set firewall ipv4 name local-to-guest rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-guest rule 124 action accept
set firewall ipv4 name local-to-guest rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-guest rule 124 log 
set firewall ipv4 name local-to-guest rule 124 protocol icmp
set firewall ipv4 name local-to-guest rule 124 limit burst 10
set firewall ipv4 name local-to-guest rule 124 limit rate 50/minute

set firewall ipv4 name local-to-guest rule 130 action accept
set firewall ipv4 name local-to-guest rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-guest rule 130 log 
set firewall ipv4 name local-to-guest rule 130 protocol all
set firewall ipv4 name local-to-guest rule 130 state established 
set firewall ipv4 name local-to-guest rule 130 state related 

set firewall ipv4 name local-to-guest rule 140 action drop
set firewall ipv4 name local-to-guest rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-guest rule 140 log 
set firewall ipv4 name local-to-guest rule 140 protocol all
set firewall ipv4 name local-to-guest rule 140 state invalid

set firewall ipv4 name local-to-guest rule 1000 action accept
set firewall ipv4 name local-to-guest rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name local-to-guest rule 1000 log
set firewall ipv4 name local-to-guest rule 1000 protocol tcp_udp
set firewall ipv4 name local-to-guest rule 1000 destination group port-group 'services_dhcp'
# set firewall ipv4 name local-to-guest rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name local-to-guest rule 1001 action accept
set firewall ipv4 name local-to-guest rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name local-to-guest rule 1001 log
set firewall ipv4 name local-to-guest rule 1001 protocol tcp_udp
set firewall ipv4 name local-to-guest rule 1001 destination group port-group 'services_ntp'
# set firewall ipv4 name local-to-guest rule 1001 destination group address-group 'services_ntp'

# Local Zone -> IoT Zone
# DeDefault block with standard rules from 100-140. Accept DHCP & NTP services & mDNS
set firewall ipv4 name local-to-iot default-action 'drop'
set firewall ipv4 name local-to-iot description 'From Local Zone to IoT Zone'
set firewall ipv4 name local-to-iot default-log

set firewall ipv4 name local-to-iot rule 100 action drop
set firewall ipv4 name local-to-iot rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-iot rule 100 log 
set firewall ipv4 name local-to-iot rule 100 protocol all
set firewall ipv4 name local-to-iot rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-iot rule 105 action drop
set firewall ipv4 name local-to-iot rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-iot rule 105 log 
set firewall ipv4 name local-to-iot rule 105 protocol all
set firewall ipv4 name local-to-iot rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-iot rule 110 action drop
set firewall ipv4 name local-to-iot rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-iot rule 110 log 
set firewall ipv4 name local-to-iot rule 110 protocol tcp_udp
set firewall ipv4 name local-to-iot rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-iot rule 120 action drop
set firewall ipv4 name local-to-iot rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-iot rule 120 log 
set firewall ipv4 name local-to-iot rule 120 protocol icmp
set firewall ipv4 name local-to-iot rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-iot rule 121 action drop
set firewall ipv4 name local-to-iot rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-iot rule 121 log 
set firewall ipv4 name local-to-iot rule 121 protocol icmp
set firewall ipv4 name local-to-iot rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-iot rule 122 action drop
set firewall ipv4 name local-to-iot rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-iot rule 122 log 
set firewall ipv4 name local-to-iot rule 122 protocol icmp
set firewall ipv4 name local-to-iot rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-iot rule 123 action drop
set firewall ipv4 name local-to-iot rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-iot rule 123 log 
set firewall ipv4 name local-to-iot rule 123 protocol icmp
set firewall ipv4 name local-to-iot rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-iot rule 124 action accept
set firewall ipv4 name local-to-iot rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-iot rule 124 log 
set firewall ipv4 name local-to-iot rule 124 protocol icmp
set firewall ipv4 name local-to-iot rule 124 limit burst 10
set firewall ipv4 name local-to-iot rule 124 limit rate 50/minute

set firewall ipv4 name local-to-iot rule 130 action accept
set firewall ipv4 name local-to-iot rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-iot rule 130 log 
set firewall ipv4 name local-to-iot rule 130 protocol all
set firewall ipv4 name local-to-iot rule 130 state established 
set firewall ipv4 name local-to-iot rule 130 state related 

set firewall ipv4 name local-to-iot rule 140 action drop
set firewall ipv4 name local-to-iot rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-iot rule 140 log 
set firewall ipv4 name local-to-iot rule 140 protocol all
set firewall ipv4 name local-to-iot rule 140 state invalid

set firewall ipv4 name local-to-iot rule 1000 action accept
set firewall ipv4 name local-to-iot rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name local-to-iot rule 1000 log
set firewall ipv4 name local-to-iot rule 1000 protocol tcp_udp
set firewall ipv4 name local-to-iot rule 1000 destination group port-group 'services_dhcp'
# set firewall ipv4 name local-to-iot rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name local-to-iot rule 1001 action accept
set firewall ipv4 name local-to-iot rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name local-to-iot rule 1001 log
set firewall ipv4 name local-to-iot rule 1001 protocol tcp_udp
set firewall ipv4 name local-to-iot rule 1001 destination group port-group 'services_ntp'
# set firewall ipv4 name local-to-iot rule 1001 destination group address-group 'services_ntp'

set firewall ipv4 name local-to-iot rule 1002 action accept
set firewall ipv4 name local-to-iot rule 1002 description "Rule: Allow mDNS Requests"
set firewall ipv4 name local-to-iot rule 1002 log
set firewall ipv4 name local-to-iot rule 1002 protocol 'udp'
set firewall ipv4 name local-to-iot rule 1002 destination group port-group 'services_mdns'
set firewall ipv4 name local-to-iot rule 1002 source group port-group 'services_mdns'

# Local Zone -> Trusted Zone
# Default block with standard rules from 100-140. Accept DHCP & NTP services & mDNS & SSH & BGP & OSFP & wireguard
set firewall ipv4 name local-to-trusted default-action 'drop'
set firewall ipv4 name local-to-trusted description 'From Local Zone to Trusted Zone'
set firewall ipv4 name local-to-trusted default-log

set firewall ipv4 name local-to-trusted rule 100 action drop
set firewall ipv4 name local-to-trusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-trusted rule 100 log 
set firewall ipv4 name local-to-trusted rule 100 protocol all
set firewall ipv4 name local-to-trusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-trusted rule 105 action drop
set firewall ipv4 name local-to-trusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-trusted rule 105 log 
set firewall ipv4 name local-to-trusted rule 105 protocol all
set firewall ipv4 name local-to-trusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-trusted rule 110 action drop
set firewall ipv4 name local-to-trusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-trusted rule 110 log 
set firewall ipv4 name local-to-trusted rule 110 protocol tcp_udp
set firewall ipv4 name local-to-trusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-trusted rule 120 action drop
set firewall ipv4 name local-to-trusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-trusted rule 120 log 
set firewall ipv4 name local-to-trusted rule 120 protocol icmp
set firewall ipv4 name local-to-trusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-trusted rule 121 action drop
set firewall ipv4 name local-to-trusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-trusted rule 121 log 
set firewall ipv4 name local-to-trusted rule 121 protocol icmp
set firewall ipv4 name local-to-trusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-trusted rule 122 action drop
set firewall ipv4 name local-to-trusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-trusted rule 122 log 
set firewall ipv4 name local-to-trusted rule 122 protocol icmp
set firewall ipv4 name local-to-trusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-trusted rule 123 action drop
set firewall ipv4 name local-to-trusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-trusted rule 123 log 
set firewall ipv4 name local-to-trusted rule 123 protocol icmp
set firewall ipv4 name local-to-trusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-trusted rule 124 action accept
set firewall ipv4 name local-to-trusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-trusted rule 124 log 
set firewall ipv4 name local-to-trusted rule 124 protocol icmp
set firewall ipv4 name local-to-trusted rule 124 limit burst 10
set firewall ipv4 name local-to-trusted rule 124 limit rate 50/minute

set firewall ipv4 name local-to-trusted rule 130 action accept
set firewall ipv4 name local-to-trusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-trusted rule 130 log 
set firewall ipv4 name local-to-trusted rule 130 protocol all
set firewall ipv4 name local-to-trusted rule 130 state established 
set firewall ipv4 name local-to-trusted rule 130 state related 

set firewall ipv4 name local-to-trusted rule 140 action drop
set firewall ipv4 name local-to-trusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-trusted rule 140 log 
set firewall ipv4 name local-to-trusted rule 140 protocol all
set firewall ipv4 name local-to-trusted rule 140 state invalid

set firewall ipv4 name local-to-trusted rule 1000 action accept
set firewall ipv4 name local-to-trusted rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name local-to-trusted rule 1000 log
set firewall ipv4 name local-to-trusted rule 1000 protocol tcp_udp
set firewall ipv4 name local-to-trusted rule 1000 destination group port-group 'services_dhcp'
# set firewall ipv4 name local-to-trusted rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name local-to-trusted rule 1001 action accept
set firewall ipv4 name local-to-trusted rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name local-to-trusted rule 1001 log
set firewall ipv4 name local-to-trusted rule 1001 protocol tcp_udp
set firewall ipv4 name local-to-trusted rule 1001 destination group port-group 'services_ntp'
# set firewall ipv4 name local-to-trusted rule 1001 destination group address-group 'services_ntp'

set firewall ipv4 name local-to-trusted rule 1002 action accept
set firewall ipv4 name local-to-trusted rule 1002 description "Rule: Allow mDNS Requests"
set firewall ipv4 name local-to-trusted rule 1002 log
set firewall ipv4 name local-to-trusted rule 1002 protocol 'udp'
set firewall ipv4 name local-to-trusted rule 1002 destination group port-group 'services_mdns'
set firewall ipv4 name local-to-trusted rule 1002 source group port-group 'services_mdns'

set firewall ipv4 name local-to-trusted rule 1003 action accept
set firewall ipv4 name local-to-trusted rule 1003 description "Rule: Allow BGP & OSFP Connections"
set firewall ipv4 name local-to-trusted rule 1003 log
set firewall ipv4 name local-to-trusted rule 1003 protocol 'tcp_udp'
set firewall ipv4 name local-to-trusted rule 1003 destination group port-group 'services_bgp_ospf'
set firewall ipv4 name local-to-trusted rule 1003 source group port-group 'services_bgp_ospf'

# Local Zone -> Untrusted Zone
# Default block with standard rules from 100-140. Accept DHCP & NTP services
set firewall ipv4 name local-to-untrusted default-action 'drop'
set firewall ipv4 name local-to-untrusted description 'From Local Zone to Untrusted Zone'
set firewall ipv4 name local-to-untrusted default-log

set firewall ipv4 name local-to-untrusted rule 100 action drop
set firewall ipv4 name local-to-untrusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-untrusted rule 100 log 
set firewall ipv4 name local-to-untrusted rule 100 protocol all
set firewall ipv4 name local-to-untrusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-untrusted rule 105 action drop
set firewall ipv4 name local-to-untrusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-untrusted rule 105 log 
set firewall ipv4 name local-to-untrusted rule 105 protocol all
set firewall ipv4 name local-to-untrusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-untrusted rule 110 action drop
set firewall ipv4 name local-to-untrusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-untrusted rule 110 log 
set firewall ipv4 name local-to-untrusted rule 110 protocol tcp_udp
set firewall ipv4 name local-to-untrusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-untrusted rule 120 action drop
set firewall ipv4 name local-to-untrusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-untrusted rule 120 log 
set firewall ipv4 name local-to-untrusted rule 120 protocol icmp
set firewall ipv4 name local-to-untrusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-untrusted rule 121 action drop
set firewall ipv4 name local-to-untrusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-untrusted rule 121 log 
set firewall ipv4 name local-to-untrusted rule 121 protocol icmp
set firewall ipv4 name local-to-untrusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-untrusted rule 122 action drop
set firewall ipv4 name local-to-untrusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-untrusted rule 122 log 
set firewall ipv4 name local-to-untrusted rule 122 protocol icmp
set firewall ipv4 name local-to-untrusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-untrusted rule 123 action drop
set firewall ipv4 name local-to-untrusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-untrusted rule 123 log 
set firewall ipv4 name local-to-untrusted rule 123 protocol icmp
set firewall ipv4 name local-to-untrusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-untrusted rule 124 action accept
set firewall ipv4 name local-to-untrusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-untrusted rule 124 log 
set firewall ipv4 name local-to-untrusted rule 124 protocol icmp
set firewall ipv4 name local-to-untrusted rule 124 limit burst 10
set firewall ipv4 name local-to-untrusted rule 124 limit rate 50/minute

set firewall ipv4 name local-to-untrusted rule 130 action accept
set firewall ipv4 name local-to-untrusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-untrusted rule 130 log 
set firewall ipv4 name local-to-untrusted rule 130 protocol all
set firewall ipv4 name local-to-untrusted rule 130 state established 
set firewall ipv4 name local-to-untrusted rule 130 state related 

set firewall ipv4 name local-to-untrusted rule 140 action drop
set firewall ipv4 name local-to-untrusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-untrusted rule 140 log 
set firewall ipv4 name local-to-untrusted rule 140 protocol all
set firewall ipv4 name local-to-untrusted rule 140 state invalid

set firewall ipv4 name local-to-untrusted rule 1000 action accept
set firewall ipv4 name local-to-untrusted rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name local-to-untrusted rule 1000 log
set firewall ipv4 name local-to-untrusted rule 1000 protocol tcp_udp
set firewall ipv4 name local-to-untrusted rule 1000 destination group port-group 'services_dhcp'
# set firewall ipv4 name local-to-untrusted rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name local-to-untrusted rule 1001 action accept
set firewall ipv4 name local-to-untrusted rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name local-to-untrusted rule 1001 log
set firewall ipv4 name local-to-untrusted rule 1001 protocol tcp_udp
set firewall ipv4 name local-to-untrusted rule 1001 destination group port-group 'services_ntp'
# set firewall ipv4 name local-to-untrusted rule 1001 destination group address-group 'services_ntp'

# Local Zone -> Container Zone
# Default accept with standard rules from 100-140. Accept DNS services
set firewall ipv4 name local-to-containers default-action 'accept'
set firewall ipv4 name local-to-containers description 'From Local Zone to Container Zone'
set firewall ipv4 name local-to-containers default-log

set firewall ipv4 name local-to-containers rule 100 action drop
set firewall ipv4 name local-to-containers rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-containers rule 100 log 
set firewall ipv4 name local-to-containers rule 100 protocol all
set firewall ipv4 name local-to-containers rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-containers rule 105 action drop
set firewall ipv4 name local-to-containers rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-containers rule 105 log 
set firewall ipv4 name local-to-containers rule 105 protocol all
set firewall ipv4 name local-to-containers rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-containers rule 110 action drop
set firewall ipv4 name local-to-containers rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-containers rule 110 log 
set firewall ipv4 name local-to-containers rule 110 protocol tcp_udp
set firewall ipv4 name local-to-containers rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-containers rule 120 action drop
set firewall ipv4 name local-to-containers rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-containers rule 120 log 
set firewall ipv4 name local-to-containers rule 120 protocol icmp
set firewall ipv4 name local-to-containers rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-containers rule 121 action drop
set firewall ipv4 name local-to-containers rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-containers rule 121 log 
set firewall ipv4 name local-to-containers rule 121 protocol icmp
set firewall ipv4 name local-to-containers rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-containers rule 122 action drop
set firewall ipv4 name local-to-containers rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-containers rule 122 log 
set firewall ipv4 name local-to-containers rule 122 protocol icmp
set firewall ipv4 name local-to-containers rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-containers rule 123 action drop
set firewall ipv4 name local-to-containers rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-containers rule 123 log 
set firewall ipv4 name local-to-containers rule 123 protocol icmp
set firewall ipv4 name local-to-containers rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-containers rule 124 action accept
set firewall ipv4 name local-to-containers rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-containers rule 124 log 
set firewall ipv4 name local-to-containers rule 124 protocol icmp
set firewall ipv4 name local-to-containers rule 124 limit burst 10
set firewall ipv4 name local-to-containers rule 124 limit rate 50/minute

set firewall ipv4 name local-to-containers rule 130 action accept
set firewall ipv4 name local-to-containers rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-containers rule 130 log 
set firewall ipv4 name local-to-containers rule 130 protocol all
set firewall ipv4 name local-to-containers rule 130 state established 
set firewall ipv4 name local-to-containers rule 130 state related 

set firewall ipv4 name local-to-containers rule 140 action drop
set firewall ipv4 name local-to-containers rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-containers rule 140 log 
set firewall ipv4 name local-to-containers rule 140 protocol all
set firewall ipv4 name local-to-containers rule 140 state invalid

set firewall ipv4 name local-to-containers rule 1000 action accept
set firewall ipv4 name local-to-containers rule 1000 description "Rule: Allow DNS Requests"
set firewall ipv4 name local-to-containers rule 1000 log
set firewall ipv4 name local-to-containers rule 1000 protocol tcp_udp
set firewall ipv4 name local-to-containers rule 1000 destination group port-group 'services_dns'
# set firewall ipv4 name local-to-containers rule 1000 destination group address-group 'services_dns'

# Local Zone -> WAN Zone
# Default accept with standard rules from 100-140.
set firewall ipv4 name local-to-wan default-action 'accept'
set firewall ipv4 name local-to-wan description 'From Local Zone to WAN Zone'
set firewall ipv4 name local-to-wan default-log

set firewall ipv4 name local-to-wan rule 100 action drop
set firewall ipv4 name local-to-wan rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name local-to-wan rule 100 log 
set firewall ipv4 name local-to-wan rule 100 protocol all
set firewall ipv4 name local-to-wan rule 100 source group address-group "blocked_networks"

set firewall ipv4 name local-to-wan rule 105 action drop
set firewall ipv4 name local-to-wan rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name local-to-wan rule 105 log 
set firewall ipv4 name local-to-wan rule 105 protocol all
set firewall ipv4 name local-to-wan rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name local-to-wan rule 110 action drop
set firewall ipv4 name local-to-wan rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name local-to-wan rule 110 log 
set firewall ipv4 name local-to-wan rule 110 protocol tcp_udp
set firewall ipv4 name local-to-wan rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name local-to-wan rule 120 action drop
set firewall ipv4 name local-to-wan rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-wan rule 120 log 
set firewall ipv4 name local-to-wan rule 120 protocol icmp
set firewall ipv4 name local-to-wan rule 120 icmp type-name timestamp-request

set firewall ipv4 name local-to-wan rule 121 action drop
set firewall ipv4 name local-to-wan rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-wan rule 121 log 
set firewall ipv4 name local-to-wan rule 121 protocol icmp
set firewall ipv4 name local-to-wan rule 121 icmp type-name address-mask-request

set firewall ipv4 name local-to-wan rule 122 action drop
set firewall ipv4 name local-to-wan rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-wan rule 122 log 
set firewall ipv4 name local-to-wan rule 122 protocol icmp
set firewall ipv4 name local-to-wan rule 122 icmp type-name router-advertisement

set firewall ipv4 name local-to-wan rule 123 action drop
set firewall ipv4 name local-to-wan rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name local-to-wan rule 123 log 
set firewall ipv4 name local-to-wan rule 123 protocol icmp
set firewall ipv4 name local-to-wan rule 123 icmp type-name router-solicitation

set firewall ipv4 name local-to-wan rule 124 action accept
set firewall ipv4 name local-to-wan rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name local-to-wan rule 124 log 
set firewall ipv4 name local-to-wan rule 124 protocol icmp
set firewall ipv4 name local-to-wan rule 124 limit burst 10
set firewall ipv4 name local-to-wan rule 124 limit rate 50/minute

set firewall ipv4 name local-to-wan rule 130 action accept
set firewall ipv4 name local-to-wan rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name local-to-wan rule 130 log 
set firewall ipv4 name local-to-wan rule 130 protocol all
set firewall ipv4 name local-to-wan rule 130 state established 
set firewall ipv4 name local-to-wan rule 130 state related 

set firewall ipv4 name local-to-wan rule 140 action drop
set firewall ipv4 name local-to-wan rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name local-to-wan rule 140 log 
set firewall ipv4 name local-to-wan rule 140 protocol all
set firewall ipv4 name local-to-wan rule 140 state invalid
