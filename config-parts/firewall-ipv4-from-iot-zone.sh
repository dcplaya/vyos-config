#!/bin/vbash

#####################################
#      From IoT Zone Traffic        #
#####################################
# IoT Zone -> Guest Zone = Block all traffic
# IoT Zone -> Trusted Zone = Allow home automation services, block everything else
# IoT Zone -> Untrusted Zone = Block all traffic
# IoT Zone -> Local Zone = All DHCP, allow NTP, block everything else
# IoT Zone -> Container Zone = Allow DNS, block everything else
# IoT Zone -> WAN Zone = Default block with standard rules from 100-140. Some specific rules will be applied based on device

# IoT Zone -> Guest Zone
# Block all traffic
set firewall ipv4 name iot-to-guest default-action 'drop'
set firewall ipv4 name iot-to-guest description 'From IoT Zone to Guest Zone'
set firewall ipv4 name iot-to-guest default-log

set firewall ipv4 name iot-to-guest rule 100 action drop
set firewall ipv4 name iot-to-guest rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-guest rule 100 log 
set firewall ipv4 name iot-to-guest rule 100 protocol all
set firewall ipv4 name iot-to-guest rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-guest rule 105 action drop
set firewall ipv4 name iot-to-guest rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-guest rule 105 log 
set firewall ipv4 name iot-to-guest rule 105 protocol all
set firewall ipv4 name iot-to-guest rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-guest rule 110 action drop
set firewall ipv4 name iot-to-guest rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-guest rule 110 log 
set firewall ipv4 name iot-to-guest rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-guest rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-guest rule 120 action drop
set firewall ipv4 name iot-to-guest rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-guest rule 120 log 
set firewall ipv4 name iot-to-guest rule 120 protocol icmp
set firewall ipv4 name iot-to-guest rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-guest rule 121 action drop
set firewall ipv4 name iot-to-guest rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-guest rule 121 log 
set firewall ipv4 name iot-to-guest rule 121 protocol icmp
set firewall ipv4 name iot-to-guest rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-guest rule 122 action drop
set firewall ipv4 name iot-to-guest rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-guest rule 122 log 
set firewall ipv4 name iot-to-guest rule 122 protocol icmp
set firewall ipv4 name iot-to-guest rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-guest rule 123 action drop
set firewall ipv4 name iot-to-guest rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-guest rule 123 log 
set firewall ipv4 name iot-to-guest rule 123 protocol icmp
set firewall ipv4 name iot-to-guest rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-guest rule 124 action accept
set firewall ipv4 name iot-to-guest rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-guest rule 124 log 
set firewall ipv4 name iot-to-guest rule 124 protocol icmp
set firewall ipv4 name iot-to-guest rule 124 limit burst 10
set firewall ipv4 name iot-to-guest rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-guest rule 130 action accept
set firewall ipv4 name iot-to-guest rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-guest rule 130 log 
set firewall ipv4 name iot-to-guest rule 130 protocol all
set firewall ipv4 name iot-to-guest rule 130 state established 
set firewall ipv4 name iot-to-guest rule 130 state related 

set firewall ipv4 name iot-to-guest rule 140 action drop
set firewall ipv4 name iot-to-guest rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-guest rule 140 log 
set firewall ipv4 name iot-to-guest rule 140 protocol all
set firewall ipv4 name iot-to-guest rule 140 state invalid 

# IoT Zone -> Trusted Zone
# Allow home automation services, block everything else
set firewall ipv4 name iot-to-trusted default-action 'drop'
set firewall ipv4 name iot-to-trusted description 'From IoT Zone to Trusted Zone'
set firewall ipv4 name iot-to-trusted default-log

set firewall ipv4 name iot-to-trusted rule 100 action drop
set firewall ipv4 name iot-to-trusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-trusted rule 100 log 
set firewall ipv4 name iot-to-trusted rule 100 protocol all
set firewall ipv4 name iot-to-trusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-trusted rule 105 action drop
set firewall ipv4 name iot-to-trusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-trusted rule 105 log 
set firewall ipv4 name iot-to-trusted rule 105 protocol all
set firewall ipv4 name iot-to-trusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-trusted rule 110 action drop
set firewall ipv4 name iot-to-trusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-trusted rule 110 log 
set firewall ipv4 name iot-to-trusted rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-trusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-trusted rule 120 action drop
set firewall ipv4 name iot-to-trusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-trusted rule 120 log 
set firewall ipv4 name iot-to-trusted rule 120 protocol icmp
set firewall ipv4 name iot-to-trusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-trusted rule 121 action drop
set firewall ipv4 name iot-to-trusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-trusted rule 121 log 
set firewall ipv4 name iot-to-trusted rule 121 protocol icmp
set firewall ipv4 name iot-to-trusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-trusted rule 122 action drop
set firewall ipv4 name iot-to-trusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-trusted rule 122 log 
set firewall ipv4 name iot-to-trusted rule 122 protocol icmp
set firewall ipv4 name iot-to-trusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-trusted rule 123 action drop
set firewall ipv4 name iot-to-trusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-trusted rule 123 log 
set firewall ipv4 name iot-to-trusted rule 123 protocol icmp
set firewall ipv4 name iot-to-trusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-trusted rule 124 action accept
set firewall ipv4 name iot-to-trusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-trusted rule 124 log 
set firewall ipv4 name iot-to-trusted rule 124 protocol icmp
set firewall ipv4 name iot-to-trusted rule 124 limit burst 10
set firewall ipv4 name iot-to-trusted rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-trusted rule 130 action accept
set firewall ipv4 name iot-to-trusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-trusted rule 130 log 
set firewall ipv4 name iot-to-trusted rule 130 protocol all
set firewall ipv4 name iot-to-trusted rule 130 state established 
set firewall ipv4 name iot-to-trusted rule 130 state related 

set firewall ipv4 name iot-to-trusted rule 140 action drop
set firewall ipv4 name iot-to-trusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-trusted rule 140 log 
set firewall ipv4 name iot-to-trusted rule 140 protocol all
set firewall ipv4 name iot-to-trusted rule 140 state invalid

set firewall ipv4 name iot-to-trusted rule 1000 action accept
set firewall ipv4 name iot-to-trusted rule 1000 description "Rule: Allow Home Automation Services By Load Balanced IPs"
set firewall ipv4 name iot-to-trusted rule 1000 log
set firewall ipv4 name iot-to-trusted rule 1000 protocol tcp_udp
set firewall ipv4 name iot-to-trusted rule 1000 destination group address-group "services_home_automation"

set firewall ipv4 name iot-to-trusted rule 1001 action accept
set firewall ipv4 name iot-to-trusted rule 1001 description "Rule: Allow Home Automation Services By Domain Name"
set firewall ipv4 name iot-to-trusted rule 1001 log
set firewall ipv4 name iot-to-trusted rule 1001 protocol tcp_udp
set firewall ipv4 name iot-to-trusted rule 1001 destination group domain-group "domains_home_automation"

# IoT Zone -> Untrusted
# Block all traffic
set firewall ipv4 name iot-to-untrusted default-action 'drop'
set firewall ipv4 name iot-to-untrusted description 'From IoT Zone to Untrusted Zone'
set firewall ipv4 name iot-to-untrusted default-log

set firewall ipv4 name iot-to-untrusted rule 100 action drop
set firewall ipv4 name iot-to-untrusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-untrusted rule 100 log 
set firewall ipv4 name iot-to-untrusted rule 100 protocol all
set firewall ipv4 name iot-to-untrusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-untrusted rule 105 action drop
set firewall ipv4 name iot-to-untrusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-untrusted rule 105 log 
set firewall ipv4 name iot-to-untrusted rule 105 protocol all
set firewall ipv4 name iot-to-untrusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-untrusted rule 110 action drop
set firewall ipv4 name iot-to-untrusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-untrusted rule 110 log 
set firewall ipv4 name iot-to-untrusted rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-untrusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-untrusted rule 120 action drop
set firewall ipv4 name iot-to-untrusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-untrusted rule 120 log 
set firewall ipv4 name iot-to-untrusted rule 120 protocol icmp
set firewall ipv4 name iot-to-untrusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-untrusted rule 121 action drop
set firewall ipv4 name iot-to-untrusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-untrusted rule 121 log 
set firewall ipv4 name iot-to-untrusted rule 121 protocol icmp
set firewall ipv4 name iot-to-untrusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-untrusted rule 122 action drop
set firewall ipv4 name iot-to-untrusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-untrusted rule 122 log 
set firewall ipv4 name iot-to-untrusted rule 122 protocol icmp
set firewall ipv4 name iot-to-untrusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-untrusted rule 123 action drop
set firewall ipv4 name iot-to-untrusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-untrusted rule 123 log 
set firewall ipv4 name iot-to-untrusted rule 123 protocol icmp
set firewall ipv4 name iot-to-untrusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-untrusted rule 124 action accept
set firewall ipv4 name iot-to-untrusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-untrusted rule 124 log 
set firewall ipv4 name iot-to-untrusted rule 124 protocol icmp
set firewall ipv4 name iot-to-untrusted rule 124 limit burst 10
set firewall ipv4 name iot-to-untrusted rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-untrusted rule 130 action accept
set firewall ipv4 name iot-to-untrusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-untrusted rule 130 log 
set firewall ipv4 name iot-to-untrusted rule 130 protocol all
set firewall ipv4 name iot-to-untrusted rule 130 state established 
set firewall ipv4 name iot-to-untrusted rule 130 state related 
# set firewall ipv4 name iot-to-untrusted rule 130 state new disable
# set firewall ipv4 name iot-to-untrusted rule 130 state invalid disable

set firewall ipv4 name iot-to-untrusted rule 140 action drop
set firewall ipv4 name iot-to-untrusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-untrusted rule 140 log 
set firewall ipv4 name iot-to-untrusted rule 140 protocol all
# set firewall ipv4 name iot-to-untrusted rule 140 state established disable
# set firewall ipv4 name iot-to-untrusted rule 140 state related disable
# set firewall ipv4 name iot-to-untrusted rule 140 state new disable
set firewall ipv4 name iot-to-untrusted rule 140 state invalid 

# IoT Zone -> Local Zone
# All DHCP, allow NTP, block everything else
set firewall ipv4 name iot-to-local default-action 'drop'
set firewall ipv4 name iot-to-local description 'From IoT Zone to Local Zone'
set firewall ipv4 name iot-to-local default-log

set firewall ipv4 name iot-to-local rule 100 action drop
set firewall ipv4 name iot-to-local rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-local rule 100 log 
set firewall ipv4 name iot-to-local rule 100 protocol all
set firewall ipv4 name iot-to-local rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-local rule 105 action drop
set firewall ipv4 name iot-to-local rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-local rule 105 log 
set firewall ipv4 name iot-to-local rule 105 protocol all
set firewall ipv4 name iot-to-local rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-local rule 110 action drop
set firewall ipv4 name iot-to-local rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-local rule 110 log 
set firewall ipv4 name iot-to-local rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-local rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-local rule 120 action drop
set firewall ipv4 name iot-to-local rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-local rule 120 log 
set firewall ipv4 name iot-to-local rule 120 protocol icmp
set firewall ipv4 name iot-to-local rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-local rule 121 action drop
set firewall ipv4 name iot-to-local rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-local rule 121 log 
set firewall ipv4 name iot-to-local rule 121 protocol icmp
set firewall ipv4 name iot-to-local rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-local rule 122 action drop
set firewall ipv4 name iot-to-local rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-local rule 122 log 
set firewall ipv4 name iot-to-local rule 122 protocol icmp
set firewall ipv4 name iot-to-local rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-local rule 123 action drop
set firewall ipv4 name iot-to-local rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-local rule 123 log 
set firewall ipv4 name iot-to-local rule 123 protocol icmp
set firewall ipv4 name iot-to-local rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-local rule 124 action accept
set firewall ipv4 name iot-to-local rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-local rule 124 log 
set firewall ipv4 name iot-to-local rule 124 protocol icmp
set firewall ipv4 name iot-to-local rule 124 limit burst 10
set firewall ipv4 name iot-to-local rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-local rule 130 action accept
set firewall ipv4 name iot-to-local rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-local rule 130 log 
set firewall ipv4 name iot-to-local rule 130 protocol all
set firewall ipv4 name iot-to-local rule 130 state established 
set firewall ipv4 name iot-to-local rule 130 state related 
# set firewall ipv4 name iot-to-local rule 130 state new disable
# set firewall ipv4 name iot-to-local rule 130 state invalid disable

set firewall ipv4 name iot-to-local rule 140 action drop
set firewall ipv4 name iot-to-local rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-local rule 140 log 
set firewall ipv4 name iot-to-local rule 140 protocol all
# set firewall ipv4 name iot-to-local rule 140 state established disable
# set firewall ipv4 name iot-to-local rule 140 state related disable
# set firewall ipv4 name iot-to-local rule 140 state new disable
set firewall ipv4 name iot-to-local rule 140 state invalid

set firewall ipv4 name iot-to-local rule 1000 action accept
set firewall ipv4 name iot-to-local rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name iot-to-local rule 1000 log
set firewall ipv4 name iot-to-local rule 1000 protocol tcp_udp
set firewall ipv4 name iot-to-local rule 1000 destination group port-group 'services_dhcp'
set firewall ipv4 name iot-to-local rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name iot-to-local rule 1001 action accept
set firewall ipv4 name iot-to-local rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name iot-to-local rule 1001 log
set firewall ipv4 name iot-to-local rule 1001 protocol tcp_udp
set firewall ipv4 name iot-to-local rule 1001 destination group port-group 'services_ntp'
set firewall ipv4 name iot-to-local rule 1001 destination group address-group 'services_ntp'

# IoT Zone -> Container Zone
# Allow DNS, block everything else
set firewall ipv4 name iot-to-containers default-action 'drop'
set firewall ipv4 name iot-to-containers description 'From IoT Zone to Container Zone'
set firewall ipv4 name iot-to-containers default-log

set firewall ipv4 name iot-to-containers rule 100 action drop
set firewall ipv4 name iot-to-containers rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-containers rule 100 log 
set firewall ipv4 name iot-to-containers rule 100 protocol all
set firewall ipv4 name iot-to-containers rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-containers rule 105 action drop
set firewall ipv4 name iot-to-containers rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-containers rule 105 log 
set firewall ipv4 name iot-to-containers rule 105 protocol all
set firewall ipv4 name iot-to-containers rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-containers rule 110 action drop
set firewall ipv4 name iot-to-containers rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-containers rule 110 log 
set firewall ipv4 name iot-to-containers rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-containers rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-containers rule 120 action drop
set firewall ipv4 name iot-to-containers rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-containers rule 120 log 
set firewall ipv4 name iot-to-containers rule 120 protocol icmp
set firewall ipv4 name iot-to-containers rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-containers rule 121 action drop
set firewall ipv4 name iot-to-containers rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-containers rule 121 log 
set firewall ipv4 name iot-to-containers rule 121 protocol icmp
set firewall ipv4 name iot-to-containers rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-containers rule 122 action drop
set firewall ipv4 name iot-to-containers rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-containers rule 122 log 
set firewall ipv4 name iot-to-containers rule 122 protocol icmp
set firewall ipv4 name iot-to-containers rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-containers rule 123 action drop
set firewall ipv4 name iot-to-containers rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-containers rule 123 log 
set firewall ipv4 name iot-to-containers rule 123 protocol icmp
set firewall ipv4 name iot-to-containers rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-containers rule 124 action accept
set firewall ipv4 name iot-to-containers rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-containers rule 124 log 
set firewall ipv4 name iot-to-containers rule 124 protocol icmp
set firewall ipv4 name iot-to-containers rule 124 limit burst 10
set firewall ipv4 name iot-to-containers rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-containers rule 130 action accept
set firewall ipv4 name iot-to-containers rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-containers rule 130 log 
set firewall ipv4 name iot-to-containers rule 130 protocol all
set firewall ipv4 name iot-to-containers rule 130 state established 
set firewall ipv4 name iot-to-containers rule 130 state related 
# set firewall ipv4 name iot-to-containers rule 130 state new disable
# set firewall ipv4 name iot-to-containers rule 130 state invalid disable

set firewall ipv4 name iot-to-containers rule 140 action drop
set firewall ipv4 name iot-to-containers rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-containers rule 140 log 
set firewall ipv4 name iot-to-containers rule 140 protocol all
# set firewall ipv4 name iot-to-containers rule 140 state established disable
# set firewall ipv4 name iot-to-containers rule 140 state related disable
# set firewall ipv4 name iot-to-containers rule 140 state new disable
set firewall ipv4 name iot-to-containers rule 140 state invalid

set firewall ipv4 name iot-to-containers rule 1000 action accept
set firewall ipv4 name iot-to-containers rule 1000 description "Rule: Allow DNS Requests"
set firewall ipv4 name iot-to-containers rule 1000 log
set firewall ipv4 name iot-to-containers rule 1000 protocol tcp_udp
set firewall ipv4 name iot-to-containers rule 1000 destination group port-group 'services_dns'
set firewall ipv4 name iot-to-containers rule 1000 destination group address-group 'services_dns'

# Guest Zone -> WAN Zone
# Default drop with standard rules from 100-140.
# Allow vacuums to check for updates
# Allow Samsung Smart Things to contact the cloud (Fridge/Washer/Dryer)
set firewall ipv4 name iot-to-wan default-action 'drop'
set firewall ipv4 name iot-to-wan description 'From IoT Zone to WAN Zone'
set firewall ipv4 name iot-to-wan default-log

set firewall ipv4 name iot-to-wan rule 100 action drop
set firewall ipv4 name iot-to-wan rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name iot-to-wan rule 100 log 
set firewall ipv4 name iot-to-wan rule 100 protocol all
set firewall ipv4 name iot-to-wan rule 100 source group address-group "blocked_networks"

set firewall ipv4 name iot-to-wan rule 105 action drop
set firewall ipv4 name iot-to-wan rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name iot-to-wan rule 105 log 
set firewall ipv4 name iot-to-wan rule 105 protocol all
set firewall ipv4 name iot-to-wan rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name iot-to-wan rule 110 action drop
set firewall ipv4 name iot-to-wan rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name iot-to-wan rule 110 log 
set firewall ipv4 name iot-to-wan rule 110 protocol tcp_udp
set firewall ipv4 name iot-to-wan rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name iot-to-wan rule 120 action drop
set firewall ipv4 name iot-to-wan rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-wan rule 120 log 
set firewall ipv4 name iot-to-wan rule 120 protocol icmp
set firewall ipv4 name iot-to-wan rule 120 icmp type-name timestamp-request

set firewall ipv4 name iot-to-wan rule 121 action drop
set firewall ipv4 name iot-to-wan rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-wan rule 121 log 
set firewall ipv4 name iot-to-wan rule 121 protocol icmp
set firewall ipv4 name iot-to-wan rule 121 icmp type-name address-mask-request

set firewall ipv4 name iot-to-wan rule 122 action drop
set firewall ipv4 name iot-to-wan rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-wan rule 122 log 
set firewall ipv4 name iot-to-wan rule 122 protocol icmp
set firewall ipv4 name iot-to-wan rule 122 icmp type-name router-advertisement

set firewall ipv4 name iot-to-wan rule 123 action drop
set firewall ipv4 name iot-to-wan rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name iot-to-wan rule 123 log 
set firewall ipv4 name iot-to-wan rule 123 protocol icmp
set firewall ipv4 name iot-to-wan rule 123 icmp type-name router-solicitation

set firewall ipv4 name iot-to-wan rule 124 action accept
set firewall ipv4 name iot-to-wan rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name iot-to-wan rule 124 log 
set firewall ipv4 name iot-to-wan rule 124 protocol icmp
set firewall ipv4 name iot-to-wan rule 124 limit burst 10
set firewall ipv4 name iot-to-wan rule 124 limit rate 50/minute

set firewall ipv4 name iot-to-wan rule 130 action accept
set firewall ipv4 name iot-to-wan rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name iot-to-wan rule 130 log 
set firewall ipv4 name iot-to-wan rule 130 protocol all
set firewall ipv4 name iot-to-wan rule 130 state established
set firewall ipv4 name iot-to-wan rule 130 state related 
# set firewall ipv4 name iot-to-wan rule 130 state new disable
# set firewall ipv4 name iot-to-wan rule 130 state invalid disable

set firewall ipv4 name iot-to-wan rule 140 action drop
set firewall ipv4 name iot-to-wan rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name iot-to-wan rule 140 log 
set firewall ipv4 name iot-to-wan rule 140 protocol all
# set firewall ipv4 name iot-to-wan rule 140 state established disable
# set firewall ipv4 name iot-to-wan rule 140 state related disable
# set firewall ipv4 name iot-to-wan rule 140 state new disable
set firewall ipv4 name iot-to-wan rule 140 state invalid

set firewall ipv4 name iot-to-wan rule 1000 action accept
set firewall ipv4 name iot-to-wan rule 1000 description "Rule: Allow Valtudo Vacuums To Check For Updates"
set firewall ipv4 name iot-to-wan rule 1000 log
set firewall ipv4 name iot-to-wan rule 1000 protocol tcp_udp
set firewall ipv4 name iot-to-wan rule 1000 source port https
set firewall ipv4 name iot-to-wan rule 1000 source group domain-group 'domains_vacuums'
set firewall ipv4 name iot-to-wan rule 1000 state established 
set firewall ipv4 name iot-to-wan rule 1000 state related 
set firewall ipv4 name iot-to-wan rule 1000 state new 
# set firewall ipv4 name iot-to-wan rule 1000 state invalid disable

set firewall ipv4 name iot-to-wan rule 1010 action accept
set firewall ipv4 name iot-to-wan rule 1010 description "Rule: Allow Samsung Smart Things To Contact Cloud"
set firewall ipv4 name iot-to-wan rule 1010 log
set firewall ipv4 name iot-to-wan rule 1010 protocol tcp_udp
set firewall ipv4 name iot-to-wan rule 1010 source port http,https
set firewall ipv4 name iot-to-wan rule 1010 source group domain-group 'domains_samsung_smart_things'
set firewall ipv4 name iot-to-wan rule 1010 state established 
set firewall ipv4 name iot-to-wan rule 1010 state related 
set firewall ipv4 name iot-to-wan rule 1010 state new 
# set firewall ipv4 name iot-to-wan rule 1010 state invalid disable