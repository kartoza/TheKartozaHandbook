# Personal Kubernetes Infrastructure

## Initial Setup

This are initial notes from Tim on setting up a personal docker, rancher desktop and rancher server testbed environment.

I started by setting up rancher desktop on my Fedora based linux laptop. I used the appimage (despite a concerning looking warning that firefox gives about the image when downloading it.)

Here is the [installation guide](https://docs.rancherdesktop.io/getting-started/installation/#installing-via-appimage).

Once installed I performed the following commands to do a quick start setup of nginx running in the k8 cluster.

```bash
$kubectl get nodes
NAME                   STATUS   ROLES                  AGE   VERSION
lima-rancher-desktop   Ready    control-plane,master   80m   v1.22.7+k3s1

$kubectl create deployment nginx --image=nginx
deployment.apps/nginx created

$kubectl get pods
NAME                     READY   STATUS              RESTARTS   AGE
nginx-6799fc88d8-7k4kd   0/1     ContainerCreating   0          10s

$kubectl describe nginx-6799fc88d8-7k4kd
error: the server doesn't have a resource type "nginx-6799fc88d8-7k4kd"

$kubectl describe pod nginx-6799fc88d8-7k4kd
Name:         nginx-6799fc88d8-7k4kd
Namespace:    default
Priority:     0
Node:         lima-rancher-desktop/192.168.5.15
Start Time:   Sat, 23 Apr 2022 22:57:06 +0100
Labels:       app=nginx
              pod-template-hash=6799fc88d8
Annotations:  <none>
Status:       Running
IP:           10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/nginx-6799fc88d8
Containers:
  nginx:
    Container ID:   containerd://f85e833716a254f9e981ebf6c0f432edab366aacdfa74cc46b84904e6afc8760
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:859ab6768a6f26a79bc42b231664111317d095a4f04e4b6fe79ce37b3d199097
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 23 Apr 2022 22:57:23 +0100
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hl4hc (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-hl4hc:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  33s   default-scheduler  Successfully assigned default/nginx-6799fc88d8-7k4kd to lima-rancher-desktop
  Normal  Pulling    33s   kubelet            Pulling image "nginx"
  Normal  Pulled     17s   kubelet            Successfully pulled image "nginx" in 16.398944871s
  Normal  Created    17s   kubelet            Created container nginx
  Normal  Started    16s   kubelet            Started container nginx

 timlinux  crest  ~  kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-6799fc88d8-7k4kd   1/1     Running   0          44s

 timlinux  crest  ~  kubectl get pods -o wide
NAME                     READY   STATUS    RESTARTS   AGE   IP          NODE                   NOMINATED NODE   READINESS GATES
nginx-6799fc88d8-7k4kd   1/1     Running   0          57s   10.42.0.9   lima-rancher-desktop   <none>           <none>

$kubectl exec -it nginx-6799fc88d8-7k4kd /bin/sh
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
# curl 10.42.0.9
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
# exit

$kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-6799fc88d8-7k4kd   1/1     Running   0          2m45s

```

These steps are verbatim from [this youtube video](https://www.youtube.com/watch?v=LwE8IA3glE4).

From this initial run through we can assume these basic concepts:

![K8 Concepts](img/k8-concepts.png)


## Deploying Rancher on Rancher Desktop

I remember that Dominic explained about namespaces in his initial walk through so let me try to create a new  namespace.

```bash
$kubectl create namespace tim
```

While trying to figure out how to list my namespaces, I found [this nice k8 cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/).

The above cheatsheet didnt actually contain the tip I needed but a bit of googling came up with this:

```bash
kubectl get namespaces --show-labels
NAME              STATUS   AGE     LABELS
default           Active   141m    kubernetes.io/metadata.name=default
kube-system       Active   141m    kubernetes.io/metadata.name=kube-system
kube-public       Active   141m    kubernetes.io/metadata.name=kube-public
kube-node-lease   Active   141m    kubernetes.io/metadata.name=kube-node-lease
tim               Active   3m34s   kubernetes.io/metadata.name=tim
```

You can see my tim namespace listed as the last entry there. So based on doing that, I think I can update my concept diagram to look like this:

![K8 Namespace](img/k8-concepts-namespace.png)


```kubectl
apiVersion: v1
kind: Pod
metadata:
  name: nginxpod
  namespace: tim
  labels:
    name: nginxpod
spec:
  containers:
  - name: web
    image: nginx
```

I saved the above as nginx.yml and was able to run it like this:

```bash
kubectl apply -f nginx.yml
```

Then I could check in the tim namespace to see if it was running:

```bash
kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS      RESTARTS   AGE
kube-system   local-path-provisioner-84bb864455-dsv47   1/1     Running     0          150m
kube-system   helm-install-traefik-crd--1-xrhvf         0/1     Completed   0          150m
kube-system   svclb-traefik-p9zwj                       2/2     Running     0          150m
kube-system   helm-install-traefik--1-m2r2x             0/1     Completed   1          150m
kube-system   coredns-96cc4f57d-5bzj8                   1/1     Running     0          150m
kube-system   traefik-56c4b88c4b-mpwfm                  1/1     Running     0          150m
kube-system   metrics-server-ff9dbcb6c-6gzt5            1/1     Running     0          150m
default       nginx-6799fc88d8-7k4kd                    1/1     Running     0          69m
tim           nginxpod                                  1/1     Running     0          14s

```

We can see my nginx pod in my namespace as the last entry.


## Exposing the nginx service in my namespace

I remember reading about ingress points for k8 which is how you can route requests to containers. 