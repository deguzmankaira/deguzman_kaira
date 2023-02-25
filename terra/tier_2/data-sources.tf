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

data "aws_key_pair" "key_kai2" {
  key_name = "key_kai2"
}

variable "private_subnets" {
  default = {
    "t3_intro_2"  = 250
  }
}