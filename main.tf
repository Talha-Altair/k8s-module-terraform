provider "kubernetes" {

  config_path    = "~/.kube/config"
  config_context = var.config_context

}

module "sample" {

  source = "./modules/altair_module"

  image     = "docker.io/nginx"
  name      = "ezio"
  namespace = "altair-ns"
  port      = 80
  replicas  = 2

}

output "ip" {

  value = module.sample.external_ip

}
