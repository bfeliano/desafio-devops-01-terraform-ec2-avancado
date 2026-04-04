# MODULE — Security Group
module "security_group" {
  source = "./modules/security_group"
  sg_name      = var.sg_name
  environment  = var.environment
}

# MODULE — IAM
module "iam" {
  source = "./modules/iam"
  role_name               = var.role_name
  instance_profile_name   = var.instance_profile_name
  enable_iam              = var.enable_iam
}

# MODULE — EC2
module "ec2" {
  source = "./modules/ec2"
  os_type             = var.os_type
  instance_type       = var.instance_type
  instance_name       = var.instance_name
  user_data           = file("${path.module}/user_data.sh")
  security_group_ids  = [module.security_group.sg_id]
  use_instance_profile = var.enable_iam
  instance_profile     = module.iam.instance_profile_name
  environment = var.environment
}