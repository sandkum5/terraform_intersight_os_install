locals {
  model                = yamldecode(file("os_install.yml"))
  target_config        = lookup(local.model.data.os_install, local.model.data.os_install_target)
  org_name             = local.model.data.org_name
  name                 = local.model.data.name
  description          = local.model.data.description
  os_install_target    = local.model.data.os_install_target
  server_serial        = local.model.data.server_serial
  os_config_file       = local.model.data.os_config_file
  os_repo_name         = local.model.data.os_repo_name
  scu_repo_name        = local.model.data.scu_repo_name
  os_hostname          = local.model.data.os_hostname
  os_ip_config_type    = local.model.data.os_ip_config_type
  os_ipv4_addr         = local.model.data.os_ipv4_addr
  os_ipv4_netmask      = local.model.data.os_ipv4_netmask
  os_ipv4_gateway      = local.model.data.os_ipv4_gateway
  os_ipv4_dns_ip       = local.model.data.os_ipv4_dns_ip
  os_root_password     = local.model.data.os_root_password
  os_answers_nr_source = local.model.data.os_answers_nr_source
}

locals {
  # MRAID VD Target
  ObjectType              = local.os_install_target == "mraid_vd" ? local.target_config.ObjectType : null
  Id                      = local.os_install_target == "mraid_vd" ? local.target_config.Id : null
  Name                    = local.os_install_target == "mraid_vd" ? local.target_config.Name : null
  StorageControllerSlotId = local.os_install_target == "mraid_vd" ? local.target_config.StorageControllerSlotId : null
  # FC Target
  InitiatorWwpn = local.os_install_target == "fc" ? local.target_config.InitiatorWwpn : null
  TargetWwpn    = local.os_install_target == "fc" ? local.target_config.TargetWwpn : null
  # iSCSI Target
  TargetIqn = local.os_install_target == "iscsi" ? local.target_config.TargetIqn : null
  VnicMac   = local.os_install_target == "iscsi" ? local.target_config.VnicMac : null

  # LunId parameter is common between FC and iSCSI Targets, Hence coalesce function
  # In JSON, the last key with the same name is the one that is going to be used.
  fc_LunId    = local.os_install_target == "fc" ? local.target_config.LunId : null
  iscsi_LunId = local.os_install_target == "iscsi" ? local.target_config.LunId : null
  LunId       = try(coalesce(local.fc_LunId, local.iscsi_LunId), null)
}