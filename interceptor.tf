resource "digitalocean_droplet" "interceptor" {
  image = "debian-12-x64"
  name = "interceptor"
  region = "ams3"
  size = "s-1vcpu-512mb-10gb"
  ssh_keys = [
      data.digitalocean_ssh_key.macbook-air.id
    ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install -y iptables  wireguard wireguard-tools"
    ]
  }
}
