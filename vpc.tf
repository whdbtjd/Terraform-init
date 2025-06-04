resource "aws_vpc" "main" {
     cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
     count = length(var.aws_vpc_public)
     vpc_id = aws_vpc.main.id

     cidr_block = element(var.aws_vpc_public, count.index)
}

resource "aws_subnet" "private" {
     count = length(var.aws_vpc_private)
     vpc_id = aws_vpc.main.id

     cidr_block = element(var.aws_vpc_private, count.index)
}

resource "aws_internet_gateway" "igw" {
     vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
     vpc_id = aws_vpc.main.id

     route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.igw.id
     }
}
  
