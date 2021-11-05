#!/bin/busybox ash
set -eo pipefail

function config() {
	echo "no-resolv"
	echo "no-hosts"
	echo "proxy-dnssec"
	echo "no-dhcp-interface="
	echo "user=dnsmasq"
	echo "group=dnsmasq"
	echo "cache-size=10000"
	for server in $DNS_SERVERS; do
		echo "server=$server"
	done
	if [ -n "$LOG_QUERIES" ]; then
		echo "log-queries"
	fi
}

config >/etc/dnsmasq.conf
dnsmasq -k --user=dnsmasq
