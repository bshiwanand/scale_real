variable "aws_profile_name" {
  type = string
}

variable "region_name" {
  type = string
}

variable "scale_security_group_name" {
  type = string
}

variable "ingress_security_group" {
  type = list
  default = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 8443
      to_port = 8443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 0
      to_port = 65535
      protocol = "icmp"
      cidr_blocks = ["192.168.0.0/16"]
    }
  ]
}

variable "egress_security_group" {
  type = list
  default = [{
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "jenkins_build_number" {
  type = string
}


variable "public_key_value" {
  type = string
}


variable "bucket_name" {
  type = string
}

variable "bucket_tag" {
  type = string
}

variable "private_key" {
  type = string
  default  = "~/.ssh/afour_rsa"
}

variable "key_name" {
  type = string
}

variable "private_sub_net_id" {
  type = string
}

variable "public_sub_net_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "nat_group_security_id" {
  type = string
}

variable "acl" {
  type = string
}

variable "csv_file_path" {
  type = string
}

