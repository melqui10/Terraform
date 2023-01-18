#! /bin/bash
sudo yum update
sudo yum -y install httpd
echo "<h1>Welcome to the EC2 $(hostname -f) deployed via Terraform!</h1>" | sudo tee /var/www/html/index.html
sudo service httpd start 
