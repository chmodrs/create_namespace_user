resource "kubernetes_service_account" "deploy_user" {
  depends_on = [kubernetes_namespace.namespace]
  metadata {
    name      = "deploy-user"
    namespace = var.namespace
  }
}

resource "kubernetes_role" "deploy_user_full_access" {
  metadata {
    name      = "deploy-user-full-access"
    namespace = var.namespace
  }

  rule {
    api_groups = ["", "extensions", "apps", "networking.istio.io"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  rule {
    api_groups = ["batch"]
    resources  = ["jobs", "cronjobs"]
    verbs      = ["*"]
  }
}

resource "kubernetes_role_binding" "deploy_user_view" {
  metadata {
    name      = "deploy-user-view"
    namespace = var.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.deploy_user_full_access.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.deploy_user.metadata.0.name
    namespace = var.namespace
  }
}

data "kubernetes_secret" "deploy_user_secret" {
  metadata {
    name      = kubernetes_service_account.deploy_user.default_secret_name
    namespace = var.namespace
  }
}

output "deploy_user_token" {
  sensitive = true
  value     = lookup(data.kubernetes_secret.deploy_user_secret.data, "token")
}