#!/bin/vbash

# BGP configuration
set protocols bgp address-family ipv4-unicast network 10.0.0.0/24
set protocols bgp address-family ipv4-unicast network 10.10.1.0/24
set protocols bgp address-family ipv4-unicast network 10.10.100.0/24
set protocols bgp address-family ipv4-unicast network 10.10.200.0/24
set protocols bgp address-family ipv4-unicast network 10.200.0.0/24
set protocols bgp address-family ipv4-unicast network 10.200.1.0/24
set protocols bgp address-family ipv4-unicast network 10.200.2.0/24
set protocols bgp address-family ipv4-unicast network 10.255.253.0/24
set protocols bgp address-family ipv4-unicast redistribute
set protocols bgp address-family ipv6-unicast redistribute connected
set protocols bgp listen range 10.200.1.0/24 peer-group 'Cluster-1'
set protocols bgp listen range 10.200.2.0/24 peer-group 'Cluster-2'
set protocols bgp neighbor 10.2.0.11 address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp neighbor 10.2.0.11 ebgp-multihop '255'
set protocols bgp neighbor 10.2.0.11 remote-as '64616'
set protocols bgp neighbor 10.2.0.11 update-source '10.2.0.11'
set protocols bgp neighbor 10.2.0.12 address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp neighbor 10.2.0.12 ebgp-multihop '255'
set protocols bgp neighbor 10.2.0.12 remote-as '64617'
set protocols bgp neighbor 10.2.0.12 update-source '10.2.0.12'
set protocols bgp neighbor 10.255.253.2 address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp neighbor 10.255.253.2 ebgp-multihop '255'
set protocols bgp neighbor 10.255.253.2 remote-as '64513'
set protocols bgp neighbor 10.255.253.2 update-source '10.255.253.2'
set protocols bgp parameters router-id '10.255.253.1'
set protocols bgp peer-group Cluster-1 address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp peer-group Cluster-1 description 'Cluster-1 Peer Group Parameters'
set protocols bgp peer-group Cluster-1 remote-as '64512'
set protocols bgp peer-group Cluster-1 update-source 'eth5.4040'
set protocols bgp peer-group Cluster-2 address-family ipv4-unicast soft-reconfiguration inbound
set protocols bgp peer-group Cluster-2 description 'Cluster-2 Peer Group Parameters'
set protocols bgp peer-group Cluster-2 remote-as '64512'
set protocols bgp peer-group Cluster-2 update-source 'eth5.4040'
set protocols bgp system-as '64512'

# OSFP configuration
set protocols ospf

# Static configuration
set protocols static route 0.0.0.0/0 dhcp-interface 'eth1'
set protocols static route 10.2.0.0/24 interface wg2 distance '1'
set protocols static route 10.10.1.0/24 next-hop 10.255.253.2
set protocols static route 10.10.100.0/24 next-hop 10.255.253.2
set protocols static route 10.10.200.0/24 next-hop 10.255.253.2
set protocols static route 10.200.0.0/24 next-hop 10.255.253.2
set protocols static route 10.200.1.0/24 next-hop 10.255.253.2
set protocols static route 10.200.2.0/24 next-hop 10.255.253.2
set protocols static route 10.200.40.0/24 next-hop 10.255.253.2
set protocols static route 10.230.0.0/24 next-hop 10.255.253.2
set protocols static route 192.168.1.0/24 next-hop 10.255.253.2
