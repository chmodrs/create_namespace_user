#k8s cluster
variable "host" {}
variable "client_certificate" {}
variable "client_key" {}
variable "cluster_ca_certificate" {}
variable "namespace" {}

variable "wait" {
  type    = string
  default = "false"
}

variable "reuse_values" {
  type    = string
  default = "false"
}

variable "replace" {
  type    = string
  default = "false"
}

variable "debug" {
  type    = string
  default = "true"
}

variable "vertical" {
  type    = string
  default = ""
}

variable "time" {
  type    = string
  default = ""
}

variable "finalidade" {
  type    = string
  default = ""
}

variable "responsavel" {
  type    = string
  default = ""
}

variable "data" {
  type    = string
  default = "2022-00-00T00:00:00Z"
}