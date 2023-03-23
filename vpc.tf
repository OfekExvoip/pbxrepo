resource "aws_vpc" "pbxvpc" {
  cidr_block       = "10.0.0.0/16"
 # instance_tenancy = "default"

  tags = {
    Name = "pbx-vpc"
  }

  enable_dns_hostnames = true
}

resource "aws_subnet" "pbxsub1" {
  depends_on = [
    aws_vpc.pbxvpc,
  ]

  vpc_id     = "${aws_vpc.pbxvpc.id}"
  cidr_block = "10.0.1.0/24"

  availability_zone_id = "euc1-az1"

  tags = {
    Name = "pbxsub1"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "pbxsub2" {
  depends_on = [
    aws_vpc.pbxvpc,
  ]

  vpc_id     = "${aws_vpc.pbxvpc.id}"
  cidr_block = "10.0.2.0/24"

  availability_zone_id = "euc1-az2"

  tags = {
    Name = "pbxsub2"
  }

  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "pbxigw" {
  depends_on = [
    aws_vpc.pbxvpc,
  ]


  vpc_id = "${aws_vpc.pbxvpc.id}"

  tags = {
    Name = "pbxigw"
  }
}

resource "aws_route_table" "pbxrt" {
  depends_on = [
    aws_vpc.pbxvpc,
    aws_internet_gateway.pbxigw,
  ]

  vpc_id = "${aws_vpc.pbxvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pbxigw.id}"
  }

  

  tags = {
    Name = "pbxrt"
  }
}

resource "aws_route_table_association" "associateRouteTableWithSubnet1" {
  depends_on = [
    aws_subnet.pbxsub1,
    aws_route_table.pbxrt,
  ]
  subnet_id      = aws_subnet.pbxsub1.id
  route_table_id = aws_route_table.pbxrt.id
}


resource "aws_route_table_association" "associateRouteTableWithSubnet2" {
  depends_on = [
    aws_subnet.pbxsub1,
    aws_route_table.pbxrt,
  ]
  subnet_id      = aws_subnet.pbxsub2.id
  route_table_id = aws_route_table.pbxrt.id
}



resource "aws_security_group" "pbxsg" {
  depends_on = [
    aws_vpc.pbxvpc,
  ]
  vpc_id = aws_vpc.pbxvpc.id
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 5060
    to_port     = 5060
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5160
    to_port     = 5160
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5061
    to_port     = 5061
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 85
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10000
    to_port     = 12000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10000
    to_port     = 12000
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1443
    to_port     = 1443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8089
    to_port     = 8089
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8003
    to_port     = 8003
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pbxsg"
  }

  
}



