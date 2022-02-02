resource "aws_security_group" "sg_ha_proxy" {
        name = var.sg_name
        description = "Security Group for AWS resources"
        ingress {
                protocol    = "tcp"
                from_port   = 7000
                to_port     = 7000
                cidr_blocks = [
                        var.vpc_cidr
                ]
        }
      
        ingress {
                protocol    = "tcp"
                from_port   = 22
                to_port     = 22
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        egress {
		from_port       = 0
		to_port         = 0
		protocol        = "-1"
		cidr_blocks     = ["0.0.0.0/0"]
       }


        vpc_id = var.vpc_id


        lifecycle {
                create_before_destroy = true
        }
}


resource "aws_security_group" "ec2" {
        name = "patroni"
        description = "Security Group for EC2"
        ingress {
                protocol    = "tcp"
                from_port   = 2379
                to_port     = 2379
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        ingress {
                protocol    = "tcp"
                from_port   = 2380
                to_port     = 2380
                cidr_blocks = [
                        var.private_cidr
                ]
        }
   
        ingress {
                protocol    = "tcp"
                from_port   = 5432
                to_port     = 5432
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        ingress {
                protocol    = "tcp"
                from_port   = 8008
                to_port     = 8008
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        ingress {
                protocol    = "tcp"
                from_port   = 6432
                to_port     = 6432
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        ingress {
                protocol    = "tcp"
                from_port   = 22
                to_port     = 22
                cidr_blocks = [
                        var.private_cidr
                ]
        }

        egress {
                from_port       = 0
                to_port         = 0
                protocol        = "-1"
                cidr_blocks     = ["0.0.0.0/0"]
       }

        vpc_id = var.vpc_id


        lifecycle {
                create_before_destroy = true
        }
}
