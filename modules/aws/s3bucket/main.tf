resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket-change-2"
    Environment = "Dev"
    AMAZING_TAG = "changed-3"
  }
}

# resource "aws_s3_bucket" "bucket124422" {
#   bucket = "gdfl-55555555555555555"
#   force_destroy = true  



#  tags = {
#     AMAZING_TAG = "changed-5"
#   }
# }

# resource "aws_s3_bucket" "buckedggft122" {
#   bucket = "gdfdgfgfgdfdfgdgflkngflkgfgdnflkdgnf"
#   force_destroy = true  



#  tags = {
#     AMAZING_TAG = "changed-22nd"
#   }
# }
