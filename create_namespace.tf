resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = {
      vertical                                    = var.vertical
      time                                        = var.time
      finalidade                                  = var.finalidade
      responsavel                                 = var.responsavel
      "lifecycle.cattle.io/create.namespace-auth" = true
      "cattle.io/status" = jsonencode(
        {
          Conditions = [
            {
              LastUpdateTime = "${var.data}"
              Message        = ""
              Status         = "True"
              Type           = "ResourceQuotaInit"
            },
            {
              LastUpdateTime = "${var.data}"
              Message        = ""
              Status         = "True"
              Type           = "InitialRolesPopulated"
            },
          ]
        }
      )
    }
    name = var.namespace
  }
}