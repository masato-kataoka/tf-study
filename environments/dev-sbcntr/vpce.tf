resource "aws_vpc_endpoint" "sbcntr-vpce-ecr-api" {
  vpc_id              = var.sbcntrVpc_id
  service_name        = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = var.egress_subnet_ids
  security_group_ids  = var.egress_security_groups
  tags = {
    Name = "sbcntr-vpce-ecr-api"
  }
}

resource "aws_vpc_endpoint" "sbcntr-vpce-ecr-dkr" {
  vpc_id              = var.sbcntrVpc_id
  service_name        = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = var.egress_subnet_ids
  security_group_ids  = var.egress_security_groups
  tags = {
    Name = "sbcntr-vpce-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "sbcntr-vpce-s3" {
  vpc_id            = var.sbcntrVpc_id
  service_name      = "com.amazonaws.ap-northeast-1.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.app_route_ids
  tags = {
    Name = "sbcntr-vpce-s3"
  }
}

resource "aws_vpc_endpoint" "sbcntr-vpce-logs" {
  vpc_id             = var.sbcntrVpc_id
  service_name       = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.egress_subnet_ids
  security_group_ids = var.egress_security_groups
  tags = {
    Name = "sbcntr-vpce-logs"
  }
}
