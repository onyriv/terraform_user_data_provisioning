resource "aws_instance" "webserver" {
  ami             = "ami-098828924dc89ea4a"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data       = file("./web/server-script.sh")
  tags = {
    Name = "webserver"
  }
}

output "pub_ip" {
  value = module.eip.webserverip
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.webserver.id
}

module "sg" {
  source = "../sg"
}




