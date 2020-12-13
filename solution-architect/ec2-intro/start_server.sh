#! /bin/bash

sudo yum update
sudo yum install httpd.x86_64 -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>Terraform instance launched successfully</h1>" | sudo tee /var/www/html/index.html
