#Criar o target group
resource "aws_lb_target_group" "target-group" {
	health_check {
		interval	= 10
		path		= "/"
		protocol	= "HTTP"
		timeout		= 5
		healthy_threshold	= 5
		unhealthy_threshold	= 2
	}
    name	    = "demo-tg"
	port	    = 80
	protocol	= "HTTP"
	target_type	= "instance"
	vpc_id = aws_vpc.alb-vpc.id
}

#Criar o application load balance
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.alb-vpc.id]
  }
}
resource "aws_lb" "demo-alb" {
	name		        = "demo-alb"
	internal	        = false
	ip_address_type	    = "ipv4"
	load_balancer_type	= "application"
	security_groups     = [aws_security_group.http-and-ssh-allowed.id]
	subnets             = aws_subnet.alb-subnet-1.*.id
	
	tags = {
		Name = "demo-alb"
	}
}

#Criar o Listener

resource "aws_lb_listener" "alb-listener" {
	load_balancer_arn		= aws_lb.demo-alb.arn
	port					= 80
	protocol				= "HTTP"
	default_action {
		target_group_arn	= aws_lb_target_group.target-group.arn
		type				= "forward"
	}
}

#attachement
resource "aws_lb_target_group_attachment" "ec2_attach" {
	count 				= length(aws_instance.web-server)
	target_group_arn	= aws_lb_target_group.target-group.arn
	target_id			= aws_instance.web-server[count.index].id
}
