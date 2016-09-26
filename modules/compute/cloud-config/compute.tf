#cloud-config

ssh_authorized_keys:
    - "${var.ssh_pub_key}"
