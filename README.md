# Terraform Container Deployment

This repository contains Infrastructure as Code (IaC) scripts using Terraform for deploying containerized applications on cloud services. The current configurations focus on deploying the IronSecureDoc container image, available on Docker Hub, to Amazon Elastic Container Service (Amazon ECS) and Azure Container Instance.

## Docker Image

The Docker image used in this repository is IronSecureDoc, which is hosted on Docker Hub. You can find the image at [ironsoftwareofficial/ironsecuredoc](https://hub.docker.com/r/ironsoftwareofficial/ironsecuredoc). This image is designed to provide a secure document management solution that can be easily deployed to cloud environments.

## Overview

The goal of this repository is to provide a set of Terraform scripts that simplify the process of deploying, managing, and scaling the IronSecureDoc application across different cloud providers. By leveraging Terraform, we can ensure that our infrastructure is reproducible, scalable, and manageable through code.

## Contents

This repository is organized into directories corresponding to each cloud service provider. Each directory contains a README with detailed instructions on how to deploy the IronSecureDoc container instance using Terraform for that specific provider.

- **Amazon Elastic Container Service (Amazon ECS):** Deploy the IronSecureDoc container instances in Amazon ECS using Terraform. This includes setting up AWS IAM Deployer User Account, configuring Terraform variables and secrets, and running Terraform commands to initialize, plan, and apply the execution plan.

- **Azure Container Instance:** Use Terraform to deploy the IronSecureDoc Docker container in Azure, making it available with a public IP address and FQDN. This includes modifying resource names, setting up Azure Container Registry credentials, and executing Terraform commands for deployment.

## Prerequisites

Before you can use the Terraform scripts in this repository, you must have the following installed:

- Terraform
- AWS CLI (for Amazon ECS deployments)
- Azure CLI (for Azure Container Instance deployments)

Please refer to the README in each directory for specific prerequisites and detailed instructions.

## Getting Started

To get started with deploying the IronSecureDoc container instances using Terraform, navigate to the directory of the cloud service provider you wish to use. Follow the instructions in the README to set up your environment and deploy the IronSecureDoc containerized application.
