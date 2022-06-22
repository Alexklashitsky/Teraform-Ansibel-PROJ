# variable "base_name" {
#   type = string

# }
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "privete_subnet_id" {
  type = string
}

# variable "privete_dns_link" {
#   type = string
# }
variable "vnet_id" {
  #   type = string
}
# variable "dns_link" {
#   type = string
# }



variable "dbname_prod" {
  default = "psqlservice"
}
variable "dbname_stage" {

  default = "psqlservice-stage"
}

