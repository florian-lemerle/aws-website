aws_website_vpc_name        = "FL-VPC"
aws_website_cidr            = "172.16.0.0/16"
aws_website_azs             = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
aws_website_private_subnets = ["172.16.32.0/24", "172.16.34.0/24", "172.16.36.0/24"]
aws_website_public_subnets  = ["172.16.31.0/24", "172.16.33.0/24", "172.16.35.0/24"]
aws_website_tags            = { Name = "AWS Website", Environment = "Dev" }

aws_website_database01_sg_name        = "private_default"
aws_website_database01_sg_description = "Default private sg"
aws_website_database01_sg_vpc_name    = "module.aws_website.module.vpc.aws_vpc.this[0]"
aws_website_database01_sg_tags        = { Name = "AWS Website", Environment = "Dev" }

aws_website_webserver01_sg_name        = "public_default"
aws_website_webserver01_sg_description = "Default public sg"
aws_website_webserver01_sg_vpc_name    = "module.aws_website.module.vpc.aws_vpc.this[0]"
aws_website_webserver01_sg_tags        = { Name = "AWS Website", Environment = "Dev" }