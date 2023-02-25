provider "aws" {
  region = "us-west-2" //change to your region //changed
}

data "aws_availability_zones" "available" {
}

data "aws_region" "current" {}

# Define VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_key_pair" "key_kai" { //change //changed
  key_name = "key_kai" //change //changed
}

variable "private_subnets" {
  default = {
    "t3_intro"  = 255 //can be any number as long as walang conflict  //changed //must be around 0 to 32
  }
}