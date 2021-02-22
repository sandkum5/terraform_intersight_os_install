# Install OS on UCS servers using terraform Intersight provider

* This module installs an OS on a UCS Server using terraform intersight provider

## Below is a list of policies created as part of the process: 
- Operating Systems Image repo
- Server Configuration Utilities repo
- Install Operating system 

## Requirements
* Terraform v0.14.2 
* git 

## Usage
* Create an account in intersight.com. 
* Login to Intersight, go to settings and generate API key. Download the SecretKey.txt file and copy the API key. 
* Download and install Terraform
<https://www.terraform.io/downloads.html>
* Clone the repository
```txt
git clone https://github.com/sandkum5/terraform_intersight_os_install.git
cd os_install
```

* Copy the SecretKye.txt file in the hx-edge directory. 
* Add the API Key to the api_key variable and the rest of the environment variables in the `<env>`.tfvars template files. Filename can be re-named as `<new-filename>`.tfvars.

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


## Terraform Workspaces 
* Use terraform workspaces to reuse the same config file for different environments. 

* Create a new workspace : 
```txt
  terraform workspace new WORKSPACE_NAME      # creates and moves to the new workspace 
```
* To list workspaces     
```txt
  terraform workspace list          # "*" indicates the current selected workspace
```
* To switch workspace    
```txt
terraform workspace select WORKSPACE_NAME     # Move to a different namespace
```

* Create a separate <env_name>.tfvars file for each environment 
* Use below commands in the respective workspace to create the policies. 
```txt
terraform plan -var-file=<env_name>.tfvars   
terraform apply -var-file=<env_name>.tfvars
```
* Use the provided sample env.tfvars template for all the environment variables configuration. 



### Additional intersight modules: 
https://github.com/CiscoDevNet/intersight-terraform-modules

https://github.com/sandkum5/terraform-intersight-hx-edge-deploy

https://github.com/sandkum5/intersight-terraform-C-Series

