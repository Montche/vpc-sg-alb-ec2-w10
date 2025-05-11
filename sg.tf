# sg.tf
resource "aws_security_group" "sg1" {
  name        = "webserver-sg"
  description = "Allow HTTP "
  vpc_id      = module.vpc.vpc_id


  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name                = "dev"
    created-byterraform = "yes"
  }

}

resource "aws_security_group" "sg2" {
  name        = "alb-sg"
  description = "Allow HTTP AND HTTPS"
  vpc_id      = module.vpc.vpc_id


  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "allow HTTPS "
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name                = "dev"
    created-byterraform = "yes"
  }

}