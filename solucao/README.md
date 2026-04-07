# 🧩 Desafio DevOps #01 — Criar EC2 com Terraform (Nível Avançado)

Bem-vindo(a) ao nível avançado do **Desafio DevOps #01!**  
Aqui você irá evoluir a solução criada no nível intermediário, aplicando práticas mais robustas e profissionais de **Infraestrutura como Código** utilizando **Terraform** e **GitHub Actions**.

Este desafio é ideal para quem já concluiu os níveis iniciante e intermediário e deseja aproximar sua estrutura Terraform do que é utilizado em ambientes corporativos.

## 🎯 Objetivo

Dentro desta pasta (`/desafio`), você encontrará a **base completa** construída no desafio intermediário.

A partir dessa base, o objetivo é aprimorar o projeto implementando melhorias como:

1.  Configuração de **backend remoto** em S3
2.  Separação de ambientes utilizando **states independentes**
3.  Pipeline **CI/CD com GitHub Actions** (fmt, validate, tflint, plan)
4.  **Linting com TFLint**
5.  Melhorias gerais de organização, clareza e boas práticas de Terraform

Você já possui um projeto modularizado — agora é hora de transformá-lo em algo mais próximo do uso real em times DevOps.

# 💬 Dicas importantes para te ajudar

## 💡 1. Configure o backend remoto (S3)

Consulte a documentação oficial: https://developer.hashicorp.com/terraform/language/settings/backends/s3

Exemplo inicial:

```hcl
terraform {
  backend "s3" {
    bucket        = "meu-bucket-backend"
    key           = "dev/terraform.tfstate"
    region        = "us-east-1"
    use_lockfile  = true
  }
}
```

O bucket deve existir antes do `terraform init`.

## 💡 2. Crie estados separados para cada ambiente

No nível avançado, você deve separar os ambientes usando **states independentes**.  
Para isso, mantenha a seguinte estrutura de pastas:

```
/desafio
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── user_data.sh
│   │   └── dev.tfvars
│   │
│   └── prod
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── user_data.sh
│       └── prod.tfvars
│
├── modules
│   ├── ec2
│   ├── iam
│   └── security_group
│
└── README.md
```

Cada ambiente deve ter:

- seu próprio backend remoto (via `provider.tf`)
- seu próprio arquivo `.tfvars`
- seu próprio prefixo no S3, por exemplo:
  - `key = "dev/terraform.tfstate"`
  - `key = "prod/terraform.tfstate"`
  
**Importante:** ao mover o `main.tf` para dentro de `environments/dev` e `environments/prod`, você precisará **ajustar o caminho dos módulos**, por exemplo:

```
source = "../../modules/ec2"
```

Isso garante que cada ambiente use a mesma base de módulos, mas tenha estados totalmente isolados.

## 💡 3. Configure CI/CD com GitHub Actions

Seu pipeline deve incluir:

*   `terraform fmt -check`
*   `terraform validate`
*   `tflint`
*   `terraform plan` **(para detecção automática de drift)**

Caminho recomendado para o pipeline em:

    .github/workflows/terraform.yml

Documentação: https://developer.hashicorp.com/terraform/tutorials/automation/github-actions

## 💡 4. Adicione TFLint ao projeto

Crie o arquivo:

    .tflint.hcl

E configure regras básicas para validar suas práticas.

Documentação: https://github.com/terraform-linters/tflint

## 💡 5. Teste dev e prod separadamente

Exemplo:

    terraform plan -var-file="dev.tfvars"

E o equivalente para `prod`.


# 📁 Estrutura desta pasta

A estrutura inicial é a **mesma** da solução do desafio intermediário:

```
/desafio
├── README.md
├── dev.tfvars
├── main.tf
├── modules
│   ├── ec2
│   ├── iam
│   └── security_group
├── outputs.tf
├── provider.tf
├── user_data.sh
└── variables.tf
```

A partir dela, você deve implementar backend remoto, ambientes separados e o pipeline.

# ▶️ Como Rodar o Desafio

No nível avançado, a validação do seu projeto deve acontecer **principalmente no GitHub Actions**, através do pipeline que você irá configurar com:

- `terraform fmt -check`
- `terraform validate`
- `tflint`
- `terraform plan` (também utilizado para detecção de drift)

Após configurar o workflow, cada push ou pull request deve acionar automaticamente essas etapas no GitHub.

## ✅ Execução local (opcional)

Você ainda pode executar os comandos localmente para testar antes de enviar para o repositório:

1. Inicialize o backend remoto:

```
terraform init
```

2. Valide e lint:

```
terraform fmt
terraform validate
tflint
```

3. Execute o plan:

```
terraform plan -var-file="dev.tfvars"
```

> Observação: o pipeline GitHub Actions é considerado a **fonte da verdade** para validação e conformidade da sua infraestrutura.

# 🧹 Como destruir a infraestrutura

```
terraform destroy -var-file="dev.tfvars"
```

# ❗ Quando consultar a solução?

Apenas depois que você tentar resolver sozinho(a).  
A solução completa está na pasta solucao.


Boa sorte e divirta-se aprendendo DevOps na prática! 🚀🔥