# 1
# Runtime is not supported
kubeless function deploy --runtime node8 \
  --from-file hello.js \
  --handler todos.create \
  --dependencies package.json \
  hello
# take one runtime from provided (for example nodejs8)


# 2
# Depoloy function that is not present in the file
kubeless function deploy foo --from-file function.py --handler hello,f --runtime python3.6

# ls status of the function deploy
kubeless function ls foo

# check logs
kubectl get pods -l function=foo
