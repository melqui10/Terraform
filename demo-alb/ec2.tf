#Criar EC2
resource "aws_instance" "web-server" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    count = 2
    # VPC
    subnet_id = element(aws_subnet.alb-subnet-1.*.id,count.index)
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.http-and-ssh-allowed.id}"]
    # the Public SSH key
    key_name = "default"
    # nginx installation
    user_data = "${file("install_apache.sh")}"
    tags = {
        Name = "EC2-${count.index+1}"
    }
		  
}
