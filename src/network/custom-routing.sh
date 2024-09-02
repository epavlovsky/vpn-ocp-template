#!/bin/sh
#
# This script is called by vpnc script during VPN connection setup.
#
# Script draft template contains examples of commands that can be used to add routes for custom routing.
#
# Please note that domain names are still resolved using DNS provided by VPN.
#

# Deleting all routes from routing table
#ip route flush table main

# Adding route with scope link for eth0
#ip route add 172.17.0.0/16 dev eth0

# Adding default route that will be used for all traffic outside VPN subnet
#ip route add 0.0.0.0/0 via 172.17.0.1 dev eth0

# Adding route for local network
#ip route add 192.168.1.0/24 via 172.17.0.1 dev eth0

# Obtaining IP from VPN interface to route all VPN traffic to
#VPN_GATEWAY=$(ip -br addr show | grep tun0 | awk '{print $3}' | cut -d/ -f1)

# Adding route for VPN-related traffic
#ip route add 10.0.0.0/8 via $VPN_GATEWAY dev tun0