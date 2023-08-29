
resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "development"
   }
}

resource "aws_subnet" "main" {
  vpc_id     = "vpc-088b2fd5eced44a81"
  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "Main-Subnet"
  }
}

data "aws_vpc" "existing_vpc" {
 default = true
}

resource "aws_subnet" "main-subnet-1" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/22"

  tags = {
    Name = "Mains"
  }
}

