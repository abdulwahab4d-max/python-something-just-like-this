# Create or import your SSH key pair
resource "aws_key_pair" "python-something-just-like-this" {
  key_name   = "python-something-just-like-this"
  public_key = var.ssh_public_key   # taking ssh key fro repository secret
}

# Security group for HTTP + SSH
resource "aws_security_group" "allow_http" {
  name_prefix = "allow_http_"

#port enabled for public ip
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0fa91bc90632c73c9"
  instance_type = "t3.micro"

  # 🟢 Add the SSH key here
  key_name = aws_key_pair.python-something-just-like-this.key_name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "Terraform-Ubuntu-python-something-just-like-this"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y docker.io
    
    # Enable docker
    systemctl start docker
    systemctl enable docker
    
    sudo docker pull abdulwahab4d/python-something-just-like-this:latest
    sudo apt update
    sudo apt install python3
    sudo apt install python3-pip
    sudo apt install python3-venv python3-dev build-essential
    python3 -m venv myenv
    python3 lyrics.py
    source myenv/bin/activate
  EOF
}
