resource "aws_security_group" "ingress" {
    description = "Security group for ingress"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "from 0.0.0.0/0:80"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = []
            description      = "from ::/0:80"
            from_port        = 80
            ipv6_cidr_blocks = [
                "::/0",
            ]
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
    ]
    name        = "ingress"
    tags        = {
        "Name" = "sbcntr-sg-ingress"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-ingress"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "front-container" {
    description = "Security Group of front container app"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = "HTTP for Ingress"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.ingress.id}",
            ]
            self             = false
            to_port          = 80
        },
    ]
    name        = "front-container"
    tags        = {
        "Name" = "sbcntr-sg-front-container"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-front-container"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "internal" {
    description = "Security group for internal load balancer"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = "HTTP for front container"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.front-cantainer.id}",
            ]
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = []
            description      = "HTTP for management server"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.management.id}",
            ]
            self             = false
            to_port          = 80
        },
    ]
    name        = "internal"
    tags        = {
        "Name" = "sbcntr-sg-internal"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-internal"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "management" {
    description = "Security Group of management server"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = []
    name        = "management"
    tags        = {
        "Name" = "sbcntr-sg-management"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-management"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "container" {
    description = "Security Group of backend app"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = "HTTP for internal lb"
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.internal.id}",
            ]
            self             = false
            to_port          = 80
        },
    ]
    name        = "container"
    tags        = {
        "Name" = "sbcntr-sg-container"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-container"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "default" {
    description = "default VPC security group"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
    ]
    name        = "default"
    tags        = {}
    tags_all    = {}
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "egress" {
    description = "Security Group of VPC Endpoint"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = "HTTPS for Container App"
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.container.id}",
            ]
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = []
            description      = "HTTPS for Front Container App"
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.front-cantainer.id}",
            ]
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = []
            description      = "HTTPS for management server"
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.management.id}",
            ]
            self             = false
            to_port          = 443
        },
    ]
    name        = "egress"
    tags        = {
        "Name" = "sbcntr-sg-vpce"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-vpce"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "database" {
    description = "Security Group of database"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow all outbound traffic by default"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = []
            description      = "MySQL protocol from backend App"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.container.id}",
            ]
            self             = false
            to_port          = 3306
        },
        {
            cidr_blocks      = []
            description      = "MySQL protocol from frontend App"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.front-cantainer.id}",
            ]
            self             = false
            to_port          = 3306
        },
        {
            cidr_blocks      = []
            description      = "MySQL protocol from management server"
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "${aws_security_group.management.id}",
            ]
            self             = false
            to_port          = 3306
        },
    ]
    name        = "database"
    tags        = {
        "Name" = "sbcntr-sg-db"
    }
    tags_all    = {
        "Name" = "sbcntr-sg-db"
    }
    vpc_id      = "${aws_vpc.vpc.id}"
}
