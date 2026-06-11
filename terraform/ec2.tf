data "aws_ami" "ubuntu_24" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "lab_key" {
  key_name   = "lab_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaOUznO7mF2p6F6aMfZb1/xTes8fZTS9ow5DAo/KxI4CXqir0nMRTtzjm3tkGTjrvsp0n9G+e2dUBh9WKbHe8486/quQCU2K+w0XOTl3FAWiAImv9BPem5Dcs3oyimzHicxyWXpK3yfHfrVg/rVaYDCgE2uDCxv5LrUOd79wO9DoNC3MZ+yqOCKlRE2o38YAz9KrWWMVfqfsNvwMd/OpUM6b/E7ereg4eyhRR3BZXvhQzCKNd5V5sh67raD453x1jiH7a22lblE7LW7EZcqYNEpqe+0B8aF1COk2FplwC5VOk5Km5GHzk0fd0GxMIlMHppRbEBD1VfkXMKd3nY3DJzLlk56Qa6rvv4FFHR5U92Inb+dNvpTG57QKnNTDde26ahRHOlCIRsdU65fCUCl1w1JR/YzB4OZdcwcBGJBg2oubMrQemMvBoFc4kUFG6+uSOedNtltYNffVjLM29264orHRvFUNezrtwBk54dwIT6SAa2LVEyqHssyqtfJkAomRBickPWVGcLt6kXdri5PHcclxYOPbqoUYDu4uLvRyM4z0i2bnJr4Nsk0Xz/vQKmv4LN4/019ozvKSqn0KGXIeYSU/jppcPus51p4QNsDYrjcrRU0/tMIAs5rmBwQ9VNypq26zHZDA7/R7+cwmCjx7rjz/77TghL8cdPNGiot1wqNw== prabn@COBRA-TATE"
}

resource "aws_instance" "my_ec2" {
  ami                         = data.aws_ami.ubuntu_24.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.lab_key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_web_traffic.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "terraform-ec2-p"
  }
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.my_ec2.public_dns
}