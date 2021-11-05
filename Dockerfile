FROM alpine:3.14

COPY start.sh /usr/local/bin/start.sh
RUN apk add --no-cache dnsmasq \
 && chmod 755 /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
