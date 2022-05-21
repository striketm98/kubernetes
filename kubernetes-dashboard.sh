#! /bin/bash

sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
sudo kubectl -n kubernetes-dashboard get svc
sudo kubectl -n  kubernetes-dashboard edit svc kubernetes-dashboard #change as per requirement "CluserIP","NodePort" and "LoadBalancer"
sudo kubectl create serviceaccount -n kubernetes-dashboard admin-user

cat >> rabc.yaml <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF
sudo kubectl apply -f rbac.yml

sudo kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')