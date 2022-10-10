
variable "location" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist."
  default     = "West Europe"
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