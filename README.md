# 🧩 Desafio DevOps #01 — Criar EC2 com Terraform (Nível Avançado)

Este é o terceiro e último nível do **Desafio DevOps #01**, onde você irá elevar ainda mais o projeto desenvolvido nos níveis iniciante e intermediário.  
Agora o foco é aplicar **práticas avançadas de Terraform**, aproximando sua infraestrutura do que é utilizado em pipelines reais de DevOps e Cloud Engineering.

Neste desafio, você avançará o projeto implementando melhorias como:

*   Configuração de **backend remoto em S3** para armazenamento do estado
*   Organização do projeto com **states separados para cada ambiente** (ex.: `dev` e `prod`)
*   Implementação de **CI/CD com GitHub Actions**, garantindo validação automática (fmt, validate, plan)
*   Integração de **TFLint** para aplicar linting e boas práticas
*   Detecção e prevenção de **drift**, assegurando que o estado reflita a infraestrutura real
*   Organização mais profissional de arquivos e ambientes, refletindo padrões utilizados em equipes Cloud/DevOps modernas

Este repositório segue o mesmo formato dos níveis anteriores:  
👉 a pasta **desafio/** contém os arquivos que você deve evoluir  
👉 a pasta **solucao/** contém a implementação final deste nível

Prepare-se para trabalhar com Terraform de forma semelhante ao uso corporativo! ⚡

## 🤝 Participe da Comunidade

Tem dúvidas sobre o desafio ou quer compartilhar sua solução?  
Entre no nosso Discord oficial:

[![Discord](https://img.shields.io/badge/Discord-Desafios%20DevOps-5865F2?style=flat&logo=discord&logoColor=white)](https://discord.gg/RgcC7YytVZ)

Lá você encontrará fóruns por desafio, ajuda da comunidade e novidades sobre próximos desafios DevOps.

Divirta-se aprendendo DevOps com Terraform! ☁️💻🔥

## 📁 Estrutura do Repositório

```
desafio-devops-01-terraform-ec2-avancado/
│
├── desafio/       → Onde você deve desenvolver sua versão avançada
├── solucao/       → Solução completa com backend remoto e CI/CD
└── README.md      → Este arquivo
```

## 📌 Como completar o seu desafio?

Todo o desenvolvimento do seu código deve ser feito dentro da pasta:

```
/desafio
```
Nela você encontrará um README com instruções detalhadas, dicas e, quando necessário, arquivos auxiliares para te orientar na construção da solução.

Quando terminar ou quiser comparar a sua abordagem, a solução final está disponível em:

```
/solucao
```

## 🛠️ Pré-requisitos

Antes de começar, você precisa ter:

- **Terraform**  
  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli  
- **AWS CLI** configurado (`aws configure`)  
  Instalação: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html  
  Configuração: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
- **TFLint**  
  https://github.com/terraform-linters/tflint
- Repositório configurado com **GitHub Actions habilitado**

Você deve possuir também uma **conta AWS** com permissões básicas de EC2, S3 e VPC.

## 🤝 Contribuições

Pull requests com melhorias em documentação, estrutura ou sugestões para novos desafios são bem-vindos!

## 📄 Licença

Este projeto está sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.
