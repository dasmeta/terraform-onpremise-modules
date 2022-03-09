module "grafana-loki" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "loki"
  repository = "https://grafana.github.io/loki/charts"

  app = {
    name             = var.name
    version          = var.chart_version
    chart            = "loki-stack"
    create_namespace = var.create_namespace
    force_update     = var.force_update
    wait             = var.wait
    recreate_pods    = var.recreate_pods
    deploy           = var.deploy
  }

  values = [
    templatefile("${path.module}/values.yaml", { resources_requests_cpu = "${var.resources_requests.cpu}", resources_requests_memory = "${var.resources_requests.memory}", resources_limits_cpu = "${var.resources_limits.cpu}", resources_limits_memory = "${var.resources_limits.memory}" })
  ]

  set = [
    {
      name  = "grafana.enabled"
      value = var.grafana_enabled
    }
  ]
}
