kubeless function deploy printeventcontext --runtime python2.7 \
                                --from-file print_event_and_context.py \
                                --handler test.hello
kubeless function ls printeventcontext

kubeless function call printeventcontext --data 'Some data'

kubeless function delete printeventcontext


# content of event and context
event:                                  
  data:                                         # Event data
    foo: "bar"                                  # The data is parsed as JSON when required
  event-id: "2ebb072eb24264f55b3fff"            # Event ID
  event-type: "application/json"                # Event content type
  event-time: "2009-11-10 23:00:00 +0000 UTC"   # Timestamp of the event source
  event-namespace: "kafkatriggers.kubeless.io"  # Event emitter
  extensions:                                   # Optional parameters
    request: ...                                # Reference to the request received 
    response: ...                               # Reference to the response to send 
                                                # (specific properties will depend on the function language)
context:
    function-name: "pubsub-nodejs"
    timeout: "180"
    runtime: "nodejs6"
    memory-limit: "128M"
