variable "network_name" {
  description = "Network name prefix"
  type        = string

  validation {
    condition     = length(trim(var.network_name, " ")) > 0
    error_message = "network_name cannot be empty."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block."
}
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string

  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "subnet_cidr must be a valid CIDR block."
}
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string

  validation {
    condition     = length(trim(var.availability_zone, " ")) > 0
    error_message = "availability_zone cannot be empty."
  }
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "subnet_role" {
  description = "Subnet role"
  type        = string
  default     = "Private"

  validation {
    condition = contains(
      ["Private", "VIP"],
      var.subnet_role
    )

    error_message = "subnet_role must be Private or VIP."
  }
}

variable "labels" {
  description = "Subnet labels"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to VPC"
  type        = map(string)
  default     = {}
}
