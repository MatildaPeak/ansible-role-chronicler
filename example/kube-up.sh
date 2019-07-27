#!/usr/bin/env bash

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.chronicler
fi

kubectl create -f namespace.yml
kubectl config set-context --current --namespace=chroncicler

ansible-playbook site.yaml
