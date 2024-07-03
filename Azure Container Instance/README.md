# Deploy a container instance in Azure using the Terraform

Use [Terraform](https://learn.microsoft.com/en-us/azure/terraform) to deploy IronSecureDoc Docker container and make its available with a public IP address and FQDN.

## Prerequisites

- [Install and configure Terraform](https://learn.microsoft.com/en-us/azure/developer/terraform/quickstart-configure)
- [Authenticate Terraform to Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash)

## Modify all resource name

### Modify all resource name in `variables.tf`

- `resource_group_name`: Name of the resource group.
- `resource_group_location`: Location of the resource group. You can find the region from REGIONS.md use the second column to fill in this variable.
- `container_group_name`:  Name of the container group.
- `container_name`: Name of the container.
- `image_tag`: The tag of the image to deploy can be `latest` or any number.
- Other variables does not required to change.

### Create `secret.tfvars` to contains all sensitive data and fill below variables

#### Azure Container Registry

`main.tf` appends below after `dns_name_label = var.dns_name_label`:

```hcl
image_registry_credential {
  server   = var.registry_server
  username = var.registry_username
  password = var.registry_password
}
```

`variables.tf` adds:

```hcl
variable "registry_server" {
  type        = string
  sensitive   = false
  description = "The server for the container registry. Required if the image is stored in a private registry."
}

variable "registry_username" {
  type        = string
  sensitive   = true
  description = "Username for the container registry. Required if the image is stored in a private registry."  
}

variable "registry_password" {
  type        = string
  sensitive   = true
  description = "Password for the container registry. Required if the image is stored in a private registry."
  default     = "latest"
}
```

`secret.tfvars` adds:

```hcl
registry_server     = "<registry-name>.azurecr.io"
registry_username   = "YOUR-REGISTRY-USERNAME"
registry_password   = "YOUR-REGISTRY-PASSWORD"
license_key         = "YOUR-LICENSE-KEY"
```

#### Docker Hub

`secret.tfvars` adds:

```hcl
license_key         = "YOUR-LICENSE-KEY"
```

## Initialize Terraform

Run terraform init to initialize the Terraform deployment. This command downloads the Azure provider required to manage your Azure resources.

```Console
terraform init -upgrade
```

## Create a Terraform execution plan

Run [terraform plan](https://www.terraform.io/docs/commands/plan.html) to create an execution plan.

```Console
terraform plan -var-file="secret.tfvars" -out main.tfplan
```

## Apply a Terraform execution plan

Run [terraform apply](https://www.terraform.io/docs/commands/apply.html) to apply the execution plan to your cloud infrastructure.

```Console
terraform apply main.tfplan
```

## Verify the results

1. When you apply the execution plan, Terraform outputs the public IP address. To display the IP address again, run terraform output.

    ```Console
    terraform output -raw container_ipv4_address
    ```

    or display the FQDN.

    ```Console
    terraform output -raw container_fqdn
    ```

2. Use Postman or curl to validate. The result should return `pong`.

    ```bash
    curl http://<container_ipv4_address>:8080/v1/document-services/ping
    ```

    or use FQDN

    ```bash
    curl http://<container_fqdn>:8080/v1/document-services/ping
    ```

## Destroy the resource

- Create a execution plan for destroy resource

```Console
terraform plan -destroy -var-files="secret.tfvars" -out main.tfplan
```

- Apply a execution destroy plan

```Console
terraform apply main.tfplan
```
