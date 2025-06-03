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
