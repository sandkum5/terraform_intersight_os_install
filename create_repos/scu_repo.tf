resource "intersight_firmware_server_configuration_utility_distributable" "scu_repo" {
  name             = local.scu_name
  nr_version       = local.scu_nr_version
  supported_models = local.scu_supported_models
  description      = local.scu_description
  # Uncomment when Organization option is added to Intersight Provider
  # Issue: https://github.com/CiscoDevNet/terraform-provider-intersight/issues/231
  # organization {
  #   object_type = "organization.Organization"
  #   moid = data.intersight_organization_organization.org.results[0].moid
  # }
  dynamic "tags" {
    for_each = local.scu_tags
    content {
      key   = tags.value.Key
      value = tags.value.Value
    }
  }
  catalog {
    moid        = local.catalog_moid
    object_type = "softwarerepository.Catalog"
    # selector    = "Name eq 'user-catalog' and Organization/Moid eq '${data.intersight_organization_organization.org.results[0].moid}'"
  }
  nr_source {
    object_type = local.scu_object_type # var.repo_source_object_type
    additional_properties = jsonencode({
      # HTTPS
      LocationLink = local.scu_LocationLink
      Username     = local.scu_Username
      Password     = local.scu_Password
      # CIFS
      FileLocation = local.scu_FileLocation
      MountOption  = local.scu_cifs_MountOption
      # Username     = "" # Common with https
      # Password     = "" # Common with https
      # NFS
      # FileLocation = "" # Common with CIFS
      MountOptions = local.scu_nfs_MountOptions
    })
  }
}