module "kafka" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = var.namespace
  repository = "https://charts.bitnami.com/bitnami"

  app = {
    name             = var.name
    version          = var.chart_version
    chart            = "kafka"
    create_namespace = var.create_namespace
    force_update     = var.force_update
    wait             = false
    recreate_pods    = false
    deploy           = 1
  }

  set = var.helm_set
}
