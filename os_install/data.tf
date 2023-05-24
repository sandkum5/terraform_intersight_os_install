data "intersight_organization_organization" "org" {
  name = local.org_name
}

data "intersight_compute_physical_summary" "server" {
  serial = local.server_serial
}

data "intersight_os_configuration_file" "os_config" {
  name = local.os_config_file
}

data "intersight_softwarerepository_operating_system_file" "os_repo" {
  name = local.os_repo_name
}

data "intersight_firmware_server_configuration_utility_distributable" "scu_repo" {
  name = local.scu_repo_name
}

data "intersight_os_install" "response" {
  moid = intersight_os_install.os_install.id
}
