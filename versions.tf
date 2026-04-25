terraform {
  required_version = ">= 1.0"
  required_providers {
    kind = { 
        source = "tehcyx/kind" 
        version = "0.11.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}