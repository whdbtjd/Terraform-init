terraform {
     backend "s3" {
          bucket          = "Terraform-git-bucket"
          key             = "/git" # s3에 저장되는 경로
          region          = "ap-northeast-2"
          encrypt         = true
          dynamodb_table  = "terraform-lock"
}
