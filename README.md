[![published](https://static.production.devnetcloud.com/codeexchange/assets/images/devnet-published.svg)](https://developer.cisco.com/codeexchange/github/repo/sandkum5/terraform_intersight_os_install)
# Install OS on UCS servers using terraform Intersight provider

* This module installs an OS on a UCS Server using terraform intersight provider

## Dirs
- create_repos
  - To create an Operating System(OS) and Server Configuration Utility(SCU) repos

- os_install
  - To Trigger Operating System(OS) Install Workflow

- get_install_status
  - To get the Install status based on last triggered os_install workflow Moid

## Below is a list of policies created as part of the process:
- Operating Systems Image repo
- Server Configuration Utilities repo
- Install Operating system

## Requirements
* Terraform v1.3.6
* Intersight Provider version 1.0.34
* git

## Usage
* Create an account in intersight.com.
* Login to Intersight, go to settings and generate API key. Download the SecretKey.txt file and copy the API key.
* Download and install Terraform
<https://www.terraform.io/downloads.html>
* Clone the repository
```txt
git clone https://github.com/sandkum5/terraform_intersight_os_install.git

To create OS and SCU Repos:
cd terraform_intersight_os_install/create_repos

To Trigger OS installation Workflow:
cd terraform_intersight_os_install/os_install
```

* Copy the v2 SecretKey.txt file in the os_install directory.
* Add the ApiKey.txt and SecretKey.txt file paths under terraform.tfvars file and the rest of the environment variables in the `os_install.yml` file.

* Initialize Terraform.
  Note: This step automatically downloads intersight provider plugin.

```txt
terraform init
```

* Create Terraform exacution plan

```txt
terraform plan
```

* Apply the configuration

```txt
terraform apply
```

When asked to enter a value, enter **"yes"**.

* Destroy the Terraform managed infrastructure

```txt
terraform destroy
```

To get more details on Intersight, terraform provider for intersight, how to create an intersight account, how to Generate API keys, refer:
https://www.cisco.com/c/en/us/products/collateral/servers-unified-computing/ucs-c-series-rack-servers/2201041-intersight-terrafirma-wp.html

## Note
- As OS Install is transactional workflow, the target resource can't be modified/deleted. We may get the following warning:
  `Warning: OsInstall does not allow delete functionality`
- When OS installation fails, we can check Intersight GUI under requests to identify the step where it failed.
- To retrigger the installation, first delete the last instance of OS_Install resource for the same server.
  `terraform state list` - to list resources
  `terraform state rm intersight_os_install.os_install` - to remove intersight_os_install.os_install resource


### Additional intersight modules:
https://github.com/CiscoDevNet/intersight-terraform-modules

https://github.com/sandkum5/terraform-intersight-hx-edge-deploy

https://github.com/sandkum5/intersight-terraform-C-Series

