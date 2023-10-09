

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = local.vpc_cidr
  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  name_prefix     = local.name_prefix
}


module "control-ec2-1" {
  source        = "./modules/ec2"
  name_prefix   = local.name_prefix
  instance_type = local.instance_type
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
  name_suffix   = "-control-1"
  vpc_cidr      = local.vpc_cidr
}

module "worker-ec2-1" {
  source        = "./modules/ec2"
  name_prefix   = local.name_prefix
  instance_type = local.instance_type
  subnet_id     = module.vpc.public_subnet_ids[1]
  vpc_id        = module.vpc.vpc_id
  name_suffix   = "-worker-1"
  vpc_cidr      = local.vpc_cidr
}

module "worker-ec2-2" {
  source        = "./modules/ec2"
  name_prefix   = local.name_prefix
  instance_type = local.instance_type
  subnet_id     = module.vpc.public_subnet_ids[2]
  vpc_id        = module.vpc.vpc_id
  name_suffix   = "-worker-2"
  vpc_cidr      = local.vpc_cidr
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deployer-key"
  public_key = local.public_key
}
