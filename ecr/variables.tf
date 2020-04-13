variable region {}
variable name {}

variable profile{
  default = "default"
}
variable repositories{
   type = list(object({
      name = string
      image_tag_mutability  = string
      scan_on_push = bool
      tags = map(any)
  }))
   description = "Repositories ECR"
   default=[{
       name = "default"
       image_tag_mutability  = "MUTABLE"
       scan_on_push = false
       tags = {
            "default" = "terraform"
       }
     }]
}
