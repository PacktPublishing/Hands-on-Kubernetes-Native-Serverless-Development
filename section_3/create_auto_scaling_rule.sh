# deploy f
kubeless function deploy scaletest \
                    --runtime python2.7 \
                    --handler helloget.f \
                    --from-file function.py



# see scale test number of instances
kubectl get pods

# create autoscale function
kubeless autoscale create scaletest --min 2 --max 4  --metric cpu --value 80

# validate that autoscale rule was addded
kubeless autoscale list

# see that additional pod was deployed
kubectl get pods

# clean up
kubeless function delete scaletest
kubeless autoscale delete scaletest