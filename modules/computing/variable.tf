# =========================
# GLOBAL / COMMON
# =========================

variable "admin_username" {
  type        = string
  description = "Admin username for Linux virtual machines"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to local SSH public key (Windows full path recommended)"
}

# =========================
# VIRTUAL MACHINES
# =========================

variable "vms" {
  description = "Virtual machine definitions keyed by VM name (frontend, backend, etc.)"
  type = map(object({
    vm_name   = string
    rg_name   = string
    location  = string
    size      = string

    nic_name   = string
    subnet_key = string
    pip_key    = string   # null if VM should NOT have a public IP

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

# =========================
# NETWORK DEPENDENCIES
# =========================

variable "subnets" {
  description = "Subnet definitions keyed by subnet_key"
  type = map(object({
    name      = string
    vnet_name = string
    rg_name   = string
  }))
}

variable "public_ips" {
  description = "Public IP definitions keyed by pip_key"
  type = map(object({
    name    = string
    rg_name = string
  }))
}
variable "subnet_ids" {
  description = "Map of subnet IDs coming from networking module"
  type        = map(string)
}