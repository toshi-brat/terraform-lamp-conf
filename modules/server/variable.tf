variable "sg" {
  description ="security group to be attached to the instance"
}

variable "ami" {
  description= "desired ami id" 
}
variable "sub-id" {
    # type = map(object({
    # subnet_id = string
    # })  )
}
variable "instance_type" {
  description = " desired instance type"
  type = string
  
 
}

variable "key-pair" {
  description = "name of the key to ssh into instance"
}

variable "iam_instance_profile" {
  
}

variable "sub-server2-id" {
  
}
variable "sg2" {
  
}