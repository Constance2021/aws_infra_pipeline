#se connecter à aws
provider "aws" {
  region = "us-east-1"
}

data "aws_subnet" "km-public-subnet" {
  id = "subnet-id"
}
data "aws_security_group" "km-security-group" {
  id = "sg-id"

}

data "aws_key_pair" "pairKey" {
  key_name           = "pairKey"
  include_public_key = true

}

resource "aws_instance" "ec2instance1" {
  ami             = "ami-08a0d1e16fc3f61ea"
  instance_type   = "t2.micro"
  subnet_id       = data.aws_subnet.km-devops-ano-public-subnet.id
  security_groups = [data.aws_security_group.km-mec-devops-somala-ano-security-group.id]
  #key_name =data.aws_key_pair.anoKey
  associate_public_ip_address = true
  tags = {
    Name = "km-server1"
  }
}
