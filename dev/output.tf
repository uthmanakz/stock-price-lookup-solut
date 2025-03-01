output "ANIBSLE" {
    value = module.ansible.public_ip
}

output "WEB-2A" {
    value = module.web_2a.public_ip
}

output "WEB-2B" {
    value = module.web_2b.public_ip
}

output "APP-2A" {
    value = module.app_2a.private_ip
}

output "APP-2B" {
    value = module.app_2b.private_ip
}