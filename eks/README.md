# EKS

El siguiente proyecto de terraform permite crear un cluster en AWS [AWS Service](https://aws.amazon.com).

# Variables importantes
Estas son las variables que se tienen que definir si o si para que el script funciones
```
// General
//Nombre del proyecto
variable name {}
// Nombre del cluster
variable cluster_name {}
//Region
variable region {}

//Network
// VPC id
variable vpc_id {}
// Lista de subnets donde los nodos van a existir
variable private_subnet {}

//Nodos
//Configuracion del nodo
variable node_group{
   type = list(object({
      node_group_name = string
      instance_types = list(string)
      tags = map(any)
      labels = map(any)
      disk_size = number
      scaling_config = object({
      	desired_size = number
      	max_size = number
      	min_size = number
      })
  }))
 ```

### Ejemplo configuracion de un nodo
 ```
 node_group = [
  {
    node_group_name = "node_group01",
    instance_types = ["t2.medium"],
    tags = {
      "Created" = "terraform",
      "Name" = "node_group01",
      "env" = "prod"
    },
    labels = {
      "app" = "app01",
      "env" = "prod",
    },
    disk_size = 30,
    scaling_config = {
      desired_size = 1,
      max_size = 2,
      min_size = 1,
    }
  },
  {
    node_group_name = "node_group02",
    instance_types = ["t2.micro"],
    tags = {
      "Created" = "terraform",
      "Name" = "node_group02",
      "env" = "prod"
    },
    labels = {
      "app" = "app02",
      "env" = "dev",
    },
    disk_size = 30,
    scaling_config = {
      desired_size = 1,
      max_size = 2,
      min_size = 1,
    }
  }
]
  ```

# Variables Opcionales

```
//  
variable has_endpoint_public_access {
  default=true
}
variable has_endpoint_private_access {
   default = false
}
```  

# Consideraciones
La vpc seleccionada debera tener habilitada enableDnsHostnames y enableDnsSupport, para mas informacion en el siguiente [link](https://docs.aws.amazon.com/es_es/vpc/latest/userguide/vpc-dns.html)


# Setup

Se debe ejecutar esto la primera vez, los nombres de variables las toma del archivo  ***terraform.tfvars*** 

```
terraform init
terraform apply -auto-approve
./setup_cluster.sh
```
ejecutar el comando
```
kubectl edit deployment.apps/alb-ingress-controller -n kube-system
```
Agregar cerca de la linea 42 y agregar los campos *cluster=name*, *aws-vpc-id* y *aws-region*
```
 38     spec:
 39       containers:
 40       - args:
 41         - --ingress-class=alb
 42         - --cluster-name=$(NOMBRE DEL CLUSTER)
 43         - --aws-vpc-id=$(VPC ID)
 44         - --aws-region=$(REGION)
```

Si todo sale bien, podemos revisar con el comando
```
kubectl get pods -n kube-system
```

Y se debe desplegar algo parecido a esto
```
NAME                                      READY   STATUS    RESTARTS   AGE
alb-ingress-controller-55b5bbcb5b-bc8q9   1/1     Running   0          56s
```

# FAQ

¿Cómo puedo ver los logs del alb ingress?
```
kubectl logs -n kube-system   deployment.apps/alb-ingress-controller
```

¿Cómo puedo autenticarme?
```
aws sts get-caller-identity
aws eks update-kubeconfig --name ${NOMBRE DEL CLUSTER}
```
¿En cuales redes se genera la ELB internas y externas ?
Para las subredes publicas o donde se genera el public ELB se debe agregar el tag: **kubernetes.io/role/elb=1**
Para las subredes privadas o donde van estar los ELB internos se debe agregar el siguiente tag **kubernetes.io/role/internal-elb=1**
Esto se genera automaticamente con el script setup_cluster.sh
