resource "intersight_os_install" "os_install" {
  name        = local.name
  description = local.description
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
  server {
    object_type = data.intersight_compute_physical_summary.server.results[0].source_object_type
    moid        = data.intersight_compute_physical_summary.server.results[0].moid
  }
  image {
    object_type = "softwarerepository.OperatingSystemFile"
    moid        = data.intersight_softwarerepository_operating_system_file.os_repo.results[0].moid
  }
  osdu_image {
    object_type = "firmware.ServerConfigurationUtilityDistributable"
    moid        = data.intersight_firmware_server_configuration_utility_distributable.scu_repo.results[0].moid
  }
  configuration_file {
    object_type = "os.ConfigurationFile"
    moid        = data.intersight_os_configuration_file.os_config.results[0].moid
  }
  answers {
    hostname       = local.os_hostname
    ip_config_type = local.os_ip_config_type
    ip_configuration {
      additional_properties = jsonencode({
        IpV4Config = {
          IpAddress = local.os_ipv4_addr
          Netmask   = local.os_ipv4_netmask
          Gateway   = local.os_ipv4_gateway
        }
      })
      object_type = "os.Ipv4Configuration"
    }
    is_root_password_crypted = false
    nameserver               = local.os_ipv4_dns_ip
    root_password            = local.os_root_password
    nr_source                = local.os_answers_nr_source
  }
  install_method = "vMedia"
  install_target {
    object_type = local.target_config.ObjectType
    additional_properties = jsonencode({
      # MRAID VD Target
      ObjectType              = local.ObjectType
      Id                      = local.Id
      Name                    = local.Name
      StorageControllerSlotId = local.StorageControllerSlotId
      # FC Target
      InitiatorWwpn = local.InitiatorWwpn
      TargetWwpn    = local.TargetWwpn
      # iSCSI Target
      TargetIqn = local.TargetIqn
      VnicMac   = local.VnicMac
      # LunId parameter is common between FC and iSCSI Targets
      LunId = local.LunId
    })
  }
}