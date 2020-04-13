# ECR

El siguiente proyecto de terraform permite crear repositorioes de contenedores en docker  [AWS Service](https://aws.amazon.com).

# Variables importantes
Estas son las variables que se tienen que definir si o si para que el script funcione. El script permite crear varios repositorios simultaneamente

```

name = Name to use
region = Region to use
profile = profile to use || default value 'default'
repositories [{
   name = Nombre del repositorio
   image_tag_mutability  = MUTABLE || IMMUTABLE, default value is MUTABLE
   scan_on_push = true || false, default value false
   tags = map(any)
}]
```
