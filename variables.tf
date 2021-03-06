variable "db_connection_string" {
  type        = string
  description = "Should look something like this - postgres://username:password@endpoint:port"
}

variable "tls_cert" {
  type        = string
  description = "The signed certificate for the Astronomer Load Balancer. It should be signed by a certificate authorize and should have common name *.base_domain"
}

variable "tls_key" {
  type        = string
  description = "The private key corresponding to the signed certificate tls_cert."
}

variable "local_umbrella_chart" {
  default = ""
  type    = string
}

variable "astronomer_version" {
  description = "verison of helm chart to use, do not include a 'v' at the front"
  default     = "0.9.2"
  type        = string
}

variable "astronomer_namespace" {
  default = "astronomer"
  type    = string
}

variable "gcp_default_service_account_key" {
  default = ""
  type    = string
}

# https://github.com/hashicorp/terraform/issues/1178
resource "null_resource" "dependency_getter" {
  triggers = {
    my_dependencies = "${join(",", var.dependencies)}"
  }
}

variable "dependencies" {
  default = [""]
  type    = list(string)
}

variable "astronomer_helm_values" {
  type        = "string"
  description = "Values in raw yaml to pass to helm to override defaults in Astronomer Helm Chart."
  default     = ""
}
