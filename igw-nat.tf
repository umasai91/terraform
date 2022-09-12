resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.uma_vpc.id

  tags = {
    Name = "uma_vpc-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    name = "nat"
  }
}
