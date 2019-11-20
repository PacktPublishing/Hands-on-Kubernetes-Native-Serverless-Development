# deploy function from simple_function.py
kubeless function deploy hello --runtime python2.7 \
                                --from-file simple_function.py \
                                --handler test.hello

# get all functions
kubectl get functions

# call kubeless function
kubeless function call hello --data 'Hello world!'

# start proxy 
kubectl proxy -p 8080 &

# submit FAAS using HTTP
curl -L --data '{"User": "Tom"}' \
  --header "Content-Type:application/json" \
  localhost:8080/api/v1/namespaces/default/services/hello:http-function-port/proxy/