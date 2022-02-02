variable "aws_region" { default = "ap-southeast-1" }
variable "group_name" { }
variable "launch_conf" { }
variable "ami" { }
variable "ec2_size" { }
variable "vpc_id" { default = "vpc-xyz" }
variable "sg_name" { default = "ha_proxy" }
variable "vpc_cidr" { default = "10.228.0.0/16" }
variable "private_subnet" {
  type    = "list"
  default = ["subnet-abc", "subnet-qwe", "subnet-xyz"]
}
variable "private_cidr" { default = "10.228.48.0/22" }


variable "disk_type" { default = "gp2" }
variable "disk_size" { }

variable "db_subnet" {
  type    = "list"
  default = ["subnet-mnb", "subnet-lkj", "subnet-poi"]
}

variable "disable_api_termination"  { default = "true" }
variable "key_name" { default = "key-name" }
