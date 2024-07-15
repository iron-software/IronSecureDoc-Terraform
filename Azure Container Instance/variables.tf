variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
  default     = "iron-securedoc-rg"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "southeastasia"
}

variable "container_group_name" {
  type        = string
  description = "Name of the container group."
  default     = "ironsd-container-group"
}

variable "container_name" {
  type        = string
  description = "Name of the container."
  default     = "ironsd-container"
}

variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
  default     = "ironsoftwareofficial/ironsecuredoc:latest"
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 8080
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
  default     = 1
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
  default     = 1
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}

variable "dns_name_label" {
  type        = string
  description = "The fully qualified domain name for the container group."
  default     = "ironsd"
}

variable "pdf_max_size_mb" {
  type        = number
  description = "The maximum size of a PDF file that can be processed by IronSecureDoc in megabytes."
  default     = 30
}

variable "request_timeout_seconds" {
  type        = number
  description = "The maximum time in seconds that IronSecureDoc will wait for a request to complete."
  default     = 5
}

variable "allowed_origins" {
  type        = string
  description = "Comma-separated list of allowed origins for the web application."
  default     = "*" # Allow all origins, but you should restrict this to only the origins you need for security. e.g., "https://myapp.azurewebsites.net,https://myapp2.azurewebsites.net"  
}

variable "api_environment" {
  type        = string
  description = "The environment for the API."
  default     = "Production"  
}

variable "license_key" {
  type        = string
  sensitive   = true
  description = "The license key for IronSecureDoc."
}