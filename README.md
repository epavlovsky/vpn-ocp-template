# VPN OpenConnect Proxy Template
Template project to create customized VPN + proxy Docker images in order to avoid running the VPN client on the host machine.

## How to use this project

### 1. Clone the repository
```sh
git clone https://github.com/epavlovsky/vpn-ocp-template.git .
```

### 2. Configure VPN settings
Modify values in custom-env.sh:
```sh
IMAGE_NAME='my-vpn-proxy'
VPN_URL=https://vpn.mycompany.com
USER_NAME=user@mycompany.com
```
and optionally some other variables.

### 3. Build & run VPN container
```sh
./start.sh
```

### 4. Configure your host machine
Add the following lines to your ~/.bashrc or ~/.bash_profile:
```sh
export http_proxy=http://
```
or some other places where proxy settings are defined.
