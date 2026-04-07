output "public_ip" {
  description = "IP Público da Instância"
  value = aws_instance.web.public_ip
}

output "public_dns" {
  description = "DNS Público da Instância"
  value = aws_instance.web.public_dns
}

output "ami_id" {
  description = "AMI selecionada dinamicamente"
  value       = data.aws_ami.selected.id
}