  json.id         @message.id
  json.message    @message.message
  json.image      @message.image.url
  json.time       @message.created_at
  json.name       @message.user.user_name

