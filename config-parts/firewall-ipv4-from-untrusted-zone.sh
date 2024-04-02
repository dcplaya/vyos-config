#!/bin/vbash

#####################################
#    From Untrusted Zone Traffic    #
#####################################
# Untrusted Zone -> Guest Zone = Default block with standard rules from 100-140.
# Untrusted Zone -> IoT Zone = Default block with standard rules from 100-140.
# Untrusted Zone -> Trusted Zone = Default block with standard rules from 100-140.
# Untrusted Zone -> Local Zone = Default block with standard rules from 100-140. Accept DHCP & NTP services
# Untrusted Zone -> Container Zone = Default accept with standard rules from 100-140. Accept DNS services
# Untrusted Zone -> WAN Zone = Default block with standard rules from 100-140.

# Untrusted Zone -> Guest Zone
# Default block with standard rules from 100-140.
set firewall ipv4 name untrusted-to-guest default-action 'drop'
set firewall ipv4 name untrusted-to-guest description 'From Untrusted Zone to Guest Zone'
set firewall ipv4 name untrusted-to-guest default-log

set firewall ipv4 name untrusted-to-guest rule 100 action drop
set firewall ipv4 name untrusted-to-guest rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-guest rule 100 log 
set firewall ipv4 name untrusted-to-guest rule 100 protocol all
set firewall ipv4 name untrusted-to-guest rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-guest rule 105 action drop
set firewall ipv4 name untrusted-to-guest rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-guest rule 105 log 
set firewall ipv4 name untrusted-to-guest rule 105 protocol all
set firewall ipv4 name untrusted-to-guest rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-guest rule 110 action drop
set firewall ipv4 name untrusted-to-guest rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-guest rule 110 log 
set firewall ipv4 name untrusted-to-guest rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-guest rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-guest rule 120 action drop
set firewall ipv4 name untrusted-to-guest rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-guest rule 120 log 
set firewall ipv4 name untrusted-to-guest rule 120 protocol icmp
set firewall ipv4 name untrusted-to-guest rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-guest rule 121 action drop
set firewall ipv4 name untrusted-to-guest rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-guest rule 121 log 
set firewall ipv4 name untrusted-to-guest rule 121 protocol icmp
set firewall ipv4 name untrusted-to-guest rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-guest rule 122 action drop
set firewall ipv4 name untrusted-to-guest rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-guest rule 122 log 
set firewall ipv4 name untrusted-to-guest rule 122 protocol icmp
set firewall ipv4 name untrusted-to-guest rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-guest rule 123 action drop
set firewall ipv4 name untrusted-to-guest rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-guest rule 123 log 
set firewall ipv4 name untrusted-to-guest rule 123 protocol icmp
set firewall ipv4 name untrusted-to-guest rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-guest rule 124 action accept
set firewall ipv4 name untrusted-to-guest rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-guest rule 124 log 
set firewall ipv4 name untrusted-to-guest rule 124 protocol icmp
set firewall ipv4 name untrusted-to-guest rule 124 limit burst 10
set firewall ipv4 name untrusted-to-guest rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-guest rule 130 action accept
set firewall ipv4 name untrusted-to-guest rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-guest rule 130 log 
set firewall ipv4 name untrusted-to-guest rule 130 protocol all
set firewall ipv4 name untrusted-to-guest rule 130 state established 
set firewall ipv4 name untrusted-to-guest rule 130 state related 
# set firewall ipv4 name untrusted-to-guest rule 130 state new disable
# set firewall ipv4 name untrusted-to-guest rule 130 state invalid disable

set firewall ipv4 name untrusted-to-guest rule 140 action drop
set firewall ipv4 name untrusted-to-guest rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-guest rule 140 log 
set firewall ipv4 name untrusted-to-guest rule 140 protocol all
# set firewall ipv4 name untrusted-to-guest rule 140 state established disable
# set firewall ipv4 name untrusted-to-guest rule 140 state related disable
# set firewall ipv4 name untrusted-to-guest rule 140 state new disable
set firewall ipv4 name untrusted-to-guest rule 140 state invalid

# Untrusted Zone -> IoT Zone
# Default block with standard rules from 100-140.
set firewall ipv4 name untrusted-to-iot default-action 'drop'
set firewall ipv4 name untrusted-to-iot description 'From Untrusted Zone to IoT Zone'
set firewall ipv4 name untrusted-to-iot default-log

set firewall ipv4 name untrusted-to-iot rule 100 action drop
set firewall ipv4 name untrusted-to-iot rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-iot rule 100 log 
set firewall ipv4 name untrusted-to-iot rule 100 protocol all
set firewall ipv4 name untrusted-to-iot rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-iot rule 105 action drop
set firewall ipv4 name untrusted-to-iot rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-iot rule 105 log 
set firewall ipv4 name untrusted-to-iot rule 105 protocol all
set firewall ipv4 name untrusted-to-iot rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-iot rule 110 action drop
set firewall ipv4 name untrusted-to-iot rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-iot rule 110 log 
set firewall ipv4 name untrusted-to-iot rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-iot rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-iot rule 120 action drop
set firewall ipv4 name untrusted-to-iot rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-iot rule 120 log 
set firewall ipv4 name untrusted-to-iot rule 120 protocol icmp
set firewall ipv4 name untrusted-to-iot rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-iot rule 121 action drop
set firewall ipv4 name untrusted-to-iot rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-iot rule 121 log 
set firewall ipv4 name untrusted-to-iot rule 121 protocol icmp
set firewall ipv4 name untrusted-to-iot rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-iot rule 122 action drop
set firewall ipv4 name untrusted-to-iot rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-iot rule 122 log 
set firewall ipv4 name untrusted-to-iot rule 122 protocol icmp
set firewall ipv4 name untrusted-to-iot rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-iot rule 123 action drop
set firewall ipv4 name untrusted-to-iot rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-iot rule 123 log 
set firewall ipv4 name untrusted-to-iot rule 123 protocol icmp
set firewall ipv4 name untrusted-to-iot rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-iot rule 124 action accept
set firewall ipv4 name untrusted-to-iot rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-iot rule 124 log 
set firewall ipv4 name untrusted-to-iot rule 124 protocol icmp
set firewall ipv4 name untrusted-to-iot rule 124 limit burst 10
set firewall ipv4 name untrusted-to-iot rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-iot rule 130 action accept
set firewall ipv4 name untrusted-to-iot rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-iot rule 130 log 
set firewall ipv4 name untrusted-to-iot rule 130 protocol all
set firewall ipv4 name untrusted-to-iot rule 130 state established 
set firewall ipv4 name untrusted-to-iot rule 130 state related 
# set firewall ipv4 name untrusted-to-iot rule 130 state new disable
# set firewall ipv4 name untrusted-to-iot rule 130 state invalid disable

set firewall ipv4 name untrusted-to-iot rule 140 action drop
set firewall ipv4 name untrusted-to-iot rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-iot rule 140 log 
set firewall ipv4 name untrusted-to-iot rule 140 protocol all
# set firewall ipv4 name untrusted-to-iot rule 140 state established disable
# set firewall ipv4 name untrusted-to-iot rule 140 state related disable
# set firewall ipv4 name untrusted-to-iot rule 140 state new disable
set firewall ipv4 name untrusted-to-iot rule 140 state invalid

# Untrusted Zone -> Trusted
# Default block with standard rules from 100-140.
set firewall ipv4 name untrusted-to-trusted default-action 'drop'
set firewall ipv4 name untrusted-to-trusted description 'From Untrusted Zone to Trusted Zone'
set firewall ipv4 name untrusted-to-trusted default-log

set firewall ipv4 name untrusted-to-trusted rule 100 action drop
set firewall ipv4 name untrusted-to-trusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-trusted rule 100 log 
set firewall ipv4 name untrusted-to-trusted rule 100 protocol all
set firewall ipv4 name untrusted-to-trusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-trusted rule 105 action drop
set firewall ipv4 name untrusted-to-trusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-trusted rule 105 log 
set firewall ipv4 name untrusted-to-trusted rule 105 protocol all
set firewall ipv4 name untrusted-to-trusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-trusted rule 110 action drop
set firewall ipv4 name untrusted-to-trusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-trusted rule 110 log 
set firewall ipv4 name untrusted-to-trusted rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-trusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-trusted rule 120 action drop
set firewall ipv4 name untrusted-to-trusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-trusted rule 120 log 
set firewall ipv4 name untrusted-to-trusted rule 120 protocol icmp
set firewall ipv4 name untrusted-to-trusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-trusted rule 121 action drop
set firewall ipv4 name untrusted-to-trusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-trusted rule 121 log 
set firewall ipv4 name untrusted-to-trusted rule 121 protocol icmp
set firewall ipv4 name untrusted-to-trusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-trusted rule 122 action drop
set firewall ipv4 name untrusted-to-trusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-trusted rule 122 log 
set firewall ipv4 name untrusted-to-trusted rule 122 protocol icmp
set firewall ipv4 name untrusted-to-trusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-trusted rule 123 action drop
set firewall ipv4 name untrusted-to-trusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-trusted rule 123 log 
set firewall ipv4 name untrusted-to-trusted rule 123 protocol icmp
set firewall ipv4 name untrusted-to-trusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-trusted rule 124 action accept
set firewall ipv4 name untrusted-to-trusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-trusted rule 124 log 
set firewall ipv4 name untrusted-to-trusted rule 124 protocol icmp
set firewall ipv4 name untrusted-to-trusted rule 124 limit burst 10
set firewall ipv4 name untrusted-to-trusted rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-trusted rule 130 action accept
set firewall ipv4 name untrusted-to-trusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-trusted rule 130 log 
set firewall ipv4 name untrusted-to-trusted rule 130 protocol all
set firewall ipv4 name untrusted-to-trusted rule 130 state established 
set firewall ipv4 name untrusted-to-trusted rule 130 state related 
# set firewall ipv4 name untrusted-to-trusted rule 130 state new disable
# set firewall ipv4 name untrusted-to-trusted rule 130 state invalid disable

set firewall ipv4 name untrusted-to-trusted rule 140 action drop
set firewall ipv4 name untrusted-to-trusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-trusted rule 140 log 
set firewall ipv4 name untrusted-to-trusted rule 140 protocol all
# set firewall ipv4 name untrusted-to-trusted rule 140 state established disable
# set firewall ipv4 name untrusted-to-trusted rule 140 state related disable
# set firewall ipv4 name untrusted-to-trusted rule 140 state new disable
set firewall ipv4 name untrusted-to-trusted rule 140 state invalid

# Untrusted Zone -> Local Zone
# Default block with standard rules from 100-140. Accept DHCP & NTP services
set firewall ipv4 name untrusted-to-local default-action 'drop'
set firewall ipv4 name untrusted-to-local description 'From Untrusted Zone to Local Zone'
set firewall ipv4 name untrusted-to-local default-log

set firewall ipv4 name untrusted-to-local rule 100 action drop
set firewall ipv4 name untrusted-to-local rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-local rule 100 log 
set firewall ipv4 name untrusted-to-local rule 100 protocol all
set firewall ipv4 name untrusted-to-local rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-local rule 105 action drop
set firewall ipv4 name untrusted-to-local rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-local rule 105 log 
set firewall ipv4 name untrusted-to-local rule 105 protocol all
set firewall ipv4 name untrusted-to-local rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-local rule 110 action drop
set firewall ipv4 name untrusted-to-local rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-local rule 110 log 
set firewall ipv4 name untrusted-to-local rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-local rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-local rule 120 action drop
set firewall ipv4 name untrusted-to-local rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-local rule 120 log 
set firewall ipv4 name untrusted-to-local rule 120 protocol icmp
set firewall ipv4 name untrusted-to-local rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-local rule 121 action drop
set firewall ipv4 name untrusted-to-local rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-local rule 121 log 
set firewall ipv4 name untrusted-to-local rule 121 protocol icmp
set firewall ipv4 name untrusted-to-local rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-local rule 122 action drop
set firewall ipv4 name untrusted-to-local rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-local rule 122 log 
set firewall ipv4 name untrusted-to-local rule 122 protocol icmp
set firewall ipv4 name untrusted-to-local rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-local rule 123 action drop
set firewall ipv4 name untrusted-to-local rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-local rule 123 log 
set firewall ipv4 name untrusted-to-local rule 123 protocol icmp
set firewall ipv4 name untrusted-to-local rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-local rule 124 action accept
set firewall ipv4 name untrusted-to-local rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-local rule 124 log 
set firewall ipv4 name untrusted-to-local rule 124 protocol icmp
set firewall ipv4 name untrusted-to-local rule 124 limit burst 10
set firewall ipv4 name untrusted-to-local rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-local rule 130 action accept
set firewall ipv4 name untrusted-to-local rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-local rule 130 log 
set firewall ipv4 name untrusted-to-local rule 130 protocol all
set firewall ipv4 name untrusted-to-local rule 130 state established 
set firewall ipv4 name untrusted-to-local rule 130 state related 
# set firewall ipv4 name untrusted-to-local rule 130 state new disable
# set firewall ipv4 name untrusted-to-local rule 130 state invalid disable

set firewall ipv4 name untrusted-to-local rule 140 action drop
set firewall ipv4 name untrusted-to-local rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-local rule 140 log 
set firewall ipv4 name untrusted-to-local rule 140 protocol all
# set firewall ipv4 name untrusted-to-local rule 140 state established disable
# set firewall ipv4 name untrusted-to-local rule 140 state related disable
# set firewall ipv4 name untrusted-to-local rule 140 state new disable
set firewall ipv4 name untrusted-to-local rule 140 state invalid

set firewall ipv4 name untrusted-to-local rule 1000 action accept
set firewall ipv4 name untrusted-to-local rule 1000 description "Rule: Allow DHCP Requests"
set firewall ipv4 name untrusted-to-local rule 1000 log
set firewall ipv4 name untrusted-to-local rule 1000 protocol tcp_udp
set firewall ipv4 name untrusted-to-local rule 1000 destination group port-group 'services_dhcp'
set firewall ipv4 name untrusted-to-local rule 1000 destination group address-group 'services_dhcp'

set firewall ipv4 name untrusted-to-local rule 1001 action accept
set firewall ipv4 name untrusted-to-local rule 1001 description "Rule: Allow NTP Requests"
set firewall ipv4 name untrusted-to-local rule 1001 log
set firewall ipv4 name untrusted-to-local rule 1001 protocol tcp_udp
set firewall ipv4 name untrusted-to-local rule 1001 destination group port-group 'services_ntp'
set firewall ipv4 name untrusted-to-local rule 1001 destination group address-group 'services_ntp'

# Trusted Zone -> Container Zone
# Default accept with standard rules from 100-140. Accept DNS services
set firewall ipv4 name untrusted-to-containers default-action 'drop'
set firewall ipv4 name untrusted-to-containers description 'From Untrusted Zone to Container Zone'
set firewall ipv4 name untrusted-to-containers default-log

set firewall ipv4 name untrusted-to-containers rule 100 action drop
set firewall ipv4 name untrusted-to-containers rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-containers rule 100 log 
set firewall ipv4 name untrusted-to-containers rule 100 protocol all
set firewall ipv4 name untrusted-to-containers rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-containers rule 105 action drop
set firewall ipv4 name untrusted-to-containers rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-containers rule 105 log 
set firewall ipv4 name untrusted-to-containers rule 105 protocol all
set firewall ipv4 name untrusted-to-containers rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-containers rule 110 action drop
set firewall ipv4 name untrusted-to-containers rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-containers rule 110 log 
set firewall ipv4 name untrusted-to-containers rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-containers rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-containers rule 120 action drop
set firewall ipv4 name untrusted-to-containers rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-containers rule 120 log 
set firewall ipv4 name untrusted-to-containers rule 120 protocol icmp
set firewall ipv4 name untrusted-to-containers rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-containers rule 121 action drop
set firewall ipv4 name untrusted-to-containers rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-containers rule 121 log 
set firewall ipv4 name untrusted-to-containers rule 121 protocol icmp
set firewall ipv4 name untrusted-to-containers rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-containers rule 122 action drop
set firewall ipv4 name untrusted-to-containers rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-containers rule 122 log 
set firewall ipv4 name untrusted-to-containers rule 122 protocol icmp
set firewall ipv4 name untrusted-to-containers rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-containers rule 123 action drop
set firewall ipv4 name untrusted-to-containers rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-containers rule 123 log 
set firewall ipv4 name untrusted-to-containers rule 123 protocol icmp
set firewall ipv4 name untrusted-to-containers rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-containers rule 124 action accept
set firewall ipv4 name untrusted-to-containers rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-containers rule 124 log 
set firewall ipv4 name untrusted-to-containers rule 124 protocol icmp
set firewall ipv4 name untrusted-to-containers rule 124 limit burst 10
set firewall ipv4 name untrusted-to-containers rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-containers rule 130 action accept
set firewall ipv4 name untrusted-to-containers rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-containers rule 130 log 
set firewall ipv4 name untrusted-to-containers rule 130 protocol all
set firewall ipv4 name untrusted-to-containers rule 130 state established 
set firewall ipv4 name untrusted-to-containers rule 130 state related 
# set firewall ipv4 name untrusted-to-containers rule 130 state new disable
# set firewall ipv4 name untrusted-to-containers rule 130 state invalid disable

set firewall ipv4 name untrusted-to-containers rule 140 action drop
set firewall ipv4 name untrusted-to-containers rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-containers rule 140 log 
set firewall ipv4 name untrusted-to-containers rule 140 protocol all
# set firewall ipv4 name untrusted-to-containers rule 140 state established disable
# set firewall ipv4 name untrusted-to-containers rule 140 state related disable
# set firewall ipv4 name untrusted-to-containers rule 140 state new disable
set firewall ipv4 name untrusted-to-containers rule 140 state invalid 

set firewall ipv4 name untrusted-to-containers rule 1000 action accept
set firewall ipv4 name untrusted-to-containers rule 1000 description "Rule: Allow DNS Requests"
set firewall ipv4 name untrusted-to-containers rule 1000 log
set firewall ipv4 name untrusted-to-containers rule 1000 protocol tcp_udp
set firewall ipv4 name untrusted-to-containers rule 1000 destination group port-group 'services_dns'
set firewall ipv4 name untrusted-to-containers rule 1000 destination group address-group 'services_dns'

# Untrusted Zone -> WAN Zone
# Default block with standard rules from 100-140.
set firewall ipv4 name untrusted-to-wan default-action 'drop'
set firewall ipv4 name untrusted-to-wan description 'From Untrusted Zone to WAN Zone'
set firewall ipv4 name untrusted-to-wan default-log

set firewall ipv4 name untrusted-to-wan rule 100 action drop
set firewall ipv4 name untrusted-to-wan rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name untrusted-to-wan rule 100 log 
set firewall ipv4 name untrusted-to-wan rule 100 protocol all
set firewall ipv4 name untrusted-to-wan rule 100 source group address-group "blocked_networks"

set firewall ipv4 name untrusted-to-wan rule 105 action drop
set firewall ipv4 name untrusted-to-wan rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name untrusted-to-wan rule 105 log 
set firewall ipv4 name untrusted-to-wan rule 105 protocol all
set firewall ipv4 name untrusted-to-wan rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name untrusted-to-wan rule 110 action drop
set firewall ipv4 name untrusted-to-wan rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name untrusted-to-wan rule 110 log 
set firewall ipv4 name untrusted-to-wan rule 110 protocol tcp_udp
set firewall ipv4 name untrusted-to-wan rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name untrusted-to-wan rule 120 action drop
set firewall ipv4 name untrusted-to-wan rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-wan rule 120 log 
set firewall ipv4 name untrusted-to-wan rule 120 protocol icmp
set firewall ipv4 name untrusted-to-wan rule 120 icmp type-name timestamp-request

set firewall ipv4 name untrusted-to-wan rule 121 action drop
set firewall ipv4 name untrusted-to-wan rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-wan rule 121 log 
set firewall ipv4 name untrusted-to-wan rule 121 protocol icmp
set firewall ipv4 name untrusted-to-wan rule 121 icmp type-name address-mask-request

set firewall ipv4 name untrusted-to-wan rule 122 action drop
set firewall ipv4 name untrusted-to-wan rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-wan rule 122 log 
set firewall ipv4 name untrusted-to-wan rule 122 protocol icmp
set firewall ipv4 name untrusted-to-wan rule 122 icmp type-name router-advertisement

set firewall ipv4 name untrusted-to-wan rule 123 action drop
set firewall ipv4 name untrusted-to-wan rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name untrusted-to-wan rule 123 log 
set firewall ipv4 name untrusted-to-wan rule 123 protocol icmp
set firewall ipv4 name untrusted-to-wan rule 123 icmp type-name router-solicitation

set firewall ipv4 name untrusted-to-wan rule 124 action accept
set firewall ipv4 name untrusted-to-wan rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name untrusted-to-wan rule 124 log 
set firewall ipv4 name untrusted-to-wan rule 124 protocol icmp
set firewall ipv4 name untrusted-to-wan rule 124 limit burst 10
set firewall ipv4 name untrusted-to-wan rule 124 limit rate 50/minute

set firewall ipv4 name untrusted-to-wan rule 130 action accept
set firewall ipv4 name untrusted-to-wan rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name untrusted-to-wan rule 130 log 
set firewall ipv4 name untrusted-to-wan rule 130 protocol all
set firewall ipv4 name untrusted-to-wan rule 130 state established 
set firewall ipv4 name untrusted-to-wan rule 130 state related 

set firewall ipv4 name untrusted-to-wan rule 140 action drop
set firewall ipv4 name untrusted-to-wan rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name untrusted-to-wan rule 140 log 
set firewall ipv4 name untrusted-to-wan rule 140 protocol all
set firewall ipv4 name untrusted-to-wan rule 140 state invalid 
