# 概要

ECR+Lambdaを作成するTerraformのコードです。

## content

- zipだけでなくimage形式やArmアーキテクチャ使用可能などを変数にしてある
- `./src/*` にimage形式で使用するDockerfileとソースコードを配置してあり、コードが修正されるとCICDからDocker Build＆Pushが行われる

## Usae

- TerraformでECRを作成する

```bash
terraform init

terraform apply -target=module.oidc_github
```

- ECRにDockerイメージをPushする
  - CICDを実行すれば自動でPushされる

```bash

```

- Lambdaを作成する

```bash
terraform apply
```



## refarence