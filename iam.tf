resource "aws_iam_user" "dev_team_leader" {
      name = "dev_team_leader"
}

resource "aws_iam_user" "dev_team_staff" {
      name = "dev_team_staff"
}

resource "aws_iam_user" "ops_team_leader" {
      name = "ops_team_leader"
}

resource "aws_iam_user" "ops_team_staff" {
      name = "ops_team_staff"
}
