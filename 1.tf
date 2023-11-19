terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "jma-my-tf-test-bucket"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

#data "aws_ami" "linux" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["al2023-ami-2023*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["amazon"] # Canonical
#}
#
#resource "aws_key_pair" "deployer" {
#  key_name   = "deployer-key"
#  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKoE/nMMeYaWyEEKeB9EVHu0kGW2FWewil08zwUIJ5OL"
#}
#
#resource "aws_vpc" "main" {
#  cidr_block = "10.0.0.0/16"
#}
#
#resource "aws_subnet" "main" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = "10.0.1.0/24"
##  map_customer_owned_ip_on_launch = true
#
#  tags = {
#    Name = "Main"
#  }
#}
#
#resource "aws_security_group" "allow_ssh" {
#  name        = "allow_ssh"
#  description = "Allow SSH inbound traffic"
#  vpc_id      = aws_vpc.main.id
#
#  ingress {
#    description      = "TLS from VPC"
#    from_port        = 22
#    to_port          = 22
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#
#  egress {
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#
#  tags = {
#    Name = "allow_ssh"
#  }
#}
#
#resource "aws_instance" "web" {
#  ami           = data.aws_ami.linux.id
#  instance_type = "t2.micro"
#  key_name = aws_key_pair.deployer.key_name
#  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
#  subnet_id     = aws_subnet.main.id
#
#  tags = {
#    Name = "HelloWorld"
#  }
#
##  connection {
##    type     = "ssh"
##    user     = "root"
##    host     = self.public_ip
##  }
##
##  provisioner "remote-exec" {
##    inline = [
##      "echo 123"
##    ]
##  }
#}

resource "aws_s3_bucket" "example" {
  bucket = "jma-my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}