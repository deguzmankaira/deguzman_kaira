provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "available" {
}

data "aws_region" "current" {}

# Define VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_key_pair" "key_kai3" {
  key_name = "key_kai3"
}

variable "private_subnets" {
  default = {
    "t3_intro_3"  = 245
  }
}