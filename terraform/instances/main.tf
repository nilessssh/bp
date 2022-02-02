module "ha_proxy" {
  source = "../modules/patroni"
  group_name   = "ha-proxy2"
  launch_conf  = "ha-proxy2"
  ami          = "ami-0f2fa88b4b1f7d6bf"
  ec2_size     = "t2.micro"
  disk_size    = "40"
}
