output "public_ip" {
  description = "IP público da EC2"
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "DNS público da EC2"
  value       = module.ec2.public_dns
}

output "ami_id" {
  description = "AMI selecionada dinamicamente"
  value       = module.ec2.ami_id
}
