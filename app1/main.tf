module "server1" {
 source = "../modules/Ec2"
ami = "ami-05c13eab67c5d8861"
region = "us-east-1"
instance_type = "t3.small"
 name = "Dev-from module" 
}

output "public_ip" {
  value = module.server1.public_ip
}

