provider "aws" {
  region = "ap-south-1" // set the AWS region you want to use
  access_key = "AKIAQDUXA2NV5WMUKPP7"
  secret_key = "1H6Yq4nHI/vFaY9/hwsnXDTmGqsBqtaQHM5oF9CH"
}

resource "aws_instance" "example" {
  ami           = "ami-02eb7a4783e7e9317" // set the AMI ID of the image you want to use
  instance_type = "t2.micro" // set the instance type you want to use
  key_name      = "AssignmentKey" // set the name of the key pair you want to use to SSH into the instance
  tags = {
    Name = "demo-instance" // set a name for the instance
  }
}
