variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "os_type" {
  description = "Tipo de SO a ser filtrado (ex: amzn2, ubuntu)"
  type        = string
  default     = "amzn2"
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "desafio-devops-01-ec2"
}

variable "sg_name" {
  description = "Nome do Security Group"
  type        = string
  default     = "desafio-devops-01-sg"
}

variable "environment" {
  description = "Ambiente (dev, prod)"
  type        = string
  default     = "dev"
}

# IAM opcional
variable "enable_iam" {
  description = "Cria ou não uma IAM Role + Instance Profile"
  type        = bool
  default     = true
}

variable "role_name" {
  description = "Nome da IAM Role"
  type        = string
  default     = "desafio-devops-01-role"
}

variable "instance_profile_name" {
  description = "Nome do Instance Profile"
  type        = string
  default     = "desafio-devops-01-profile"
}