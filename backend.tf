terraform {
     backend "s3" {
          bucket          = "terraform-git-whdbtjd"
          key             = "git"
          region          = "ap-northeast-2"
          encrypt         = true
          dynamodb_table  = "terraform-lock-whdbtjd"
     }
}
