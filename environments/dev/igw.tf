resource "aws_internet_gateway" "gw" {
    tags     = {
        "Name" = "sbcntr-igw"
    }
    tags_all = {
        "Name" = "sbcntr-igw"
    }
    vpc_id   = "vpc-0fde87b32cacadbc4"
}
