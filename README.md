Ansible Role - matildapeak.chronicler
=====================================

A Role for the installation of the Matilda Peak **chronicler** application
into a Kubernetes (or OpenShift) cluster.

Requirements
------------

-   Kubernetes or OpenShift 

Role Variables
--------------

    # The image tag and pull policy
    image_tag: stable
    image_pull_policy: IfNotPresent
    
    # The port to expose the application service on
    service_port: 9090
    # Port for outbound connections
    outbound_port: 9090
    # The runner key.
    # Runners present this toi gain connections
    runner_key: got20190415
    
    # To uninstall from the cluster
    # set state: absent
    state: present
    
    # NOTE: meta.name(space) comes from CR metadata
    #       when run with Ansible Operator
    #       deploy/crds has an example CR for reference
    name: "{{ meta.name|default('chronicler') }}"
    namespace: "{{ meta.namespace|default('chronicler') }}"

Dependencies
------------

-   (none)

Example Playbook
----------------

**NOTE** The example below assumes that you have a running Kubernetes|OpenShift
cluster and that you have sufficient permissions in the `chronicler` namespace.

    - hosts: servers
      tasks:
      - include_role:
          name: matildapeak.chronicler
        vars:
          image_tag: latest
          image_pull_policy: Always

>   When deploying to Kubernetes a `chronicler` namespace is created by default.

License
-------

GPLv3 License

Author Information
------------------

Developed by Matilda Peak for its **Emergent Behaviour Platform** (tm)
