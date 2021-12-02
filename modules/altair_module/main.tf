resource "kubernetes_deployment_v1" "simple-deployment" {
  metadata {
    name = "${var.name}-deployment"
    labels = {
      app = var.name
    }
    namespace = var.namespace
  }

  spec {

    replicas = var.replicas

    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {
        container {
          image = var.image
          name  = var.name
          port {
            container_port = var.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simple-service" {
  metadata {
    name      = "${var.name}-service"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = var.name
    }
    port {
      port        = 80
      target_port = var.port
    }
    type = "LoadBalancer"
  }
}
