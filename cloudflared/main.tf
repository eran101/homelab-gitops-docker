resource "docker_container" "cloudflared" {
  name  = var.container_name 
  image = var.image_name
  network_mode = var.network_mode
  command = [
    "tunnel",
    "--no-autoupdate",
    "run",
    "--token",
    var.tunnel_token
  ]
}
