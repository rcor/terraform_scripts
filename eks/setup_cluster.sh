#!/bin/bash
./update_vpc_tags.sh
name=$(eval "terraform output name");
aws sts get-caller-identity
echo 'Update Kubeconfig'
eval "aws eks update-kubeconfig --name $name"
echo 'create a service account:alb-ingress-controller'
kubectl apply -f ./yml/rbac-role.yaml
echo 'create an ingress create a controller'
kubectl apply -f ./yml/alb-ingress-controller.yaml
echo 'install metrics'
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
kubectl get deployment metrics-server -n kube-system

#kubectl edit deployment.apps/alb-ingress-controller -n kube-system
