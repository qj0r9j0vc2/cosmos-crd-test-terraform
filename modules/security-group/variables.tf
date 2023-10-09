variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_rules" {
  type    = list(string)
  default = []
}

variable "custom_ingress_rules" {
  type = list(map(string))
  default = [{
    # {
    #   from_port   = 8080
    #   to_port     = 8090
    #   protocol    = "tcp"
    #   description = "User-service ports"
    #   cidr_blocks = "10.10.0.0/16"
    # }
    "from_port"   = "8080"
    "to_port"     = "8090"
    "protocol"    = "tcp"
    "description" = "User-service ports"
    "cidr_blocks" = "10.10.0.0/16"
  }]

}

variable "egress_rules" {
  type    = list(string)
  default = []
}

variable "custom_egress_rules" {
  type = list(map(string))
  default = [{
    "from_port"   = "0"
    "to_port"     = "0"
    "protocol"    = "-1"
    "description" = "Allow every outbound"
    "cidr_blocks" = "0.0.0.0"
  }]

}
