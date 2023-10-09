
module "security_group" {
  source      = "../security-group"
  name        = "${var.name_prefix}-sg-ssh"
  description = "Allow ssh from anywhere"
  custom_ingress_rules = [
    { "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "description" = ""
      "cidr_blocks" = "0.0.0.0/0"
    },
    { "from_port"   = "6443"
      "to_port"     = "6443"
      "protocol"    = "tcp"
      "description" = ""
      "cidr_blocks" = "0.0.0.0/0"
    },
    { "from_port"   = "1"
      "to_port"     = "65535"
      "protocol"    = "tcp"
      "description" = ""
      "cidr_blocks" = var.vpc_cidr
    }
  ]
  vpc_id = var.vpc_id
  custom_egress_rules = [{
    "from_port"   = "0"
    "to_port"     = "0"
    "protocol"    = "-1"
    "description" = "Allow every outbound"
    "cidr_blocks" = "0.0.0.0/0"
  }]

}

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
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "${var.name_prefix}-ec2"

  ami = data.aws_ami.ubuntu.id

  instance_type               = var.instance_type
  key_name                    = "deployer-key"
  monitoring                  = true
  vpc_security_group_ids      = [module.security_group.security_group_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
