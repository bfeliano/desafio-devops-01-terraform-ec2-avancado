
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

variable "user_data" {
  description = "Arquivo para ser utilizado como user_data"
}

variable "security_group_ids" {
  description = "Lista de SG que serão utilizados"
  type = list(string)
}


variable "use_instance_profile" {
  description = "Variável para checar se a instância utilizará um Instance Profile"
  type = bool
  default = false
}


variable "instance_profile" {
  description = "Instance Profile criada pelo módulo IAM"
  type = string
}
