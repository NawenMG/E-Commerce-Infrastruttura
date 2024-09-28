provider "aws" {
  region = "eu-west-3"  # Scegli la regione desiderata
}

resource "aws_instance" "e_commerce" {
  ami           = "ami-0c2e9a1c2a6b6bfa3"  #ami ubuntu
  instance_type = "t3.micro"  # Tipo di istanza

  tags = {
    Name = "MyWebServer_ecommerce"
  }

  # Configurazione della chiave SSH
  key_name = "secret-key"  
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  #immetti il tuo ip
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #immetti il tuo ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Associa il gruppo di sicurezza all'istanza
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c2e9a1c2a6b6bfa3"  
  instance_type = "t3.micro"
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "MyWebServer_ecommerce"
  }

  key_name = "secret-key"  # Sostituisci con il tuo nome del key pair
}
