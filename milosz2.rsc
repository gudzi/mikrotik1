# mar/11/2021 10:29:20 by RouterOS 6.48.1
# software id = 7S0Q-6JUG
#
#
#
/interface ethernet
set [ find default-name=ether2 ] disabled=yes
/interface list
add name=WAN
add name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/lora servers
add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU \
    up-port=1700
add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US \
    up-port=1700
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface bridge port
add interface=ether1
add interface=ether2
add interface=ether3
add interface=ether4
/interface list member
add interface=ether1 list=WAN
add list=LAN
add interface=ether2 list=LAN
add interface=ether3 list=LAN
add interface=ether4 list=LAN
add list=LAN
/ip address
add address=10.0.0.2/24 interface=ether1 network=10.0.0.0
add address=10.0.1.2/24 interface=ether2 network=10.0.1.0
/ip cloud
set update-time=no
/ip dns
set servers=8.8.8.8
/ip firewall filter
add action=accept chain=forward in-interface=all-ethernet out-interface=\
    ether1 src-address=10.255.2.162
/ip route
add distance=1 gateway=10.0.1.1
add distance=10 gateway=10.0.0.1
/system identity
set name=mt2
/system lcd
set contrast=0 enabled=no port=parallel type=24x4
/system lcd page
set time disabled=yes display-time=5s
set resources disabled=yes display-time=5s
set uptime disabled=yes display-time=5s
set packets disabled=yes display-time=5s
set bits disabled=yes display-time=5s
set version disabled=yes display-time=5s
set identity disabled=yes display-time=5s
set ether1 disabled=yes display-time=5s
set ether2 disabled=yes display-time=5s
set ether3 disabled=yes display-time=5s
set ether4 disabled=yes display-time=5s
/tool user-manager database
set db-path=user-manager
