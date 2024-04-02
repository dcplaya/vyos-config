#!/bin/vbash

#####################################
#       From WAN Zone Traffic       #
#####################################
# WAN Zone -> Guest Zone = Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
# WAN Zone -> IoT Zone = Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
# WAN Zone -> Trusted Zone = Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related) Allow SSH to jumphost. Allow Plex loadbalanced IP
# WAN Zone -> Untrusted Zone = Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
# WAN Zone -> Local Zone = Default block with standard rules from 100-140. Disabled rules 130 (established/related). Allow wireguard
# WAN Zone -> Containers Zone = Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related). Allow HTTP/HTTPS to HAProxy





# WAN Zone -> Guest Zone
# Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
set firewall ipv4 name wan-to-guest default-action 'drop'
set firewall ipv4 name wan-to-guest description 'From WAN Zone to Guest Zone'
set firewall ipv4 name wan-to-guest default-log

set firewall ipv4 name wan-to-guest rule 100 action drop
set firewall ipv4 name wan-to-guest rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-guest rule 100 log 
set firewall ipv4 name wan-to-guest rule 100 protocol all
set firewall ipv4 name wan-to-guest rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-guest rule 105 action drop
set firewall ipv4 name wan-to-guest rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-guest rule 105 log 
set firewall ipv4 name wan-to-guest rule 105 protocol all
set firewall ipv4 name wan-to-guest rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-guest rule 110 action drop
set firewall ipv4 name wan-to-guest rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-guest rule 110 log 
set firewall ipv4 name wan-to-guest rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-guest rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-guest rule 120 action drop
set firewall ipv4 name wan-to-guest rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-guest rule 120 log 
set firewall ipv4 name wan-to-guest rule 120 protocol icmp
set firewall ipv4 name wan-to-guest rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-guest rule 121 action drop
set firewall ipv4 name wan-to-guest rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-guest rule 121 log 
set firewall ipv4 name wan-to-guest rule 121 protocol icmp
set firewall ipv4 name wan-to-guest rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-guest rule 122 action drop
set firewall ipv4 name wan-to-guest rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-guest rule 122 log 
set firewall ipv4 name wan-to-guest rule 122 protocol icmp
set firewall ipv4 name wan-to-guest rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-guest rule 123 action drop
set firewall ipv4 name wan-to-guest rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-guest rule 123 log 
set firewall ipv4 name wan-to-guest rule 123 protocol icmp
set firewall ipv4 name wan-to-guest rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-guest rule 124 disable
set firewall ipv4 name wan-to-guest rule 124 action accept
set firewall ipv4 name wan-to-guest rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-guest rule 124 log 
set firewall ipv4 name wan-to-guest rule 124 protocol icmp
set firewall ipv4 name wan-to-guest rule 124 limit burst 10
set firewall ipv4 name wan-to-guest rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-guest rule 130 disable
set firewall ipv4 name wan-to-guest rule 130 action accept
set firewall ipv4 name wan-to-guest rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-guest rule 130 log 
set firewall ipv4 name wan-to-guest rule 130 protocol all
set firewall ipv4 name wan-to-guest rule 130 state established 
set firewall ipv4 name wan-to-guest rule 130 state related 
# set firewall ipv4 name wan-to-guest rule 130 state new disable
# set firewall ipv4 name wan-to-guest rule 130 state invalid disable

set firewall ipv4 name wan-to-guest rule 140 action drop
set firewall ipv4 name wan-to-guest rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-guest rule 140 log 
set firewall ipv4 name wan-to-guest rule 140 protocol all
# set firewall ipv4 name wan-to-guest rule 140 state established disable
# set firewall ipv4 name wan-to-guest rule 140 state related disable
# set firewall ipv4 name wan-to-guest rule 140 state new disable
set firewall ipv4 name wan-to-guest rule 140 state invalid 

# WAN Zone -> IoT Zone
# Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
set firewall ipv4 name wan-to-iot default-action 'drop'
set firewall ipv4 name wan-to-iot description 'From WAN Zone to IoT Zone'
set firewall ipv4 name wan-to-iot default-log

set firewall ipv4 name wan-to-iot rule 100 action drop
set firewall ipv4 name wan-to-iot rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-iot rule 100 log 
set firewall ipv4 name wan-to-iot rule 100 protocol all
set firewall ipv4 name wan-to-iot rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-iot rule 105 action drop
set firewall ipv4 name wan-to-iot rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-iot rule 105 log 
set firewall ipv4 name wan-to-iot rule 105 protocol all
set firewall ipv4 name wan-to-iot rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-iot rule 110 action drop
set firewall ipv4 name wan-to-iot rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-iot rule 110 log 
set firewall ipv4 name wan-to-iot rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-iot rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-iot rule 120 action drop
set firewall ipv4 name wan-to-iot rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-iot rule 120 log 
set firewall ipv4 name wan-to-iot rule 120 protocol icmp
set firewall ipv4 name wan-to-iot rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-iot rule 121 action drop
set firewall ipv4 name wan-to-iot rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-iot rule 121 log 
set firewall ipv4 name wan-to-iot rule 121 protocol icmp
set firewall ipv4 name wan-to-iot rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-iot rule 122 action drop
set firewall ipv4 name wan-to-iot rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-iot rule 122 log 
set firewall ipv4 name wan-to-iot rule 122 protocol icmp
set firewall ipv4 name wan-to-iot rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-iot rule 123 action drop
set firewall ipv4 name wan-to-iot rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-iot rule 123 log 
set firewall ipv4 name wan-to-iot rule 123 protocol icmp
set firewall ipv4 name wan-to-iot rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-iot rule 124 disable
set firewall ipv4 name wan-to-iot rule 124 action accept
set firewall ipv4 name wan-to-iot rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-iot rule 124 log 
set firewall ipv4 name wan-to-iot rule 124 protocol icmp
set firewall ipv4 name wan-to-iot rule 124 limit burst 10
set firewall ipv4 name wan-to-iot rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-iot rule 130 disable
set firewall ipv4 name wan-to-iot rule 130 action accept
set firewall ipv4 name wan-to-iot rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-iot rule 130 log 
set firewall ipv4 name wan-to-iot rule 130 protocol all
set firewall ipv4 name wan-to-iot rule 130 state established 
set firewall ipv4 name wan-to-iot rule 130 state related 
# set firewall ipv4 name wan-to-iot rule 130 state new disable
# set firewall ipv4 name wan-to-iot rule 130 state invalid disable

set firewall ipv4 name wan-to-iot rule 140 action drop
set firewall ipv4 name wan-to-iot rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-iot rule 140 log 
set firewall ipv4 name wan-to-iot rule 140 protocol all
# set firewall ipv4 name wan-to-iot rule 140 state established disable
# set firewall ipv4 name wan-to-iot rule 140 state related disable
# set firewall ipv4 name wan-to-iot rule 140 state new disable
set firewall ipv4 name wan-to-iot rule 140 state invalid

# WAN Zone -> Trusted Zone
# Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related) Allow SSH to jumphost. Allow Plex loadbalanced IP
set firewall ipv4 name wan-to-trusted default-action 'drop'
set firewall ipv4 name wan-to-trusted description 'From WAN Zone to Trusted Zone'
set firewall ipv4 name wan-to-trusted default-log

set firewall ipv4 name wan-to-trusted rule 100 action drop
set firewall ipv4 name wan-to-trusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-trusted rule 100 log 
set firewall ipv4 name wan-to-trusted rule 100 protocol all
set firewall ipv4 name wan-to-trusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-trusted rule 105 action drop
set firewall ipv4 name wan-to-trusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-trusted rule 105 log 
set firewall ipv4 name wan-to-trusted rule 105 protocol all
set firewall ipv4 name wan-to-trusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-trusted rule 110 action drop
set firewall ipv4 name wan-to-trusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-trusted rule 110 log 
set firewall ipv4 name wan-to-trusted rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-trusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-trusted rule 120 action drop
set firewall ipv4 name wan-to-trusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-trusted rule 120 log 
set firewall ipv4 name wan-to-trusted rule 120 protocol icmp
set firewall ipv4 name wan-to-trusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-trusted rule 121 action drop
set firewall ipv4 name wan-to-trusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-trusted rule 121 log 
set firewall ipv4 name wan-to-trusted rule 121 protocol icmp
set firewall ipv4 name wan-to-trusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-trusted rule 122 action drop
set firewall ipv4 name wan-to-trusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-trusted rule 122 log 
set firewall ipv4 name wan-to-trusted rule 122 protocol icmp
set firewall ipv4 name wan-to-trusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-trusted rule 123 action drop
set firewall ipv4 name wan-to-trusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-trusted rule 123 log 
set firewall ipv4 name wan-to-trusted rule 123 protocol icmp
set firewall ipv4 name wan-to-trusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-trusted rule 124 disable
set firewall ipv4 name wan-to-trusted rule 124 action accept
set firewall ipv4 name wan-to-trusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-trusted rule 124 log 
set firewall ipv4 name wan-to-trusted rule 124 protocol icmp
set firewall ipv4 name wan-to-trusted rule 124 limit burst 10
set firewall ipv4 name wan-to-trusted rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-trusted rule 130 disable
set firewall ipv4 name wan-to-trusted rule 130 action accept
set firewall ipv4 name wan-to-trusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-trusted rule 130 log 
set firewall ipv4 name wan-to-trusted rule 130 protocol all
set firewall ipv4 name wan-to-trusted rule 130 state established 
set firewall ipv4 name wan-to-trusted rule 130 state related \

set firewall ipv4 name wan-to-trusted rule 140 action drop
set firewall ipv4 name wan-to-trusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-trusted rule 140 log 
set firewall ipv4 name wan-to-trusted rule 140 protocol all
set firewall ipv4 name wan-to-trusted rule 140 state invalid

set firewall ipv4 name wan-to-trusted rule 1000 action accept
set firewall ipv4 name wan-to-trusted rule 1000 description "Rule: Allow SSH Jumphost"
set firewall ipv4 name wan-to-trusted rule 1000 log
set firewall ipv4 name wan-to-trusted rule 1000 protocol tcp
set firewall ipv4 name wan-to-trusted rule 1000 destination group port-group 'services_ssh'
set firewall ipv4 name wan-to-trusted rule 1000 destination group domain-group 'domains_ssh_jumphost'

set firewall ipv4 name wan-to-trusted rule 1010 action accept
set firewall ipv4 name wan-to-trusted rule 1010 description "Rule: Allow Plex Load Balanced Direct Connection"
set firewall ipv4 name wan-to-trusted rule 1010 log
set firewall ipv4 name wan-to-trusted rule 1010 protocol tcp
set firewall ipv4 name wan-to-trusted rule 1010 destination group port-group 'services_plex'
set firewall ipv4 name wan-to-trusted rule 1010 destination group address-group 'services_plex'

# WAN Zone -> Untrusted Zone
# Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related)
set firewall ipv4 name wan-to-untrusted default-action 'drop'
set firewall ipv4 name wan-to-untrusted description 'From WAN Zone to Untrusted Zone'
set firewall ipv4 name wan-to-untrusted default-log

set firewall ipv4 name wan-to-untrusted rule 100 action drop
set firewall ipv4 name wan-to-untrusted rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-untrusted rule 100 log 
set firewall ipv4 name wan-to-untrusted rule 100 protocol all
set firewall ipv4 name wan-to-untrusted rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-untrusted rule 105 action drop
set firewall ipv4 name wan-to-untrusted rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-untrusted rule 105 log 
set firewall ipv4 name wan-to-untrusted rule 105 protocol all
set firewall ipv4 name wan-to-untrusted rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-untrusted rule 110 action drop
set firewall ipv4 name wan-to-untrusted rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-untrusted rule 110 log 
set firewall ipv4 name wan-to-untrusted rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-untrusted rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-untrusted rule 120 action drop
set firewall ipv4 name wan-to-untrusted rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-untrusted rule 120 log 
set firewall ipv4 name wan-to-untrusted rule 120 protocol icmp
set firewall ipv4 name wan-to-untrusted rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-untrusted rule 121 action drop
set firewall ipv4 name wan-to-untrusted rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-untrusted rule 121 log 
set firewall ipv4 name wan-to-untrusted rule 121 protocol icmp
set firewall ipv4 name wan-to-untrusted rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-untrusted rule 122 action drop
set firewall ipv4 name wan-to-untrusted rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-untrusted rule 122 log 
set firewall ipv4 name wan-to-untrusted rule 122 protocol icmp
set firewall ipv4 name wan-to-untrusted rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-untrusted rule 123 action drop
set firewall ipv4 name wan-to-untrusted rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-untrusted rule 123 log 
set firewall ipv4 name wan-to-untrusted rule 123 protocol icmp
set firewall ipv4 name wan-to-untrusted rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-untrusted rule 124 disable
set firewall ipv4 name wan-to-untrusted rule 124 action accept
set firewall ipv4 name wan-to-untrusted rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-untrusted rule 124 log 
set firewall ipv4 name wan-to-untrusted rule 124 protocol icmp
set firewall ipv4 name wan-to-untrusted rule 124 limit burst 10
set firewall ipv4 name wan-to-untrusted rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-untrusted rule 130 disable
set firewall ipv4 name wan-to-untrusted rule 130 action accept
set firewall ipv4 name wan-to-untrusted rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-untrusted rule 130 log 
set firewall ipv4 name wan-to-untrusted rule 130 protocol all
set firewall ipv4 name wan-to-untrusted rule 130 state established 
set firewall ipv4 name wan-to-untrusted rule 130 state related 

set firewall ipv4 name wan-to-untrusted rule 140 action drop
set firewall ipv4 name wan-to-untrusted rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-untrusted rule 140 log 
set firewall ipv4 name wan-to-untrusted rule 140 protocol all
set firewall ipv4 name wan-to-untrusted rule 140 state invalid 

# WAN Zone -> Local Zone
# Default block with standard rules from 100-140. Disabled rules 130 (established/related). Allow wireguard
set firewall ipv4 name wan-to-local default-action 'drop'
set firewall ipv4 name wan-to-local description 'From WAN Zone to Local Zone'
set firewall ipv4 name wan-to-local default-log

set firewall ipv4 name wan-to-local rule 100 action drop
set firewall ipv4 name wan-to-local rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-local rule 100 log 
set firewall ipv4 name wan-to-local rule 100 protocol all
set firewall ipv4 name wan-to-local rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-local rule 105 action drop
set firewall ipv4 name wan-to-local rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-local rule 105 log 
set firewall ipv4 name wan-to-local rule 105 protocol all
set firewall ipv4 name wan-to-local rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-local rule 110 action drop
set firewall ipv4 name wan-to-local rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-local rule 110 log 
set firewall ipv4 name wan-to-local rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-local rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-local rule 120 action drop
set firewall ipv4 name wan-to-local rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-local rule 120 log 
set firewall ipv4 name wan-to-local rule 120 protocol icmp
set firewall ipv4 name wan-to-local rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-local rule 121 action drop
set firewall ipv4 name wan-to-local rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-local rule 121 log 
set firewall ipv4 name wan-to-local rule 121 protocol icmp
set firewall ipv4 name wan-to-local rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-local rule 122 action drop
set firewall ipv4 name wan-to-local rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-local rule 122 log 
set firewall ipv4 name wan-to-local rule 122 protocol icmp
set firewall ipv4 name wan-to-local rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-local rule 123 action drop
set firewall ipv4 name wan-to-local rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-local rule 123 log 
set firewall ipv4 name wan-to-local rule 123 protocol icmp
set firewall ipv4 name wan-to-local rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-local rule 124 action accept
set firewall ipv4 name wan-to-local rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-local rule 124 log 
set firewall ipv4 name wan-to-local rule 124 protocol icmp
set firewall ipv4 name wan-to-local rule 124 limit burst 10
set firewall ipv4 name wan-to-local rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-local rule 130 disable
set firewall ipv4 name wan-to-local rule 130 action accept
set firewall ipv4 name wan-to-local rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-local rule 130 log 
set firewall ipv4 name wan-to-local rule 130 protocol all
set firewall ipv4 name wan-to-local rule 130 state established 
set firewall ipv4 name wan-to-local rule 130 state related 

set firewall ipv4 name wan-to-local rule 140 action drop
set firewall ipv4 name wan-to-local rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-local rule 140 log 
set firewall ipv4 name wan-to-local rule 140 protocol all
set firewall ipv4 name wan-to-local rule 140 state invalid

set firewall ipv4 name wan-to-local rule 1000 action accept
set firewall ipv4 name wan-to-local rule 1000 description "Rule: Allow Wireguard"
set firewall ipv4 name wan-to-local rule 1000 log
set firewall ipv4 name wan-to-local rule 1000 protocol udp
set firewall ipv4 name wan-to-local rule 1000 destination group port-group 'services_wireguard'

# WAN Zone -> Containers Zone
# Default block with standard rules from 100-140. Disabled rules 124 & 130 (Ping & established/related). Allow HTTP/HTTPS to HAProxy
set firewall ipv4 name wan-to-containers default-action 'drop'
set firewall ipv4 name wan-to-containers description 'From WAN Zone to Containers Zone'
set firewall ipv4 name wan-to-containers default-log

set firewall ipv4 name wan-to-containers rule 100 action drop
set firewall ipv4 name wan-to-containers rule 100 description "Rule: Drop Blocked Networks"
set firewall ipv4 name wan-to-containers rule 100 log 
set firewall ipv4 name wan-to-containers rule 100 protocol all
set firewall ipv4 name wan-to-containers rule 100 source group address-group "blocked_networks"

set firewall ipv4 name wan-to-containers rule 105 action drop
set firewall ipv4 name wan-to-containers rule 105 description "Rule: Drop Bogon IP addresses (illegitimate IP address not assigned by IANA)"
set firewall ipv4 name wan-to-containers rule 105 log 
set firewall ipv4 name wan-to-containers rule 105 protocol all
set firewall ipv4 name wan-to-containers rule 105 source group address-group "bogons_ipv4"

set firewall ipv4 name wan-to-containers rule 110 action drop
set firewall ipv4 name wan-to-containers rule 110 description "Rule: Drop Blocked Protocols"
set firewall ipv4 name wan-to-containers rule 110 log 
set firewall ipv4 name wan-to-containers rule 110 protocol tcp_udp
set firewall ipv4 name wan-to-containers rule 110 destination group port-group "blocked_protocols"

set firewall ipv4 name wan-to-containers rule 120 action drop
set firewall ipv4 name wan-to-containers rule 120 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-containers rule 120 log 
set firewall ipv4 name wan-to-containers rule 120 protocol icmp
set firewall ipv4 name wan-to-containers rule 120 icmp type-name timestamp-request

set firewall ipv4 name wan-to-containers rule 121 action drop
set firewall ipv4 name wan-to-containers rule 121 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-containers rule 121 log 
set firewall ipv4 name wan-to-containers rule 121 protocol icmp
set firewall ipv4 name wan-to-containers rule 121 icmp type-name address-mask-request

set firewall ipv4 name wan-to-containers rule 122 action drop
set firewall ipv4 name wan-to-containers rule 122 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-containers rule 122 log 
set firewall ipv4 name wan-to-containers rule 122 protocol icmp
set firewall ipv4 name wan-to-containers rule 122 icmp type-name router-advertisement

set firewall ipv4 name wan-to-containers rule 123 action drop
set firewall ipv4 name wan-to-containers rule 123 description "Rule: Drop Undesirable ICMP"
set firewall ipv4 name wan-to-containers rule 123 log 
set firewall ipv4 name wan-to-containers rule 123 protocol icmp
set firewall ipv4 name wan-to-containers rule 123 icmp type-name router-solicitation

set firewall ipv4 name wan-to-containers rule 124 disable
set firewall ipv4 name wan-to-containers rule 124 action accept
set firewall ipv4 name wan-to-containers rule 124 description "Rule: Allow ICMP Echo at Low Rate"
set firewall ipv4 name wan-to-containers rule 124 log 
set firewall ipv4 name wan-to-containers rule 124 protocol icmp
set firewall ipv4 name wan-to-containers rule 124 limit burst 10
set firewall ipv4 name wan-to-containers rule 124 limit rate 50/minute

set firewall ipv4 name wan-to-containers rule 130 disable
set firewall ipv4 name wan-to-containers rule 130 action accept
set firewall ipv4 name wan-to-containers rule 130 description "Rule: Allow Established / Related"
set firewall ipv4 name wan-to-containers rule 130 log 
set firewall ipv4 name wan-to-containers rule 130 protocol all
set firewall ipv4 name wan-to-containers rule 130 state established 
set firewall ipv4 name wan-to-containers rule 130 state related 

set firewall ipv4 name wan-to-containers rule 140 action drop
set firewall ipv4 name wan-to-containers rule 140 description "Rule: Drop Invalid"
set firewall ipv4 name wan-to-containers rule 140 log 
set firewall ipv4 name wan-to-containers rule 140 protocol all
set firewall ipv4 name wan-to-containers rule 140 state invalid 

set firewall ipv4 name wan-to-containers rule 1000 action accept
set firewall ipv4 name wan-to-containers rule 1000 description "Rule: Allow HTTP/HTTPS To HAProxy"
set firewall ipv4 name wan-to-containers rule 1000 log
set firewall ipv4 name wan-to-containers rule 1000 protocol tcp
set firewall ipv4 name wan-to-containers rule 1000 destination group port-group 'services_http'
set firewall ipv4 name wan-to-containers rule 1000 destination group address-group 'services_haproxy'