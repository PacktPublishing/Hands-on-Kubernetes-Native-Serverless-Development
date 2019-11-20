# create docker with kubeless
kubectl create secret docker-registry kubeless-registry-credentials \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=user \
  --docker-password=password \
  --docker-email=user@example.com

# get credentials
kubectl get secret kubeless-registry-credentials --output="jsonpath={.data.\.dockerconfigjson}" | base64 -D

# edit config map of docker kubeless
kubectl edit configmaps -n kubeless kubeless-config