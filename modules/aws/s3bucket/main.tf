resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket-change-6"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket124422" {
  bucket = "${var.name}-55"
  force_destroy = true  



 tags = {
    AMAZING_TAG = "${var.name}-6"
  }
}

# resource "aws_s3_bucket" "buckedggft122" {
#   bucket = "gdfdgfgfgdfdfgdgflkngflkgfgdnflkdgnf"
#   force_destroy = true  



#  tags = {
#     AMAZING_TAG = "changed-22nd"
#   }
# }
