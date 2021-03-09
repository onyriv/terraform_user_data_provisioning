provider "aws" {
  region = "eu-west-2"
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "dbserverip" {
  value = module.db.dbserverip
}


output "webserverpublic_ip" {
  value = module.web.pub_ip
}

