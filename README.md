# Airtel Cloud Network Module

Terraform module for provisioning Airtel Cloud VPC and Subnet resources.

## Features

* Creates VPC
* Creates Subnet
* Supports DNS configuration
* Supports subnet roles
* Supports labels and tags
* Exposes VPC and Subnet information through outputs

## Usage

### Basic Example

```hcl
module "network" {
  source = "Airtel-Cloud-Platform/network/airtelcloud"

  network_name = "basic-network"

  vpc_cidr     = "10.0.0.0/16"
  subnet_cidr  = "10.0.1.0/24"

  availability_zone = "S1"
}
```

### Complete Example

```hcl
module "network" {
  source = "Airtel-Cloud-Platform/network/airtelcloud"

  network_name = "production-network"

  vpc_cidr     = "10.10.0.0/16"
  subnet_cidr  = "10.10.1.0/24"

  availability_zone = "S1"

  enable_dns_support   = true
  enable_dns_hostnames = true

  subnet_role = "Private"

  labels = ["production", "web-tier"]

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}
```

## Inputs

| Name                 | Description          | Type         | Required |
| -------------------- | -------------------- | ------------ | -------- |
| network_name         | Network name         | string       | Yes      |
| vpc_cidr             | VPC CIDR block       | string       | Yes      |
| subnet_cidr          | Subnet CIDR block    | string       | Yes      |
| availability_zone    | Availability Zone    | string       | Yes      |
| enable_dns_support   | Enable DNS support   | bool         | No       |
| enable_dns_hostnames | Enable DNS hostnames | bool         | No       |
| subnet_role          | Private or VIP       | string       | No       |
| labels               | Subnet labels        | list(string) | No       |
| tags                 | VPC tags             | map(string)  | No       |

## Outputs

| Name      | Description   |
| --------- | ------------- |
| vpc_id    | VPC ID        |
| subnet_id | Subnet ID     |
| vpc       | VPC object    |
| subnet    | Subnet object |

## Requirements

| Name | Version |
|--------|---------|
| Terraform | >= 1.5 |
| airtelcloud provider | >= 1.0.4 |
