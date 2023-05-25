resource "intersight_softwarerepository_operating_system_file" "os_repo" {
  name        = local.os_name
  nr_version  = local.os_nr_version
  vendor      = local.os_vendor
  description = local.os_description
  # Uncomment when Organization option is added to Intersight Provider
  # Issue: https://github.com/CiscoDevNet/terraform-provider-intersight/issues/231
  # organization {
  #   object_type = "organization.Organization"
  #   moid = data.intersight_organization_organization.org.results[0].moid
  # }
  dynamic "tags" {
    for_each = local.os_tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
  catalog {
    moid        = local.catalog_moid
    object_type = "softwarerepository.Catalog"
    # selector    = "Name eq 'user-catalog' and Organization/Moid eq '${data.intersight_organization_organization.org.results[0].moid}'"
  }
  nr_source {
    object_type = local.os_object_type
    additional_properties = jsonencode({
      # HTTPS
      LocationLink = local.os_LocationLink
      Username     = local.os_Username
      Password     = local.os_Password
      # CIFS
      FileLocation = local.os_FileLocation
      MountOption  = local.os_cifs_MountOption
      # Username     = "" # Common with https
      # Password     = "" # Common with https
      # NFS
      # FileLocation = "" # Common with CIFS
      MountOptions = local.os_nfs_MountOptions
    })
  }
}