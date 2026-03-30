# Interceptor

```conf

#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables.
# See sysctl.conf (5) for information.
#

#kernel.domainname = example.com

# Uncomment the next two lines to enable Spoof protection (reverse-path filter)
# Turn on Source Address Verification in all interfaces to
# prevent some spoofing attacks
#net.ipv4.conf.default.rp_filter=1
#net.ipv4.conf.all.rp_filter=1

# Uncomment the next line to enable TCP/IP SYN cookies
# See http://lwn.net/Articles/277146/
# Note: This may impact IPv6 TCP sessions too
#net.ipv4.tcp_syncookies=1

# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.eth0.disable_ipv6 = 1
net.ipv6.conf.eth1.disable_ipv6 = 1

###################################################################
# Additional settings - these settings can improve the network
# security of the host and prevent against some network attacks
# including spoofing attacks and man in the middle attacks through
# redirection. Some network environments, however, require that these
# settings are disabled so review and enable them as needed.
#
# Do not accept ICMP redirects (prevent MITM attacks)
#net.ipv4.conf.all.accept_redirects = 0
#net.ipv4.conf.default.accept_redirects = 0
# _or_
# Accept ICMP redirects only for gateways listed in our default
# gateway list (enabled by default)
# net.ipv4.conf.all.secure_redirects = 1
#
# Do not send ICMP redirects (we are not a router)
#net.ipv4.conf.all.send_redirects = 0
#
# Log Martian Packets
#net.ipv4.conf.all.log_martians = 1
#

###################################################################
# Magic system request Key
# 0=disable, 1=enable all, >1 bitmask of sysrq functions
# See https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html
# for what other values do
#kernel.sysrq=438

```

```bash

# Update 
sudo apt update
# Install packages
sudo apt install -y iptables wireguard wireguard-tools
# Enable IP Forwarding
vim /etc/sysctl.conf # -> uncomment `net.ipv4.ip_forwarding=1`
# Activate changes
systcl -p
# Go to Wireguard config directory
cd /etc/wireguard
# Generate keys
umask 077; wg genkey | tee privatekey | wg pubkey > publickey
# Create `wg0` configuration
vim wg0.conf

```

> [!NOTE]
> These ports must be open to connect to the Xbox network:
> - Port 88 (UDP)
> - Port 3074 (UDP and TCP)
> - Port 53 (UDP and TCP)
> - Port 80 (TCP)
> - Port 500 (UDP)
> - Port 3544 (UDP)
> - Port 4500 (UDP)
