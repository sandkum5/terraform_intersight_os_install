locals {
  catalog_moid = [for c in data.intersight_softwarerepository_catalog.repo_catalog.results : c if c.organization[0].moid == data.intersight_organization_organization.org.results[0].moid][0].moid
}

locals {
  model    = yamldecode(file("repo.yml"))
  os_repo  = local.model.data.os_repo
  scu_repo = local.model.data.scu_repo
}

locals {
  os_repo_type   = local.os_repo.type
  os_name        = local.os_repo.name
  os_nr_version  = local.os_repo.nr_version
  os_vendor      = local.os_repo.vendor
  os_description = local.os_repo.description
  os_tags        = try(local.os_repo.tags, [])

  os_object_type_https = local.os_repo_type == "https" ? "softwarerepository.HttpServer" : null
  os_object_type_cifs  = local.os_repo_type == "cifs" ? "softwarerepository.CifsServer" : null
  os_object_type_nfs   = local.os_repo_type == "nfs" ? "softwarerepository.NfsServer" : null
  os_object_type       = coalesce(local.os_object_type_https, local.os_object_type_cifs, local.os_object_type_nfs)

  # HTTP Path
  os_LocationLink = local.os_repo_type == "https" ? local.os_repo.iso_path : null

  # CIFS or NFS Path
  os_cifs_filelocation = local.os_repo_type == "cifs" ? local.os_repo.iso_path : null
  os_nfs_filelocation  = local.os_repo_type == "nfs" ? local.os_repo.iso_path : null
  os_FileLocation      = try(coalesce(local.os_cifs_filelocation, local.os_nfs_filelocation), null)

  os_https_user = local.os_repo_type == "https" ? local.os_repo.user : null
  os_cifs_user  = local.os_repo_type == "cifs" ? local.os_repo.user : null
  os_Username   = try(coalesce(local.os_https_user, local.os_cifs_user), null)
  # Username = try(local.os_repo.user, null)

  os_https_password = local.os_repo_type == "https" ? local.os_repo.password : null
  os_cifs_password  = local.os_repo_type == "cifs" ? local.os_repo.password : null
  os_Password       = try(coalesce(local.os_https_password, local.os_cifs_password), null)
  # Password = try(local.os_repo.password, null)

  # For CIFS, leave the field blank or enter one or more comma seperated options from the following. For Example, \" \" , \" soft \" , \" soft , nounix \" . * soft. * nounix. * noserviceino. * guest. * USERNAME=VALUE. * PASSWORD=VALUE. * sec=VALUE (VALUE could be None, Ntlm, Ntlmi, Ntlmssp, Ntlmsspi, Ntlmv2, Ntlmv2i)
  os_cifs_MountOption = try(local.os_repo.cifs_mount_option, null)

  # For NFS, leave the field blank or enter one or more comma seperated options from the following.For Example, \" \" , \" ro \" , \" ro , rw \" . * ro. * rw. * nolock. * noexec. * soft. * PORT=VALUE. * timeo=VALUE. * retry=VALUE.
  os_nfs_MountOptions = try(local.os_repo.nfs_mount_option, null)
}

locals {
  scu_repo_type        = local.scu_repo.type
  scu_name             = local.scu_repo.name
  scu_nr_version       = local.scu_repo.nr_version
  scu_supported_models = local.scu_repo.supported_models
  scu_description      = local.scu_repo.description
  scu_tags             = try(local.scu_repo.tags, [])

  scu_object_type_https = local.scu_repo_type == "https" ? "softwarerepository.HttpServer" : null
  scu_object_type_cifs  = local.scu_repo_type == "cifs" ? "softwarerepository.CifsServer" : null
  scu_object_type_nfs   = local.scu_repo_type == "nfs" ? "softwarerepository.NfsServer" : null
  scu_object_type       = coalesce(local.scu_object_type_https, local.scu_object_type_cifs, local.scu_object_type_nfs)

  # HTTP Path
  scu_LocationLink = local.scu_repo_type == "https" ? local.scu_repo.iso_path : null

  # CIFS or NFS Path
  scu_cifs_filelocation = local.scu_repo_type == "cifs" ? local.scu_repo.iso_path : null
  scu_nfs_filelocation  = local.scu_repo_type == "nfs" ? local.scu_repo.iso_path : null
  scu_FileLocation      = try(coalesce(local.scu_cifs_filelocation, local.scu_nfs_filelocation), null)

  scu_https_user = local.scu_repo_type == "https" ? local.scu_repo.user : null
  scu_cifs_user  = local.scu_repo_type == "cifs" ? local.scu_repo.user : null
  scu_Username   = try(coalesce(local.scu_https_user, local.scu_cifs_user), null)
  # Username = try(local.scu_repo.user, null)

  scu_https_password = local.scu_repo_type == "https" ? local.scu_repo.password : null
  scu_cifs_password  = local.scu_repo_type == "cifs" ? local.scu_repo.password : null
  scu_Password       = try(coalesce(local.scu_https_password, local.scu_cifs_password), null)
  # Password = try(local.scu_repo.password, null)

  # For CIFS, leave the field blank or enter one or more comma seperated options from the following. For Example, \" \" , \" soft \" , \" soft , nounix \" . * soft. * nounix. * noserviceino. * guest. * USERNAME=VALUE. * PASSWORD=VALUE. * sec=VALUE (VALUE could be None, Ntlm, Ntlmi, Ntlmssp, Ntlmsspi, Ntlmv2, Ntlmv2i)
  scu_cifs_MountOption = try(local.scu_repo.cifs_mount_option, null)

  # For NFS, leave the field blank or enter one or more comma seperated options from the following.For Example, \" \" , \" ro \" , \" ro , rw \" . * ro. * rw. * nolock. * noexec. * soft. * PORT=VALUE. * timeo=VALUE. * retry=VALUE.
  scu_nfs_MountOptions = try(local.scu_repo.nfs_mount_option, null)
}