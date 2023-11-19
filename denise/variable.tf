variable "instance_ami" {
  type             =  string
  description  = "The id of the machine image (AMI) "
   }
  module "jeanet" {
    source = "../modules/ec2"
  }