
output "instance_public_ip" {
  value = module.ec2_instances[*].public_ip
}