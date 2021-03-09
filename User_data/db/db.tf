resource "aws_instance" "dbserver" {
  ami           = "ami-098828924dc89ea4a"
  instance_type = "t2.micro"

  tags = {
    Name = "dbserver"
  }
}

output "dbserverip" {
  value = aws_instance.dbserver.private_ip
}