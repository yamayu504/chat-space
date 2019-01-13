  json.id         @message.id
  json.message    @message.message
  json.image      @message.image.url
  json.time       @message.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
  json.name       @message.user.user_name

