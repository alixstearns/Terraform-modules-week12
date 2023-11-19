terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_instance" "demo" {
  ami           = "ami-0e8a34246278c21e4"
  instance_type = "t2.micro"
}


resource "null_resource" "my_provisioner" {
  provisioner "local-exec" {
    command = "echo 'resource successfully created' > status.txt"

  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'resource successfully destroyed' > status.txt"
  }
}

