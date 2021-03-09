variable "ingressport" {
  type    = list(number)
  default = [80, 433]
}

variable "egressport" {
  type    = list(number)
  default = [80, 433]
}

output "sg_name" {
  value = aws_security_group.webtraffic.name
}

resource "aws_security_group" "webtraffic" {
  name        = "allow_webtraffic"
  description = "Allow HTTP and HTTPS inbound and outbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressport
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressport
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_webtraffic"
  }
}