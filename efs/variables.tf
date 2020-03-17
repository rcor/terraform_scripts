variable region {}
variable creation_token {}
variable name {}
variable vpc_id {}
variable sg_env {}
variable subnets {}
variable encrypted {
  type = bool
  default = false
}
variable performance_mode {
  type = string
  default = "generalPurpose" // posible values "generalPurpose" or "maxIO"
}

variable tags  {
    default = {
      "Type" = "efs"
    }
}
