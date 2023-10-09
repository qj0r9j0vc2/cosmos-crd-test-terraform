locals {
  region          = "ap-northeast-2"
  instance_type   = "t3.medium"
  name_prefix     = "test"
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4slCtSEVaglw55JN4uf1dUeLrceYCeTVL5po/wJxeKePb/QhsC3m2OC4MlKeE0PZzlRW5rQDwOKb4Ly9FgOzT0AgzN6w4/38ZR22Er0K5Q+mhQuuR60zI96ks57UgGYmDqabdAT9DkWmO+XOFugf8OWnGfI2lG/fUjQb4tjJACWQ5FU+vMdfK2YZ5zafs0ORTIB+v+bpihGi//pS65oEbcKMSI5fswimzjcZx288zGYzV7E1ygSWQ0k/N4yqMfxf8gvGYn33G0ITxVItPXw2JlKk1VHxTzVCX/HHrAzzFMkr8+NJX44yWGeqmb0MO5AtcQ4fGu+rIhdUET3TqTSQp"
  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}c"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  private_subnets = ["10.0.128.0/20", "10.0.144.0/20"]
  vpc_cidr        = "10.0.0.0/16"

}
