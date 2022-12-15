#details for first vpc
cidr = "10.0.0.0/20"
pri-snet = {
  ps1 = {
    cidr_block        = "10.0.8.0/21"
    availability_zone = "ap-southeast-1a"
  }
}
pub-cidr = "10.0.0.0/21"
pub-region = "ap-southeast-1a"

#details of second vpc
cidr2 = "10.1.0.0/20"
pri-snet2 = {
  ps1 = {
    cidr_block        = "10.1.8.0/21"
    availability_zone = "ap-southeast-1a"
  }
}
pub-cidr2 = "10.1.0.0/21"
pub-region2 = "ap-southeast-1a"
# security group for server-1

vpc = {
  vpc-01={
    cidr = "10.1.0.0/20"
    pub-cidr = "10.1.0.0/21"
    pub-region = "ap-southeat-1b"
    is_nat_required = false
 pri-snet = {
  ps1 = {
    cidr_block        = "10.1.8.0/21"
    availability_zone = "ap-southeast-1a"
  }
}
  },
  vpc-02={
    cidr = "192.168.0.0/20"
    pub-cidr = "192.168.0.0/21"
    pub-region = "ap-southeast-1b"
    is_nat_required = false
pri-snet = {
  ps1 = {
    cidr_block        = "192.168.8.0/21"
    availability_zone = "ap-southeast-1b"
  }
}
  }
}
