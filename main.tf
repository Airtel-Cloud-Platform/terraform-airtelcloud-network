resource "airtelcloud_vpc" "this" {
  name       = var.network_name
  cidr_block = var.vpc_cidr

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.tags
}

resource "airtelcloud_subnet" "this" {
  network_id = airtelcloud_vpc.this.id

  name = "${var.network_name}-subnet"

  ipv4_address_space = var.subnet_cidr

  subnet_sub_role = var.subnet_role

  availability_zone = var.availability_zone

  labels = var.labels
}
