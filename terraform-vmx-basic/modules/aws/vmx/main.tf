data "aws_ami" "marketplace_vmx" {
  most_recent        = true
  include_deprecated = true
  owners             = ["aws-marketplace"]
  filter {
    name   = "name"
    values = ["vmx-15-41-manufacturing-*"]
  }
}

resource "aws_security_group" "vmx_sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id  # Use the variable here

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.marketplace_vmx.id
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = [aws_security_group.vmx_sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.has_public_ip
  source_dest_check           = false
  user_data                   = var.vmx_token

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }
}