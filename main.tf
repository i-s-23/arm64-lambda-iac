module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.9.0"

  function_name = var.function_name
  description   = var.description
  image_uri     = local.image_uri # コンテナイメージのURI

  create_package = false

  architectures      = var.architectures # arm64のイメージを使用する設定
  package_type       = var.package_type  # Lambdaでコンテナイメージを使用する設定
  authorization_type = var.authorization_type
  timeout            = var.timeout

  environment_variables = var.environment_variables
}


resource "aws_ecr_repository" "ECRRepository" {
  name = var.function_name
}

resource "aws_iam_policy" "ecr_push_policy" {
  name = "ci-cd-ecr-push"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        "Resource" : ["arn:aws:ecr:${local.region}:${local.account_id}:repository/${aws_ecr_repository.ECRRepository.name}"]
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_update" {
  name = "lambda_update"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "lambda:UpdateFunctionCode",
        ],
        "Resource" : ["arn:aws:lambda:${local.region}:${local.account_id}:function:${var.function_name}"]
      }
    ]
  })
}

module "oidc_github" {
  source  = "unfunco/oidc-github/aws"
  version = "1.8.0"

  iam_role_name = "github_oidc_role"

  github_repositories = [
    "${var.github_organization}/${var.github_repository}"
  ]
  iam_role_policy_arns = [
    aws_iam_policy.ecr_push_policy.arn,
    aws_iam_policy.lambda_update.arn
  ]
}
