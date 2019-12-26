// Public Subnet
resource "aws_subnet" "publicA" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_subnets[0]}"
  availability_zone = "${var.region_az[0]}"
  map_public_ip_on_launch = "${var.public_subnet_map_public_ip_on_launch}"
  tags = {
    Name = "${var.name}-public-${var.region_az[0]}"
    Created = "terraform"
    Author = var.author
    Type = "public"
    Date = timestamp()
  }
}

resource "aws_subnet" "publicB" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_subnets[1]}"
  availability_zone = "${var.region_az[1]}"
  map_public_ip_on_launch = "${var.public_subnet_map_public_ip_on_launch}"
  tags = {
    Name = "${var.name}-public-${var.region_az[1]}"
    Created = "terraform"
    Author = var.author
    Type = "public"
    Date = timestamp()
  }
}

// Private Subnet
resource "aws_subnet" "privateA" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_subnets[2]}"
  availability_zone = "${var.region_az[0]}"
  tags = {
    Name = "${var.name}-private-${var.region_az[0]}"
    Created = "terraform"
    Author = var.author
    Type = "private"
    Date = timestamp()
  }
}

resource "aws_subnet" "privateB" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.cidr_subnets[3]}"
  availability_zone = "${var.region_az[1]}"
  tags = {
    Name = "${var.name}-private-${var.region_az[1]}"
    Created = "terraform"
    author = var.author
    type = "private"
    date = timestamp()
  }
}
