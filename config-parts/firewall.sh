#!/bin/vbash

# General configuration
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

# Address Groups
set firewall group address-group blocked_networks address '1.0.1.21'
set firewall group address-group bogons_ipv4 address '100.64.0.1-100.127.255.254'
set firewall group address-group services_plex address '10.200.1.53'
set firewall group address-group services_dns address '10.0.0.4'
set firewall group address-group services_dhcp address '10.255.253.1'
set firewall group address-group services_ntp address '10.255.253.1'
set firewall group address-group services_haproxy address '10.0.0.102'
set firewall group address-group services_home_automation address '10.200.1.52'
set firewall group address-group services_home_automation address '10.200.1.54-10.200.1.56'
set firewall group address-group services_home_automation address '10.200.1.60'
set firewall group address-group services_home_automation address '10.200.1.62'

# Network Groups
set firewall group network-group internal_lan_networks network "10.0.0.0/8"
set firewall group network-group internal_lan_networks network "127.0.0.1/32"
set firewall group network-group internal_lan_networks network "172.16.0.0/12"
set firewall group network-group internal_lan_networks network "192.168.0.0/16"

# Domain Groups
set firewall group domain-group domains_plex address "plex.${SECRET_DOMAIN}"
set firewall group domain-group domains_plex address "plex.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "home.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "home.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "esphome.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "esphome.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "mqtt.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "mqtt.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "hyperhdr.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "hyperhdr.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "frigate.${SECRET_DOMAIN}"
set firewall group domain-group domains_home_automation address "frigate.cluster-1.${SECRET_DOMAIN}"
set firewall group domain-group domains_vacuums address "arnold.${SECRET_DOMAIN}"
set firewall group domain-group domains_vacuums address "vac.${SECRET_DOMAIN}"
set firewall group domain-group domains_vacuums address "vacuum.${SECRET_DOMAIN}"
set firewall group domain-group domains_vacuums address "vacuum01.iot.${SECRET_DOMAIN}"
set firewall group domain-group domains_samsung_smart_things address "samsung-washer.iot.${SECRET_DOMAIN}"
set firewall group domain-group domains_samsung_smart_things address "samsung-dryer.iot.${SECRET_DOMAIN}"
set firewall group domain-group domains_samsung_smart_things address "samsung-fridge.iot.${SECRET_DOMAIN}"
set firewall group domain-group domains_ssh_jumphost address "workhorse.mgmt.${SECRET_DOMAIN}"

# Port Groups
set firewall group port-group blocked_protocols port 'fido'
set firewall group port-group services_dns port 'domain'
set firewall group port-group services_dns port 'domain-s'
set firewall group port-group services_dhcp port '67'
set firewall group port-group services_dhcp port '68'
set firewall group port-group services_ntp port 'ntp'
set firewall group port-group services_http port 'http'
set firewall group port-group services_http port 'https'
set firewall group port-group services_mdns port 'mdns'
set firewall group port-group services_ssh port 'ssh'
set firewall group port-group services_bgp_ospf port 'bgp'
set firewall group port-group services_bgp_ospf port '89'
set firewall group port-group services_wireguard port '51820'
set firewall group port-group services_plex port '32400'