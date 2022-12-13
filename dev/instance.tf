module "instance"{
    source = "../modules/server"
    sg = lookup(module.sg-server-1.output-sg-id,"web-server",null) 
    ami = "ami-07651f0c4c315a529"
    instance_type = "t2.micro"
    sub-id = lookup(module.vpc1.pri-snet-id,"ps1",null)
    key-pair ="key-nv-pair"
    iam_instance_profile = module.iam.instance_profile
    sub-server2-id = lookup(module.vpc2.pri-snet-id,"ps1",null)
    sg2 = lookup(module.sg-server-2.output-sg-id,"db-server",null) 
}
