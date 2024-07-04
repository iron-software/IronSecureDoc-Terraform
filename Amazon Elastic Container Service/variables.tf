variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "load_balancer_name" {
  description = "Name of the load balancer"
  default     = "load-balancer-dev"
}

variable "target_group_name" {
  description = "Name of the target group"
  default     = "target-group-dev"  
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  default     = "app-cluster"
}

variable "task_family" {
  description = "Name of the ECS task family"
  default     = "app-first-task"  
}

variable "image" {
  description = "Docker image"
  default     = "ironsoftwareofficial/ironsecuredoc"
}

variable "container_port" {
  description = "Port to expose"
  default     = 8080
}

variable "container_cpu" {
  description = "CPU units for the container (in MiB, 1024 CPU units = 1 vCPU core). Recommended to set at least 256 CPU units"
  default     = 512  
}

variable "container_memory" {
  description = "Memory for the container (in MiB). Recommended to set at least 512MB"
  default     = 1024  
}

variable "container_allowed_origins" {
  description = "Allowed origins for the container. Use comma separated values, or `all` for all origins"
  default     = "all"
}

variable "container_environment" {
  description = "Environment for the container. Including Development, Staging, and Production."
  default     = "Production"  
}

variable "license_key" {
  description = "License key for the IronSecureDoc"
  sensitive   = true
}

variable "service_name" {
  description = "Name of the ECS service"
  default     = "app-service"  
}

variable "service_desired_count" {
  description = "Number of containers to run in the service"
  default     = 1  
}
