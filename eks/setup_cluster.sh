#!/bin/bash
aws sts get-caller-identity
aws eks update-kubeconfig --name ${1}
#create a service account:alb-ingress-controller
kubectl apply -f ./yml/rbac-role.yaml
#create a controller
kubectl apply -f ./yml/alb-ingress-controller.yaml

#kubectl edit deployment.apps/alb-ingress-controller -n kube-system
