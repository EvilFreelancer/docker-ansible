# Docker Ansible

Small universal image of Docker with Ansible tools for easy software deploy.

## About folders

* `ansible` : `/opt/ansible` - Required by Ansible files for work
* `scripts` : `/opt/scripts` - Collection of scripts for running via entrypoint of Docker

## How to build

    git clone https://github.com/EvilFreelancer/docker-ansible.git
    cd docker-ansible
    docker build . --tag ansible

## Okay, what next?

You need put your Ansible playbook and any other files which required
for normal work into the `ansible` folder. On build stage this folder
will be added into the container's `/opt` folder.

Next you need write some script (eg `run.sh`), which contain some
commands, for example:

```bash
#!/bin/bash

cd /opt/ansible/
ansible-playbook -i hosts site.yml
```

## How to run

That's easy, as any other Docker containers:

    docker run ansible run.sh

Where:

* ansible - is tag's name of our image
* run.sh - script name which should be executed

If you need demonized container, try this:

    docker run ansible

And container never stop, until you will not stop him (eg via `docker kill`).

## Small hack

In theory `docker run ansible *.sh` also must work, this command mean
what container should execute all files from `/opt/scripts` folder
with `.sh` suffix of filename.

Check the `entrypoint.sh` and you will get why.

# Links

* http://docs.ansible.com/ansible/latest/intro_installation.html
* https://www.ansible.com/overview/how-ansible-works
* https://hub.docker.com/r/evilfreelancer/docker-ansible/
