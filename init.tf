provider "aws" {
     region = "ap-northeast-2"
}

resource "aws_s3_bucket" "tfstate" {
     bucket = "terraform-git-whdbtjd"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
     name          = "terraform-lock-whdbtjd"
     hash_key      = "LockID" # 락기능 사용하려면 이 속성값이 필수, attribute도 마찬가지
     billing_mode   = "PAY_PER_REQUEST"

     attribute {
       name = "LockID"
       type = "S"
     }
}
