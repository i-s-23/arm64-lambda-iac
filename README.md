# 概要

ECR+Lambdaを作成するTerraformのコードです。

## content

- zipだけでなくimage形式やArmアーキテクチャ使用可能などを変数にしてある
- `./src/lambda-test/*` にimage形式で使用するDockerfileとソースコードを配置してあり、コードが修正されるとCICDからDocker Build＆Pushが行われる

## Usae

- TerraformでECRを作成する

```bash
terraform init

terraform apply -target=module.oidc_github
```

- ECRにDockerイメージをPushする
  - CICDを実行すれば自動でPushされる

- Lambdaを作成する

```bash
terraform apply
```



## refarence

- [unfunco/oidc-github/aws | Terraform Registry](https://registry.terraform.io/modules/unfunco/oidc-github/aws/1.8.0)