
variable "location" {
  type        = map(string)
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist."
  default = {
    name  = "West Europe"
    short = "westeu"
    mini  = "weu"
  }
}

variable "scope" {
  type = string
}

variable "instance" {
  type        = string
  description = ""
  default     = "001"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}