# get last supported RELEASE of kafka trigger
export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kafka-trigger/releases/latest | grep tag_name | cut -d '"' -f 4)

# create using RELEASE 
kubectl create -f kafka-zookeeper-v1.0.2.yaml

# verify that two stateful sets are up and running
kubectl -n kubeless get statefulset

# deploy kafka function
 kubeless function deploy test --runtime python2.7 \
                                --handler test.f \
                                --from-file kafka_function.py

# trigger a function when even is arriving to a topic
 kubeless trigger kafka create test --function-selector created-by=kubeless,function=test --trigger-topic test-topic  

# create kafka topic 
kubeless topic create test-topic

# send data to a topic
kubeless topic publish --topic test-topic --data 'Hello World!'