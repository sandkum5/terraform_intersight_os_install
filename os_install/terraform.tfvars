# Intersight Access API Key
# Common
org_name = "default"
server_serial = "FCxxxxxx"
os_config_file = "ESXi7.0ConfigFile"

os_repo_name = "os_repo_esxi"
scu_repo_name = "scu_6.1.3c"

# os_install
# Configuration Source : Cisco
# Configuration File :
# ESXi  : ESXi6.7ConfigFile, ESXi6.5ConfigFile,
# Redhat: RHEL8ConfigFile, RHEL7ConfigFile
# Ubuntu: No cisco provided config
# Windows: Windows2019ConfigFile, Windows2016ConfigFile
os_hostname       = "tf-custom-esxi1"
os_ip_config_type = "static"

## OS IP Info
os_ipv4_addr         = "x.x.x.156"
os_ipv4_netmask      = "255.255.248.0"
os_ipv4_gateway      = "x.x.x.1"
os_ipv4_dns_ip       = "x.x.x.1"
os_root_password     = "Password"
os_answers_nr_source = "Template" # Template for cisco provided source files
