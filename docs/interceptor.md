# Interceptor

## Installation

```bash
apt update && apt install -y iptables wireguard wireguard-tools
```

## Configuration


```bash
sed -e '/net.ipv4.ip_forward=1/s/^#*//g' -i /etc/sysctl.conf && sysctl -p

```

```bash
mkdir -p /etc/wireguard && cd /etc/wireguard
```

```bash
touch wg0.conf
```

```bash
umask 077; wg genkey | tee privatekey | wg pubkey > publickey
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

