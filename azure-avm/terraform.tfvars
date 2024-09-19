location               = "westus2"
address_space_start_ip = "10.0.0.0"
address_space_size     = 16
subnets = {
    "AzureBastionSubnet" = {
        size= 24
        has_nat_gateway = true
        has_network_security_group = false
    }

}

tags = {
  type = "avm"
  env  = "demo"
}

