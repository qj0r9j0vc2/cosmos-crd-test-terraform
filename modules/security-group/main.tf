

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress_rules = var.ingress_rules
  #   ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = var.custom_ingress_rules
  egress_rules             = var.egress_rules
  egress_with_cidr_blocks  = var.custom_egress_rules
}
