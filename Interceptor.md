# Interceptor

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
