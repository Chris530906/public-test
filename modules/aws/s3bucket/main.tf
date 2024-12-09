resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket"
    Environment = "Dev"
    AMAZING_TAG = "changed"
  }
}

resource "aws_s3_bucket" "bucket22" {
  bucket = "gdflngfdlkndgflkngflkgnflkdgnf"
  force_destroy = true  



 tags = {
    Name        = "My bucket"
    Environment = "Dev"
    AMAZING_TAG = "changed-2nd"
  }
}

