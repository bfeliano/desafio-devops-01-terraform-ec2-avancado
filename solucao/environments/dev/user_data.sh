#!/bin/bash
# Atualiza pacotes
yum update -y

# Instala o Apache (webserver)
yum install -y httpd

# Inicia o serviço
systemctl start httpd
systemctl enable httpd

# Página HTML simples
echo "<h1>Desafio DevOps #1 Avançado</h1>Ambiente de Desenvolvimento — Deploy realizado com sucesso!" > /var/www/html/index.html