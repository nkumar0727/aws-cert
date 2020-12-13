terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default VPC"
    }
}

resource "aws_instance" "ec2-test-host" {
  ami = "ami-0e472933a1395e172"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_dev.id]
  key_name = "${var.key_pair_name}"
  user_data = "${file("start_server.sh")}"
}

resource "aws_security_group" "allow_ssh_dev" {
    name = "allow_ssh_dev"
    description = "Allow SSH traffic for dev"
    vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "ingress_https" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.allow_ssh_dev.id
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.allow_ssh_dev.id
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_ssh_dev" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_group_id = aws_security_group.allow_ssh_dev.id
    cidr_blocks = ["${file("ip_address.txt")}"]
}

resource "aws_security_group_rule" "egress_ec2-test-host" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.allow_ssh_dev.id
    cidr_blocks = ["0.0.0.0/0"]
}

