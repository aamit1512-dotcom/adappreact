# =========================
# SUBNET (DATA)
# =========================


# =========================
# PUBLIC IP (DATA – OPTIONAL)
# =========================
data "azurerm_public_ip" "pip" {
  for_each = {
    for k, v in var.vms : k => v
    if v.pip_key != null
  }

  name                = var.public_ips[each.value.pip_key].name
  resource_group_name = var.public_ips[each.value.pip_key].rg_name
}

# =========================
# NIC
# =========================
resource "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id = var.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = try(
      data.azurerm_public_ip.pip[each.key].id,
      null
    )
  }
}

# =========================
# LINUX VM (SSH ONLY)
# =========================
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size

  admin_username = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
