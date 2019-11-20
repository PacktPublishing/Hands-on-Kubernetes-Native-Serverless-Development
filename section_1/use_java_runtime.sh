# deploy java function using runtime
kubeless function deploy get-java --runtime java1.8 --handler JavaExample.function --from-file JavaExample.java
# get all functions
kubeless function ls get-java
# execute java FAAS using Java runtime

