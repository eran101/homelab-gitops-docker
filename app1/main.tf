variable "image_name" {
  description = "The Docker image to use"
  type        = string
  default     = "cloudflare/cloudflared:2025.2.1-arm64"
}

variable "container_name" {
  description = "The name of the Docker container"
  type        = string
  default     = "cloudflared"
}

variable "cloudflared_token" {
  description = "cloudflared token"
  type        = string
}

variable "command" {
  description = "Docker container command"
  type        = string
  default     = "tunnel --no-autoupdate run --token"
}

locals {
  full_command = "${var.command} ${var.cloudflared_token}"
}

resource "docker_container" "cloudflared" {
  name    = var.container_name
  image   = var.image_name
  command = var.full_command
}