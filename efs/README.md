# EFS

El siguiente proyecto de terraform permite varios EFS en AWS [AWS Service](https://aws.amazon.com).

# Variables importantes
Estas son las variables que se tienen que definir si o si para que el script funciones

```
//Region
variable region {}
variable creation_token {}
variable name {}
variable vpc_id {}
# all the host with the follow SG can get access to EFS
variable sg_env {}
# List of subnet avalaible
variable subnet {}
```

# Variables opcionales
Estas variables son opcionales
```
variable tags {
  default = {
    Created = "terraform"
  }
}

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
```
