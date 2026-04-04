# Data source AMI dinâmica
data "aws_ami" "selected" {
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["${var.os_type}-ami-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  most_recent = true
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.selected.id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  user_data              = var.user_data

  iam_instance_profile   = var.use_instance_profile ? var.instance_profile : null

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}