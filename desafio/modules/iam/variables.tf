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