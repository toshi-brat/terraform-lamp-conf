module "sg-server-1" {
  source     = "../modules/security_group"
  vpc_id     = module.vpc1.vpc-id
sg_details = {
  "web-server" = {
    description = "httpd inbound"
    name        = "web-server"
    ingress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 80
          protocol        = "tcp"
          self            = null
          to_port         = 80
          security_groups = null
        },
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 22
          protocol        = "tcp"
          self            = null
          to_port         = 22
          security_groups = null
        }
    ]
  }
}
  
}
module "sg-server-2" {
  source     = "../modules/security_group"
  vpc_id     = module.vpc2.vpc-id
sg_details = {
  "db-server" = {
    description = "server-1 inbound"
    name        = "db-server"
    ingress_rules = [
      {
        cidr_blocks     = ["0.0.0.0/0"]
        from_port       = 3306
        protocol        = "tcp"
        self            = null
        to_port         = 3306
        security_groups = null
      },
    ]
  }
}
depends_on = [
  module.sg-server-1
]

}