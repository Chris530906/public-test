resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket-change-1"
    Environment = "Dev"
    AMAZING_TAG = "changed-1"
  }
}

resource "aws_s3_bucket" "bucket12442" {
  bucket = "gdfl-4444444444444444444444444444444"
  force_destroy = true  



 tags = {
    AMAZING_TAG = "changed-3"
  }
}

resource "aws_s3_bucket" "buckedggft122" {
  bucket = "gdfdgfgfgdfdfgdgflkngflkgfgdnflkdgnf"
  force_destroy = true  



 tags = {
    AMAZING_TAG = "changed-22nd"
  }
}