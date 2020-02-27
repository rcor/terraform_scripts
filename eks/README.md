eks


aws sts get-caller-identity

aws eks update-kubeconfig --name lab

kubectl apply -f deployment.yml
kubectl expose deployment whoami --type=LoadBalancer --name=whoa mi-service
