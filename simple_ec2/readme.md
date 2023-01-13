O objetivo desse código é a criação de uma EC2 simples na AWS. Essa EC2 possui acesso a internet e é feito a instalação do Apache, simulando uma pagina Web.

![alt text](https://raw.githubusercontent.com/melqui10/Terraform/main/simple_ec2/simple_ec2.drwaio.png)

Será criado os seguintes itens na AWS:

- 1 VPC
- 1 Subnet
- 1 Internet Gateway
- 1 Route Table
- 1 Security Group
- 1 EC2

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

6) Após completo acessa a console AWS e valide o seu trabalho! Verifique o IP da sua EC2 e acessa via browser para validar se o Apache foi instalado.

7) Depois de verificado digite o comando a baixo para deletar os recursos:

```
terraform destroy
```

Esse projeto foi adaptado do seguinte tutorial:
https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1
