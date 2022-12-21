Tags = [{
    Key   = "Location"
    Value = "SJ"
  },
  {
    Key   = "ENV"
    Value = "PROD"
  }]

object_type = "https" # Options: https, cifs, nfs
enable_https = true
enable_cifs = false
enable_nfs = false

# create_os_repo
repo_name               = "os-repo"
repo_nr_version         = "ESXi 7.0"
repo_vendor             = "VMware"
repo_description        = "ESXi 7.0 Cisco Custom ISO"
repo_source_os_iso_path = "https://x.x.x.x/FILESERVER/storage/ISOs/VMware-ESXi-7.0.0-16324942-Custom-Cisco-4.1.2a.iso"

# Common attributes between OS/SCU Resources:
repo_source_cifs_mount_options = ""
repo_source_nfs_mount_options  = ""
repo_source_user               = "root"
repo_source_password           = "password"

# create_scu_repo
repo_source_scu_iso_path = "https://x.x.x.x/share/ucs-cxxx-scu-6.1.3c.iso"
scu_name                 = "scu-repo"
scu_description          = "SCU 6.1.3c for Demo"
scu_nr_version           = "6.1.3c"
scu_supported_models     = ["UCSC-C220-M5SX", "UCSC-C220-M5L", "UCSC-C220-M5SN", "HX220C-M5SX", "HXAF220C-M5SX" ]
