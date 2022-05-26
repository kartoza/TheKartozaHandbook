# Kubectl

??? danger "Work in Progress"

    This article is under heavy development and is not considered production ready

[Kubectl](https://kubernetes.io/docs/reference/kubectl/kubectl/) (Kubernetes Control) is a commandline utility for managing Kubernetes clusters.

## Kustomize

Kustomize is a utility for building and "patching" complete resource definitions from a subset of information, allowing .

There are a lot of declarative items within a set of Kubernetes resources that may be consistent and repeating these definitions would become rather redundant. An example would be all the resources in the project requiring the inclusion of the namespace element in the resource metadata.

Not only is this redundancy inefficient to manage and control, but it also violates DRY principles that ensure our components are managed consistently and to prevent errors.

### Common operations

To validate the current resource configurations, run `kubectl kustomize`, or pipe the output to a file with `kubectl kustomize > output.yaml` to create a single file with a complete set of the resource definitions available within the current directory.

Apply the current directories manifests using kustomize with `kubectl apply -k .`, with `.` being the current directory and using a `kustomize.yaml` file to define the resources to apply.

Use `kubectl -n my-namespace get pods` to list the pods in the `my-namespace` namespace.

This is useful when you want to find a pod by name, so that you can execute the command directly against a pod that forms a particular service. You would have to be careful with your deployments naming conventions to avoid collisions, but it can be super handy to enhance your automation capabilities.

```bash
$ nginx_pod=$(kubectl -n my-namespace get pods | awk '{print $1}' | grep -e "nginx") && \
echo $nginx_pod
```

If you're a sucker for punishment, you can accomplish a similar result with powershell.

```powershell
> $nginx_pod = (kubectl -n my-namespace get pods |  Select-String -Pattern "nginx" -SimpleMatch | select -first 1 | %{ ($_ -split "\s+")[0]})
> Write-Output $nginx_pod
```

This makes it trivial to copy data into a volume with kubectl

```bash
nginx_pod=$(kubectl -n my-namespace get pods | awk '{print $1}' | grep -e "nginx") && \
  kubectl -n my-namespace cp ./configs/web/index.html $nginx_pod:/web/index.html
```

Or execute commands such as a mapproxy cleanup

```bash
mapproxy_pod=$(kubectl -n my-namespace get pods | awk '{print $1}' | grep -e "mapproxy") && \
  kubectl -n my-namespace exec $mapproxy_pod -- /bin/bash -c "mapproxy-seed -s /mapproxy/seed.yaml -f /mapproxy/mapproxy.yaml -c 4 --cleanup=remove_complete_levels"
```

Or run the command in the background within the pod, such as a mapproxy seeding operation

```bash
mapproxy_pod=$(kubectl -n my-namespace get pods | awk '{print $1}' | grep -e "mapproxy") && \
  kubectl -n my-namespace exec $mapproxy_pod -- /bin/bash -c "mapproxy-seed -s /mapproxy/seed.yaml -f /mapproxy/mapproxy.yaml -c 4 > /dev/null 2> /dev/null &"
```

## Helm

Helm is a Kubernetes Native package manager that provides more complex management capabilities for k8s resources. Helm is a separate application from kubectl that must be installed on a system with access to the cluster via the `~/.kube/config` file.

