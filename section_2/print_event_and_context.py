def hello(event, context):
  print event.id
  print context
  return event['data']
