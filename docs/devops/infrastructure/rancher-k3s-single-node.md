# Using Rancher, K3S, and Longhorn for single node Kubernetes deployment

Prerequisites: This process assumes the use of a clean Ubuntu 20.04 server with a public IP address and an authorized key recognised by the server in the current users ~/.ssh.

## Rancher Deployment Process

Get the docker-ansible project to run an ansible controller in a docker container

```bash
user@dev$ git clone https://github.com/kartoza/docker-ansible.git
```

Build the container image

```bash
user@dev$ cd docker-ansible
```

```bash
user@dev$ docker build . -t ansible
```

Replace the remote IP address in the inventory file

```bash
user@dev$ echo "<server-ip> ansible_user=root ansible_private_key_file=/root/.ssh/id_ed25519" > ${PWD}/ansible/inventory/hosts.ini
```

Remove the default playbooks directory

```
user@dev$ rm -r ./ansible/playbooks
```

Fetch the playbook repository which includes the singlenode rancher deployment

```bash
user@dev$ cd ./ansible && git clone https://github.com/kartoza/playbooks.git
```

Go back to the repository root

```bash
user@dev$ cd /..
```

Run the docker container (Powershell/ Windows users should read the [docker-ansible](https://github.com/kartoza/docker-ansible/blob/main/README.md) readme)

```bash
user@dev$ docker run -dt -v $PWD/ansible:/ansible \
               -v ~/.ssh:/root/win-ssh:ro \
               -e ANSIBLE_CONFIG=/ansible/ansible.cfg \
               --restart=unless-stopped \
               --name ansible ansible
```

Once the container is running run the playbook

```bash
user@dev$ docker exec -it ansible ansible-playbook /ansible/playbooks/ubuntu20.04/app/rancher-singlenode.yaml
```

Save the logs and kill off the ansible container

```bash
user@dev$ docker logs ansible >> $PWD/ansible_log.txt && docker rm -f ansible
```

At this point, the server should be configured to use `https://rancher.<server-ip>.sslip.io`. By default the admin user is `admin` and the password is `chickensoup` but that can be changed in the `rancher-singlenode.yaml` file. Note self-signed TLS is enabled so there'll be browser notices, but TLS configuration is environment specific and not considered in the scope of this process definition.

## Application Deployment Process

Now the project workload will need to be deployed to the server. This will use kubectl and can be done in various ways. If you wish to deploy from the local machine, the kubectl configuration for each node should be available in the `ansible/data` directory.

For the purpose of demonstrating this process, it is assumed that this is done by using ssh to connect to the server as the root user, which should have the kubectl configuration already setup by the ansible deployment.

```bash
user@dev$ ssh root@<server-ip>
```

Clone the project repository

```bash
root@app-srv$ mkdir /manifests && cd /manifests && git clone https://gitlab.com/zacharlie/test-manifest.git
```

Replace the hostname field in the ingress with the fully qualified domain name of the server.

```bash
root@app-srv$ cp /manifests/test-manifest/ingress.yaml /manifests/test-manifest/ingress.yaml.bak && awk '/nginx.test.localhost/ {sub("nginx.test.localhost", "123.456.7.89.sslip.io", $0)} {print}' /manifests/test-manifest/ingress.yaml.bak > /manifests/test-manifest/ingress.yaml
```

Apply the project resources using kustomize

```bash
root@app-srv$ cd /manifests/test-manifest && kubectl apply -k .
```

Be patient and monitor the resources from the nifty rancher dashboard (Workload >> Pods is a good place to start). Once everything is running you may view the landing page at the hostname address that was configured within the ingress configuration.

![Hello World from Nginx](https://user-images.githubusercontent.com/64078329/170362614-65f290bc-d3a1-42cc-8f78-640cd958e52a.png)
