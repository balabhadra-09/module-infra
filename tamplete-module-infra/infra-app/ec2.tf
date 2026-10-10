resource "aws_key_pair" "my_key_pair" {
    key_name = "${var.key_pair}-my_key_pair"
    public_key = file("my-terra-key.pub")
  
}

resource "aws_default_vpc" "default"{

}
 

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-my_security_group"
  description = "my_security_group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-my-sg"
     Enviroment = var.env
  }
}

 resource "aws_instance" "my_instance" {
   count = var.ec2_count
   ami = var.ami_id
   instance_type = var.instance_type
   security_groups = [aws_security_group.my_security_group.name]
   key_name = aws_key_pair.my_key_pair.key_name
  

   root_block_device {
     volume_size = 8
     volume_type = "gp3"
   }
   tags = {
     name = "${var.env}-my-VM"
      Enviroment = var.env
   }
 }