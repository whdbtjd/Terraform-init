resource "aws_vpc" "main" {
     cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count = length(var.aws_vpc_public)
  vpc_id = aws_vpc.main.id

  cidr_block = element(var.aws_vpc_public, count.index)
}
