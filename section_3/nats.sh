# create NATS server
kubectl apply -f https://github.com/nats-io/nats-operator/releases/latest/download/00-prereqs.yaml
kubectl apply -f https://github.com/nats-io/nats-operator/releases/latest/download/10-deployment.yaml

# create new namespace
kubectl create ns nats-io

# verify that nats service is present
 kubectl get crd