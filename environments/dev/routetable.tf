resource "aws_route_table" "sbcntr-route-app" {
    propagating_vgws = []
    route            = []
    tags             = {
        "Name" = "sbcntr-route-app"
    }
    tags_all         = {
        "Name" = "sbcntr-route-app"
    }
    vpc_id           = "vpc-0fde87b32cacadbc4"
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
    vpc_id           = "vpc-0fde87b32cacadbc4"
}

resource "aws_route_table" "sbcntr-route-ingress" {
    propagating_vgws = []
    route {
        cidr_block                 = "0.0.0.0/0"
        gateway_id                 = "igw-08a0be89d95b322e7"
    }
    tags             = {
        "Name" = "sbcntr-route-ingress"
    }
    tags_all         = {
        "Name" = "sbcntr-route-ingress"
    }
    vpc_id           = "vpc-0fde87b32cacadbc4"
}

resource "aws_route" "sbcntr-route-app" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "rtb-075cb4cb775022237"
}

resource "aws_route" "sbcntr-route-db" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "rtb-0295d2910613f8d26"
}

resource "aws_route" "sbcntr-route-ingress" {
    destination_cidr_block = "10.0.0.0/16"
    gateway_id             = "local"
    route_table_id         = "rtb-0d26b619f4cce982a"
}

resource "aws_route_table_association" "sbcntr-subnet-public-ingress-1a" {
    route_table_id = "rtb-0d26b619f4cce982a"
    subnet_id      = "subnet-03089260bcb2f8c56"
}

resource "aws_route_table_association" "sbcntr-subnet-public-ingress-1c" {
    route_table_id = "rtb-0d26b619f4cce982a"
    subnet_id      = "subnet-067e7d33312a751ab"
}

resource "aws_route_table_association" "sbcntr-subnet-private-container-1a" {
    route_table_id = "rtb-075cb4cb775022237"
    subnet_id      = "subnet-0770b48318cc5dda7"
}
resource "aws_route_table_association" "sbcntr-subnet-private-container-1c" {
    route_table_id = "rtb-075cb4cb775022237"
    subnet_id      = "subnet-03b6e5f6c6e0cc0cd"
}

resource "aws_route_table_association" "sbcntr-subnet-private-db-1a" {
    route_table_id = "rtb-0295d2910613f8d26"
    subnet_id      = "subnet-0951cd8c83827bf9e"
}

resource "aws_route_table_association" "sbcntr-subnet-private-db-1c" {
    route_table_id = "rtb-0295d2910613f8d26"
    subnet_id      = "subnet-0951cd8c83827bf9e"
}

resource "aws_route_table_association" "sbcntr-subnet-public-management-1a" {
    route_table_id = "rtb-0d26b619f4cce982a"
    subnet_id      = "subnet-009c2e25ecaea1e9c"
}

resource "aws_route_table_association" "sbcntr-subnet-public-management-1c" {
    route_table_id = "rtb-0d26b619f4cce982a"
    subnet_id      = "subnet-0c7b916b46c39f02c"
}
