resource "aws_route_table" "sbcntr-route-app" {
    propagating_vgws = []
    route            = []
    tags             = {
        "Name" = "sbcntr-route-app"
    }
    tags_all         = {
        "Name" = "sbcntr-route-app"
    }
    vpc_id           = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "sbcntr-route-db" {
    propagating_vgws = []
    route            = []
    tags             = {
        "Name" = "sbcntr-route-db"
    }
    tags_all         = {
        "Name" = "sbcntr-route-db"
    }
    vpc_id           = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "sbcntr-route-ingress" {
    propagating_vgws = []
    route {
        cidr_block                 = "0.0.0.0/0"
        gateway_id                 = "${aws_internet_gateway.gw.id}"
    }
    tags             = {
        "Name" = "sbcntr-route-ingress"
    }
    tags_all         = {
        "Name" = "sbcntr-route-ingress"
    }
    vpc_id           = "${aws_vpc.vpc.id}"
}

resource "aws_route" "sbcntr-route-app" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "${aws_route_table.sbcntr-route-app.id}"
}

resource "aws_route" "sbcntr-route-db" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "${aws_route_table.sbcntr-route-db.id}"
}

resource "aws_route" "sbcntr-route-ingress" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "${aws_route_table.sbcntr-route-ingress.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-public-ingress-1a" {
    route_table_id = "${aws_route.sbcntr-route-ingress.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-public-ingress-1a.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-public-ingress-1c" {
    route_table_id = "${aws_route.sbcntr-route-ingress.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-public-ingress-1c.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-private-container-1a" {
    route_table_id = "${aws_route_table.sbcntr-route-app.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-private-container-1a.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-private-container-1c" {
    route_table_id = "${aws_route_table.sbcntr-route-app.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-private-container-1c.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-private-db-1a" {
    route_table_id = "${aws_route_table.sbcntr-route-db.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-private-db-1a.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-private-db-1c" {
    route_table_id = "${aws_route_table.sbcntr-route-db.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-private-db-1c.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-public-management-1a" {
    route_table_id = "${aws_route.sbcntr-route-ingress.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-public-management-1a.id}"
}

resource "aws_route_table_association" "sbcntr-subnet-public-management-1c" {
    route_table_id = "${aws_route.sbcntr-route-ingress.id}"
    subnet_id      = "${aws_subnet.sbcntr-subnet-public-management-1c.id}"
}
