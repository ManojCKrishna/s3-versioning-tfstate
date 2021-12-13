provider "aws"{
    region = "us-east-2"
    profile = "development"
}
resource "aws_vpc" "vpc"{
    cidr_block = "172.31.0.0/16"
    tags = {
    name = "s3-vpc"
    }
}

resource "aws_subnet" "subnet" {
    cidr_block = "172.31.1.0/24"
    tags = {
        name = "s3-subnet1"
    }
    vpc_id = aws_vpc.vpc.id
}
terraform {
  backend "s3" {
    bucket = "dev-observation2-databus-tf"
    key    = "dev-observation2-msk-eks-tfstate"
    region = "us-east-2"
    profile = "development"
  }
}
#  resource "aws_subnet" "subnet1" {
#     cidr_block = "172.31.2.0/24"
#     tags = {
#         name = "s3-subnet2"
#     }
#     vpc_id = aws_vpc.vpc.id
# }









 
