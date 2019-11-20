# enable ingress traffic
minikube addons enable ingress

# register function with kubeless
kubeless function deploy bikesearch --runtime python2.7 --handler bikes.find --from-file bikes.py
kubeless trigger http create bikesearch --function-name bikesearch

# call function
kubeless function call bikesearch --data 'Army Navy Dr & S Joyce St'