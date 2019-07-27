#!/usr/bin/env bash

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.chronicler
fi

ansible-playbook site.yaml -e state=absent

kubectl delete namespace/chronicler
