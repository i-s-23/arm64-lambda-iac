# AWS Infomation

data "aws_caller_identity" "current" {}
data "aws_canonical_user_id" "current" {}
data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.id
  image_uri  = "${local.account_id}.dkr.ecr.${local.region}.amazonaws.com/${var.function_name}:latest"
}
