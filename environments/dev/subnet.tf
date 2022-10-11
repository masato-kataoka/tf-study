resource "aws_subnet" "sbcntr-subnet-public-ingress-1a" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.0.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = true
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-public-ingress-1a"
        "Type" = "Public"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-public-ingress-1a"
        "Type" = "Public"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-public-ingress-1c" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.1.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = true
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-public-ingress-1c"
        "Type" = "Public"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-public-ingress-1c"
        "Type" = "Public"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-container-1a" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.8.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-container-1a"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-container-1a"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-container-1c" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.9.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-container-1c"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-container-1c"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-db-1a" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.16.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-db-1a"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-db-1a"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-db-1c" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.17.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-db-1c"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-db-1c"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-public-management-1a" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.240.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = true
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-public-management-1a"
        "Type" = "Public"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-public-management-1a"
        "Type" = "Public"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"

    timeouts {}
}

resource "aws_subnet" "sbcntr-subnet-public-management-1c" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.241.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = true
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-public-management-1c"
        "Type" = "Public"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-public-management-1c"
        "Type" = "Public"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-egress-1a" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.248.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-egress-1a"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-egress-1a"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

resource "aws_subnet" "sbcntr-subnet-private-egress-1c" {
    assign_ipv6_address_on_creation                = false
    cidr_block                                     = "10.0.249.0/24"
    enable_dns64                                   = false
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    ipv6_native                                    = false
    map_public_ip_on_launch                        = false
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Name" = "sbcntr-subnet-private-egress-1c"
        "Type" = "Isolated"
    }
    tags_all                                       = {
        "Name" = "sbcntr-subnet-private-egress-1c"
        "Type" = "Isolated"
    }
    vpc_id                                         = "vpc-0fde87b32cacadbc4"
}

