
# Private Subnets
resource "aws_subnet" "private_subnets" {
  for_each   = var.private_subnets
  vpc_id     = data.aws_vpc.default.id
  cidr_block = cidrsubnet(data.aws_vpc.default.cidr_block, 8, each.value)

  tags = {
    Terraform = true
  }
}

# Security Groups
resource "aws_security_group" "t3_intro_2" {
  name        = "t3_intro_2"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "SSH Inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.250.0/24", "120.29.76.169/32"]
  }
  egress {
    description = "Global Outbound"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "t3_intro_2"
    Purpose = "For dev"
  }
}

resource "aws_instance" "t3_intro_2" {
  ami                         = "ami-0f1a5f5ada0e7da53"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_subnets["t3_intro_2"].id
  security_groups             = [aws_security_group.t3_intro_2.id]
  associate_public_ip_address = true
  key_name                    = data.aws_key_pair.key_kai2.key_name
  #   iam_instance_profile        = "CloudWatchAgentServerPolicy"

  tags = {
    Name = "t3_intro_2"
  }
}

