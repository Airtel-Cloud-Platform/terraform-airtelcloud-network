module "network" {
  source = "Airtel-Cloud-Platform/network/airtelcloud"

  network_name = "production-network"

  vpc_cidr     = "10.10.0.0/16"
  subnet_cidr  = "10.10.1.0/24"

  availability_zone = "S1"

  enable_dns_support   = true
  enable_dns_hostnames = true

  subnet_role = "Private"

  labels = [
    "production",
    "web-tier"
  ]

  tags = {
    Environment = "production"
    Team        = "platform"
    Application = "shared-network"
  }
}
