# generate username and hashed password
htpasswd -cb auth user pass

# create secret using username and password
kubectl create secret generic basic-auth --from-file=auth

# create function
kubeless function deploy get-python \
                    --runtime python2.7 \
                    --handler helloget.f \
                    --from-file function.py

# create function trigger protected with user/pass
kubeless trigger http create get-python --function-name get-python --basic-auth-secret basic-auth --gateway nginx

# get ip 
kubectl get ing

# start proxy
kubectl proxy -p 8080 &

# verify that access is forbidden
curl --header 'Host: get-python.192.168.64.4.nip.io' 127.0.0.1:8080

kubeless function delete get-python  