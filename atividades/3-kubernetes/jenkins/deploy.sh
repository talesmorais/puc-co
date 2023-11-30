#!/bin/bash -e


kubectl apply -f k8s-jenkins.yaml

kubectl get cm aws-auth -o yaml -n kube-system > aws-auth.yaml
sed -i "s/node:{{EC2PrivateDNSName}}/serviceaccount:prod-infra:jenkins/" aws-auth.yaml
kubectl apply -f aws-auth.yaml