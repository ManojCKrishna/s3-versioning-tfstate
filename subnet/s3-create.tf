provider "aws"{
    region = "us-east-2"
    profile = "development"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "dev-observation2-databus-tf"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
  }


  tags = {
    Name        = "MSK-EKS bucket"
    Environment = "Dev"
  }
}
