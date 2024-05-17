# Using fixed version to guarantee versions/architecture compatibility in the future
# Alpine 3.16 is chosen because it uses openssl 1.1.1w-r1, while later versions use 3.x
#Openssl 3.x contains issue 
FROM alpine:3.16

# Main repository does not contain openconnect package
RUN apk add --no-cache openconnect --repository http://dl-cdn.alpinelinux.org/alpine/v3.16/community

RUN apk add --no-cache tinyproxy procps

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

ENV OCP_DIR=/etc/openconnect-proxy
RUN mkdir $OCP_DIR

COPY network/* env-init.sh entrypoint.sh $OCP_DIR/
RUN chmod -R +x $OCP_DIR/

EXPOSE 8888

ENTRYPOINT $OCP_DIR/entrypoint.sh