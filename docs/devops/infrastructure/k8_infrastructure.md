# Kubernetes Infrastructure

## Overiew

This section describes the infrastructure that is used to run the Kubernetes cluster. We do a from-scratch walkthrough of the infrastructure configuration and deployment up to the point of having Rancher running on the cluster with multiple masters.

### Some obectives

1. 🪛 Deploy Kubernetes on bare metal servers.
2. ⛑️ Secure all services behind hetzner firewall.
3. 💻 Distribute the master nodes across multiple servers and multiple datacenters for resilience.
4. 👮 SSH Access to all nodes via wireguard VPN only.
5. 📔 All configurations described here and versioned in Git
6. ✅ Maximise use of Hetzner cloud capabilities.

### Version history

Although this document is versioned in Git, major changes should be annotated here too.

1. 🕥️ Initial version - Tim Sutton May 2022

## Hetzner Project

The starting point for this deployment is a Hetzner project. I propose that we mirror this process for each new devops employee so that they understand the 'from the ground up' workflow of how the infrastructure is deployed in a sandbox environmnent.

> 📔 Hetzner software defined networks work only within a single project, so make sure all related services are in the same project.

We will make use of the following services within the project:

![Hetzner Services](img/hetzner-services.png)

1. Servers: One goal is to reduce our environmental footprint. We will multi-tennant services across multiple servers to reduce the financial and environmental cost of running services. The master node servers will be deployed in different datacenters. Later in this document we will also seek to describe an architecture where the Rancher Longhorn cluster is replicated across multiple data centers.

2. Volumes: Any key persisten data should be mounted in Hetzner volumes. This will allow us to store the data in a highly available manner. We can detatch the volume, destroy and recreate the server and then reattach the volume. This applies equally to the etcd and other stateful data, and to the stateful data that is associated with the different kubernetes deployments.

3. Load Balances: As of writing, I am unclear if we have a use case for this as opposed to using the k8 load balancer capabilities. Potentially it could be used to balance traffic to our master nodes.

4. Floating IPs: We will use floating IPs to provide access to the Kubernetes cluster from outside the data center. The floating IP's will ensure that we can migrate the cluster to different hosts without having to change the IP address of the Kubernetes cluster.

5. Networks: We will create a private network for the Kubernetes cluster. This will ensure that no servers are publicly accessible. We will use a dedicated VPN host to provide access to the cluster via wireguard.

6. Firewalls: This will allow us keep all ssh and kubernetes management interfaces behind a VPN and only allow access to port 443 for running servers which are public facing. We will also expose the wireguard port for access into the VPN. Because of this we will run our rancher web admin console on a non standard part so that it is not publicly accessible.

7. Security: All staff should access the hosts via a single purpose SSH key. This will insulate the servers from possible compromise if your other keys (e.g. as used in GitHub) are compromised.

From these services we can already see our baseline design goals:

![Hetzner Architecture](img/k8-overview.png)

## TODO Items

1. Fully describe and verify online to offline to online backup and restore of all master nodes. See [this article].
2. Image scanning before deployment for better security.
3. Image slimming before deployment e.g. [slim.ai](https://www.slim.ai/).
3. [Terraform (is it needed?) with Hetzner](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs)
4. Service accounts, roles and role bindings so that each developer can access their project namespaces and that they can have staging environments.

## Generating an SSH key

You can and should generate an SSH key specifically for managing the cluster.

This key should not be used for any other purpose.

> 📔We need to additionally protect the SSH key from being compromised by using a Yubikey or similar hardware security device.

To create your key do:

```bash
ssh-keygen -t ed25519 -C "youemail@kartoza.com"
```

## Provisioning the master node with Kubespray

What follows are steps for provisioning a master node with Anisble using kubespray.

I am using the toolbox feature of Fedora which lets you install stuff (in this case all the ansible packages) into a sandbox environment. These notes are based on the [kubespray documentation](https://kubespray.io/docs/getting-started/install/).

Before starting make an .ssh/config entry for the host:

```bash
# Duplicate of above for ansible spraybook
Host 10.0.0.1
  Hostname 10.0.0.1
  IdentityFile /home/timlinux/.ssh/id_ed25519_kubernetes_training
  User root
```

I set the host to the IP addres for the ansible script below to run correctly.
You should change the IP address above and below to the VPN configured address
for the server. Also note above that I set the SSH key to the one that I created.

```bash
git clone git@github.com:kubernetes-sigs/kubespray.git
toolbox create kubespray
toolbox enter kubespray
cd kubespray
sudo dnf install python-pip
sudo pip install -r requirements.txt
cp -rfp inventory/sample inventory/kartoza-k8
# You can provision multiple hosts by space separating the list of IP addresses
# Substitute with the correct IP
declare -a IPS=(10.0.0.1)
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml

```

If the script runs properly, it will take a little while to run and you should see green text interlaced in the output. If it runs really quickly or has red (not brown) text in the output, investigate the issues and try to address them as they come up.

Once the script has run, log back into the master node and test the cluster. You can do this by checking if kubectl etc. is working:

```bash
root@node1:~# kubectl get nodes
NAME    STATUS   ROLES                  AGE     VERSION
node1   Ready    control-plane,master   4m20s   v1.23.6

```

Kubespray seems to install a lot of components that I am not familiar with - I would like to revise / create our own ansible script that installs just the minimum of what we need and then we add things on a 'need to have' basis.

## Installing helm

Helm is not installed by kubespray it seems so I installed it on the server following official instructions.

> 📔**Note:** Avoid following random guides on how to install helm.

```bash

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Setting up kubectl to use the cluster
