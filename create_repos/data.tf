data "intersight_organization_organization" "org" {
  name = var.org_name
}

data "intersight_softwarerepository_catalog" "repo_catalog" {
  name = "user-catalog"
  # filter = "Organization/Moid eq '${data.intersight_organization_organization.org.results[0].moid}'"
}

# output "catalog_data" {
#   # value = data.intersight_softwarerepository_catalog.repo_catalog.results
#   value = [for s in data.intersight_softwarerepository_catalog.repo_catalog.results : s if s.organization[0].moid == data.intersight_organization_organization.org.results[0].moid][0].moid
# }