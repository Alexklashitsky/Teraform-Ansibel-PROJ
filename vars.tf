variable "location" {
  type    = string
  default = "australiaeast"
}
variable "resource_group_name" {
  type    = string
  default = "week6-stg"
}
# variable "resource_group_name_prod" {
#   default = "week6_prod"
# }

variable "application_port" {
  default = 8080
}
# variable "dbname_prod" {
#   default = "psqlservice"
# }
variable "dbname" {
  default = "psqlservice-stage"
}
variable "dbname_stage" {

  default = "psqlservice-stage"
  # prod    = "psqlservice"
}
variable "secret" {
  default = "coolpassword"
}

variable "admin_user" {
  default = "app"
}

variable "vm_count" {
  default = 2
  type    = number
}
variable "storage_account" {
  default = "backendstorage2022"
}

