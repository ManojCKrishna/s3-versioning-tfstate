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







# resource "aws_s3_bucket" "bucket" {
#   bucket = "my-tf-databus-bucket"
#   acl    = "private"
#   force_destroy = true

#   versioning {
#     enabled = true
#   }


#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }



#




# resource "aws_cloudformation_stack" "cloudformationstack" {
#   name = "cloudformation-test-stack"

#   parameters = {

#    VPCCidr  = "172.31.0.0/16",
#     Subnet1Cidr = "172.31.1.0/24",
#     Subnet2Cidr = "172.31.2.0/24",
#   }
#   template_body = <<STACK
# {
#     "Parameters": {
#       "VPCCidr": {
#         "Type": "String",
#         "Default": "172.31.0.0/16",
#         "Description": "Cidr block of VPC is 172.31.0.0/16."
#       },
#       "Subnet1Cidr": {
#         "Type": "String",
#         "Default": "172.31.1.0/24",
#         "Description": "CIDR block for the subnet 1 is 172.31.1.0/24."
#       },
#       "Subnet2Cidr": {
#         "Type": "String",
#         "Default": "172.31.2.0/24",
#         "Description": "CIDR block for the subnet 1 is 172.31.2.0/24."
#       }
#     },
#     "Resources": {
#       "VPC": {
#         "Type": "AWS::EC2::VPC",
#         "Properties": {
#           "CidrBlock": {
#             "Ref": "VPCCidr"
#           },
#           "Tags": [
#             {
#               "Key": "Name",
#               "Value": "cloudformationstack-s3-test-vpc"
#             }
#           ]
#         }
#       },
#       "Subnet1": {
#         "Type": "AWS::EC2::Subnet",
#         "Properties": {
#           "VpcId": {
#             "Ref": "VPC"
#           },
#           "CidrBlock": "172.31.1.0/24",
#           "Tags": [
#             {
#               "Key": "Name",
#               "Value": "cloudformationstack-s3-test-subnet1"
#             }
#           ]
#         }
#       },
#       "Subnet2": {
#         "Type": "AWS::EC2::Subnet",
#         "Properties": {
#           "VpcId": {
#             "Ref": "VPC"
#           },
#           "CidrBlock": "172.31.2.0/24",
#           "Tags": [
#             {
#               "Key": "Name",
#               "Value": "cloudformationstack-s3-test-subnet2"
#             }
#           ]
#         }
#       }


#     },
#     "Outputs": {
#       "StackVPC": {
#         "Description": "Exported VPC for ec2 instance",
#         "Value": {
#           "Ref": "VPC"
#         },
#         "Export": {
#           "Name": {
#             "Fn::Sub": "$${AWS::StackName}-VPCID"
#           }
#         }
#       },
#       "Stacksubnet1": {
#         "Description": "Exported Subnet1 for ec2 instance",
#         "Value": {
#           "Ref": "Subnet1"
#         },
#         "Export": {
#           "Name": {
#             "Fn::Sub": "$${AWS::StackName}-Subnet1"
#           }
#         }
#       },
#        "Stacksubnet2": {
#         "Description": "Exported Subnet1 for ec2 instance",
#         "Value": {
#           "Ref": "Subnet1"
#         },
#         "Export": {
#           "Name": {
#             "Fn::Sub": "$${AWS::StackName}-Subnet2"
#           }
#         }
#       }

#     }
#   }
# STACK
# }









 