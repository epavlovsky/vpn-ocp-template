#!/bin/sh

# Name of Docker image. Probably should carry some usage context
IMAGE_NAME='my-vpn-proxy'

# Port that will be exposed on a host (that runs container)
HOST_PORT=8888

# Type of authentication to use. Possible values: PWD, COOKIE
AUTH_TYPE=PWD

# Address to connect
VPN_URL=

# VPN protocol to use. Possible values: nc, anyconnect
# See Openconnect documentation for more details: https://www.infradead.org/openconnect/protocols.html
VPN_PROTOCOL=anyconnect

# Name of a user for PWD auth type
USER_NAME=

# Name of authentication cookie that is used when AUTH_TYPE=COOKIE
AUTH_COOKIE_NAME=

# Use custom routing. Possible values: true, false
USE_CUSTOM_ROUTING=false