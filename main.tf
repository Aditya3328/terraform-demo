provider "aws" {
  region = "ap-south-1" // set the AWS region you want to use
  
}

resource "aws_instance" "example" {
  ami           = "ami-02eb7a4783e7e9317" // set the AMI ID of the image you want to use
  instance_type = "t2.micro" // set the instance type you want to use
  key_name      = "AssignmentKey" // set the name of the key pair you want to use to SSH into the instance
  vpc_security_group_ids= ["sg-04fba683f37ca92fd"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("AssignmentKey.pem")
    host     = self.public_ip
  }
  tags = {
    Name = "demo-instance" // set a name for the instance
  }
  
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World!' > /tmp/hello.txt",
      "echo ${aws_instance.example.public_ip} > /home/ubuntu/public_ip.txt"
    ]
  }
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > inventory"
    
  }
  
}
output "public_ip_address" {
  value = aws_instance.example.public_ip
}
