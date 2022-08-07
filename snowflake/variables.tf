variable "user_role_name" {
  type = string
  default = "SYSADMIN"
}

variable "create_db" {
  type = bool
  default = false
}

variable "db_name" {
  type = string
}

variable "create_wh" {
  type = bool
  default = false
}

variable "wh_name" {
  type = string
}

variable "wh_size" {
  type = string
  default = "xsmall"

  validation {
    condition = contains(["xsmall", "small", "medium", "large", "xlarge", "xxlarge", "xxxlarge"], var.wh_size)
    error_message = "Valid values for warehouse size: [\"xsmall\", \"small\", \"medium\", \"large\", \"xlarge\", \"xxlarge\", \"xxxlarge\"]."
  }
}

variable "min_wh_size" {
  type = number
  default = 1
}

variable "max_wh_size" {
  type = number
  default = 1
}

variable "create_schema" {
  type = bool
  default = false
}

variable "schema_db_name" {
  type = string
}

variable "schema_name" {
  type = string
}

variable "create_role" {
  type = bool
  default = false
}

variable "role_name" {
  type = string
}

variable "create_role_grants" {
  type = bool
  default = false
}

variable "role_grants_role_name" {
  type = string
}

variable "role_grants_roles" {
  type = set(string)
}

variable "role_grants_users" {
  type = set(string)
}

variable "create_database_grant" {
  type = bool
  default = false
}

variable "database_grant_database_name" {
  type = string
}

variable "database_grant_privilege" {
    type = string
}

variable "database_grant_roles" {
  type = set(string)
}

variable "create_warehouse_grant" {
  type = boolean
  default = false
}

variable "warehouse_grant_warehouse_name" {
  type = string
}

variable "warehouse_grant_privilege" {
  type = string
}

variable "warehouse_grant_roles" {
  type = set(string)
}
