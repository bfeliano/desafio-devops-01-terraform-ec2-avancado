# ✅ Solução — Desafio DevOps #01 — Criar EC2 com Terraform (Nível Avançado)

Parabéns por concluir o **nível avançado do Desafio DevOps #01**!  
Nesta etapa, o objetivo foi levar a infraestrutura construída anteriormente para um patamar próximo ao **uso real em ambientes corporativos**, aplicando boas práticas de Terraform, separação de ambientes e automação via CI/CD.

Este diretório contém a **solução final completa**, incluindo backend remoto, ambientes isolados e um pipeline funcional no GitHub Actions.

## 🎯 O que foi implementado nesta solução?

Esta solução consolida todos os objetivos do nível avançado:

### ✔ Backend remoto em S3
- O estado do Terraform é armazenado remotamente em um bucket S3
- Uso de `use_lockfile = true` para controle de versão de providers
- O bucket de backend é tratado como **pré-requisito**

### ✔ Ambientes isolados por state
O projeto foi organizado para suportar múltiplos ambientes com **states independentes**:

- Ambiente `dev` com seu próprio `terraform.tfstate`
- Ambiente `prod` preparado para expansão futura

Isso garante isolamento, segurança e previsibilidade — padrão adotado em projetos reais.

### ✔ Estrutura modular reutilizável
Os recursos foram organizados em módulos reutilizáveis para:

- EC2
- Security Group
- IAM Role / Instance Profile

Os ambientes (`dev`, `prod`) apenas **consomem os módulos**, sem duplicar lógica.

### ✔ CI/CD com GitHub Actions (ambiente dev)
Um pipeline foi configurado para validar automaticamente o ambiente `dev` sempre que houver mudanças na branch `dev`.

O pipeline executa:

- `terraform fmt -check`
- `terraform validate`
- `tflint`
- `terraform plan` (usado também para detecção de drift)

Nenhum `apply` é feito automaticamente — o foco é **validação, segurança e previsibilidade**.

### ✔ Linting com TFLint
O projeto utiliza **TFLint**, configurado via `.tflint.hcl`, para garantir:

- boas práticas de Terraform
- estrutura correta de módulos
- consistência no código

O lint pode ser executado **localmente** e também **no pipeline**.

## 🔍 Exemplo de execução do pipeline

Para referência, uma execução bem-sucedida do pipeline CI/CD deste projeto pode ser encontrada aqui:

➡️ https://github.com/bfeliano/desafio-devops-01-terraform-ec2-avancado/actions/runs/24078145815

Este workflow valida automaticamente o ambiente `dev`, executando:

- `terraform fmt -check`
- `terraform validate`
- `tflint`
- `terraform plan`

Os logs dessa execução ilustram como o pipeline se comporta em um cenário real, sendo uma boa referência para estudo e troubleshooting.

## 📁 Estrutura da solução

```
solucao
├── README.md
├── environments
│   ├── dev
│   │   ├── dev.tfvars
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── user_data.sh
│   │   └── variables.tf
│   └── prod
│       └── (estrutura preparada)
│
├── modules
│   ├── ec2
│   ├── iam
│   └── security\_group
│
└── .tflint.hcl
```

## ▶️ Como executar esta solução (ambiente dev)

### ✅ Validação via CI/CD (recomendado)
A forma **oficial** de validação desta solução é através do **GitHub Actions**.

Sempre que houver:
- push para a branch `dev`, ou
- pull request direcionado à branch `dev`

o pipeline será executado automaticamente, validando todo o código Terraform.

### ✅ Execução local (opcional)

Caso queira testar localmente antes de enviar alterações:

```bash
cd solucao/environments/dev
terraform init
terraform fmt
terraform validate
tflint
terraform plan -var-file="dev.tfvars"
```
```bash
cd solucao/environments/dev
terraform init
terraform apply -var-file="dev.tfvars"
```

Após o apply, abra no navegador:

```
http://<IP_PUBLICO_OUTPUT>
```

Você verá a página criada pelo User Data.

## 🧹 Como destruir a infraestrutura

Para remover os recursos do ambiente `dev`:

```bash
cd solucao/environments/dev
terraform destroy -var-file="dev.tfvars"
```

Repita o mesmo processo para `prod`, caso venha a utilizá-lo.

## 📌 Observações importantes

- Para esse desafio, o bucket de backend **não é gerenciado pelo Terraform**  
- A separação de ambientes é feita por **states independentes**, não por workspaces  
- O pipeline executa apenas `plan` (segurança e controle)  

## 🔜 Próximos passos

Parabéns por concluir o **Desafio DevOps #01 — Nível Avançado**! 🎉  
Este desafio fecha uma trilha completa com Terraform, passando desde fundamentos até práticas avançadas como backend remoto, separação de ambientes e pipelines de validação.

Este projeto também pode servir muito bem como **material de portfólio**, pois mostra na prática:

* evolução progressiva de uma infraestrutura Terraform
* organização profissional de código
* uso de CI/CD para validação automática
* aplicação de boas práticas usadas no dia a dia de times DevOps

💡 Se fizer sentido para você, uma ideia legal é **compartilhar este projeto no LinkedIn ou GitHub**, explicando brevemente o que foi construído e quais conceitos você colocou em prática. Esse tipo de post costuma gerar boas conversas técnicas.

Este desafio **não possui um próximo nível**, mas você pode continuar evoluindo este **mesmo repositório** de várias formas, por exemplo:

* Aplicar automaticamente (`terraform apply`) via merge na branch `main`
* Estender o pipeline para validar e aplicar no ambiente `prod`
* Adicionar **approvals manuais** no GitHub Actions antes do apply
* Integrar ferramentas de **segurança** (por exemplo, `tfsec`)

E, se quiser continuar explorando Infraestrutura como Código por outro caminho, que tal dar uma olhada no próximo desafio da trilha?

➡️ **Desafio DevOps #02 — CloudFormation (Nível Iniciante)**  
https://github.com/bfeliano/desafio-devops-02-cfn-s3-lambda-iniciante

Nesse desafio, o foco é trabalhar com **AWS CloudFormation**, usando templates YAML, dependências entre recursos e integração entre serviços serverless (S3 → Lambda), o que ajuda bastante a comparar diferentes abordagens de IaC usadas no mercado.