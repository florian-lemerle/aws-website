aws_website_vpc_name        = "FL-VPC"
aws_website_cidr            = "172.16.0.0/16"
aws_website_azs             = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
aws_website_private_subnets = ["172.16.32.0/24", "172.16.34.0/24", "172.16.36.0/24"]
aws_website_public_subnets  = ["172.16.31.0/24", "172.16.33.0/24", "172.16.35.0/24"]
aws_website_tags            = { Name = "AWS Website VPC", Environment = "Dev" , ManagedBy = "Terraform"}

aws_website_database01_sg_name        = "Database01_SG"
aws_website_database01_sg_description = "Default private sg"
aws_website_database01_sg_vpc_name    = "module.aws_website.module.vpc.aws_vpc.this[0]"
aws_website_database01_sg_tags        = { Name = "AWS Website", Environment = "Dev" , ManagedBy = "Terraform"}

aws_website_webserver01_sg_name        = "Webserver01_SG"
aws_website_webserver01_sg_description = "Default public sg"
aws_website_webserver01_sg_vpc_name    = "module.aws_website.module.vpc.aws_vpc.this[0]"
aws_website_webserver01_sg_tags        = { Name = "AWS Website", Environment = "Dev" , ManagedBy = "Terraform"}

aws_website_key_name = "aws-website"
aws_website_public_key_path = "/home/shankars/.ssh/aws_website_ed25519.pub"
aws_website_key_tags = { Name = "AWS Website", Environment = "Dev", ManagedBy = "Terraform"}

aws_website_webserver01_instance_type = "t3.micro"
aws_website_webserver01_tags = { Name = "webserver01", Environment = "Dev", ManagedBy = "Terraform"}
aws_website_database01_instance_type = "t3.micro"
aws_website_database01_tags = { Name = "database01", Environment = "Dev", ManagedBy = "Terraform"}