resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket"
    Environment = "Dev"
    AMAZING_TAG = "deploy"
  }
}

# resource "aws_s3_bucket" "bucket122" {
#   bucket = "gdflngfdlkndgflkngflkgfgdnflkdgnf"
#   force_destroy = true  



#  tags = {
#     AMAZING_TAG = "changed-2nd"
#   }
# }

# resource "aws_s3_bucket" "buckedggft122" {
#   bucket = "gdfdgfgfgdfdfgdgflkngflkgfgdnflkdgnf"
#   force_destroy = true  



#  tags = {
#     AMAZING_TAG = "changed-22nd"
#   }
# }