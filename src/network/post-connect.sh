#!/bin/sh 

INTERFACE_READY=$(ip -br addr show | grep tun0)

if [ ! -z "$INTERFACE_READY" ]; then
    /bin/sh $OCP_DIR/vpnc-script
    /bin/sh $OCP_DIR/custom-routing.sh
fi