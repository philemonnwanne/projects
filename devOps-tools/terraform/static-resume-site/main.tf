# Specify Docker provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Start an Nginx container accessible on port 8080 on the host
resource "docker_container" "resume" {
  name  = "resume"
  image = "nginx:alpine"

  ports {
    internal = "80"
    external = "8084"
  }
  volumes {
  host_path = "/Users/philemonnwanne/AltSchool/test"
  container_path = "/usr/share/nginx/html"
  read_only = true
  }
  
}
