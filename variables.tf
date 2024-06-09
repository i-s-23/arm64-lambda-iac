variable "description" {
  type        = string
  description = "何のためのLambdaか説明文"
  default     = "arm64でビルドしたコンテナを使用したLambda"
}
variable "package_type" {
  type        = string
  description = "lambdaのパッケージタイプ. Image or Zip"
  default     = "Image"
}
variable "function_name" {
  type        = string
  description = "Lambda の関数名 (e.g. copy-to-partition-for-athena)"
  default     = "lambda-test"
}
variable "architectures" {
  type        = list(string)
  description = "lambdaが動作するアーキテクチャ eg. arm64"
  default     = ["arm64"]
}
variable "authorization_type" {
  type        = string
  description = "lambdaの認証タイプ. AWS_IAM or NONE"
  default     = "AWS_IAM"
}
variable "timeout" {
  type        = number
  description = "lambdaのタイムアウト時間"
  default     = 10
}

variable "environment_variables" {
  type        = map(string)
  description = "lambda起動時に設定する環境変数"
  default = {
    TEST = "test"
  }
}

variable "github_organization" {
  type        = string
  description = "GithubのOrganization名. or Organizationに所属していない場合Githubのユーザ名"
  default     = "i-s-23"
}

variable "github_repository" {
  type        = string
  description = "Githubのリポジトリ名"
  default     = "arm64-lambda-iac"
}
