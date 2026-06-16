module "network" {
  source = "Airtel-Cloud-Platform/network/airtelcloud"

  network_name = "basic-network"

  vpc_cidr     = "10.0.0.0/16"
  subnet_cidr  = "10.0.1.0/24"

  availability_zone = "S1"
}
