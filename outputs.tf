output "vpc_id" {
  description = "VPC ID"
  value       = airtelcloud_vpc.this.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = airtelcloud_subnet.this.id
}

output "vpc" {
  description = "VPC object"
  value = {
    id    = airtelcloud_vpc.this.id
    cidr  = airtelcloud_vpc.this.cidr_block
    state = airtelcloud_vpc.this.state
  }
}

output "subnet" {
  description = "Subnet object"
  value = {
    id    = airtelcloud_subnet.this.id
    cidr  = airtelcloud_subnet.this.ipv4_address_space
    state = airtelcloud_subnet.this.state
  }
}
