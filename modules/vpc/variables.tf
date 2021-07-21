# Input variable definitions

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "TEST-VPC"
}

variable "vpc_tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}


variable "vpc_subnet_count" {
  default = 3
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "enable_nat_gateway" {
  description = "Enable a VPN gateway in your VPC."
  type        = bool
  default     = false
}


# variable "public_subnet_count" {
#   description = "Number of public subnets."
#   type        = number
#   default     = 3
# }

# variable "private_subnet_count" {
#   description = "Number of private subnets."
#   type        = number
#   default     = 3
# }

variable "vpc_public_subnets" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    ]
}

variable "vpc_private_subnets" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
      "10.0.4.0/24",
      "10.0.5.0/24",
      "10.0.6.0/24",
  ]
}


