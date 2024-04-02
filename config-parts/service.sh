#!/bin/vbash

# NTP server
set service ntp listen-address '10.255.253.1'
delete service ntp allow-client
set service ntp allow-client address '127.0.0.0/8'
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
delete service ntp server
set service ntp server time.cloudflare.com nts

# SSH server
set service ssh listen-address '10.255.253.1'
set service ssh disable-password-authentication
set service ssh port '22'

# Dynamic DNS
set service dns dynamic name cloudflare address web url 'http://checkip.dyndns.com/'
set service dns dynamic name cloudflare host-name "er1.device.${SECRET_DOMAIN}"
set service dns dynamic name cloudflare host-name "vpn.${SECRET_DOMAIN}"
set service dns dynamic name cloudflare host-name "ipv4.${SECRET_DOMAIN}"
set service dns dynamic name cloudflare password "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set service dns dynamic name cloudflare protocol 'cloudflare'
set service dns dynamic name cloudflare username "drewmich@${SECRET_DOMAIN}"
set service dns dynamic name cloudflare zone "${SECRET_DOMAIN}"
