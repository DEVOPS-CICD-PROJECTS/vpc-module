environment        = "stage"
region             = "us-east-2"
availability_zones = ["us-east-2a", "us-east-2b"]
cidr_block         = "12.0.0.0/16"
private_cidr       = ["12.0.0.0/19", "12.0.32.0/19"]
public_cidr        = ["12.0.64.0/19", "12.0.96.0/19"]
log_destination      = "" # "arn:aws:s3:::zino-7728-zeezee"
log_destination_type = "s3"