# get current release
RELEASE=v1.0.5
# set your AWS credentials
AWS_ACCESS_KEY_ID="access_key"
AWS_SECRET_ACCESS_KEY="secret_key"

# create pubsub kinesis trigger controller
kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kinesis-$RELEASE.yaml

# validate that kinesis controller is present
kubectl get pods -n kubeless

# create secret for your AWS account
kubectl create secret generic ec2 --from-literal=aws_access_key_id=$AWS_ACCESS_KEY_ID --from-literal=aws_secret_access_key=$AWS_SECRET_ACCESS_KEY

# deploy kinses trigger
kubeless trigger kinesis create test-trigger --function-name post-python --aws-region us-west-2 --shard-id shardId-000000000000 --stream stream-name --secret ec2

# publish record using FAAS DataStream
kubeless trigger kinesis publish --aws-region us-west-2  --secret ec2 --partition-key "1" --stream stream-name  --message "This is messsage from kubeless"