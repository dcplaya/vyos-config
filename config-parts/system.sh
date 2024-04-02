#!/bin/vbash

set system config-management commit-archive
set system config-management commit-revisions '100'

# set system domain-name "${SECRET_DOMAIN}"
# set system host-name 'gateway'

set system ipv6 disable-forwarding

set system login user ${SECRET_USER} authentication encrypted-password '$6$ioI6OOPc/Q3KpidO$x7pxmaTmAUcUu/GODbOLkwPFV/SkpmbjzVnIvf7JYkmTpYaLu.y3hOUrL09Qe7puNKKbSYopgEZDME2jq0wmR0'
set system login user ${SECRET_USER} authentication public-keys CellPhone key 'AAAAC3NzaC1lZDI1NTE5AAAAILDGC8QZi/XfLOY4C8bMM7YxUuoXvtzGj/91OtPUZlHa'
set system login user ${SECRET_USER} authentication public-keys CellPhone type 'ssh-ed25519'
set system login user ${SECRET_USER} authentication public-keys SurfaceBook key 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDdGqMc3CNxF4vNyKRgt8RucxREeiAKtkU0B/meYRrnzOhpriX44U1ypYYngzowYGUwVtx5fgF8hiRi9/jKOXZsrpg/rObBRQZZNum2ylirtAZU91SP5bk6x+5tqn0DmsMWL4rPdykOpB3TBcbD9dMfI674EDnEvuSJl9LxtNy1lrptwC2flQqkBZVTqj+j9iGUv8swIrdTzavO+AqrPHIQa2UiYharBbwMOK1/CeDI65hKETDaupIskRybdItlPVBaLFZKnNae2FSKJZAOe413l2XMY2yKBpgOpONYrx+ze7sPI1UpdbB9wNJ5l/YdaMpS/bKK1NxmZXdRaKMm2IhxRARamWFNp2Zyp/y3NPmKkRfdTsin8LXMd4NvIlXhs/WQTF9netvVgw7/vjmuZHjgoGJihZgXC/dN9hGR0ZCcoJGVAfMcYSTRuRq6FanqKUnQYHKNMT5w1Um4+GCs/sRmq6YxhNUlwy/wWqzOYVEUz8jUQj1L38tWjt0xrlvCRtc='
set system login user ${SECRET_USER} authentication public-keys SurfaceBook type 'ssh-rsa'
set system login user ${SECRET_USER} authentication public-keys Workhorse key 'AAAAC3NzaC1lZDI1NTE5AAAAIHSTiZO5CSOYlUMEMvL8wDIvwDEdHGQOwzzLr2SaQghr'
set system login user ${SECRET_USER} authentication public-keys Workhorse type 'ssh-ed25519'
set system login user ${SECRET_USER} home-directory "/home/${SECRET_USER}"

set system name-server '10.0.0.4'

set system option performance throughput

set system static-host-mapping host-name vyos.${SECRET_DOMAIN} inet '10.255.253.1'
set system static-host-mapping host-name gateway.${SECRET_DOMAIN} inet 10.255.253.1

set system sysctl parameter kernel.pty.max value '24000'

set system syslog global facility all level info

# set system task-scheduler task backup-config crontab-spec '30 0 * * *'
# set system task-scheduler task backup-config executable path '/config/scripts/task-config-backup-usb.sh'
set system task-scheduler task wg2_Amber executable arguments "set wg2 peer K/fa0fGyoQBhS3HXSZbFIypABTSkHATEQCezxL6diE8= endpoint er3.device.${SECRET_DOMAIN}:51820"
set system task-scheduler task wg2_Amber executable path '/usr/bin/wg'
set system task-scheduler task wg2_Amber interval '2m'
set system task-scheduler task wg2_Jeff executable arguments "set wg2 peer uliP4IFnwRfyyMR9MXUSGrVsfsB8Esq7O7UqqaUBt2Y= endpoint er2.device.${SECRET_DOMAIN}:51820"
set system task-scheduler task wg2_Jeff executable path '/usr/bin/wg'
set system task-scheduler task wg2_Jeff interval '2m'

set system time-zone 'America/Los_Angeles'


# These are enabled by default but keeping explicit for readability
set system conntrack modules ftp
set system conntrack modules h323
set system conntrack modules nfs
set system conntrack modules pptp
set system conntrack modules sip
set system conntrack modules sqlnet
set system conntrack modules tftp