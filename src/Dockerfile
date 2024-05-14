# Using fixed version to guarantee versions/architecture compatibility in the future
FROM alpine:3.19

# Main repository does not contain openconnect package
RUN apk add --no-cache openconnect --repository http://dl-cdn.alpinelinux.org/alpine/v3.19/community

RUN apk add --no-cache tinyproxy procps

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

ENV OCP_DIR=/etc/openconnect-proxy
RUN mkdir $OCP_DIR

COPY network/* env-init.sh entrypoint.sh $OCP_DIR/
RUN chmod -R +x $OCP_DIR/

EXPOSE 8888

ENTRYPOINT $OCP_DIR/entrypoint.sh