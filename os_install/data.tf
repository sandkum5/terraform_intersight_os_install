data "intersight_organization_organization" "org_data" {
  name = var.org_name
}

data "intersight_compute_physical_summary" "server" {
    serial = var.server_serial
}

data "intersight_os_configuration_file" "os_config" {
    name = var.os_config_file
}
