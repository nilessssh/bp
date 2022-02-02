resource "aws_instance" "ec2" {
  count = length(var.db_subnet)
  ami = var.ami
  instance_type = var.ec2_size
  vpc_security_group_ids  = compact(concat(tolist([aws_security_group.ec2.id])))

  disable_api_termination  = var.disable_api_termination
  subnet_id = var.db_subnet[count.index]
  monitoring = true

  root_block_device {
    volume_type = var.disk_type
    volume_size = var.disk_size
    delete_on_termination = true
  }

}

