variable "location" {
  default = "australiaeast"
}
variable "resource_group_name" {
  default = "week6"
}

variable "application_port" {
  default = 8080
}
variable "dbname_prod" {
  default = "psqlservice"
}
variable "dbname_stage" {

  default = "psqlservice-stage"
}
variable "secret" {
  default = "Alex310224993"
}

