# create cron function
kubectl create -f cronjob.yaml

# or using CMLD line instead of yaml
kubectl run hello2 --schedule="*/1 * * * *" --restart=OnFailure --image=busybox -- /bin/sh -c "date; echo Hello from the Kubernetes cluster"

# get function 
kubectl get cronjob hello

# watch 
kubectl get jobs --watch

kubectl get cronjob hello

# delete
kubectl delete cronjob hello
kubectl delete cronjob hello2