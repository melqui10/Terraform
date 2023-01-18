#Cria a VPC
resource "aws_vpc" "alb-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "alb-vpc"
    }
}

#Cria a subnets
resource "aws_subnet" "alb-subnet-1" {
    count = length(var.subnets_cidr)
    vpc_id = "${aws_vpc.alb-vpc.id}"
    cidr_block = element(var.subnets_cidr,count.index)
    map_public_ip_on_launch = "true"
    availability_zone = element(var.availability_zones,count.index)
    tags = {
        Name = "Subnet-${count.index+1}"
    }
}

#Cria o internet Gateway
resource "aws_internet_gateway" "alb-igw" {
    vpc_id = "${aws_vpc.alb-vpc.id}"
    tags = {
        Name = "alb-igw"
    }
}

#Cria a route table
resource "aws_route_table" "alb-rt" {
    vpc_id = "${aws_vpc.alb-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.alb-igw.id}" 
    }
    
    tags = {
        Name = "alb-rt"
    }
}

#Associar route table com a subnet
resource "aws_route_table_association" "alb-crta-subnet-1"{
    count = length(aws_subnet.alb-subnet-1)
    subnet_id = element(aws_subnet.alb-subnet-1.*.id,count.index)
    route_table_id = "${aws_route_table.alb-rt.id}"
}

#Criar security Group
resource "aws_security_group" "http-and-ssh-allowed" {
    vpc_id = "${aws_vpc.alb-vpc.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "http-and-ssh-allowed"
    }
}
