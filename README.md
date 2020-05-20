# terraform_scripts


## Proyectos

### BaseVPC
Te permite crear una VPC en AWS, con diferentes configuraciones

### S3_website
Permite crear sitios web usando S3

### cloudfront_s3
Permite crear sitios web con AWS cloudfront, un nivel un poco mas avanzado que **S3_Website**

### efs
Permite crear discos EFS dentro de la infraestructura

### EKS
Te permite crear un Cluster de EFS desde cero con la menor cantidad de pasos posibles


## FAQ

*Como guardar el tf state?*
Dentro del archivo state.tf, se debe agregar los siguientes archivos:

```
terraform {
  backend "s3" {
    bucket = ""
    key = ""
    region = ""
  }
}

```
