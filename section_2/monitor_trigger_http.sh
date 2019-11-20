# create function that will be exposed via HTTP
kubeless function deploy get-python \
                    --runtime python2.7 \
                    --handler helloget.f \
                    --from-file function.py

# create http trigget to get-python function
kubeless trigger http create get-python --function-name get-python

# list created ingress commands (get HOSTS)
kubectl get ing

# start proxy
kubectl proxy -p 8080 &

# invoke HTTP FAAS (use HOSTS from prev step in the --handler)
curl -L --data '{"Data": "value"}' \
  --header "Content-Type:application/json" \
  localhost:8080/api/v1/namespaces/default/services/get-python:http-function-port/proxy/

# remove function 
kubeless function delete get-python  