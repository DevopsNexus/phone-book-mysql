#!/bin/bash

kubectl create secret generic app-config --from-file=config/dbsecret.py 
kubectl create secret generic mysql-credentials --from-literal=MYSQL_ROOT_PASSWORD=secret --from-literal=MYSQL_DATABASE=phonebook --from-literal=MYSQL_USER=app --from-literal=MYSQL_PASSWORD=qwer
kubectl create configmap nginx-config --from-file=phonebook-nginx.conf
