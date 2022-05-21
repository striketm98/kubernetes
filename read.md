

What is Kubernetes?
1.Project that was spun out of Google as an open source container orchestration platform.
2.Built from the lessons learned in the experiences of developing and running Google’s Borg and Omega.
3.Designed from the ground-up as a loosely coupled collection of components centered around deploying, maintaining and scaling workloads.

What Does Kubernetes do?
*Known as the linux kernel of distributed systems.
*Abstracts away the underlying hardware of the nodes and provides a uniform interface for workloads to be both deployed and consume the shared pool of resources.
*Works as an engine for resolving state by converging actual and the desired state of the system.

Decouples Infrastructure and Scaling
All services within Kubernetes are natively Load Balanced.
Can scale up and down dynamically.
Used both to enable self-healing and seamless upgrading or rollback of applications.

Self Healing
Kubernetes will ALWAYS try and steer the cluster to its desired state.

Me: “I want 3 healthy instances of redis to always be running.”
Kubernetes: “Okay, I’ll ensure there are always 3 instances up and running.”
Kubernetes: “Oh look, one has died. I’m going to attempt to spin up a new one.”

What can Kubernetes REALLY do?
Autoscale Workloads
Blue/Green Deployments
Fire off jobs and scheduled cronjobs
Manage Stateless and Stateful Applications
Provide native methods of service discovery
Easily integrate and support 3rd party apps

A Couple 
Key Concepts...

Pods
Atomic unit or smallest “unit of work”of Kubernetes.
Pods are one or MORE containers that share volumes, a network namespace, and are a part of a single context.
Services
Unified method of accessing the exposed workloads of Pods. 
Durable resource
static cluster IP
static namespaced DNS name




#os:                    ubuntu 20.0.4 LTS
#system Requried:       cpu(2) & ram(2GB)  <master node>
                        cpu(1) & ram(1GB)  <master node>
                        
#Cloud  Provider:       aws-ec2 
#Remote Tools:          vscode

#Steps to Install Kubernetes
Set up Docker
Step 1: Install Docker
Kubernetes requires an existing Docker installation. If you already have Docker installed, skip ahead to Step 2.

If you do not have Kubernetes, install it by following these steps:

1. Update the package list with the command:
    sudo apt-get update -y 

2. Next, install Docker with the command:
   apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io
   add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   apt update

3. Repeat the process on each server that will act as a node.
4. Check the installation (and version) by entering the following:
   docker ––version
Install Kubernetes
Step 3: Add Kubernetes Signing Key
Since you are downloading Kubernetes from a non-standard repository, it is essential to ensure that the software is authentic. This is done by adding a signing key.

1. Enter the following to add a signing key:
    apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -   

Step 4: Add Software Repositories
Kubernetes is not included in the default repositories. To add them, enter the following:
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

Step 5: Kubernetes Installation Tools
Kubeadm (Kubernetes Admin) is a tool that helps initialize a cluster. It fast-tracks setup by using community-sourced best practices. Kubelet is the work package, which runs on every node and starts containers. The tool gives you command-line access to clusters.

1. Install Kubernetes tools with the command:
  apt update && apt install -y kubeadm=1.18.5-00 kubelet=1.18.5-00 kubectl=1.18.5-00
kubeadm init --apiserver-advertise-address=172.31.21.224 --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=all
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

Assign Unique Hostname for Each Server Node 
Decide which server to set as the master node. Then enter the command:
Next, set a worker node hostname by entering the following on the worker server:

kubectl taint node 18.234.34.157 node-role.kubernetes.io/master:NoSchedule-
