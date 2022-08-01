# Docker Ansible

[Docker-Ansible](https://github.com/kartoza/docker-ansible) is a project for running an ansible controller in a docker container. This allows the controller to be used on windows and avoids issues with environment specific configuration or possible collisions, making it possible to use ansible playbooks for consistent and reliable deployments on VPS and BareMetal instances.

The [Kartoza Playbooks](https://github.com/kartoza/playbooks.git) is used for company maintained playbooks.

## Prerequisites

Ensure beforehand that you have ssh access to the relevant host, and replace the relevant server details in the host config etc. as outlined in the following commans. By default, Docker-Ansible will attempt to use the ssh configuration files from the host to perform operations.

## Procedure

The following example shows bash commands on how to create a new docker-based host. Ensure beforehand that you have ssh access to the host and replace the relevant server details in the host config etc.

```bash
git clone https://github.com/kartoza/docker-ansible.git
cd docker-ansible/ansible
rm -r playbooks
git clone https://github.com/kartoza/playbooks.git
echo 123.456.78.90 ansible_user=root ansible_private_key_file=/root/.ssh/id_ed25519 > inventory/hosts.ini
cd ..
docker build . -t ansible
docker run -dt -v $PWD/ansible:/ansible \
           -v ~/.ssh:/root/.ssh:ro \
           -e ANSIBLE_CONFIG=/ansible/ansible.cfg \
           --restart=unless-stopped \
           --name ansible ansible
docker exec -it ansible ansible-playbook /ansible/playbooks/ubuntu20.04/app/docker-ce.yaml -u iamgroot -k
```

## Cleanup

Once the task has run to completion you can always output the logs from the docker container to a file, e.g. `docker logs ansible > ansible-output.log`

Remove the container `docker stop ansible && docker rm ansible`

If desired, remove the docker-ansible directory. To purge the docker image use `docker image rm ansible`.

## Troubleshooting

If you encounter permissions or ssh access errors, try setting `-v ~/.ssh:/root/.ssh:ro` to `-v ~/.ssh:/root/win-ssh:ro`

If ansible struggles to gather facts or stumbles into connection issues, using the ping command will allow you to verify whether the issue is connectivity related (e.g. ssh keys etc) or system specific.

Simply ping your host to check the response `docker exec -it ansible ansible -m ping 123.456.78.90`.

Otherwise you can always attach to the ansible controller shell with `docker exec -it ansible /bin/bash` and then troubleshoot from there, e.g. try ssh `ssh 123.456.78.90`, or check file permissions with `ls -alh /root/.ssh/`
