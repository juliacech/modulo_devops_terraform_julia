terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}


resource "aws_instance" "web" {
  subnet_id = "subnet-03e846cd8a0b89397"
  ami = "ami-0e66f5495b4efdd0f"
  instance_type = var.tipo
  # instance_type = "t2.micro"
  key_name = "cert-turma3-julia-dev" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0c70edf7fbe9800f0"] 
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-julia-teste"
    # Name = "ec2-julia-teste-${each.key}"
  }
}


# resource "aws_instance" "web" {
#   ami           = "ami-0e66f5495b4efdd0f"
#   instance_type = var.tipo
#   tags = {
#     Name = "${var.nome}",
#     Itau = true
#   }
# }