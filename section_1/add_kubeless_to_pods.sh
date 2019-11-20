# analyze https://github.com/kubeless/kubeless/releases/download/v1.0.5/kubeless-v1.0.5.yaml kubeless definition
kubectl get pods -n kubeless # see if all instances are ready
kubectl get customresourcedefinition # get resources 

# add kubeless to your CLI
export OS=$(uname -s| tr '[:upper:]' '[:lower:]')
curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip && \
  unzip kubeless_$OS-amd64.zip && \
  sudo mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/