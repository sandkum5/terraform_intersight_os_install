resource "intersight_os_install" "os_install" {
  name = "InstallTemplatee165"
  server {
    object_type = "compute.RackUnit"
    selector    = var.os_install_server_selector
  }
  image {
    object_type = "softwarerepository.OperatingSystemFile"
    moid        = intersight_softwarerepository_operating_system_file.esxi_custom_iso.moid
  }
  osdu_image {
    moid        = intersight_firmware_server_configuration_utility_distributable.scu_ucsc.moid
    object_type = "firmware.ServerConfigurationUtilityDistributable"
  }
  configuration_file {
    object_type = "os.ConfigurationFile"
    selector    = var.os_install_configuration_file_selector
  }
  answers {
    hostname       = var.os_hostname
    ip_config_type = var.os_ip_config_type
    # IpV4Config = {
    ip_configuration {
      additional_properties = jsonencode({
        IpV4Config = {
          IpAddress = var.os_ipv4_addr
          Netmask   = var.os_ipv4_netmask
          Gateway   = var.os_ipv4_gateway
        }
      })
      object_type = "os.Ipv4Configuration"
    }
    is_root_password_crypted = false
    nameserver               = var.os_ipv4_dns_ip
    root_password            = var.os_root_password
    nr_source                = var.os_answers_nr_source
  }
  description    = "Install ESXi 6.7 U3"
  install_method = "vMedia"
  organization {
    object_type = "organization.Organization"
    # moid        = var.organization
  }
  install_target {
    additional_properties = jsonencode({
      Id                      = "0"
      Name                    = "RAID0_1"
      StorageControllerSlotId = "MRAID"
    })
    object_type = "os.VirtualDrive"
  }
}
