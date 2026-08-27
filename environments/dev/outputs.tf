output "webserver01_private_ip" {
  value = module.aws_website.webserver01_private_ip
}

output "webserver01_public_ip" {
  value = module.aws_website.webserver01_public_ip
}

output "database01_private_ip" {
  value = module.aws_website.database01_private_ip
}