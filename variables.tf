# Required Variables
variable "do_token" {
  type = string
  description = "Digital Ocean API token. Set this in your tfvars file."
}

variable "ssh_keys" {
  type        = list(string)
  description = "SSH keys to use for the nodes. Set this in your tfvars file."
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster and its associated resources."
  default = "millennium-falcon"
}

variable "region" {
  type        = string
  description = "Region to deploy the cluster in."
  default = "syd1"
}

# vpc.tf variables
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
  default = "10.10.0.0/16"
}

# droplets.tf variables
variable "master_count" {
  type        = number
  description = "Number of master nodes."
  default = 1
}

variable "worker_count" {
  type        = number
  description = "Number of worker nodes."
  default = 2
}

variable "master_droplet_size" {
  type        = string
  description = "Size of the master nodes."
  default = "s-1vcpu-1gb"
}

variable "worker_droplet_size" {
  type        = string
  description = "Size of the worker nodes."
  default = "s-1vcpu-1gb"
}

variable "droplet_image" {
  type        = string
  description = "Image to use for the nodes."
  default = "ubuntu-22-04-x64"
}

# load_balancer.tf variables
variable "healthcheck_port" {
  type        = number
  description = "Port to use for the healthcheck."
  default = 22
}

variable "healthcheck_protocol" {
  type        = string
  description = "Protocol to use for the healthcheck."
  default = "tcp"
}
