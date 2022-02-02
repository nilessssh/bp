
resource "aws_launch_configuration" "launch_conf" {
  name_prefix   = var.launch_conf
  image_id      = var.ami
  instance_type = var.ec2_size
  security_groups = compact(concat(tolist([aws_security_group.sg_ha_proxy.id])))
  user_data = "${file("user-data.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "auto-scale" {
  name                      = var.group_name
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.launch_conf.name
  vpc_zone_identifier       = var.private_subnet


  tag {
    key                 = "function"
    value               = "ha-proxy-auto-scale-group"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

}
