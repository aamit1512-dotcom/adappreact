variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "appgw_subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "frontend_nic_ids" {
  type = map(string)
}
