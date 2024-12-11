provider "aws" {
  region  = var.aws_region

}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">3.0.0"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "name" {
  type    = string
  default = "test_name"
}

variable "value" {
  type    = string
  default = "test_value"
  sensitive = true
}



resource "aws_ssm_parameter" "example" {
  name  = "example-${var.name}"
  type  = "String"
  value = "${var.value}"
  tags = {
    branch = "master branch"
    new = "tag"
  }
}


output "ssm_value" {
  value = aws_ssm_parameter.example.value
  sensitive = true
}


