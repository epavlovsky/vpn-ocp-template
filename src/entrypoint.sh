#!/bin/sh

source $OCP_DIR/env-init.sh

/usr/bin/tinyproxy -c /etc/tinyproxy/tinyproxy.conf

cookie_auth() {
  echo 'Using cookie authentication.'
  echo -n "Enter $AUTH_COOKIE_NAME cookie value: "
  read -s AUTH_COOKIE
  AUTH="-C $AUTH_COOKIE_NAME=$AUTHCOOKIE"
}

pwd_auth() {
  echo 'Using password authentication.'
  AUTH="--user=$USER_NAME"
}

authenticate() {
  case $AUTH_TYPE in 
    PWD)
      pwd_auth
      ;;
    COOKIE)
      cookie_auth
      ;;
  esac
}

connect() {
  if [ -z $AUTH ]; then
    authenticate
  fi
  
  openconnect $AUTH \
              -vvv \
              --script=$OCP_DIR/post-connect.sh \
              --protocol=$VPN_PROTOCOL \
              --reconnect-timeout $VPN_SESSION \
              $VPN_URL

  AUTH=
}

until (connect); do
  error_msg 'Openconnect exited. Restarting process in 60 seconds.'
  sleep 60
done
