# execute in an incorrect way
kubeless function call bikesearch --dataa 'Army Navy Dr & S Joyce St'

# get pods (ie bikesearch-78b55fcb5d-579q6)
kubectl get pods 

# get logs
kubectl logs bikesearch-757cc75f76-ngbzk

# clean up
kubeless function delete bikesearch

