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