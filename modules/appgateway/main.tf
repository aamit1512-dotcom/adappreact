resource "azurerm_application_gateway" "appgw" {
  name                = "appgw-${var.vnet_name}"
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  ssl_policy {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20220101"
  }

  gateway_ip_configuration {
    name      = "appgw-ipcfg"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                  = "vnet-aamit-feip"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  # -----------------------
  # Backend HTTP Settings
  # -----------------------
  backend_http_settings {
    name                  = "http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    probe_name            = "backend-probe"
  }
  # Health Probe
# -----------------------
probe {
  name     = "backend-probe"
  protocol = "Http"
  host     = "localhost"
  path     = "/api/data"   # or "/health" (recommended)
  interval = 30
  timeout  = 30
  unhealthy_threshold = 3

  match {
    status_code = ["200-399"]
  }
}

  # -----------------------
  # Health Probe
  # -----------------------
  

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "vnet-aamit-feip"
    frontend_port_name            = "frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule"
    rule_type                 = "Basic"
    http_listener_name        = "listener"
    backend_address_pool_name = "backend-pool"
    backend_http_settings_name = "http-settings"
    priority                  = 100
  }

  waf_configuration {
    enabled           = true
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"
  }
}
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "frontend_assoc" {
  for_each = var.frontend_nic_ids


  network_interface_id     = each.value
  ip_configuration_name    = "internal"

  backend_address_pool_id = one([
    for p in azurerm_application_gateway.appgw.backend_address_pool :
    p.id if p.name == "backend-pool"
  ])
}
