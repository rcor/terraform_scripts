resource "aws_route_table" "private_table" {
  vpc_id = "${aws_vpc.main.id}"
  tags = merge ({
    Name = "${var.name}_private_route_table"
    type = "private"
  },var.tags)
}

resource "aws_route_table" "private_table_a" {
  vpc_id = "${aws_vpc.main.id}"
  tags = merge ({
    Name = "${var.name}_private_table_a"
    type = "private"
  },var.tags)
}

resource "aws_route_table" "private_table_b" {
  vpc_id = "${aws_vpc.main.id}"
  tags = merge ({
    Name = "${var.name}_private_table_b"
    type = "private"
  },var.tags)
}

// Only with has_egress-only-internet-gateway = true

resource "aws_egress_only_internet_gateway" "egress_only_ig" {
  vpc_id = "${aws_vpc.main.id}"
  count = "${var.has_egress-only-internet-gateway?1:0}"
}

resource "aws_route" "egress_only_ig_route_a" {
  route_table_id = "${aws_route_table.private_table_a.id}"
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.egress_only_ig[0].id}"
  count = "${var.has_egress-only-internet-gateway?1:0}"
}

resource "aws_route" "egress_only_ig_route_b" {
  route_table_id = "${aws_route_table.private_table_b.id}"
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.egress_only_ig[0].id}"
  count = "${var.has_egress-only-internet-gateway?1:0}"
}

resource "aws_route_table_association" "egress_only_ig_route_route_a" {
  subnet_id      = aws_subnet.private_a[0].id
  route_table_id = aws_route_table.private_table.id
  count = "${var.has_egress-only-internet-gateway?1:0}"
}

resource "aws_route_table_association" "egress_only_ig_route_route_b" {
  subnet_id      = aws_subnet.private_b[0].id
  route_table_id = aws_route_table.private_table.id
  count = "${var.has_egress-only-internet-gateway?1:0}"
}
