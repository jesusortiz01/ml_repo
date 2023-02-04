#declarar un proveedor de la nube
provider "aws" {
    region = "us-east-1"
    profile = "icesi_mcd"
}

#recursos declaraciones de componentes
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "backend"
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "db"
  }
}

#consultas de datos

#ciclo de vida terraform

#inicializar: terraformt init

#verificar diseño: terrafom plan

#aplicar el diseño: terreform 

#destruir infraestructa terraform destroy
