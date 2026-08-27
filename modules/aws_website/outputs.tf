output "webserver01_private_ip" {
  value = aws_instance.webserver01.private_ip
}

output "webserver01_public_ip" {
  value = aws_instance.webserver01.private_ip
}

output "database01_private_ip" {
  value = aws_instance.database01.private_ip
}