# mar/11/2021 10:03:41 by RouterOS 6.48.1
# software id = Y4MA-RJ7D
#
#
#
/interface ethernet
set [ find default-name=ether1 ] name=WANinterface
/interface list
add name=WAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=10.0.0.2-10.0.0.126
/lora servers
add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU \
    up-port=1700
add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US \
    up-port=1700
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface list member
add interface=WANinterface list=WAN
/ip address
add address=10.0.0.1/24 interface=ether2 network=10.0.0.0
add address=10.0.1.1/24 interface=ether3 network=10.0.1.0
/ip cloud
set update-time=no
/ip dhcp-client
add default-route-distance=10 disabled=no interface=WANinterface
/ip dhcp-server network
add address=10.0.0.0/25 gateway=10.0.0.1
/ip dns
set servers=8.8.8.8
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN
/ip route
add check-gateway=ping distance=1 dst-address=10.255.2.0/32 gateway=\
    10.255.2.162 pref-src=10.255.2.163
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
set WANinterface disabled=yes display-time=5s
set ether2 disabled=yes display-time=5s
set ether3 disabled=yes display-time=5s
set ether4 disabled=yes display-time=5s
/tool user-manager database
set db-path=user-manager
