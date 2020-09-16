#!/bin/sh

sed 's/{{DEPLOYMENT_NAME}}/jenkins-deployment/g' ./jenkins-deployment.yaml | sed 's/{{CONTAINER_PORT}}/8080/g' | sed 's/{{IMAGE_NAME}}/jenkins:lts/g' > ./new/jenkins-deployment.yaml
sed 's/{{DEPLOYMENT_NAME}}/jenkins-deployment/g' ./jenkins-service.yaml | sed 's/{{SERVICE_NAME}}/jenkins-service/g' | sed 's/{{CONTAINER_PORT}}/8080/g' > ./new/jenkins-service.yaml
sed 's/{{DEPLOYMENT_NAME}}/jenkins-deployment/g' ./jenkins-ingress.yaml | sed 's/{{SERVICE_NAME}}/jenkins-service/g' | sed 's/{{CONTAINER_PORT}}/8080/g' | sed 's/{{INGRESS_NAME}}/jenkins-ingress/g' > ./new/jenkins-ingress.yaml

kubectl apply -f ./new