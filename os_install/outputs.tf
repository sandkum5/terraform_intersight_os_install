output "os_install_moid" {
  value = data.intersight_os_install.response.results[0].moid
}

output "os_install_ErrorMsg" {
  value = data.intersight_os_install.response.results[0].error_msg
}

output "os_install_OperState" {
  value = data.intersight_os_install.response.results[0].oper_state
}