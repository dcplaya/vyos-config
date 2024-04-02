#!/bin/vbash

set interfaces ethernet eth0 address 'dhcp'
#set interfaces ethernet eth0 duplex 'auto'
set interfaces ethernet eth0 hw-id 'a8:b8:e0:01:0e:33'

set interfaces ethernet eth1 address 'dhcp'
set interfaces ethernet eth1 description 'ONT'
set interfaces ethernet eth1 hw-id 'a8:b8:e0:01:0e:34'

set interfaces ethernet eth2 address 'dhcp'
#set interfaces ethernet eth2 duplex 'auto'
set interfaces ethernet eth2 hw-id 'a8:b8:e0:01:0e:35'

set interfaces ethernet eth3 address 'dhcp'
#set interfaces ethernet eth3 duplex 'auto'
set interfaces ethernet eth3 hw-id 'a8:b8:e0:01:0e:36'

set interfaces ethernet eth4 address 'dhcp'
#set interfaces ethernet eth4 duplex 'auto'
set interfaces ethernet eth4 hw-id 'd4:20:00:b1:d7:21'

set interfaces ethernet eth5 address '10.10.255.1/24'
set interfaces ethernet eth5 description '10G Switch Uplink - LAN'
#set interfaces ethernet eth5 duplex 'auto'
set interfaces ethernet eth5 hw-id 'd4:20:00:b1:d7:22'
set interfaces ethernet eth5 offload gro
set interfaces ethernet eth5 offload gso
set interfaces ethernet eth5 offload rfs
set interfaces ethernet eth5 offload rps
set interfaces ethernet eth5 offload sg
set interfaces ethernet eth5 offload tso
set interfaces ethernet eth5 speed 'auto'
set interfaces ethernet eth5 vif 1 description 'Untrusted'
set interfaces ethernet eth5 vif 2 description 'Home'
set interfaces ethernet eth5 vif 50 address '10.10.50.1/24'
set interfaces ethernet eth5 vif 50 description 'Guest Network'
set interfaces ethernet eth5 vif 100 address '10.10.100.254/24'
set interfaces ethernet eth5 vif 100 description 'IoT Only'
set interfaces ethernet eth5 vif 200 description 'Servers'
set interfaces ethernet eth5 vif 1999 description 'Proxmox Corosync Only'
set interfaces ethernet eth5 vif 2000 description 'Management'
set interfaces ethernet eth5 vif 2001 description 'Cluster-1'
set interfaces ethernet eth5 vif 2002 address '10.200.2.254/24'
set interfaces ethernet eth5 vif 2002 description 'Cluster-2'
set interfaces ethernet eth5 vif 2040 description 'Ceph VLAN'
set interfaces ethernet eth5 vif 2300 description 'VPN / Netmaker / Wireguard VLAN'
set interfaces ethernet eth5 vif 4040 address '10.255.253.1/24'
set interfaces ethernet eth5 vif 4040 description 'Unifi Switch Inter-VLAN Routing'

set interfaces loopback lo

set interfaces wireguard wg2 address '10.2.0.10/32'
set interfaces wireguard wg2 address '10.2.0.10/24'
set interfaces wireguard wg2 description 'Site-To-Site'
set interfaces wireguard wg2 mtu '1420'
set interfaces wireguard wg2 peer AmbersHouse allowed-ips '10.17.0.0/16'
set interfaces wireguard wg2 peer AmbersHouse allowed-ips '10.200.0.216/29'
set interfaces wireguard wg2 peer AmbersHouse allowed-ips '10.2.0.12/32'
set interfaces wireguard wg2 peer AmbersHouse persistent-keepalive '16'
set interfaces wireguard wg2 peer AmbersHouse public-key 'K/fa0fGyoQBhS3HXSZbFIypABTSkHATEQCezxL6diE8='
set interfaces wireguard wg2 peer AndroidPhone allowed-ips '10.2.0.100/32'
set interfaces wireguard wg2 peer AndroidPhone persistent-keepalive '16'
set interfaces wireguard wg2 peer AndroidPhone public-key 'mmjOlMmSataifJOQst14z5RBiULBQL7woufPNYz2XXw='
set interfaces wireguard wg2 peer BergsPhone allowed-ips '10.2.0.101/32'
set interfaces wireguard wg2 peer BergsPhone public-key 'JL5mAj7TbvaWWhapx7Oz4c+bUQKs42e3xquTQ9FyC2U='
set interfaces wireguard wg2 peer JeffsHouse allowed-ips '10.16.0.0/16'
set interfaces wireguard wg2 peer JeffsHouse allowed-ips '10.2.0.11/32'
set interfaces wireguard wg2 peer JeffsHouse allowed-ips '10.200.0.208/29'
set interfaces wireguard wg2 peer JeffsHouse persistent-keepalive '16'
set interfaces wireguard wg2 peer JeffsHouse public-key 'uliP4IFnwRfyyMR9MXUSGrVsfsB8Esq7O7UqqaUBt2Y='
set interfaces wireguard wg2 peer TylersPC allowed-ips '10.2.0.102/32'
set interfaces wireguard wg2 peer TylersPC public-key 'Qt33QyrMJeAyt5oXmtgNp8Oj7o6/Oe947+y6CYWd5D4='
set interfaces wireguard wg2 peer WorkLaptop allowed-ips '10.2.0.110/32'
set interfaces wireguard wg2 peer WorkLaptop persistent-keepalive '16'
set interfaces wireguard wg2 peer WorkLaptop public-key '/o3ZEu2WUyqUWCip5pAN/DidnGVl8/q/3u42LJpRDFg='
set interfaces wireguard wg2 port '51820'
set interfaces wireguard wg2 private-key '0PDELkVlayiU7vHy2YFokwPRD+sPvaW4yiOTLIw6Ll4='