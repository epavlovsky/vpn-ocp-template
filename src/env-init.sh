#!/bin/sh

error_msg() {
  echo -e "\e[1;31m$1\e[0m" >&2
}

if [ -z "$VPN_PROTOCOL" ]; then
    echo -n 'VPN protocol not set. Using default: anyconnect'
    export VPN_PROTOCOL=anyconnect
fi

if [ -z "$VPN_SESSION" ]; then
    echo -n 'VPN session timeout not set. Using default: 24 hours'
    # Default session timeout is 24 hours
    export VPN_SESSION=86400
fi

if [ -z "$AUTH_TYPE" ]; then
    echo -n 'Authentication type not set. Using default: PWD'
    export AUTH_TYPE="PWD"
fi

if [ $AUTH_TYPE != 'PWD' ] && [ $AUTH_TYPE != 'COOKIE' ]; then
    error_msg 'AUTH_TYPE must be on of: PWD, COOKIE.'
    exit 1
fi

if [ -z "$VPN_URL" ]; then
    echo -n 'Enter VPN address: '
    read VPN_URL
    export VPN_URL
fi