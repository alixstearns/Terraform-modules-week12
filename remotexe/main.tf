provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "alix" {
  ami           = "ami-0e8a34246278c21e4"
  instance_type = "t2.micro" 
  

  connection {
    type        = "ssh"
    user        = "ec2-user"

   
    host        = self.public_ip
   }

  provisioner "remote-exec" {
    inline = [
     "sudo yum -y install httpd && sudo systemctl start httpd",
     "echo '<h1>My Test Website using Terraform Provisioner</h1>' > index.html",
     "sudo mv index.html /var/www/html/"
   ]
   }
}




# Generates a secure private k ey and encodes it as PEM
#resource "tls_private_key" "ec2_key" {
 # algorithm = "RSA"
  #rsa_bits  = 2048
#}
# Create the Key Pair
#resource "aws_key_pair" "ec2_key" {
 # key_name   = "remotekeypair"  
 # public_key = tls_private_key.ec2_key.public_key_openssh
#}
# Save file
#resource "local_file" "ssh_key" {
 # filename = "keyremote.pem"
#  content  = tls_private_key.ec2_key.private_key_pem
#}
output "public_ip" {
  value = aws_instance.alix.public_ip
}