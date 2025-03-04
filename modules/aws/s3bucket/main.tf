resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true  



 tags = {
    Name        = "My bucket-change-6"
    Environment = "Dev"
  }
}

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "public-read"
# }
