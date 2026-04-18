#!/bin/sh
set -eu

TINYPROXY_CONF_FILE="/etc/tinyproxy/tinyproxy.conf"

exec /usr/bin/tinyproxy -d
