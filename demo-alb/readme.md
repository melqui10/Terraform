O objetivo desse código é a criação de duas EC2 e um load balance na AWS.

![alt text](https://github.com/melqui10/Terraform/blob/a9b63ca4f2a84ed486de70b770ad718f742255c5/demo-alb/demo%20load%20balance.drawio.png)

Será criado os seguintes itens na AWS:

- 1 VPC
- 2 Subnet
- 1 Internet Gateway
- 1 Route Table
- 1 Security Group
- 2 EC2
- 1 Application Load Balance

**Estrutura das pastas**
```
demo-alb
   ├── alb.tf #Configurações do Load Balance
   ├── ec2.tf #Configurações das EC2
   ├── install_apache.sh #Arquivo de configuração do apache
   ├── provider.tf #Informações sobre o service provider
   ├── var.tf # Variaveis
   └── vpc.tf #Configuração da VPC e intens relacionados (subnet, route table, etc)
```

**How To**:

1) Faça o download e instalação do Terraform de acordo com seu sistema operacional. 
- [Link](https://developer.hashicorp.com/terraform/downloads) 

2) Faça o download dos arquivos nesse repositório.

3) Na sua conta AWS, crie um usuário do tipo **`Programmatic access`** e anote sua `access_key` e `secret_key`.

4) No o arquivo `provider.tf` insira as credencias geradas na AWS e salve.

5) Digite os seguintes comandos:
```
terraform init

terraform plan

terraform apply
```

6) Após completo acessa a console AWS e valide o seu trabalho! Verifique a URL do Load Balance e teste, você deverá ser redirecionado para cada uma das EC2.

7) Depois de verificado digite o comando a baixo para deletar os recursos:

```
terraform destroy
```
