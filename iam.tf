resource "aws_iam_user" "dev_leader" {
      name = "dev_leader"
}

resource "aws_iam_user" "dev_staff" {
      name = "dev_staff"
}

resource "aws_iam_user" "ops_leader" {
      name = "ops_leader"
}

resource "aws_iam_user" "ops_staff" {
      name = "ops_staff"
}

resource "aws_iam_group" "dev_team" {
      name = "dev_team"
}

resource "aws_iam_group" "ops_team" {
      name = "ops_team"
}

resource "aws_iam_group_membership" "dev_team_membership" {
      name = "dev-team-terraform"

      users = var.dev_team_users

      group = aws_iam_group.dev_team.name
}

resource "aws_iam_group_membership" "ops_team_membership" {
      name = "ops-team-terraform"

      users = var.ops_team_users

      group = aws_iam_group.ops_team.name
}

resource "aws_iam_user_policy" "dev_leader_policy" {
      name = "dev_leader_policy"
      user = aws_iam_user.dev_leader.name

      policy = <<EOF
      {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::dev-bucket-whdbtjd/*"
        }
      ]
    }
EOF
}

resource "aws_iam_user_policy" "ops_leader_policy" {
       name = "ops_leader_policy"
       user = aws_iam_user.ops_leader.name

       policy = <<EOF
        {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::ops-bucket-whdbtjd/*"
        }
      ]
    }
EOF
}

resource "aws_iam_user_policy" "dev_staff_policy" {
      name = "dev_staff_policy"
      user = aws_iam_user.dev_staff.name

      policy = <<EOF
       {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::dev-bucket-whdbtjd/*"
        }
      ]
    }
EOF
}

resource "aws_iam_user_policy" "ops_staff_policy" {
      name = "ops_staff_policy"
      user = aws_iam_user.ops_staff.name

      policy = <<EOF
       {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::ops-bucket-whdbtjd/*"
        }
      ]
    }
EOF
}




