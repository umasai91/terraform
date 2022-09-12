resource "aws_vpc" "uma_vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"
  tags = {
    Name = "uma_vpc"
  }
}
