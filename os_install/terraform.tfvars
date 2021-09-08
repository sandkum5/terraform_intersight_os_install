# Intersight Access API Key
api_key    = "<your_api_key>"
secret_key = "SecretKey.txt"
endpoint   = "https://intersight.com"

# Common
# Tags
tags = {
  key1   = "DC"
  value1 = "SJ"
  key2   = "ENV"
  value2 = "LAB"
}

# create_os_repo  
repo_name               = "esxi_6.7.0_cisco_custom_iso"
repo_nr_version         = "ESXi 6.7 U3"
repo_vendor             = "VMware"
repo_description        = "ESXi 6.7 U3 Cisco Custom ISO" # # Options: check Intersight GUI     = "ESXi 6.7 U3 Cisco Custom ISO"
repo_source_os_iso_path = "https://x.x.x.x/path/to/iso/VMware_ESXi_6.7.0_14320388_Custom_Cisco_6.7.3.1.iso"

# Common attributes between OS/SCU Resources: 
repo_source_object_type        = "softwarerepository.HttpServer" # softwarerepository.HttpServer, softwarerepository.CifsServer, softwarerepository.NfsServer
repo_source_cifs_mount_options = ""
repo_source_nfs_mount_options  = ""
repo_source_user               = ""
repo_source_password           = ""

# create_scu_repo 
repo_source_scu_iso_path = "https://x.x.x.x/path/to/iso/ucs-cxxx-scu-6.1.2d.iso"
scu_name                 = "SCU-6.1.2d"
scu_description          = "SCU 6.1.2d for Lab"
scu_nr_version           = "6.1.(2d)"
scu_supported_models     = ["C-series", ]

# os_install
os_install_server_selector             = "$filter=Serial eq 'xxxxxxxxx'"
os_install_configuration_file_selector = "$filter=Name eq 'ESXi6.7ConfigFile'"
# Configuration Source : Cisco 
# Configuration File : 
# ESXi  : ESXi6.7ConfigFile, ESXi6.5ConfigFile, 
# Redhat: RHEL8ConfigFile, RHEL7ConfigFile
# Ubuntu: No cisco provided config
# Windows: Windows2019ConfigFile, Windows2016ConfigFile
os_hostname       = "tf-custom-esxi1"
os_ip_config_type = "static"

## OS IP Info
os_ipv4_addr         = "x.x.x.2"
os_ipv4_netmask      = "255.255.255.0"
os_ipv4_gateway      = "x.x.x.1"
os_ipv4_dns_ip       = "x.x.x.10"
os_root_password     = "Password123"
os_answers_nr_source = "Template" # Template for cisco provided source files

