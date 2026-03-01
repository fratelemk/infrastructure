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

> [!NOTE]
> These ports must be open to connect to the Xbox network:
> - Port 88 (UDP)
> - Port 3074 (UDP and TCP)
> - Port 53 (UDP and TCP)
> - Port 80 (TCP)
> - Port 500 (UDP)
> - Port 3544 (UDP)
> - Port 4500 (UDP)
