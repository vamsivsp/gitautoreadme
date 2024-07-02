provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-01376101673c89611"
  instance_type = "t2.micro"
}
